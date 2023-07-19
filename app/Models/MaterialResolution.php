<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaterialResolution extends Model
{
    use HasFactory;
    protected $fillable = [
        'material_resolution',
        'created_by'
    ];
}
