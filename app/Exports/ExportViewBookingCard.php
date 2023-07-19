<?php

namespace App\Exports;

use App\Models\BookingHistoryDetail;
use App\Models\DataAsset;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Str;
use Carbon\Carbon;

class ExportViewBookingCard implements FromCollection, WithHeadings
{
    public $request;
    public function __construct($request)
    {
        $this->request = $request;
    }

    public function headings(): array{
        return ['NAMA PROGRAM', 'SEASON', 'EPISODE', 'STASIUN TV ASAL', 'TANGGAL BOOKING'];
    }

    public function collection()
    {   
        
        $query = BookingHistoryDetail::select('program_name', 'season', 'episode', 'tv_station', 'tanggal_booking');
        if ($this->request->program_name == null && $this->request->season == null && $this->request->tv_station == null && empty($this->request->tanggal_awal) && empty($this->request->tanggal_akhir)) {
            $dataAsset = $query->get();
            return $dataAsset;
        }
        // Filter Program Name
        if (!empty($this->request->program_name)) {
            $program =  Str::headline($this->request->program_name);    
            $query->where('program_name', '=', $program);
        }
        // Filter Season
        if($this->request->season != NULL && !empty($this->request->season)){
            $query->where('season', '=', $this->request->season);
        }
        // Filter TV Station
        if($this->request->tv_station != NULL && !empty($this->request->tv_station)){
            $query->where('booking_by', '=', $this->request->tv_station);
        }
        // Filter Started Date
        if(!empty($this->request->tanggal_awal) && empty($this->request->tanggal_akhir))
        {
            $query->whereBetween('tanggal_booking', [$this->request->tanggal_awal, now()]);
        }
        // Filter Ended Date
        if(!empty($this->request->tanggal_akhir) && empty($this->request->tanggal_awal)){
            $query->whereBetween('tanggal_booking', [now(), $this->request->tanggal_akhir]);
        }

        // Filter Between Date
        if(!empty($this->request->tanggal_awal) && !empty($this->request->tanggal_akhir)){
            $query->whereBetween('tanggal_booking', [$this->request->tanggal_awal, $this->request->tanggal_akhir]);
        }

        $dataAsset = $query->get();

        return $dataAsset;
    }
}
