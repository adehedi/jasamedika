<?php

namespace App\Http\Controllers;

use App\Models\Kelurahan;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Yajra\DataTables\Facades\DataTables;

class KelurahanController extends Controller
{
    public function index()
    {
        return view('kelurahan.index');
    }

    public function getKelurahan(Request $request)
    {
        if ($request->ajax()) {
            $data = Kelurahan::latest()->get();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $actionBtn = 
					'<a href="javascript:void(0)" id="btn-edit-kelurahan" data-id="'.$row->id.'" class="edit btn btn-warning btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-kelurahan" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</a>
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
			'province' => 'string|max:255',
			'city' => 'string|max:255',
			'subdistrict' => 'string|max:255',
            'village_district' => 'string|max:255',
            'postal_code' => 'string|max:5',
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Insert Data
        $kelurahan = Kelurahan::create([
            'province' => $request->province,
            'city' => $request->city,
            'subdistrict' => $request->subdistrict,
            'village_district' => $request->village_district,
            'postal_code' => $request->postal_code,
        ]);

        // Save qr code
        /* if ($kelurahan) {
            $qrCode = base64_encode(QrCode::format('png')->generate($request->barcode_code));
            $imageData = base64_decode($qrCode);
            file_put_contents(public_path('uploads/qrcode/' . Str::slug($kelurahan->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png') , $imageData);
            $kelurahan->barcode_code = $request->barcode_code;
        } */

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Disimpan!'
        ]);
    }

    public function edit($id)
    {
        $user = Kelurahan::find($id);
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
            'province' => 'string|max:255',
			'city' => 'string|max:255',
			'subdistrict' => 'string|max:255',
            'village_district' => 'string|max:255',
            'postal_code' => 'string|max:5',
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // find location data
        $kelurahan = Kelurahan::find($request->kelurahan_id);

        // Update location
        $kelurahan->province = $request->province;
        $kelurahan->city = $request->city;
        $kelurahan->subdistrict = $request->subdistrict;
        $kelurahan->village_district = $request->village_district;
        $kelurahan->postal_code = $request->postal_code;

        /* if ($kelurahan->barcode_code !== $request->barcode_code) {
            // Delete existing qr code
            $oldQrcode = 'uploads/qrcode/' . Str::slug($kelurahan->building_name, '_') .'_'. Str::slug($kelurahan->check_point_name, '_') . '.png';
            if (Storage::exists($oldQrcode)) {
                Storage::delete($oldQrcode);
            }

            // Reupload new qrcode
            $qrCode = base64_encode(QrCode::format('png')->generate($request->barcode_code));
            $imageData = base64_decode($qrCode);
            file_put_contents(public_path('uploads/qrcode/' . Str::slug($kelurahan->building_name, '_') .'_'. Str::slug($location->check_point_name, '_') . '.png') , $imageData);
            $kelurahan->barcode_code = $request->barcode_code;
        } */

        // Save data
        $kelurahan->save();

        // Response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        Kelurahan::where('id', $id)->delete();

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
        $kelurahan = Kelurahan::find($id);

        $qrCodePath = public_path('uploads/qrcode/' . Str::slug($kelurahan->building_name, '_') .'_'. Str::slug($kelurahan->check_point_name, '_') . '.png');

        if (file_exists($qrCodePath)) {
            return Response::download($qrCodePath, Str::slug($kelurahan->building_name, '_') .'_'. Str::slug($kelurahan->check_point_name, '_') . '.png', [
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
