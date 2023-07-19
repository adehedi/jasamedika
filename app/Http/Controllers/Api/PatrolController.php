<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PatrolResource;
use App\Models\Location;
use App\Models\Patrol;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PatrolController extends Controller
{
    public function show(Request $request)
    {
        $patrolQuery = Patrol::with(['user:id,name', 'location:id,longitude,latitude,check_point_name,barcode_code,building_name,floor']);
        
        if(!empty($request->user_name)){
            $patrolQuery->whereHas('user', function ($query) use ($request) {
                $query->where('name', 'like', '%' . $request->user . '%');
            });
        }
        
        if(!empty($request->qrcode)){
            $patrolQuery->whereHas('location', function ($query) use ($request) {
                $query->where('barcode_code', $request->qrcode);
            });
        }

        if(!empty($request->building_name)){
            $patrolQuery->whereHas('location', function ($query) use ($request) {
                $query->where('building_name', 'LIKE', '%' . $request->building_name . '%');
            });
        }

        if(!empty($request->floor)){
            $patrolQuery->whereHas('location', function ($query) use ($request) {
                $query->where('floor', $request->floor);
            });
        }

        if(!empty($request->check_point_name)){
            $patrolQuery->whereHas('location', function ($query) use ($request) {
                $query->where('check_point_name', 'LIKE', '%' . $request->check_point_name . '%');
            });
        }

        if(!empty($request->condition)){
            $patrolQuery->where('condition', $request->condition);
        }
        
        if (!empty($request->start_date) && !empty($request->end_date)) {
            $patrolQuery->whereDate('created_at', '>=', $request->start_date)->whereDate('created_at', '<=', $request->end_date);
        }

        if (!empty($request->user_id)) {
            $patrolQuery->where('user_id', $request->user_id);
        }

        $patrol = $patrolQuery->orderBy('created_at', 'desc')->paginate(10);

        return PatrolResource::collection($patrol);
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'location_id' => ['required', 'string', 'max:255'],
            'condition' => ['required', 'string', 'max:255'],
            'condition_note' => ['required', 'string', 'max:255'],
            'photo_one' => ['nullable','image', 'mimes:jpeg,png,jpg'],
            'photo_two' => ['nullable','image', 'mimes:jpeg,png,jpg'],
            'photo_three' => ['nullable','image', 'mimes:jpeg,png,jpg'],
            'video' => ['nullable','file', 'mimes:mp4,mov,mkv'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        // Request Variable
        $photo = ['photo_one', 'photo_two', 'photo_three'];

        // Location Detail
        $location = Location::find($request->location_id);
        $imagePath = [];

        try {
            // Save Image
            if ($request->file('photo_one') || $request->file('photo_two') || $request->file('photo_three')) {
                $image1 = $request->file('photo_one');
                    if($image1){
                        $extension = $image1->getClientOriginalExtension();
                        $filename = str_replace(' ', '_', $location->check_point_name) . '_' . str_replace(' ', '_', $location->building_name) . '1' . '_' . time();
                        $image1->move('uploads/image/', $filename  . '.' . $extension);
                        $image1 = 'uploads/image/' . $filename . '.' . $extension;
                    }

                $image2 = $request->file('photo_two');
                    if($image2){
                        $extension = $image2->getClientOriginalExtension();
                        $filename = str_replace(' ', '_', $location->check_point_name) . '_' . str_replace(' ', '_', $location->building_name) . '2' . '_' . time();
                        $image2->move('uploads/image/', $filename  . '.' . $extension);
                        $image2 = 'uploads/image/' . $filename . '.' . $extension;
                    }

                $image3 = $request->file('photo_three');
                    if($image3){
                        $extension = $image3->getClientOriginalExtension();
                        $filename = str_replace(' ', '_', $location->check_point_name) . '_' . str_replace(' ', '_', $location->building_name) . '3' . '_' . time();
                        $image3->move('uploads/image/', $filename  . '.' . $extension);
                        $image3 = 'uploads/image/' . $filename . '.' . $extension;
                    }
                
            }

            // Save video file
            $filenameVideo = null;
            if ($request->hasFile('video')) {
                $video = $request->file('video');
                $extension = $video->getClientOriginalExtension();
                $filenameVideo = str_replace(' ', '_', $location->check_point_name) . '_' . str_replace(' ', '_', $location->building_name) . '_' . time() . '.' . $extension;
                $video->move('uploads/video/', $filenameVideo);
            }
            
            $patrol = Patrol::create([
                'location_id' => $request->location_id,
                'user_id' => Auth::user()->id,
                'condition' => $request->condition,
                'condition_note' => $request->condition_note,
                'photo_one' => ($request->file('photo_one')) ? $image1 : null,
                'photo_two' => ($request->file('photo_two')) ? $image2 : null,
                'photo_three' => ($request->file('photo_three')) ? $image3 : null,
                'video' => ($filenameVideo) ? 'uploads/video/' . $filenameVideo : null,
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'message' => $e->getMessage()
            ], 500);
        }

        return response()->json([
            'message' => 'Data created successfully'
        ], 201);
    }

    public function getCondition(){
        return response()->json([
            "data" => [
                [
                    "code" => "aman",
                    "name" => "Aman"
                ],
                [
                    "code" => "kendala",
                    "name" => "Kendala"
                ],
                [
                    "code" => "butuh_tindakan",
                    "name" => "Butuh Tindakan"
                ]
            ]
        ]);
    }
}
