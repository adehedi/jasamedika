<?php

namespace App\Rules;

use App\Models\DataAsset;
use App\Models\Program;
use App\Models\TvStation;
use Carbon\Carbon;
use Illuminate\Contracts\Validation\Rule;

class BookingDateRule implements Rule
{
    protected $program_name, $season, $userTvStation;

    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($program_name, $season, $userTvStation)
    {
        $this->program_name = $program_name;
        $this->season = $season;
        $this->userTvStation = $userTvStation;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
         $userTv = TvStation::find($this->userTvStation);
          // Get booking date from last episode
          $dataAsset = DataAsset::where('program_name', 'like', '%' . $this->program_name . '%')->where('season', $this->season)->orderBy('tanggal_booking', 'desc')->first();

          //last tv run
          $tvOrigin = $dataAsset->tv_station;

          //last date run
          $lastDateRun = $dataAsset->tanggal_booking;
          
          $value = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($value)->format('Y-m-d');
          $newDate = Carbon::createFromFormat('Y-m-d', $value);
          $thirtyOneDays = Carbon::createFromFormat('Y-m-d', $lastDateRun)->addDays(31);

           return $newDate->gt($thirtyOneDays) || $userTv->original_tv_station == $tvOrigin;
                  
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Pastikan tanggal booking memenuhi jeda 31 hari, Ubah data Tanggal Booking gagal untuk Program '.$this->program_name.' Season '.$this->season.' karena bertabrakan dengan Tanggal Booking lain dan belum jeda 31 hari';
    }
}
