<?php

namespace App\Exports;

use App\Models\BookingHistory;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Str;

class ExportBookingView implements FromCollection, WithHeadings
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
        return ['BOOKING NUMBER', 'TANGGAL BOOKING AWAL', 'TANGGAL BOOKING AKHIR', 'STASIUN TV ASAL', 'NAMA PROGRAM', 'SEASON', 'TOTAL EPS NUMBER', 'BOOKING BY'];
    }

    public function collection()
    {
        $query = BookingHistory::select('booking_number', 'booking_date_start', 'booking_date_end', 'tv_station_name', 'program_name', 'season', 'total_episode', 'booking_by');

        if (empty($this->request->program_name_filter) && empty($this->request->season_filter) && empty($this->request->tv_station_filter) && empty($this->request->tanggal_awal_filter) && empty($this->request->tanggal_akhir_filter)) {
            $bookingHistory = $query->latest()->get();
            return $bookingHistory;
        }

        // // Filter Program Name
        if ($this->request->program_name_filter != NULL && $this->request->program_name_filter != 'ALL') {
            $program =  Str::headline($this->request->program_name_filter);
            $query->where('program_name', '=', $program);
        }
        // // Filter Season
        if($this->request->season_filter != NULL && $this->request->season_filter != 'ALL'){
            $query->where('season', '=', $this->request->season_filter);
        }
        // // Filter TV Station
        if($this->request->tv_station_filter != NULL && $this->request->tv_station_filter != 'ALL'){
            $query->where('tv_station_name', '=', $this->request->tv_station_filter);
        }
        // // Filter Started Date
        if(!empty($this->request->tanggal_awal_filter && $this->request->tanggal_awal_filter != NULL && empty($this->request->tanggal_akhir_filter))){
            $query->whereBetween('created_at', [$this->request->tanggal_awal_filter, now()]);
        }
        // // Filter Ended Date
        if(isset($this->request->tanggal_akhir_filter) && $this->request->tanggal_akhir_filter != NULL && empty($this->request->tanggal_awal_filter)){
            $query->whereBetween('created_at', [now(), $this->request->tanggal_akhir_filter]);
        }

        // // Filter Between Date
        if(!empty($this->request->tanggal_awal_filter) && $this->request->tanggal_awal_filter != NULL && !empty($this->request->tanggal_akhir_filter) && $this->request->tanggal_akhir != NULL){
            $query->whereBetween('created_at', [$this->request->tanggal_awal_filter, $this->request->tanggal_akhir_filter]);
        }

        $dataAsset = $query->latest()->get();
        return $dataAsset;
    }
}
