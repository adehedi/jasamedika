<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pasien extends Model
{
    use HasFactory;
    protected $table = 'pasien';
    protected $fillable = [
        'id',
        'code',
        'name',
        'gender',
        'rtrw',
        'phone',
        'address',
        'province',
        'city',
        'subdistrict',
        'village_district',
        'postal_code',
    ];

    public function kelurahan()
    {
        return $this->belongsTo(Kelurahan::class, 'village_district', 'id');
    }
}
