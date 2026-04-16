<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\User;
use App\Models\Faculty;
use App\Models\Subject;
use App\Models\Booking;
use App\Models\Attendance;
use App\Models\Room;
use PDF; 

class AdminController extends Controller
{

    public function checkSchedule(Request $request)
    {
        $schedules = Schedule::with(['user', 'subject', 'room'])->get();
        return response()->json($schedules);
    }

    public function checkUser(Request $request)
    {
        $users = User::all();
        return response()->json($users);
    }

    public function checkFaculties(Request $request)
    {
        $faculties = User::where('role', 'faculty')->get();

        return response()->json($faculties);
    }

    public function checkSubjects(Request $request)
    {
        $subjects = Subject::all();
        return response()->json($subjects);
    }

    public function checkAttendance(Request $request)
    {
        $attendances = Attendance::with(['user', 'room'])->get();

        return response()->json([
            'status' => 'success',
            'total' => $attendances->count(),
            'data' => $attendances
        ]);
    }


    public function generateReport(Request $request)
    {
        $attendances = Attendance::with(['user', 'room'])->get();
        $data = [
            'attendances' => $attendances,
            'total' => $attendances->count(),
        ];

        return response()->json($data);
        // For PDF: $pdf = PDF::loadView('reports.attendance', $data); return $pdf->download('report.pdf');
    }
}