<?php

use App\Http\Controllers\Booking\BookingCardController;
use App\Http\Controllers\Booking\BookingController;
use App\Http\Controllers\Booking\BookingExcelController;
use App\Http\Controllers\Booking\BookingHistoryController;
use App\Http\Controllers\Booking\ViewBookingController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\Master\CityController;
use App\Http\Controllers\Master\FormatFileController;
use App\Http\Controllers\Master\MaterialResolutionController;
use App\Http\Controllers\Master\MaterialStatusController;
use App\Http\Controllers\Master\ProgramController;
use App\Http\Controllers\Master\ProgramExcelController;
use App\Http\Controllers\Master\ProgramTypeController;
use App\Http\Controllers\Master\ProvinceController;
use App\Http\Controllers\Master\PurchaseStatusController;
use App\Http\Controllers\Master\TvStationController;
use App\Http\Controllers\Master\UserController;
use App\Http\Controllers\PatrolController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReportController;

// module baru
use App\Http\Controllers\KelurahanController;
use App\Http\Controllers\PasienController;

use App\Models\BookingHistory;
use Illuminate\Support\Facades\Route;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/login');
});
Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    // User
    Route::get('/user', [UserController::class, 'index'])->name('user');
    Route::get('/users', [UserController::class, 'getUsers'])->name('users.list');
    Route::get('/user/{id}', [UserController::class, 'show'])->name('users.edit');
    Route::post('/user/store', [UserController::class, 'store'])->name('users.add');
    Route::post('/user/update', [UserController::class, 'update'])->name('users.update');
    Route::delete('/user/{id}', [UserController::class, 'destroy'])->name('users.delete');

    // Location
    Route::get('/location', [LocationController::class, 'index'])->name('location');
    Route::get('/locations', [LocationController::class, 'getLocation'])->name('location.list');
    Route::get('/location/{id}', [LocationController::class, 'edit'])->name('location.edit');
    Route::post('/location/store', [LocationController::class, 'store'])->name('location.add');
    Route::post('/location/update', [LocationController::class, 'update'])->name('location.update');
    Route::delete('/location/{id}', [LocationController::class, 'destroy'])->name('location.delete');
    Route::get('/location/qrcode/download/{id}', [LocationController::class, 'downloadQr'])->name('location.qrcode.download');
    Route::get('/location/qrcode/{barcode}', function ($barcode) {
        return base64_encode(QrCode::format('png')->size(100)->generate($barcode));
    });

    // Patrol
    Route::get('/patrol', [PatrolController::class, 'index'])->name('patrol');
    Route::get('/patrols', [PatrolController::class, 'getPatrolReport'])->name('patrol.report');
    Route::get('/patrol/{id}', [PatrolController::class, 'getPatrol'])->name('patrol.detail');

    // Report
    Route::get('/report', [ReportController::class, 'index'])->name('report');
    Route::post('/report/export', [ReportController::class, 'export'])->name('report.export');
	
    // Kelurahan
    Route::get('/kelurahan', [KelurahanController::class, 'index'])->name('kelurahan');
    Route::get('/kelurahans', [KelurahanController::class, 'getKelurahan'])->name('kelurahan.list');
    Route::get('/kelurahan/{id}', [KelurahanController::class, 'edit'])->name('kelurahan.edit');
    Route::post('/kelurahan/store', [KelurahanController::class, 'store'])->name('kelurahan.add');
    Route::post('/kelurahan/update', [KelurahanController::class, 'update'])->name('kelurahan.update');
    Route::delete('/kelurahan/{id}', [KelurahanController::class, 'destroy'])->name('kelurahan.delete');
	
    // Pasien
    Route::get('/pasien', [PasienController::class, 'index'])->name('pasien');
    Route::get('/pasiens', [PasienController::class, 'getPasien'])->name('pasien.list');
    Route::get('/pasien/{id}', [PasienController::class, 'edit'])->name('pasien.edit');
    Route::post('/pasien/store', [PasienController::class, 'store'])->name('pasien.add');
    Route::post('/pasien/update', [PasienController::class, 'update'])->name('pasien.update');
    Route::delete('/pasien/{id}', [PasienController::class, 'destroy'])->name('pasien.delete');
    Route::get('/pasien/kelurahan/{id}', [PasienController::class, 'kelurahan'])->name('pasien.kelurahan');
	
});

require __DIR__.'/auth.php';
