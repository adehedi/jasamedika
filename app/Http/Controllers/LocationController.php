<?php

namespace App\Http\Controllers;

use App\Models\Location;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Yajra\DataTables\Facades\DataTables;

class LocationController extends Controller
{
    public function index()
    {
        return view('location.index');
    }

    public function getLocation(Request $request)
    {
        if ($request->ajax()) {
            $data = Location::latest()->get();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-location" data-id="'.$row->id.'" class="edit btn btn-warning btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-location" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</a>
                    <a href="/location/qrcode/download/'.$row->id.'" id="btn-download-location" data-id="'.$row->id.'" class="delete btn btn-success btn-sm">Download</a>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'checkpoint_name' => 'required|string|max:255',
            'building_name' => 'required|string|max:255',
            'floor' => 'required|string|max:3',
            'barcode_code' => 'required|string|max:16',
            // 'address' => 'string|max:255',
            // 'province' => 'string|max:255',
            // 'city' => 'string|max:255',
            // 'subdistrict' => 'string|max:255',
            // 'village_district' => 'string|max:255',
            // 'postal_code' => 'string|max:5',
            // 'longitude' => 'string|max:255',
            // 'latitude' => 'string|max:255',
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Insert Data
        $location = Location::create([
            'check_point_name' => $request->checkpoint_name,
            'building_name' => $request->building_name,
            'floor' => $request->floor,
            'barcode_code' => $request->barcode_code,
            'address' => $request->address,
            'province' => $request->province,
            'city' => $request->city,
            'subdistrict' => $request->subdistrict,
            'village_district' => $request->village_district,
            'postal_code' => $request->postal_code,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude
        ]);

        // Save qr code
        if ($location) {
            $qrCode = base64_encode(QrCode::format('png')->generate($request->barcode_code));
            $imageData = base64_decode($qrCode);
            file_put_contents(public_path('uploads/qrcode/' . Str::slug($location->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png') , $imageData);
            $location->barcode_code = $request->barcode_code;
        }

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Disimpan!'
        ]);
    }

    public function edit($id)
    {
        $user = Location::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data User',
            'data'    => $user
        ]);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'checkpoint_name' => 'string|max:255',
            'building_name' => 'string|max:255',
            'floor' => 'string|max:3',
            'barcode_code' => 'string|max:16',
            'address' => 'max:255',
            'province' => 'max:255',
            'city' => 'max:255',
            'subdistrict' => 'max:255',
            'village_district' => 'max:255',
            'postal_code' => 'max:5',
            'longitude' => 'max:255',
            'latitude' => 'max:255',
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // find location data
        $location = Location::find($request->location_id);

        // Update location
        $location->check_point_name = $request->checkpoint_name;
        $location->building_name = $request->building_name;
        $location->floor = $request->floor;
        $location->address = $request->address;
        $location->province = $request->province;
        $location->city = $request->city;
        $location->subdistrict = $request->subdistrict;
        $location->village_district = $request->village_district;
        $location->postal_code = $request->postal_code;
        $location->longitude = $request->longitude;
        $location->latitude = $request->latitude;

        if ($location->barcode_code !== $request->barcode_code) {
            // Delete existing qr code
            $oldQrcode = 'uploads/qrcode/' . Str::slug($location->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png';
            if (Storage::exists($oldQrcode)) {
                Storage::delete($oldQrcode);
            }

            // Reupload new qrcode
            $qrCode = base64_encode(QrCode::format('png')->generate($request->barcode_code));
            $imageData = base64_decode($qrCode);
            file_put_contents(public_path('uploads/qrcode/' . Str::slug($location->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png') , $imageData);
            $location->barcode_code = $request->barcode_code;
        }

        // Save data
        $location->save();

        // Response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        Location::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]);
    }

    public function getQrCode(Request $request)
    {
        // Testing
        // $qrCode = QrCode::format('png')->generate($request);
        $qrCode = '<img src="data:image/png;base64,{{ base64_encode(QrCode::format("png")->generate("Wow")) }}" alt="">';
        
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
            'data' => $qrCode
        ]);
    }

    public function downloadQr($id)
    {
        $location = Location::find($id);

        $qrCodePath = public_path('uploads/qrcode/' . Str::slug($location->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png');

        if (file_exists($qrCodePath)) {
            return Response::download($qrCodePath, Str::slug($location->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png', [
                'Content-Type' => 'image/png',
            ]);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'QR Code tidak ada!.',
            ]);
        }
    }
}
