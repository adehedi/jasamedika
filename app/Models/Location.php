<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
    protected $table = 'location';
    protected $fillable = [
        'id',
        'check_point_name',
        'building_name',
        'floor',
        'barcode_code',
        'address',
        'province',
        'city',
        'subdistrict',
        'village_district',
        'postal_code',
        'longitude',
        'latitude',
    ];

    public function patrol()
    {
        return $this->hasOne(Patrol::class);
    }
}
