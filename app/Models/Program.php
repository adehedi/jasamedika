<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
    use HasFactory;
    protected $guarded = [

    ];
    
    public function dataAssets()
    {
        return $this->hasOne(DataAsset::class, 'program_id', 'id');
    }

    public function city()
    {
        return $this->hasOne(City::class, 'id', 'city');
    }

    public function province()
    {
        return $this->hasOne(Province::class, 'id', 'province');
    }

    public function tvStation()
    {
        return $this->hasOne(TvStation::class, 'id', 'original_tv_station');
    }

    public function bookingHistory()
    {
        return $this->hasOne(BookingHistory::class);
    }
}
