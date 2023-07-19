<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function getLocation(Request $request)
    {
        $location = Location::where('barcode_code', '=', $request->qrcode)->first();

        return response()->json([
            'data' => [
                'id' => $location->id,
                'check_point_name' => $location->check_point_name,
                'building_name' => $location->building_name,
                'floor' => $location->floor
            ]
        ], 200);
    }
}
