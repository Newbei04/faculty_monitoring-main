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
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;

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

    public function viewAvailableRooms(Request $request)
    {
        $now = Carbon::now();

        // Get currently occupied room IDs
        $occupiedRoomIds = Booking::whereNull('end_booking_time')
            ->whereDate('booking_date', $now->toDateString())
            ->pluck('room_id')
            ->toArray();

        // Get all rooms
        $rooms = Room::all();

        // Add occupancy status for each room
        $roomsWithStatus = $rooms->map(function ($room) use ($occupiedRoomIds) {
            $roomData = $room->toArray();
            $roomData['is_occupied'] = in_array($room->id, $occupiedRoomIds);
            return $roomData;
        })->values();

        return response()->json($roomsWithStatus);
    }

    public function generateReport(Request $request)
    {
        $attendances = Booking::with(['user', 'room', 'subject'])->get();

        $data = [
            'attendances' => $attendances,
            'total' => $attendances->count(),
            'generated_at' => now()->format('Y-m-d H:i:s'),
        ];

        // Check if PDF is requested
        if ($request->query('format') === 'pdf') {
            try {
                $pdf = Pdf::loadView('reports.attendance', $data);

                $pdf->setPaper('A4', 'landscape');
                $pdf->setOptions([
                    'defaultFont' => 'sans-serif',
                    'isHtml5ParserEnabled' => true,
                    'isRemoteEnabled' => true,
                ]);

                return $pdf->download('attendance_report_' . now()->format('Y-m-d') . '.pdf');
            } catch (\Exception $e) {
                return response()->json([
                    'error' => 'PDF generation failed',
                    'message' => $e->getMessage()
                ], 500);
            }
        }

        // Default: Return JSON
        return response()->json($data);
    }
}