<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
class ReportExport implements FromCollection, WithHeadings
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function headings(): array
    {
        return [
            'Room',
            'Building',
            'Total Seconds',
            'Total Minutes',
            'Total Hours',
            'Total Bookings'
        ];
    }

    public function collection()
    {
        return $this->data->map(function ($item) {
            $totalSeconds = (int) ($item->total_seconds ?? 0);
            $hours = floor($totalSeconds / 3600);
            $minutes = floor(($totalSeconds % 3600) / 60);
            $seconds = $totalSeconds % 60;

            return [
                $item->room_name,
                $item->building,
                $hours,
                $minutes,
                $seconds,
                $item->total_bookings ?? 0,
            ];
        });
    }
}
