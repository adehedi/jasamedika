<?php

namespace App\Exports;

use App\Models\City;
use App\Models\DataAsset;
use App\Models\Program;
use App\Models\Province;
use App\Models\TvStation;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Concerns\WithMapping;

class ExportBookingDataAsset implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */

    public $request;
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function headings(): array{
        return ['NAMA FILE', 'PO ASSET', 'SUB JUDUL', 'NAMA PROGRAM', 'SEASON', 'EPS NUMBER', 'PROVINSI', 'KOTA', 'DURASI PROGRAM', 'STASIUN TV AWAL', 'TANGGAL BOOKING', 'LAST RUN TV', 'LAST RUN DATE', 'LAST RUN IVM', 'LAST RUN SCTV', 'LAST RUN MOJI', 'LAST RUN MENTARI TV'];
    }
    public function map($row): array
    {
        return [
            $row->file_name,
            $row->po_asset,
            $row->sub_title,
            $row->program_name,
            $row->season,
            $row->eps_number,
            Province::find($row->province)->select('province_name')->first()->province_name,
            City::find($row->city)->select('city_name')->first()->city_name,
            $row->program_duration,
            TvStation::find($row->original_tv_station)->select('original_tv_station')->first()->original_tv_station,
            $row->tanggal_booking,
            $row->last_run_tv,
            $row->last_run_date,
            $row->last_run_ivm,
            $row->last_run_sctv,
            $row->last_run_moji,
            $row->last_run_mentari_tv,
        ];
    }
    public function collection()
    {
        $query = Program::with(['province', 'city', 'tvStation'])
                    ->addSelect(['last_run_tv' => DataAsset::select('original_tv_stations.original_tv_station')
                        ->leftJoin('original_tv_stations', 'original_tv_stations.id', '=', 'programs.original_tv_station')
                        ->whereColumn('program_name', 'programs.program_name')
                        ->whereColumn('season', 'programs.season')
                        ->latest('tanggal_booking')
                        ->take(1)
                    ])
                    ->addSelect(['last_run_date' => DataAsset::select('tanggal_booking')
                        ->whereColumn('program_name', 'programs.program_name')
                        ->whereColumn('season', 'programs.season')
                        ->latest('tanggal_booking')
                        ->take(1)
                    ])        
                    ->addSelect('data_assets.tanggal_booking', 
                             'data_assets.last_run_tv',
                             'data_assets.last_run_ivm',
                             'data_assets.last_run_sctv',  
                             'data_assets.last_run_moji',  
                             'data_assets.last_run_mentari_tv',  
                             )          
                    ->leftJoin('data_assets', 'data_assets.program_id', '=', 'programs.id');
        // Filter
        if (empty($this->request->program_name_filter) && empty($this->request->season_filter) && empty($this->request->tv_station_filter) && empty($this->request->tanggal_awal_filter) && empty($this->request->tanggal_akhir_filter)) {
            $data = $query->orderBy('program_name', 'asc')->orderBy('season', 'asc')->orderBy('eps_number', 'asc')->get();
            return $data;
        }
        // Filter Program Name
        if (!empty($this->request->program_name_filter)) {
            $program =  Str::headline($this->request->program_name_filter);
            $query->where('programs.program_name', $program);
        }
        // Filter Season
        if(!empty($this->request->season_filter)){
            $query->where('programs.season', $this->request->season_filter);
        }
        // Filter TV Station
        if(!empty($this->request->tv_station_filter)){
            $tv = TvStation::where('original_tv_station', $this->request->tv_station_filter)->first();
            $query->where('programs.original_tv_station', $tv->id);
        }
        // Filter Started Date
        if(!empty($this->request->tanggal_awal_filter) && empty($this->request->tanggal_akhir_filter))
        {
            $query->whereBetween('data_assets.tanggal_booking', [$this->request->tanggal_awal_filter, now()]);
        }
        // Filter Ended Date
        if(!empty($this->request->tanggal_akhir_filter) && empty($this->request->tanggal_awal_filter)){
            $query->whereBetween('data_assets.tanggal_booking', [now(), $this->request->tanggal_akhir_filter]);
        }
        // Filter Between Date
        if(!empty($this->request->tanggal_awal_filter) && !empty($this->request->tanggal_akhir_filter)){
            $query->whereBetween('data_assets.tanggal_booking', [$this->request->tanggal_awal_filter, $this->request->tanggal_akhir_filter]);
        }
                    
        $data = $query->orderBy('program_name', 'asc')->orderBy('season', 'asc')->orderBy('eps_number', 'asc')->get();
            // Set Value
        return $data;
    }
}
