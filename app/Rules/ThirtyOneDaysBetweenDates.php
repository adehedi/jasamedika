<?php

namespace App\Rules;

use App\Models\DataAsset;
use App\Models\Program;
use App\Models\TvStation;
use Carbon\Carbon;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ThirtyOneDaysBetweenDates implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    protected $program_name, $season;
    public function __construct($program_name, $season)
    {
        $this->program_name = $program_name;
        $this->season = $season;
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
        $userTv = Program::where(['program_name' => $this->program_name, 'season' => $this->season, 'original_tv_station' => Auth::user()->origin_station_id])->get();
        // Check if user have same tv station with program
        if ($userTv->isEmpty()) {
            // Get booking date from last episode
            $lastEpisode = Program::where(['program_name' => $this->program_name, 'season' => $this->season])->select('original_tv_station', DB::raw("max(eps_number) as episode"))->groupBy('original_tv_station')->get();
            dd($lastEpisode);
            $maxBookingDate = DataAsset::where(['program_name' => $this->program_name, 'season' => $this->season, 'episode' => $lastEpisode])->select('tanggal_booking')->get();

            // Change format booking date
            $start = str_replace("/", "-", $value);

            // Make date object
            $start = Carbon::parse($start);
            $maxBookingDate = Carbon::parse($maxBookingDate[0]->tanggal_booking);

            // Compare 2 date
            $difference = $start->diffInDays($maxBookingDate);

            // Return true if the difference is 31 day
            return $difference == 31;
        }
        else{
            return true;
        }
        
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Pastikan tanggal booking memenuhi jeda 31 hari';
    }
}
