<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div style="width: 100%; height: 100%; margin: 0; padding: 0; background-color: #fff;">
    <table>
        <thead>
        <tr class="text-center">
            <th>Room</th>
            <th>Building</th>
            <th>Total Number of Hours</th>
            <th>Total Number of Minutes</th>
            <th>Total Number of Seconds</th>
            <th>Total Number of Attendance</th>
        </tr>
        </thead>
        <tbody>
        @foreach($roomStats as $roomStat)
            <tr class="text-center">
                <td>{{ $roomStat->room_name }}</td>
                <td>{{ $roomStat->building }}</td>
                <td>{{ number_format($roomStat->total_seconds / 3600, 2) }}</td>
                <td>{{ floor($roomStat->total_seconds / 60) }}</td>
                <td>{{ $roomStat->total_seconds }}</td>
                <td>{{ $roomStat->total_bookings }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
</body>
</html>
