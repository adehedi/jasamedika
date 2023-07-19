<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\PurchaseStatus;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PurchaseStatusController extends Controller
{
    public function index()
    {
        return view('master.purchase.status.index');
    }

    public function show($id)
    {
        $material = PurchaseStatus::find($id);
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Pembelian',
            'data'    => $material
        ]); 
    }

    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'purchase_status' => ['required', 'string', 'max:255']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $material = PurchaseStatus::create(
            [
               'purchase_status' => $request->purchase_status,
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
            'purchase_status' => ['required', 'string', 'max:255'],
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        PurchaseStatus::where('id', $request->id)->update(['purchase_status' => $request->purchase_status]);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        PurchaseStatus::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]); 
    }
    
    public function getPurchaseStatus(Request $request)
    {
        if ($request->ajax()) {
            $data = PurchaseStatus::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-purchase" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-purchase" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
}
