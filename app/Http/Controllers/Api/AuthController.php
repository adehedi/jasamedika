<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = $request->user();

            $token = $user->createToken('epatrolToken')->plainTextToken;

            return response()->json([
                'access_token' => $token,
                'token_type' => 'Bearer',
            ]);
        }

        return response()->json([
            'message' => 'Invalid credentials',
        ], 401);
    }

    public function getUser(Request $request)
    {
        try {
            $user = $request->user();

            if ($request->user()) {
                return response()->json([
                    'data' => [
                        "user_id" => $user->id,
                        'employee_id' => $user->employee_id,
                        'name' => $user->name,
                        'email' => $user->email,
                        'photo' => $user->image,
                        'role' => $user->roles->pluck('name'),
                    ]
                ], 200);
            }
        } catch (Exception $e) {
            throw $e;
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Logout successful'
        ]);
    }
}
