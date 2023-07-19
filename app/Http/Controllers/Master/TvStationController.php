<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TvStation;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TvStationController extends Controller
{
    public function index()
    {
        return view('master.tv-station.index');
    }

    public function show($id)
    {
        $material = TvStation::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Stasiun TV',
            'data'    => $material
        ]); 
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'original_tv_station' => ['required', 'string', 'max:255']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $material = TvStation::create(
            [
               'original_tv_station' => $request->original_tv_station,
               'created_by' => Auth::user()->name
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
            'original_tv_station' => ['required', 'string', 'max:255'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        TvStation::where('id', $request->id)->update(['original_tv_station' => $request->original_tv_station]);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        TvStation::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]); 
    }
    
    public function getTvStation(Request $request)
    {
        if ($request->ajax()) {
            $data = TvStation::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-station" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-station" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
}
