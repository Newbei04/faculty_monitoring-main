<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\FacultyController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Login
Route::post('/login', [AuthController::class, 'login']);

// Admin routes
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    Route::get('/admin/schedules', [AdminController::class, 'checkSchedule']);
    Route::get('/admin/users', [AdminController::class, 'checkUser']);
    Route::get('/admin/faculties', [AdminController::class, 'checkFaculties']);
    Route::get('/admin/subjects', [AdminController::class, 'checkSubjects']);
    Route::get('/admin/report', [AdminController::class, 'generateReport']);
});

// Faculty routes
Route::middleware(['auth:sanctum', 'role:faculty'])->group(function () {
    Route::get('/faculty/rooms', [FacultyController::class, 'viewAvailableRooms']);
    Route::get('/faculty/attendance', [FacultyController::class, 'viewAttendance']);
    Route::post('/faculty/scan-qr', [FacultyController::class, 'scanQr']);
    Route::get('/faculty/schedules', [FacultyController::class, 'viewSchedules']);
});
