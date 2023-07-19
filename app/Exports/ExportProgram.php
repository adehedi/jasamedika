<?php

namespace App\Exports;

use App\Models\Program;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportProgram implements FromQuery, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function headings(): array{
        return ['NAMA FILE', 'PO ASSET', 'SUB JUDUL', 'NAMA PROGRAM', 'SEASON', 'EPS NUMBER', 'PROVINSI', 'KOTA', 'FORMAT FILE', 'RESOLUSI MATERI', 'IN_OUT HOUSE', 'PO YEAR', 'SLOT PRG', 'STATUS MATERI', 'DURASI PROGRAM', 'STATUS PEMBELIAN', 'LICENSE START', 'LICENSE END', 'NAMA PH', 'PROGRAM TYPE', 'STASIUN TV ASAL'];
    }

    public function query()
    {
        return DB::table('programs as a')
                    ->join('provinces as b', 'a.province', '=', 'b.id')
                    ->join('cities as c', 'a.city', '=', 'c.id')
                    ->join('format_files as d', 'a.file_format', '=', 'd.id')
                    ->join('material_resolutions as e', 'a.material_resolution', '=', 'e.id')
                    ->join('material_status as f', 'a.material_status', '=', 'f.id')
                    ->join('purchase_status as g', 'a.purchase_status', '=', 'g.id')
                    ->join('program_types as h', 'a.program_type', '=', 'h.id')
                    ->join('original_tv_stations as i', 'a.original_tv_station', '=', 'i.id')
                    ->limit(0)
                    ->get();
    }
}
