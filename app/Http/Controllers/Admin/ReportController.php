<?php

namespace App\Http\Controllers\Admin;

use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

/**
 * Class ReportController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class ReportController extends Controller
{
    public function export(Request $request, $type)
    {
        // Initialize variables to store the start and end dates for the whereBetween clause
        $startDate = null;
        $endDate = null;

        // Check the selected reporting period and set the start and end dates accordingly
        switch ($request->input('report_period')) {
            case 'daily':
                $startDate = now()->startOfDay();
                $endDate = now()->endOfDay();
                break;
            case 'weekly':
                $startDate = now()->startOfWeek();
                $endDate = now()->endOfWeek();
                break;
            case 'monthly':
                $startDate = now()->startOfMonth();
                $endDate = now()->endOfMonth();
                break;
            case 'yearly':
                $startDate = now()->startOfYear();
                $endDate = now()->endOfYear();
                break;
            default:
                $startDate = now()->startOfDay();
                $endDate = now()->endOfDay();
        }

        // Fetch room statistics based on the selected reporting period
        $roomStats = Booking::select('rooms.id as room_id', 'rooms.room_number as room_name', 'rooms.building_number as building',
            DB::raw('SUM(TIMESTAMPDIFF(HOUR, STR_TO_DATE(start_booking_time, "%h:%i %p"), STR_TO_DATE(end_booking_time, "%h:%i %p"))) AS total_hours'),
            DB::raw('SUM(TIMESTAMPDIFF(SECOND, STR_TO_DATE(start_booking_time, "%h:%i %p"), STR_TO_DATE(end_booking_time, "%h:%i %p"))) AS total_seconds'),
            DB::raw('SUM(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(start_booking_time, "%h:%i %p"), STR_TO_DATE(end_booking_time, "%h:%i %p"))) AS total_minutes'),
            DB::raw('COUNT(*) AS total_bookings'),
        )
            ->join('rooms', 'rooms.id', '=', 'bookings.room_id')
            ->whereBetween('booking_date', [$startDate, $endDate])
            ->groupBy('room_id')
            ->get();

        if ($type == 'pdf') {
            $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('admin.print', [
                'roomStats' => $roomStats
            ])->setPaper('a4', 'landscape');

            return $pdf->download('report.pdf');
        } elseif ($type == 'excel') {
            return \Maatwebsite\Excel\Facades\Excel::download(new \App\Exports\ReportExport($roomStats), 'report.xlsx');
        } elseif ($type == 'print') {
            $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('admin.print', [
                'roomStats' => $roomStats
            ])->setPaper('a4', 'landscape');

            return $pdf->stream('report.pdf');
        }

        // Default to print if type not recognized
        return redirect()->back();
    }

    public function index(Request $request)
    {
        // Initialize variables to store the start and end dates for the whereBetween clause
        $startDate = null;
        $endDate = null;

        // Check the selected reporting period and set the start and end dates accordingly
        switch ($request->input('report_period')) {
            case 'daily':
                $startDate = now()->startOfDay();
                $endDate = now()->endOfDay();
                break;
            case 'weekly':
                $startDate = now()->startOfWeek();
                $endDate = now()->endOfWeek();
                break;
            case 'monthly':
                $startDate = now()->startOfMonth();
                $endDate = now()->endOfMonth();
                break;
            case 'yearly':
                $startDate = now()->startOfYear();
                $endDate = now()->endOfYear();
                break;
            default:
                $startDate = now()->startOfDay();
                $endDate = now()->endOfDay();
        }

        // Fetch room statistics based on the selected reporting period
        $roomStats = Booking::select(
            'rooms.id as room_id',
            'rooms.room_number as room_name',
            'rooms.building_number as building',

            DB::raw("
            SUM(
                TIMESTAMPDIFF(
                    SECOND,
                    STR_TO_DATE(CONCAT(booking_date, ' ', start_booking_time), '%Y-%m-%d %H:%i:%s'),
                    STR_TO_DATE(CONCAT(booking_date, ' ', end_booking_time), '%Y-%m-%d %H:%i:%s')
                )
            ) AS total_seconds
        "),

            DB::raw('COUNT(*) AS total_bookings')
        )
            ->join('rooms', 'rooms.id', '=', 'bookings.room_id')
            ->whereBetween('booking_date', [$startDate, $endDate])
            ->groupBy('rooms.id', 'rooms.room_number', 'rooms.building_number')
            ->get();


        // Pass the room statistics and other data to the view
        return view('admin.report', [
            'title' => 'Report',
            'breadcrumbs' => [
                trans('backpack::crud.admin') => backpack_url('dashboard'),
                'Report' => false,
            ],
            'page' => 'resources/views/admin/report.blade.php',
            'controller' => 'app/Http/Controllers/Admin/ReportController.php',
            'roomStats' => $roomStats
        ]);
    }

}
