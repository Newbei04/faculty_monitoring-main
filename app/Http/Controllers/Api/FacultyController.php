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

    public function viewAttendance(Request $request)
    {
        $user = $request->user();
        $attendances = Booking::where('user_id', $user->id)
            ->with(['room', 'subject']) 
            ->orderBy('booking_date', 'desc') 
            ->orderBy('start_booking_time', 'desc')
            ->get();
        return response()->json($attendances);
    }

    public function scanQr(Request $request)
    {
        try {
            $request->validate([
                'room_id' => 'required|exists:rooms,id',
            ]);

            $user = $request->user();
            $roomId = $request->room_id;
            $now = Carbon::now();

            $dayNow = Carbon::now()->format('l');
            $timeNow = Carbon::now()->format('H:i:s');

            $schedule = Schedule::where('user_id', $user->id)
                ->where('room_id', $roomId)
                ->where('day', $dayNow)
                ->where('start_time', '<=', $timeNow)
                ->where('end_time', '>=', $timeNow)
                ->first();

            if (!$schedule) {
                return response()->json([
                    'message' => 'No active schedule for this time'
                ], 400);
            }

            // Find existing open booking — whereNull works on both MySQL and PostgreSQL
            $booking = Booking::where('user_id', $user->id)
                ->where('room_id', $roomId)
                ->where('subject_id', $schedule->subject_id)
                ->where('booking_date', $now->toDateString())
                ->whereNull('end_booking_time')
                ->first();

            // Only create if no open booking exists
            if (!$booking) {
                $booking = Booking::create([
                    'user_id'      => $user->id,
                    'room_id'      => $roomId,
                    'subject_id'   => $schedule->subject_id,
                    'booking_date' => $now->toDateString(),
                ]);
            }

            if ($booking->start_booking_time && $booking->end_booking_time) {
                return response()->json([
                    'message' => 'Already completed'
                ], 400);
            }

            if (!$booking->start_booking_time) {
                $booking->update([
                    'start_booking_time' => $timeNow
                ]);

                return response()->json([
                    'message' => 'Checked in successfully',
                    'status'  => 'in'
                ]);
            }

            if (!$booking->end_booking_time) {
                $booking->update([
                    'end_booking_time' => $timeNow
                ]);

                return response()->json([
                    'message' => 'Checked out successfully',
                    'status'  => 'out'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function viewSchedules(Request $request)
    {
        $user = $request->user();
        $schedules = Schedule::where('user_id', $user->id)->with(['subject', 'room'])->get();
        return response()->json($schedules);
    }
}