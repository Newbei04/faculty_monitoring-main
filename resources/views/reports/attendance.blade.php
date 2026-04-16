<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Attendance Report</title>
    <style>
        body { font-family: sans-serif; font-size: 12px; color: #333; }
        h2 { text-align: center; margin-bottom: 4px; }
        p.meta { text-align: center; color: #666; margin-bottom: 16px; font-size: 11px; }
        table { width: 100%; border-collapse: collapse; }
        th { background-color: #1A1A2E; color: white; padding: 8px; text-align: left; font-size: 11px; }
        td { padding: 7px 8px; border-bottom: 1px solid #eee; font-size: 11px; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .badge { padding: 2px 8px; border-radius: 10px; font-size: 10px; font-weight: bold; }
        .present { background: #d4edda; color: #155724; }
        .absent  { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>Attendance Report</h2>
    <p class="meta">Generated: {{ $generated_at }} &nbsp;|&nbsp; Total Records: {{ $total }}</p>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>User</th>
                <th>Subject</th>
                <th>Room</th>
                <th>Date</th>
                <th>Time In</th>
                <th>Time Out</th>
                {{-- <th>Status</th> --}}
            </tr>
        </thead>
        <tbody>
            @forelse($attendances as $index => $attendance)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>
                    {{ $attendance->user->first_name ?? '' }}
                    {{ $attendance->user->last_name ?? 'Unknown' }}
                </td>
                <td>
                    {{ $attendance->schedule->subject->name ?? $attendance->subject->name ?? 'N/A' }}
                </td>
                <td>
                    @if($attendance->room)
                        Room {{ $attendance->room->room_number }}
                        @if($attendance->room->building_number)
                            · Bldg {{ $attendance->room->building_number }}
                        @endif
                    @else
                        N/A
                    @endif
                </td>
                <td>{{ \Carbon\Carbon::parse($attendance->booking_date)->format('M d, Y') }}</td>
                <td>
                    {{ $attendance->start_booking_time 
                        ? \Carbon\Carbon::parse($attendance->start_booking_time)->format('h:i A') 
                        : '—' }}
                </td>

                <td>
                    {{ $attendance->end_booking_time 
                        ? \Carbon\Carbon::parse($attendance->end_booking_time)->format('h:i A') 
                        : '—' }}
                </td>

                {{-- <td>
                    <span class="badge {{ $attendance->status === 'present' ? 'present' : 'absent' }}">
                        {{ ucfirst($attendance->status ?? 'N/A') }}
                    </span>
                </td> --}}
            </tr>
            @empty
            <tr>
                <td colspan="8" style="text-align:center; color:#999; padding: 20px;">
                    No attendance records found.
                </td>
            </tr>
            @endforelse
        </tbody>
    </table>
</body>
</html>