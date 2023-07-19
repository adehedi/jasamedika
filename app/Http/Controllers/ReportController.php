<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Patrol;
use App\Models\User;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
// use PhpOffice\PhpSpreadsheet\Writer\Pdf;
use Spatie\SimpleExcel\SimpleExcelWriter;
use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{
    public function index()
    {
        $users = User::all();
        $locations = Location::all();

        return view('report.index', compact(['users', 'locations']));
    }

    public function export(Request $request)
    {
        $startDate = $request->start_date;
        $endDate = $request->end_date;

        $query = DB::table('patrol');
        $query->join('location', 'patrol.location_id', '=', 'location.id');
        $query->join('users', 'patrol.user_id', '=', 'users.id')->select('users.*', 'location.*', 'patrol.*');

        // Mengatur tanggal awal dan tanggal akhir jika tidak diisi
        if (empty($request->start_date) && empty($request->end_date)) {
            $twoMonthsAgo = Carbon::now()->subMonths(2);
            $startDate = $twoMonthsAgo->format('Y-m-d');
            $endDate = Carbon::now()->format('Y-m-d');
            $query->whereBetween('patrol.created_at', [$startDate, $endDate]);
        }

        // Mencari berdasarkan tanggal
        if (!empty($request->start_date) && !empty($request->end_date)) {
            $query->whereDate('patrol.created_at', '>=', $request->start_date)->whereDate('patrol.created_at', '<=', $request->end_date);
        }

        // Mencari berdasarkan petugas
        if (!empty($request->user) && $request->user != 'all') {
            $userNames = array_map(function ($name) {
                return str_replace('-', ' ', $name);
            }, $request->user);
            // Pencarian petugas
            $query->whereIn('users.name', $userNames);
        }

        // Mencari berdasarkan lokasi
        if (!empty($request->location) && $request->location != 'all') {
            $locations = array_map(function ($location) {
                return str_replace('-', ' ', $location);
            }, $request->location);
            // Pencarian location
            $query->whereIn('location.check_point_name', $locations);
        }

        // Eksekusi query dan kembalikan hasil
        $results = $query->orderBy('patrol.created_at', 'desc')->get();

        $data = $results->map(function ($item) {
            return (array) $item;
        })->toArray();

        $exportData = $this->generateExportData($data);

        // Extension PDF
        if($request->format_file == '.pdf'){
            $pdf = PDF::loadView('user.user-pdf', ['data' => $data])->setPaper('a4', 'landscape');
            return $pdf->download('report epatrol '. $startDate . '/' . $endDate .' .pdf');
        }

        $filename = 'report epatrol ' . $startDate . ' ' . $endDate . $request->format_file;

        $writer = SimpleExcelWriter::streamDownload($filename);
        $writer->addRows($exportData);
        $writer->toBrowser();
    }

    function generateExportData($data)
    {
        foreach ($data as $item) {
            yield [
                "Nama Petugas" => $item["name"],
                "Longitude" => $item["longitude"],
                "Latitude" => $item["latitude"],
                "Kode QR" => $item["barcode_code"],
                "Nama Gedung" => $item["building_name"],
                "Lantai" => $item["floor"],
                "Nama Check Point" => $item["check_point_name"],
                "Kategori Kondisi" => $item["condition"],
                "Keterangan Kondisi" => $item["condition_note"],
                "Created Date" => $item["created_at"]
            ];
        }
    }
}
