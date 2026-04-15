<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Booking;
use App\Models\Attendance;
use App\Models\Schedule;
use Carbon\Carbon;

class FacultyController extends Controller
{
    // Removed middleware from here, now in routes

    public function viewAvailableRooms(Request $request)
    {
        $rooms = Room::where('is_occupied', false)->get();
        return response()->json($rooms);
    }

    public function viewAttendance(Request $request)
    {
        $user = $request->user();
        $attendances = Booking::where('user_id', $user->id)->with('room')->get();
        return response()->json($attendances);
    }

    public function scanQr(Request $request)
    {
        $request->validate([
            'room_id' => 'required|exists:rooms,id',
        ]);

        $user = $request->user();
        $roomId = $request->room_id;
        $now = Carbon::now();

        // Check if user has an active booking for today
        $booking = Booking::where('user_id', $user->id)
            ->where('room_id', $roomId)
            ->where('booking_date', $now->toDateString())
            ->whereNull('end_booking_time')
            ->first();

        if (!$booking) {
            return response()->json(['message' => 'No active booking for this room'], 400);
        }

        // Check if already checked in
        $attendance = Attendance::where('user_id', $user->id)
            ->where('room_id', $roomId)
            ->whereDate('created_at', $now->toDateString())
            ->first();

        if (!$attendance) {
            // Check in
            Attendance::create([
                'user_id' => $user->id,
                'room_id' => $roomId,
                'time_in' => $now,
            ]);
            return response()->json(['message' => 'Checked in successfully']);
        } elseif (!$attendance->time_out) {
            // Check out
            $attendance->update(['time_out' => $now]);
            return response()->json(['message' => 'Checked out successfully']);
        } else {
            return response()->json(['message' => 'Already checked out'], 400);
        }
    }

    public function viewSchedules(Request $request)
    {
        $user = $request->user();
        $schedules = Schedule::where('user_id', $user->id)->with(['subject', 'room'])->get();
        return response()->json($schedules);
    }
}