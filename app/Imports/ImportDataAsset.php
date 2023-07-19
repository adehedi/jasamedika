<?php

namespace App\Imports;

use App\Models\BookingHistory;
use App\Models\BookingHistoryDetail;
use App\Models\DataAsset;
use App\Models\Program;
use App\Models\TvStation;
use App\Rules\BookingDateRule;
use App\Rules\ThirtyOneDaysBetweenDates;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Events\BeforeImport;
use Illuminate\Validation\ValidationException;
use Maatwebsite\Excel\Validators\Failure;
use Maatwebsite\Excel\Validators\ValidationException as ValidatorsValidationException;

use function PHPUnit\Framework\isEmpty;

class ImportDataAsset implements ToModel, WithHeadingRow, WithBatchInserts, SkipsOnError, SkipsOnFailure, WithValidation, WithMapping, WithEvents
{
    use SkipsErrors, SkipsFailures;
    protected $rows = 0;
    public $totalRow;
    public $program_name;
    public $season;
    public $booking_number;
    public $tanggal_booking = [];
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function registerEvents(): array
    {
        return [
            BeforeImport::class => function (BeforeImport $event) {
                $totalRows = $event->getReader()->getTotalRows();

                if (!empty($totalRows)) {
                    $this->totalRow = $totalRows['Worksheet'];
                    $this->totalRow = (int) $this->totalRow - 1;
                }
            }
        ];
    }
    public function model(array $row)
    {
        
        ++$this->rows;
     

        // Check 
        $totalEpisode = Program::where('program_name', 'like', '%' . $this->program_name . '%')
                        ->where('season', $this->season)->count();

       // dd($this->totalRow);                

        if ($this->totalRow < $totalEpisode) {
            $error = ['Pastikan semua tanggal booking terisi'];
            $failures[] = new Failure($this->rows, 'department', $error, $row);
            throw new \Maatwebsite\Excel\Validators\ValidationException(\Illuminate\Validation\ValidationException::withMessages($error), $failures);
        }

        // Check input data
        $program = Program::addSelect(['last_run_date' => DataAsset::select('tanggal_booking')
        ->whereColumn('program_name', 'programs.program_name')
        ->whereColumn('season', 'programs.season')
        ->orderBy('tanggal_booking', 'desc')
        ->take(1)
    ])->where('program_name', 'like', '%' . $row['nama_program'] . '%')
        ->where('season', '=', $row['season'])
        ->where('eps_number', '=', $row['episode'])
        ->first();
      

        // Program ID
        $row['program_id'] = (isEmpty($program) ? $program->id : Null);

        // Find Program TV Station
        $tvStation = TvStation::find($program->original_tv_station);
        $tvStation = (isEmpty($tvStation) ? $tvStation->original_tv_station : Null);
        $userTv = TvStation::find(Auth::user()->origin_station_id);

        // Find User TV Station
        $bookingBy = TvStation::find(Auth::user()->origin_station_id);
        
        // Change Format Tanggal Booking
        $row['tanggal_booking'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['tanggal_booking'])->format('Y-m-d');

        array_push($this->tanggal_booking, $row['tanggal_booking']);

          //check 31 days
          $lastDateRun = $program->last_run_date;      
              
          $newDate = Carbon::createFromFormat('Y-m-d', $row['tanggal_booking']);
          $thirtyOneDays = Carbon::createFromFormat('Y-m-d', $lastDateRun)->addDays(31);

          $HistoryBookingDetail = BookingHistoryDetail::select('tanggal_booking')->where('program_name', 'like', '%' . $row['nama_program'] . '%')
                        ->where('season', $row['season'])    
                        ->where('tanggal_booking', $row['tanggal_booking'])    
                        ->count();
        
                        
                        if($newDate->lt($thirtyOneDays) && $userTv->original_tv_station !== $tvStation) {
          
                            $error = ['Pastikan tanggal booking memenuhi jeda 31 hari'];
                            $failures[] = new Failure($this->rows, 'department', $error, $row);
                
                            throw new \Maatwebsite\Excel\Validators\ValidationException(\Illuminate\Validation\ValidationException::withMessages($error), $failures);
                        }                

        if($HistoryBookingDetail > 0 || ($newDate->lt($thirtyOneDays) && $userTv->original_tv_station !== $tvStation)) {
              
            $error = ['Ubah data Tanggal Booking untuk Program '.$row['nama_program'].' Season '.$row['season'].' gagal karena bertabrakan dengan Tanggal Booking lain dan belum jeda 31 hari'];
            $failures[] = new Failure($this->rows, 'department', $error, $row);
           
            throw new \Maatwebsite\Excel\Validators\ValidationException(\Illuminate\Validation\ValidationException::withMessages($error), $failures);                
        }                

       

        switch (strtolower($userTv->original_tv_station)) {
            case "sctv":
              $lastRunDateTvOrigin = 'last_run_sctv';
              break;
            case "ivm":
              $lastRunDateTvOrigin = 'last_run_ivm';
              break;
            case "moji":
              $lastRunDateTvOrigin = 'last_run_moji';
              break;
            case "mentari tv":
              $lastRunDateTvOrigin = 'last_run_mentari_tv';
              break;
            default:
              echo " ";
        }

        $dataAsset = DataAsset::updateOrCreate(
            [
                'program_name' => $program->program_name,
                'season' => $row['season'],
                'episode' => $row['episode'],
            ],
            [
                'program_id' => $row['program_id'],
                'tanggal_booking' => $row['tanggal_booking'],
                'program_name' => $program->program_name,
                'season' => $program->season,
                'tv_station' => $tvStation,
                'episode' => $program->eps_number,
                'last_run_tv' => $userTv->original_tv_station,
                'booking_by' => $bookingBy->original_tv_station,
                'booking_number' => $this->bookingNumber(),
                $lastRunDateTvOrigin => $row['tanggal_booking']
            ]
        );
        return $dataAsset;
    }
    public function batchSize(): int
    {
        return 1000;
    }
    public function map($row): array
    {
        $this->program_name = $row['nama_program'];
        $this->season = $row['season'];
        return [
            'nama_program' => $row['nama_program'],
            'season' => $row['season'],
            'episode' => $row['episode'],
            'tanggal_booking' => $row['tanggal_booking'],
        ];
    }
    public function rules(): array
    {
        return [
            '*.nama_program' => ['required', 'string', Rule::exists('programs', 'program_name')],
            '*.season' => [
                'required',
                Rule::exists('programs', 'season')->where(function ($query) {
                    $query->where('program_name', $this->program_name);
                }),
            ],
            '*.episode' => [
                'required',
                Rule::exists('programs', 'eps_number')->where(function ($query) {
                    $query->where('program_name', $this->program_name)
                    ->where('season', $this->season);
                }),
            ],
            // '*.tanggal_booking' => ['required', new BookingDateRule($this->program_name, $this->season, Auth::user()->origin_station_id)],
        ];
    }
    public function customValidationMessages()
    {
        // Tanggal Booking belum di validasi
        return [
            'nama_program.exists' => 'Program tidak ada di master data Program. Harap upload di master data Program dahulu',
            'season.exists' => 'Pastikan season dan program sudah terdaftar di sistem',
            'episode.exists' => 'Pastikan episode, season dan program sudah terdaftar di sistem',
            'nama_program.required' => 'Kolom Nama Program Harus Diisi',
            'season.required' => 'Kolom Season Harus Diisi',
            'episode.required' => 'Kolom Episode Harus Diisi',
            'date_format' => 'Pastikan format tanggal benar',
            'tanggal_booking.date_format' => 'Pastikan format tanggal benar',
            'tanggal_booking.required_without' => 'Pastikan tanggal booking sudah terisi'
        ];
    }
    public function getRowCount(): int
    {
        return $this->rows;
    }

    private function bookingNumber()
    {
        $maxBookingHistory = BookingHistory::max('booking_number');
        
        if(empty($maxBookingHistory)) {
            return 'SSJ-' . str_pad(1, 10, '0', STR_PAD_LEFT);
        } 

        $bookingNumber = explode('-', $maxBookingHistory);
        $bookingNumber = (int) $bookingNumber[1] + 1;
        $bookingNumber =  'SSJ-' . str_pad($bookingNumber, 10, '0', STR_PAD_LEFT);
        
        return $bookingNumber;
    }
}
