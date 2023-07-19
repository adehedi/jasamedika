<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\FormatFile;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class FormatFileController extends Controller
{
    public function index(){
        return view('master.format.index');
    }

    public function show($id)
    {
        $format = FormatFile::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Provinsi',
            'data'    => $format
        ]); 
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'file_format' => ['required', 'string', 'max:255']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $province = FormatFile::create(
            [
               'file_format' => $request->file_format,
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
            'file_format' => ['required', 'string', 'max:255'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        FormatFile::where('id', $request->id)->update(['file_format' => $request->file_format]);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id){
        FormatFile::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]); 
   }
    
    public function getFormatFile(Request $request){
        if ($request->ajax()) {
            $data = FormatFile::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-format" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-format" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
}
