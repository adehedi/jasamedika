<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Patrol;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;

class PatrolController extends Controller
{
    public function index()
    {
        return view('patrol.index');
    }
    
    public function getPatrolReport(Request $request)
    {
        if ($request->Ajax()) {
            $patrol = Patrol::with(['user', 'location'])->orderBy('created_at', 'desc')->get();
            return DataTables::of($patrol)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $actionBtn = '<a href="javascript:void(0)" id="btn-edit-user" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                <a href="javascript:void(0)" id="btn-delete-user" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                ';
                return $actionBtn;
            })
            // ->editColumn('condition_note', function($row)
            //     { 
            //         $condition_note = '<a href="javascript:void(0)" data-id="'.$row->id.'" id="viewConditionNoteButton" data-bs-toggle="modal" data-bs-target="#conditionNoteModal"> </a>';
            //         return $condition_note; 
            //     }
            // )
            ->editColumn('created_at', function($row)
                { 
                    $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $row->created_at)->format('d-m-Y H:i:s');
                    return $formatedDate; 
                }
            )
            ->addColumn('btnPictures', function ($row) {
                $actionBtn = '<a href="javascript:void(0)" class="text-decoration-none" data-id="'.$row->id.'" data-bs-toggle="modal" data-bs-target="#viewPictureModal" id="viewPictureButton">Pictures</a>';
                return $actionBtn;
            })
            ->addColumn('btnVideo', function ($row) {
                $actionBtn = '<a href="javascript:void(0)" class="text-decoration-none" data-id="'.$row->id.'" data-bs-toggle="modal" data-bs-target="#viewVideoModal" id="viewVideoButton">Videos</a>';
                return $actionBtn;
            })
            ->rawColumns(['action', 'ttl', 'btnPictures', 'btnVideo', 'condition_note'])
            ->make(true);
        }
    }

    public function getPatrol($id)
    {
        $patrol = Patrol::with(['user', 'location'])->find($id);

        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
            'data' => $patrol
        ]);
    }
}
