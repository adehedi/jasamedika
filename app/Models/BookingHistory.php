<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingHistory extends Model
{
    use HasFactory;
    protected $guarded = [
        'id'
    ];

    public function program()
    {
        return $this->belongsTo(Program::class);
    }

    public function dataAsset()
    {
        return $this->belongsTo(DataAsset::class);
    }

    public function bookingHistoryDetails(){
        return $this->hasMany(BookingHistoryDetail::class);
    }
}
