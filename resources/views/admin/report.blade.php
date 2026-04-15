@extends(backpack_view('blank'))

@section('content')
    <div>
        <h1 class="mb-4">Report</h1>
    </div>

    <div class="container-fluid animated fadeIn">
        <div class="row table-content">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('page.report.index') }}" method="GET ">
                            <div class="form-group d-flex align-items-center">
                                <label for="report_period" class="mr-3">Select Period:</label>
                                <select id="report_period" name="report_period" class="form-control mr-3" onchange="this.form.submit()">
                                    <option @if(request()->report_period === 'daily') selected @endif  value="daily">Daily</option>
                                    <option @if(request()->report_period === 'weekly') selected @endif value="weekly">Weekly</option>
                                    <option @if(request()->report_period === 'monthly') selected @endif value="monthly">Monthly</option>
                                    <option @if(request()->report_period === 'yearly') selected @endif value="yearly">Yearly</option>
                                </select>

                                <!-- Button for triggering report generation -->
                                <button id="generate_report" class="btn btn-sm btn-primary mr-3">Generate</button>

                                <div class="dropdown">
                                    <button class="btn btn-sm btn-success dropdown-toggle" type="button" id="exportDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Export
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="exportDropdown">
                                        <a class="dropdown-item" href="{{ route('page.report.export', ['type' => 'pdf', 'report_period' => request('report_period', 'monthly')]) }}">PDF</a>
                                        <a class="dropdown-item" href="{{ route('page.report.export', ['type' => 'excel', 'report_period' => request('report_period', 'monthly')]) }}">Excel</a>
                                        <a class="dropdown-item" href="{{ route('page.report.export', ['type' => 'print', 'report_period' => request('report_period', 'monthly')]) }}">Print</a>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- Table for displaying report -->
                        <table class="table table-striped">
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
                                <td>{{ number_format($roomStat->total_hours, 2) }}</td>
                                <td>{{ $roomStat->total_minutes }}</td>
                                <td>{{ $roomStat->total_seconds }}</td>
                                <td>{{ $roomStat->total_bookings }}</td>
                            </tr>
                        @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
