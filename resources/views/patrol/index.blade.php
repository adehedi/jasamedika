@extends('layouts.main')

@push('up.scripts')
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/dataTables.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/responsive.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/buttons.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/rowGroup.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/extensions/swiper.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/css/plugins/extensions/ext-component-swiper.css') }}">
    <style>
        #loading-pic {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
            margin: auto;
        }

        #loading-vid {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
            margin: auto;
        }

        #loading-cn {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
            margin: auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
@endpush

@section('page.content')
    <div class="content-overlay">
        
    </div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <!-- Basic table -->
            <section id="basic-datatable">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Report</h4>
                            </div>
                            <div class="demo-inline-spacing">
                                {{-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userModal" id="addBtn">Add</button> --}}
                            </div>
                            <table class="datatables-basic table user-table" style="width: 100%">
                                <thead>
                                    <tr>
                                        {{-- <th>Aksi</th> --}}
                                        <th>No</th>
                                        <th>Nama Petugas: </th>
                                        <th>Longitude: </th>
                                        <th>Latitude: </th>
                                        <th>Kode QR: </th>
                                        <th>Nama Gedung: </th>
                                        <th>Lantai: </th>
                                        <th>Nama Check Point: </th>
                                        <th>Kategori Kondisi: </th>
                                        <th>Keterangan Kondisi: </th>
                                        <th>Foto Kondisi: </th>
                                        <th>Video Kondisi: </th>
                                        <th>Created Date: </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Modal to add new record -->
                <div class="modal fade" id="userModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel17">Form Add User</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                {{-- <div class="text-center mb-2">
                                    <h1 class="mb-1">Edit User Information</h1>
                                    <p>Updating user details will receive a privacy audit.</p>
                                </div> --}}
                                <input type="text" name="user_id" class="form-control form-control" id="user_id" hidden />
                                <form id="userForm" class="row gy-1 pt-75 flex w-full mx-auto" enctype="multipart/form-data" onsubmit="return false">
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="employee_name" class="col-sm-3 font-bold">Nama Pegawai</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="employee_name" class="form-control form-control" id="employee_name" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="employee_id" class="col-sm-3 font-bold">Id Pegawai</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="employee_id" class="form-control form-control" id="employee_id" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="colFormLabelLg" class="col-sm-3 font-bold">Tempat, tanggal lahir</label>
                                        <div class="col-sm-3">
                                          <input type="text" name="birth_place" class="form-control form-control" id="birth_place" required />
                                        </div>
                                        <div class="col-sm-2">
                                            <select name="dob" class="select2-size-lg form-select" id="day-select">
                                                @for($i=1; $i<=31; $i++)
                                                    <option value="{{ $i }}">{{ $i }}</option>
                                                @endfor
                                            </select>                             
                                        </div>
                                        <div class="col-sm-2">
                                            <select name="mob" class="select2-size-lg form-select" id="month-select">
                                                @for($i=1; $i<=12; $i++)
                                                    <option value="{{ $i }}">{{ $i }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <select class="form-select" name="yob" id="year-select">
                                                @for($year=date('Y'); $year>=date('Y')-100; $year--)
                                                  <option value="{{ $year }}">{{ $year }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="address" class="col-sm-3 font-bold">Alamat</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="address" class="form-control form-control" id="address" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="email" class="col-sm-3 font-bold">Email</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="email" class="form-control form-control" id="email" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2" id="inputPassword">
                                        <label for="password" class="col-sm-3 font-bold">Password</label>
                                        <div class="col-sm-9">
                                          <input type="password" name="password" class="form-control form-control" id="password"/>
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto align-items-center mb-2">
                                        <label for="colFormLabelLg" class="col-sm-3 font-bold">Jenis Kelamin</label>
                                        <div class="col-sm-4">
                                            <div class="align-items-center justify-center">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="L" checked />
                                                <label class="form-check-label" for="inlineRadio1">Laki-laki</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="align-items-center justify-center">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="P" />
                                                <label class="form-check-label" for="inlineRadio1">Perempuan</label>
                                            </div>
                                        </div>
                                    </div>                                      
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="position" class="col-sm-3 font-bold">Jabatan</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="position" class="form-control form-control" id="position" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="role" class="col-sm-3 font-bold">Role</label>
                                        <div class="col-sm-9">
                                            <select class="select2-size-lg form-select" name="role" id="role">
                                                <option value="admin">Admin</option>
                                                <option value="user">User</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="employee_picture" class="col-sm-3 font-bold">Upload Foto</label>
                                        <div class="col-sm-9">
                                          <input type="file" name="employee_picture" class="form-control form-control" id="employee_picture" />
                                        </div>
                                    </div>
                                    <div class="col-12 text-end mt-2 pt-50">
                                        <button type="reset" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">Batal</button>
                                        <button type="submit" class="btn btn-success me-1">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="loading"></div>
            <!--/ Basic table -->  

            {{-- Modal Condition Note --}}
            <div class="modal fade" id="conditionNoteModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel17">Form Add User</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeConditionNoteButton"></button>
                        </div>
                        <div class="modal-body">
                            <div id="loading-cn"></div>
                            <div id="conditionNoteText"></div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- End Condition Note --}}

            {{-- Modal View Pictures --}}
            <div class="modal d-block hidden" id="viewPictureModal" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-edit-user">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel17">Foto Kondisi</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeModalViewPic"></button>
                        </div>
                        <div class="modal-body">
                            <div id="loading-pic"></div>
                            <div id="component-swiper-navigations">
                                <div class="swiper-navigations swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide d-flex justify-content-center">
                                            <img id="pic1" class="img-fluid" alt="banner" />
                                        </div>
                                        <div class="swiper-slide d-flex justify-content-center">
                                            <img id="pic2" class="img-fluid" alt="banner" />
                                        </div>
                                        <div class="swiper-slide d-flex justify-content-center">
                                            <img id="pic3" class="img-fluid" alt="banner" />
                                        </div>
                                    </div>
                                    <!-- Add Arrows -->
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- End Modal View Pictures --}}

            {{-- Modal View Video --}}
            <div class="modal d-block hidden" id="viewVideoModal" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-edit-user">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel17">Video Kondisi</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeModalViewVideo"></button>
                        </div>
                        <div class="modal-body">
                            <div class="" id="media-player-wrapper">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-12">
                                        <div class="video-player text-center loading" id="plyr-video-player">
                                            <iframe height="300" allowfullscreen allow="autoplay" id="videoFrame"></iframe>
                                            <div id="loading-vid"></div>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- End Modal View Pictures --}}
        </div>
    </div>
@endsection

@push('bottom.scripts')
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/dataTables.bootstrap5.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/responsive.bootstrap5.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/jszip.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/pdfmake.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/vfs_fonts.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/buttons.print.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/tables/datatable/dataTables.rowGroup.min.js') }}"></script>
    <script src="{{ asset('vuexy/app-assets/vendors/js/extensions/swiper.min.js') }}"></script>
    {{-- <script src="{{ asset('vuexy/app-assets/js/scripts/tables/table-datatables-basic.js') }}"></script> --}}
    {{-- <script src="{{ asset('vuexy/app-assets/js/scripts/extensions/ext-component-swiper.js') }}"></script> --}}
    <script type="text/javascript">
         $(document).ready(function() {
            var isUpdate = false;
            var mySwiper1 = new Swiper('.swiper-navigations', {
                navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
                }
            });
            
            $("#loading-pic").hide();
            $("#loading-vid").hide();
            $("#loading-cn").hide();

            $('#btnSubmit').prop('disabled', false);
            $('#email').prop('disabled', false);

            // Button View Modal Condition Note
            $('body').on('click', '#viewConditionNoteButton', function () {
                
                // hidding condition note frame for loading animation
                $('#conditionNoteText').hide();
                // showing loading animation
                $("#loading-cn").show();
                
                let patrol_id = $(this).data('id');
                console.log(patrol_id);

                $.ajax({
                    url: '/patrol/' + patrol_id,
                    type: 'GET',
                    cache: true,
                    success: function(response){
                        console.log(response.data);
                        // hide loading animation
                        $("#loading-cn").hide();
                        // unhide picture frame
                        $('#conditionNoteText').show();
                        // // set source picture
                        $('#conditionNoteText').append(response.data.condition_note);
                    },
                    error: function(error){
                        Swal.fire({
                            type: 'error',
                            icon: 'error',
                            title: `${error.message}`,
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });
            });
            $('body').on('click', '#closeConditionNoteButton', function () {
                $('#conditionNoteText').html('');
            });

            // Button View Modal Pictures
            $('body').on('click', '#viewPictureButton', function () {
                $('#viewPictureModal').removeClass('hidden');
                // hidding picture frame for loading animation
                $('#component-swiper-navigations').hide();
                // showing loading animation
                $("#loading-pic").show();

                let patrol_id = $(this).data('id');

                $.ajax({
                    url: '/patrol/' + patrol_id,
                    type: 'GET',
                    cache: true,
                    success: function(response){
                        console.log(response.data);
                        // hide loading animation
                        $("#loading-pic").hide();
                        // unhide picture frame
                        $('#component-swiper-navigations').show();
                        // // set source picture
                        $('#pic1').attr('src', response.data.photo_one);
                        $('#pic2').attr('src', response.data.photo_two);
                        $('#pic3').attr('src', response.data.photo_three);
                    },
                    error: function(error){
                        Swal.fire({
                            type: 'error',
                            icon: 'error',
                            title: `${error.message}`,
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });
            });
            $('body').on('click', '#closeModalViewPic', function () {
                $('#pic1').removeAttr('src');
                $('#pic2').removeAttr('src');
                $('#pic3').removeAttr('src');
                $('#viewPictureModal').addClass('hidden');
            });

            // Button View Modal Videos
            $('body').on('click', '#viewVideoButton', function () {
                $('#viewVideoModal').removeClass('hidden');
                // hidding video frame for loading animation
                $('#videoFrame').hide();
                // showing loading animation
                $("#loading-vid").show();

                let patrol_id = $(this).data('id');

                $.ajax({
                    url: '/patrol/' + patrol_id,
                    type: "GET",
                    cache: true,
                    success:function(response){
                        console.log(response);
                        // hide loading animation
                        $("#loading-vid").hide();
                        // unhide video frame
                        $('#videoFrame').show();
                        // add video source to video frame
                        $('#videoFrame').attr('src', response.data.video);
                    },
                    error:function(error){
                        Swal.fire({
                            type: 'error',
                            icon: 'error',
                            title: `${error.message}`,
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });

            });
            $('body').on('click', '#closeModalViewVideo', function () {
                $('#videoFrame').removeAttr('src');
                $('#viewVideoModal').addClass('hidden');
            });

            // Add user
            $('form').submit(function(event) {
                var day = $('#day-select').val();
                var month = $('#month-select').val();
                var year = $('#year-select').val();
                var isValid = true;
                // cek tanggal yang tidak valid
                if (day > 28 && month == 2 && year % 4 != 0) {
                    isValid = false;
                } else if (day > 29 && month == 2) {
                    isValid = false;
                } else if (day > 30 && (month == 4 || month == 6 || month == 9 || month == 11)) {
                    isValid = false;
                }
                if (!isValid) {
                    event.preventDefault(); // batalkan submit form
                    Swal.fire({
                        type: 'error',
                        icon: 'error',
                        title: `Tanggal yang anda masukan tidak valid!`,
                        showConfirmButton: false,
                        timer: 3000
                    });
                    return false;
                }
                else{
                    event.preventDefault();
                    // Add loading animation
                    $("#btnSubmit").addClass("loading");

                    let userForm = new FormData($('#userForm')[0]);

                    let employee_name = $('#employee_name').val();
                    let employee_id = $('#employee_id').val();
                    let birth_place = $('#birth_place').val();
                    let dob = $('#day-select').val();
                    let mob = $('#month-select').val();
                    let yob = $('#year-select').val();
                    let address = $('#address').val();
                    let email = $('#email').val();
                    let password = $('#password').val();
                    let user_id = $('#user_id').val();
                    let gender = $('input[name=gender]:checked').val();
                    let position = $('#position').val();
                    let role = $('#role').val();

                    if(isUpdate){
                        url = '/user/update';
                    } else {
                        url = '/user/store';
                    }

                    // Post Request
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: userForm,
                        contentType: false,
                        processData: false,
                        // data: {
                        //     "user_id": user_id,
                        //     "employee_name": employee_name,
                        //     "employee_id": employee_id,
                        //     "birth_place": birth_place,
                        //     "dob": dob,
                        //     "mob": mob,
                        //     "yob": yob,
                        //     "address": address,
                        //     "email": email,
                        //     "password": password,
                        //     "gender": gender,
                        //     "position": position,
                        //     "role": role,
                        // },
                        success:function(response){
                            $('#btnSubmit').prop('disabled', true);
                            $("#btnSubmit").removeClass("loading");
                            console.log(response);
                            //show success message
                            Swal.fire({
                                type: 'success',
                                icon: 'success',
                                title: `${response.message}`,
                                showConfirmButton: false,
                                timer: 3000
                            });

                            table.ajax.reload();

                            $('#userModal').modal('hide');
                            $("#btnSubmit").removeClass("loading");

                            $(':input').val('').prop('disabled', false);
                            $('.divPassword').show();
                            isUpdate = false;
                            

                        },
                        error:function(error){
                            $("#btnSubmit").removeClass("loading");
                            console.log(error);
                            if(error.responseJSON.name[0]) {

                                //show alert
                                $('#alert-name').removeClass('d-none');
                                $('#alert-name').addClass('d-block');

                                //add message to alert
                                $('#alert-name').html(error.responseJSON.name[0]);
                            } 

                            if(error.responseJSON.email[0]) {

                                //show alert
                                $('#alert-email').removeClass('d-none');
                                $('#alert-email').addClass('d-block');

                                //add message to alert
                                $('#alert-email').html(error.responseJSON.email[0]);
                            } 
                            
                            if(error.responseJSON.password[0]) {

                                //show alert
                                $('#alert-password').removeClass('d-none');
                                $('#alert-password').addClass('d-block');

                                //add message to alert
                                $('#alert-password').html(error.responseJSON.password[0]);
                            } 

                        }

                    });
                }
            });

            var table = $('.user-table').DataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                scrollXInner: "100%",
                cache: true,
                ajax: "{{ route('patrol.report') }}",
                dom: '<"card-header border-bottom p-1"<"head-label"><"dt-action-buttons text-end"B>><"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-6"f>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
                buttons: [
                    {
                        extend: 'collection',
                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                        buttons: [
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
                                filename: 'Report EPatrol'
                                // exportOptions: { columns: [0, 4, 5, 6, 7] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
                                filename: 'Report EPatrol'
                                // exportOptions: { columns: [3, 4, 5, 6, 7] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
                                orientation: 'landscape',
                                filename: 'Report EPatrol'
                                // exportOptions: { columns: [3, 4, 5, 6, 7] }
                            },
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                            $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                    }
                ],
                columns: [
                    // {
                    //     data: 'action', 
                    //     name: 'action', 
                    //     orderable: true, 
                    //     searchable: true
                    // },
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'user.name', name: 'user.name'},
                    {data: 'location.longitude', name: 'location.longitude'},
                    {data: 'location.latitude', name: 'location.latitude'},
                    {data: 'location.barcode_code', name: 'location.barcode_code'},
                    {data: 'location.building_name', name: 'location.building_name'},
                    {data: 'location.floor', name: 'location.floor'},
                    {data: 'location.check_point_name', name: 'location.check_point_name'},
                    {data: 'condition', name: 'condition'},
                    {
                        data: 'condition_note',
                        name: 'condition_note',
                        render: function(data, type, row) {
                            if (type === 'display') {
                                if (data.length > 50) {
                                    return `<a href="javascript:void(0)" data-id="${row.id}" id="viewConditionNoteButton" data-bs-toggle="modal" data-bs-target="#conditionNoteModal"> ${data.substr(0, 50) + '...'} </a>`;
                                }
                                else {
                                    return data;
                                }
                            }
                            else {
                                return data;
                            }
                        }
                    },
                    {data: 'btnPictures', name: 'ptnPictures'},
                    {data: 'btnVideo', name: 'btnVideo'},
                    {data: 'created_at', name: 'created_at'},
                    // {data: 'created_at', name: 'created_at'},
                ]
            });

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('body').on('click', '#btn-delete-user', function () {

                let user_id = $(this).data('id');
                let token   = $("meta[name='csrf-token']").attr("content");

                Swal.fire({
                    title: 'Apakah Kamu Yakin?',
                    text: "ingin menghapus data ini!",
                    icon: 'warning',
                    showCancelButton: true,
                    cancelButtonText: 'TIDAK',
                    confirmButtonText: 'YA, HAPUS!'
                }).then((result) => {
                    if (result.isConfirmed) {

                        //fetch to delete data
                        $.ajax({
                            url: '/user/'+user_id,
                            type: "DELETE",
                            cache: false,
                            data: {
                                "_token": token
                            },
                            success:function(response){ 

                                //show success message
                                Swal.fire({
                                    type: 'success',
                                    icon: 'success',
                                    title: `${response.message}`,
                                    showConfirmButton: false,
                                    timer: 3000
                                });

                                table.ajax.reload();
                            }
                        });

                        
                    }
                })
            });

             //edit on click
            $('body').on('click', '#btn-edit-user', function () {
                let user_id = $(this).data('id');

                //fetch detail post with ajax
                $.ajax({
                    url: '/user/' + user_id,
                    type: "GET",
                    cache: true,
                    success:function(response){
                        isUpdate = true;

                        let birth_date = response.data.birth_date.split("-");
                        let yob = birth_date[0];
                        let mob = birth_date[1].replace('0', '');
                        let dob = birth_date[2].replace('0', '');
                        
                        $('#user_id').val(response.data.id);
                        $('#employee_name').val(response.data.name);
                        $('#employee_id').val(response.data.employee_id);
                        $('#birth_place').val(response.data.birth_place);
                        $('#day-select').val(dob);
                        $('#month-select').val(mob);
                        $('#year-select').val(yob);
                        $('#address').val(response.data.address);
                        $('#email').val(response.data.email);
                        $('#inputPassword').attr('hidden', true);
                        $('#email').attr('readonly', true);
                        $('input[name="gender"][value="' + response.data.gender + '"]').prop('checked', true);
                        $('#position').val(response.data.employee_position);
                        $('#role').val(response.data.role);
                        
                        //open modal
                        $('#userModal').modal('show');
                    }
                });
            });   
            
        });
    </script>

@endpush