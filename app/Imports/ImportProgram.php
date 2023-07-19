<?php

namespace App\Imports;

use App\Models\City;
use App\Models\FormatFile;
use App\Models\MaterialResolution;
use App\Models\MaterialStatus;
use App\Models\Program;
use App\Models\ProgramType;
use App\Models\Province;
use App\Models\PurchaseStatus;
use Error;
use Maatwebsite\Excel\Validators\Failure;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Throwable;

use function PHPUnit\Framework\isEmpty;

class ImportProgram implements ToModel, WithHeadingRow, WithBatchInserts, SkipsOnError, WithValidation, SkipsOnFailure
{
    use SkipsErrors, SkipsFailures;
    private $rows = 0;

    public function model(array $row)
    {  
        // dd($row);
        ++$this->rows;
        $program = Program::where('program_name', 'LIKE', '%' . $row['nama_program'] . '%')
            ->where('season', $row['season'])
            ->where('eps_number', $row['eps_number'])
            ->first();

        // Check if program owned by other tv station
        if (empty(!$program) && $program->original_tv_station !== Auth()->user()->origin_station_id) {
            $error = ['Program milik stasiun tv lain!'];
            $failures[] = new Failure($this->rows, 'Tv Station', $error, $row);
            throw new \Maatwebsite\Excel\Validators\ValidationException(\Illuminate\Validation\ValidationException::withMessages($error), $failures);
        }


        $province = Province::where('province_name', 'like', '%' . $row['provinsi'] . '%')->get();
        $city = City::where('city_name', 'like', '%' . $row['kota'] . '%')->get();
        $file_format = FormatFile::where('file_format', 'like', '%' . $row['format_file'] . '%')->get();
        $material_resolution = MaterialResolution::where('material_resolution', 'like', '%' . $row['resolusi_materi'] . '%')->get();
        $material_status = MaterialStatus::where('material_status', 'like', '%' . $row['status_materi'] . '%')->get();
        $purchase_status = PurchaseStatus::where('purchase_status', 'like', '%' . $row['status_pembelian'] . '%')->get();
        $program_type = ProgramType::where('program_type', 'like', '%' . $row['program_type'] . '%')->get();
        $row['provinsi'] = (isEmpty($province)) ? $province[0]->id : NULL;
        $row['kota'] = (isEmpty($city)) ? $city[0]->id : NULL;
        $row['format_file'] = (isEmpty($file_format)) ? $file_format[0]->id : NULL;
        $row['resolusi_materi'] = (isEmpty($material_resolution)) ? $material_resolution[0]->id : NULL;
        $row['status_materi'] = (isEmpty($material_status)) ? $material_status[0]->id : NULL;
        $row['status_pembelian'] = (isEmpty($purchase_status)) ? $purchase_status[0]->id : NULL;
        $row['program_type'] = (isEmpty($program_type)) ? $program_type[0]->id : NULL;
        $row['license_start'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['license_start'])->format('Y-m-d');
        $row['license_end'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['license_end'])->format('Y-m-d');
        $row['durasi_program'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['durasi_program'])->format('H:i:s');
        
        return Program::updateOrCreate(
            [
                'program_name' => $row['nama_program'],
                'season' => $row['season'],
                'eps_number' => $row['eps_number'],
            ],
            [
                'file_name' => $row['nama_file'],
                    'po_asset' => $row['po_asset'],
                    'sub_title' => $row['sub_judul'],
                    'province' => $row['provinsi'],
                    'city' => $row['kota'],
                    'file_format' => $row['format_file'],
                    'material_resolution' => $row['resolusi_materi'],
                    'in_out_house' => $row['in_out_house'],
                    'po_year' => $row['po_year'],
                    'slot_prg' => $row['slot_prg'],
                    'material_status' => $row['status_materi'],
                    'program_duration' => $row['durasi_program'],
                    'purchase_status' => $row['status_pembelian'],
                    'license_start' => $row['license_start'],
                    'license_end' => $row['license_end'],
                    'ph_name' => $row['nama_ph'],
                    'program_type' => $row['program_type'],
                    'original_tv_station' => Auth::user()->origin_station_id, 
            ]
        );
    }
    public function batchSize(): int
    {
        return 1000;
    }
    public function rules(): array
    {
        return [
            '*.nama_file' => ['required', 'string'],
            '*.po_asset' => ['required', 'string'],
            '*.sub_judul' => ['required', 'string'],
            '*.nama_program' => ['required', 'string'],
            '*.season' => ['required', 'integer'],
            '*.eps_number' => ['required', 'integer'],
            '*.provinsi' => ['required', 'string', 'exists:provinces,province_name'],
            '*.kota' => ['required', 'string', 'exists:cities,city_name'],
            '*.format_file' => ['required', 'string', 'exists:format_files,file_format'],
            '*.resolusi_materi' => ['required', 'string', 'exists:material_resolutions,material_resolution'],
            '*.in_out_house' => ['required', 'string'],
            '*.po_year' => ['required', 'integer'],
            '*.slot_prg' => ['required', 'integer'],
            '*.status_materi' => ['required', 'string', 'exists:material_status,material_status'],
            '*.durasi_program' => ['required'],
            '*.status_pembelian' => ['required', 'string', 'exists:purchase_status,purchase_status'],
            '*.license_start' => ['sometimes', 'date_format:d/m/Y'],
            '*.license_start' => ['sometimes', 'date_format:d-m-Y'],
            '*.license_start' => 'required_without:0,1',
            '*.license_end' => ['sometimes', 'date_format:d/m/Y'],
            '*.license_end' => ['sometimes', 'date_format:d-m-Y'],
            '*.license_end' => 'required_without:0,1',
            '*.nama_ph' => ['required', 'string'],
            '*.program_type' => ['required', 'string', 'exists:program_types,program_type'],
            '*.stasiun_tv_asal' => ['required', 'string', 'exists:original_tv_stations,original_tv_station'],
        ];
    }

    public function customValidationMessages()
    {
        // Tanggal Booking belum di validasi
        return [
            'provinsi.exists' => 'Pastikan Provinsi sudah terdaftar di sistem',
            'kota.exists' => 'Pastikan Kota sudah terdaftar di sistem',
            'format_file.exists' => 'Pastikan Format File sudah terdaftar di sistem',
            'resolusi_materi.exists' => 'Pastikan tipe Resolusi Materi sudah terdaftar di sistem',
            'program_type.exists' => 'Pastikan Program Type sudah terdaftar di sistem',
            'stasiun_tv_asal.exists' => 'Pastikan Stasiun sudah terdaftar di sistem',
            'season.required' => 'Kolom Season Harus Diisi',
            'episod.required' => 'Kolom Episod Harus Diisi',
            'date_format' => 'Pastikan format tanggal benar',
        ];
    }

    public function getRowCount(): int
    {
        return $this->rows;
    }
}
