@extends(backpack_view('blank'))

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h2>Attendance Report</h2>
                    <p class="text-muted">Generated: {{ $generated_at }}</p>
                </div>
                <div class="card-body">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Faculty</th>
                                <th>Email</th>
                                <th>Room</th>
                                <th>Subject</th>
                                <th>Date</th>
                                <th>Check In</th>
                                <th>Check Out</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($attendances as $attendance)
                            <tr>
                                <td>{{ $attendance->id }}</td>
                                <td>
                                    {{ $attendance->user->first_name ?? '' }} 
                                    {{ $attendance->user->last_name ?? 'N/A' }}
                                </td>
                                <td>{{ $attendance->user->email ?? 'N/A' }}</td>
                                <td>
                                    @if($attendance->room)
                                        Room {{ $attendance->room->room_number }} 
                                        Bldg {{ $attendance->room->building_number }}
                                    @else
                                        N/A
                                    @endif
                                </td>
                                <td>{{ $attendance->subject->name ?? $attendance->subject->code ?? 'N/A' }}</td>
                                <td>{{ $attendance->booking_date }}</td>
                                <td>{{ $attendance->start_booking_time ?? '-' }}</td>
                                <td>{{ $attendance->end_booking_time ?? '-' }}</td>
                                <td>
                                    @if($attendance->start_booking_time && $attendance->end_booking_time)
                                        <span class="badge bg-success">Completed</span>
                                    @elseif($attendance->start_booking_time)
                                        <span class="badge bg-warning">In Progress</span>
                                    @else
                                        <span class="badge bg-secondary">Scheduled</span>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    
                    <div class="mt-3 text-end">
                        <strong>Total Records: {{ $total }}</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('after_styles')
<style>
    @media print {
        .sidebar, .app-header, .app-footer { display: none !important; }
        .app-content { margin: 0 !important; padding: 0 !important; }
    }
</style>
@endsection