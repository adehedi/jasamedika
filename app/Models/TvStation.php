<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TvStation extends Model
{
    use HasFactory;
    protected $table = 'original_tv_stations';
    protected $fillable = [
        'original_tv_station',
        'created_by'
    ];
}
