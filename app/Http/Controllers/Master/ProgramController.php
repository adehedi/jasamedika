<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\DataAsset;
use App\Models\FormatFile;
use App\Models\MaterialResolution;
use App\Models\MaterialStatus;
use App\Models\Program;
use App\Models\ProgramType;
use App\Models\Province;
use App\Models\PurchaseStatus;
use App\Models\TvStation;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class ProgramController extends Controller
{
    public function index()
    {
        // $data = Program::latest()->get();
        // var_dump('<pre>', $data, '<pre>');die;
        $province = Province::all();
        $city = City::all();
        $format_file = FormatFile::all();
        $material_resolution = MaterialResolution::all();
        $material_status = MaterialStatus::all();
        $purchase_status = PurchaseStatus::all();
        $program_type = ProgramType::all();
        $tv_station = TvStation::all(); 

        return view('master.program.upload.index', [
            'province' => $province,
            'city' => $city,
            'format_file' => $format_file,
            'material_resolution' => $material_resolution,
            'material_status' => $material_status,
            'purchase_status' => $purchase_status,
            'program_type' => $program_type,
            'tv_station' => $tv_station
        ]);
    }

    public function show($id)
    {
        $program = Program::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Program',
            'data'    => $program
        ]); 
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'file_name' => ['required', 'string', 'max:255'],
            'po_asset' => ['required', 'string', 'max:255'],
            'sub_title' => ['required', 'string', 'max:255'],
            'program_name' => ['required', 'string', 'max:255'],
            'season' => ['required', 'integer'],
            'eps_number' => ['required', 'integer'],
            'province' => ['required', 'integer'],
            'city' => ['required', 'integer'],
            'file_format' => ['required', 'integer'],
            'material_resolution' => ['required', 'integer'],
            'in_out_house' => ['required', 'string'],
            'po_year' => ['required', 'integer'],
            'slot_prg' => ['required', 'integer'],
            'material_status' => ['required', 'integer'],
            'program_duration' => ['required'],
            'purchase_status' => ['required', 'integer'],
            'license_start' => ['required','date'],
            'license_end' => ['required','date'],
            'ph_name' => ['required', 'string'],
            'program_type' => ['required', 'integer'],
            'tv_station' => ['required', 'integer']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $program = Program::create(
            [
                'file_name' => $request->file_name,
                'po_asset' => $request->po_asset,
                'sub_title' => $request->sub_title,
                'program_name' => $request->program_name,
                'season' => $request->season,
                'eps_number' => $request->eps_number,
                'province' => $request->province,
                'city' => $request->city,
                'file_format' => $request->file_format,
                'material_resolution' => $request->material_resolution,
                'in_out_house' => $request->in_out_house,
                'po_year' => $request->po_year,
                'slot_prg' => $request->slot_prg,
                'material_status' => $request->material_status,
                'program_duration' => $request->program_duration,
                'purchase_status' => $request->purchase_status,
                'license_start' => $request->license_start,
                'license_end' => $request->license_end,
                'ph_name' => $request->ph_name,
                'program_type' => $request->program_type,
                'original_tv_station' => $request->tv_station
            ]
        );

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Disimpan!'
        ]);
    }

    public function update(Request $request)
    {
        // define validation rules
        $validator = Validator::make($request->all(), [
            'file_name' => ['required', 'string', 'max:255'],
            'po_asset' => ['required', 'string', 'max:255'],
            'sub_title' => ['required', 'string', 'max:255'],
            'program_name' => ['required', 'string', 'max:255'],
            'season' => ['required', 'integer'],
            'eps_number' => ['required', 'integer'],
            'province' => ['required', 'integer'],
            'city' => ['required', 'integer'],
            'file_format' => ['required', 'integer'],
            'material_resolution' => ['required', 'integer'],
            'in_out_house' => ['required', 'string'],
            'po_year' => ['required', 'integer'],
            'slot_prg' => ['required', 'integer'],
            'material_status' => ['required', 'integer'],
            'program_duration' => ['required'],
            'purchase_status' => ['required', 'integer'],
            'license_start' => ['required','date'],
            'license_end' => ['required','date'],
            'ph_name' => ['required', 'string'],
            'program_type' => ['required', 'integer'],
            'tv_station' => ['required', 'integer']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        Program::where('id', $request->id)->update(
            [   
                'file_name' => $request->file_name,
                'po_asset' => $request->po_asset,
                'sub_title' => $request->sub_title,
                'program_name' => $request->program_name,
                'season' => $request->season,
                'eps_number' => $request->eps_number,
                'province' => $request->province,
                'city' => $request->city,
                'file_format' => $request->file_format,
                'material_resolution' => $request->material_resolution,
                'in_out_house' => $request->in_out_house,
                'po_year' => $request->po_year,
                'slot_prg' => $request->slot_prg,
                'material_status' => $request->material_status,
                'program_duration' => $request->program_duration,
                'purchase_status' => $request->purchase_status,
                'license_start' => $request->license_start,
                'license_end' => $request->license_end,
                'ph_name' => $request->ph_name,
                'program_type' => $request->program_type,
                'original_tv_station' => $request->tv_station
            ]
        );

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        $dataAsset = DataAsset::where('program_id', $id)->first();
        if($dataAsset){
            return response()->json([
                'error' => true,
                'booked' => true,
                'message' => 'Data program sedang di booking!',
            ], 422);
        }
        
        Program::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]); 
    }
    
    public function getProgram(Request $request)
    {
        if ($request->ajax()) {
            $data = DB::table('programs as a')
                    ->leftJoin('provinces as b', 'a.province', '=', 'b.id')
                    ->leftJoin('cities as c', 'a.city', '=', 'c.id')
                    ->leftJoin('format_files as d', 'a.file_format', '=', 'd.id')
                    ->leftJoin('material_resolutions as e', 'a.material_resolution', '=', 'e.id')
                    ->leftJoin('material_status as f', 'a.material_status', '=', 'f.id')
                    ->leftJoin('purchase_status as g', 'a.purchase_status', '=', 'g.id')
                    ->leftJoin('program_types as h', 'a.program_type', '=', 'h.id')
                    ->leftJoin('original_tv_stations as i', 'a.original_tv_station', '=', 'i.id')
                    ->select('a.id','a.file_name', 'a.po_asset', 'a.sub_title', 'a.program_name', 'a.season', 'a.eps_number', 'b.province_name', 'c.city_name', 'd.file_format', 'e.material_resolution', 'a.in_out_house', 'a.po_year', 'a.slot_prg', 'f.material_status', 'a.program_duration', 'g.purchase_status', 'a.license_start', 'a.license_end', 'a.ph_name', 'h.program_type', 'i.original_tv_station', 'a.original_tv_station','a.created_at')
                    ->latest()
                    ->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-program" data-id="'.$row->id.'" data-tv="'.$row->original_tv_station.'" data-user="'.Auth::user()->origin_station_id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-program" data-id="'.$row->id.'" data-tv="'.$row->original_tv_station.'" data-user="'.Auth::user()->origin_station_id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
}
