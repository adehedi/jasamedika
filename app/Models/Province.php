<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    use HasFactory;
    protected $fillable = [
        'province_name',
        'created_by'
    ];

    public function programs()
    {
        return $this->hasMany(Program::class, 'province', 'id');
    }
}
