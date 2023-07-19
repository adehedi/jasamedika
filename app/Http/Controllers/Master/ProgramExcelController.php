<?php

namespace App\Http\Controllers\Master;

use App\Exports\ExportProgram;
use App\Http\Controllers\Controller;
use App\Imports\ImportProgram;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Imports\ImportUser;
use App\Models\City;
use App\Models\UploadLog;
use Carbon\Carbon;
use Illuminate\Support\Facades\Redirect;

class ProgramExcelController extends Controller
{
    public function index(){
        return view('master.program.upload-excel.index');
    }
    
    public function getUploadLog(Request $request){
        if ($request->ajax()) {
            $data = UploadLog::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                // ->addColumn('action', function($row){
                //     $actionBtn = ' <a href="javascript:void(0)" id="btn-delete-province" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                //     ';
                //     return $actionBtn;
                // })
                ->editColumn('created_at', function($row)
                    { 
                        $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $row->created_at)->format('d-m-Y H:i:s');
                        return $formatedDate; 
                    }
                )
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    // Excel 
    public function import(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'file_import' => ['required', 'mimes:xlsx'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        try{
            $import = new ImportProgram;
            Excel::import($import, $request->file('file_import'));
            if ($import->failures()->isNotEmpty()) {
                foreach ($import->failures() as $key => $value) {
                    $error_message = json_encode($value->errors());
                    UploadLog::create([
                        'file_name' => $request->file('file_import')->getClientOriginalName(),
                        'row_number' => $value->row(),
                        'message' => $error_message,
                        'upload_by' => Auth::user()->name
                    ]);
                }
            }
            
            return response()->json([
                'success' => true,
                'message' => 'Data berhasil diupload!',
                'result' => $request->file('file_import')->getClientOriginalName() . ' uploaded!',
                'row_success' => $import->getRowCount(),
                'row_fail' => count($import->failures())
            ]);
        }
        catch(\Exception $e){
            return response()->json(
                [
                    'error' => true,
                    'message' => $e->getMessage()
                ], 422
            );
        }

        
    }
 
    public function exportProgram(Request $request){
        return Excel::download(new ExportProgram, 'template-program.xlsx');
    }
}
