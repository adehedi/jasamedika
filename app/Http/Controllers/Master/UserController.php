<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\TvStation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use DataTables;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Str;
use Carbon\Carbon;

class UserController extends Controller
{
    public function index()
    {
        return view('user.index');
    }

     /**
     * store
     *
     * @param  mixed $request
     * @return void
     */
    public function store(Request $request)
    {
        $filename = null;
        //define validation rules
        $validator = Validator::make($request->all(), [
            'employee_name' => ['required', 'string', 'max:10'],
            'employee_id' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', Rules\Password::defaults()],
            'role' => ['required', 'string', 'max:32']
        ]);

        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if ($request->hasFile('employee_picture')) 
        {
            $image = $request->file('employee_picture');
            $extension = $image->getClientOriginalExtension();
            $filename = 'uploads/employee/' . time() . '.' . $extension;
            $image->move('uploads/employee/', $filename);
        }
        
        // dob
        $dob = ($request->yob == date('Y')) ? $request->yob . '-' . $request->mob . '-' . $request->dob : null;

        $user = User::create(
            [
               'name' => $request->employee_name,
               'employee_id' => $request->employee_id,
               'birth_place' => ($request->birth_place) ? $request->birth_place : null,
               'birth_date' => $dob,
               'address' => ($request->address) ? $request->address : null,
               'gender' => ($request->gender) ? $request->gender : null,
               'employee_position' => ($request->position) ? $request->position : null,
               'email' => $request->email,
               'password' => Hash::make($request->password),
               'role' => $request->role,
               'image' => ($filename) ? $filename : null
            ]
        );

        $user->assignRole($request->role);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Disimpan!'
        ]);
    }

     /**
     * show
     *
     * @param  mixed $post
     * @return void
     */
    public function show($id)
    {
        $user = User::find($id);
        $user->role = $user->roles->first()->name;
        //return response
        return response()->json([
            'success' => true,
            'message' => 'Detail Data User',
            'data'    => $user
        ]);
    }

    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $post
     * @return void
     */
    public function update(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'employee_name' => ['required', 'string', 'max:10'],
            'employee_id' => ['required', 'string', 'max:255'],
            'role' => ['required', 'string', 'max:32']
        ]);
        
        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $user = User::find($request->user_id);

        // Update image
        if ($request->hasFile('employee_picture')) 
        {
            $image = $request->file('employee_picture');
            $extension = $image->getClientOriginalExtension();
            $filename = 'uploads/employee/' . time() . '.' . $extension;
            $image->move('uploads/employee/', $filename);
            $user->image = $filename;
        }

        // Update user data
        $user->name = $request->employee_name;
        $user->employee_id = $request->employee_id;
        $user->birth_place = $request->birth_place;
        $user->birth_date = $request->yob . '-' . $request->mob . '-' . $request->dob;
        $user->address = $request->address;
        // $user->email = $request->email;
        $user->gender = $request->gender;
        $user->employee_position = $request->position;
        $user->assignRole($request->role);
        $user->save();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Diupdate!',
        ]);
    }

    public function destroy($id)
    {
        User::where('id', $id)->delete();

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data Berhasil Dihapus!.',
        ]);
    }

    public function getUsers(Request $request)
    {
        if ($request->ajax()) {
            $data = User::orderBy('created_at', 'desc')->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $actionBtn = '<a href="javascript:void(0)" id="btn-edit-user" data-id="'.$row->id.'" class="edit btn btn-success btn-sm">Edit</a> 
                    <a href="javascript:void(0)" id="btn-delete-user" data-id="'.$row->id.'" class="delete btn btn-danger btn-sm">Delete</button>
                    ';
                    return $actionBtn;
                })
                ->addColumn('user_pic', function ($row) {
                    return ($row->image) ? '<img src="'. $row->image .'" class="img-fluid">' : null;
                })
                ->editColumn('created_at', function($row)
                    { 
                        $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $row->created_at)->format('d-m-Y H:i:s');
                        return $formatedDate; 
                    }
                )
                ->addColumn('role', function ($row) {
                    return Str::ucfirst($row->roles->first()->name);
                })
                ->editColumn('ttl', function($row)
                    { 
                        $ttl = $row->birth_place . ', ' . $row->birth_date;
                        return $ttl; 
                    }
                )
                ->rawColumns(['action', 'ttl', 'user_pic'])
                ->make(true);
        }
    }
}
