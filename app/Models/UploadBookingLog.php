<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UploadBookingLog extends Model
{
    use HasFactory;
    protected $fillable = [
        'file_name',
        'row_number',
        'message',
        'upload_by'
    ];
}
