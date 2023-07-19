<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataAsset extends Model
{
    use HasFactory;
    protected $guarded = [
        'id'
    ];

    public function Program()
    {
        return $this->belongsTo(Program::class);
    }

    public function bookingHistory()
    {
        return $this->hasOne(BookingHistory::class);
    }
}
