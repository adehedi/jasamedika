<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\PatrolController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', [AuthController::class, 'getUser']);

    // Route::post('/user', [UserController::class, 'store']);
    // Route::get('/user-data', [UserController::class, 'edit']);
    // Route::put('/user', [UserController::class, 'update']);
    // Route::delete('/user', [UserController::class, 'delete']);

    // Location
    Route::get('/location/qrcode', [LocationController::class, 'getLocation']);

    // Patrol
    Route::get('/patrol', [PatrolController::class, 'show']);
    Route::get('/patrol/condition', [PatrolController::class, 'getCondition']);
    Route::post('/patrol', [PatrolController::class, 'store']);

    // Logout
    Route::get('/logout', [AuthController::class, 'logout']);
});
