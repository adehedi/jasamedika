<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\MaterialStatus;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class MaterialStatusController extends Controller
{
    public function index()
    {
        return view('master.material.status.index');
    }

    public function show($id)
    {
        $material = MaterialStatus::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Provinsi',
            'data'    => $material
        ]); 
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'material_status' => ['required', 'string', 'max:255']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $material = MaterialStatus::create(
            [
               'material_status' => $request->material_status,
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
            'material_status' => ['required', 'string', 'max:255'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        MaterialStatus::where('id', $request->id)->update(['material_status' => $request->material_status]);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        MaterialStatus::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]); 
    }
    
    public function getMaterialStatus(Request $request)
    {
        if ($request->ajax()) {
            $data = MaterialStatus::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-material" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-material" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
}
