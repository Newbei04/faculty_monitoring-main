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
            return [
                $item->room_name,
                $item->building,
                $item->total_seconds,
                $item->total_minutes,
                number_format($item->total_minutes / 60, 2),
                $item->total_bookings
            ];
        });
    }
}
