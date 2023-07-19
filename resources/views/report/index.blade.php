@extends('layouts.main')

@push('up.scripts')
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/pickers/pickadate/pickadate.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/css/plugins/forms/pickers/form-flat-pickr.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/css/plugins/forms/pickers/form-pickadate.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endpush

@section('page.content')

    <div class="content-overlay">
            
    </div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="row d-flex justify-content-center">
                <div class="col-sm-10">
                    <div class="card my-2">
                        <div class="card-header">
                            <h4 class="card-title">Rekap Report</h4>
                        </div>
                        <div class="card-body">
                            <form class="form form-horizontal" action="{{route('report.export')}}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-1 row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <label class="" for="first-name">Tanggal Awal</label>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" name="start_date" id="fp-default" class="form-control flatpickr-basic" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-1 row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <label class="" for="email-id">Tanggal Akhir</label>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" name="end_date" id="fp-default" class="form-control flatpickr-basic" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-1 row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <label class="" for="contact-info">Nama Petugas</label>
                                            </div>
                                            <div class="col-sm-7">
                                                <select class="js-example-basic-multiple" name="user[]" multiple="multiple">
                                                    @foreach ($users as $user)
                                                        <option value="{{ Str::slug($user->name) }}">{{ $user->name }}</option>
                                                    @endforeach
                                                </select>

                                                {{-- <select class="select2-size-lg form-select" name="user" id="large-select">
                                                    <option value="all" selected>All</option>
                                                    @foreach ($users as $user)
                                                        <option value="{{ Str::slug($user->name) }}">{{ $user->name }}</option>
                                                    @endforeach
                                                </select> --}}
                                            </div>
                                            <div class="col-sm-2">
                                                <span>* Jika tidak di isi defaultnya All</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-1 row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <label class="" for="password">Lokasi</label>
                                            </div>
                                            <div class="col-sm-7">
                                                <select class="js-example-basic-multiple" name="location[]" multiple="multiple">
                                                    @foreach ($locations as $location)
                                                        <option value="{{ Str::slug($location->check_point_name) }}">{{ $location->check_point_name }}</option>
                                                    @endforeach
                                                </select>

                                                {{-- <select class="select2-size-lg form-select" name="location" id="large-select">
                                                    <option value="all" selected>All</option>
                                                    @foreach ($locations as $location)
                                                        <option value="{{ Str::slug($location->check_point_name) }}">{{ $location->check_point_name }}</option>
                                                    @endforeach
                                                </select> --}}
                                            </div>
                                            <div class="col-sm-2">
                                                <span>* Jika tidak di isi defaultnya All</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mb-1 row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <label class="" for="password">Format Export</label>
                                            </div>
                                            <div class="col-sm-9">
                                                <select class="select2-size-lg form-select" name="format_file" id="large-select">
                                                    <option value=".xlsx">Excel</option>
                                                    <option value=".csv">CSV</option>
                                                    <option value=".pdf">PDF</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-9 offset-sm-3">
                                        <button type="submit" class="btn btn-primary me-1">Export</button>
                                        <button type="reset" class="btn btn-outline-secondary">Reset</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('bottom.scripts')
    <script src="{{ asset('vuexy/app-assets/vendors/js/pickers/pickadate/picker.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/pickers/pickadate/picker.date.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/pickers/pickadate/picker.time.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/pickers/pickadate/legacy.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/js/scripts/forms/pickers/form-pickers.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2({
                allowClear: false
            });
        });
    </script>
@endpush