<?php

namespace App\Exports;

use App\Models\DataAsset;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportDataAsset implements FromQuery, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function headings(): array{
        return ['NAMA PROGRAM', 'SEASON', 'EPISODE', 'TANGGAL BOOKING'];
    }

    public function query()
    {
        return DB::table('data_assets as a')
                ->join('programs as b', 'a.program_id', '=', 'b.id')
                ->select('b.program_name', 'b.season', 'b.eps_number', 'a.tanggal_booking')
                ->limit(0)
                ->get();
    }
}
