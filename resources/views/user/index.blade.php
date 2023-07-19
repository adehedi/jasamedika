@extends('layouts.main')

@push('up.scripts')
<link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/dataTables.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/responsive.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/buttons.bootstrap5.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('vuexy/app-assets/vendors/css/tables/datatable/rowGroup.bootstrap5.min.css') }}">
    <style>
        .loading-icon {
            display: none;
        }
        .loading .loading-icon {
            display: inline-block;
            width: 14px;
            height: 14px;
            margin-left: 10px;
            vertical-align: middle;
            border-radius: 50%;
            border: 2px solid #fff;
            border-top-color: transparent;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
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
                            <h4 class="card-title">Master Data User</h4>
                        </div>
                            <div class="demo-inline-spacing">
                                {{-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#userModal" id="addBtn">Add</button> --}}
                            </div>
                            <table class="datatables-basic table user-table" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Aksi</th>
                                        <th>No</th>
                                        <th>Nama : </th>
                                        <th>Id Karyawan : </th>
                                        <th>TTL : </th>
                                        <th>Alamat : </th>
                                        <th>Email : </th>
                                        {{-- <th>Password : </th> --}}
                                        <th>JK : </th>
                                        <th>Jabatan : </th>
                                        <th>Foto : </th>
                                        <th>Role : </th>
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
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeModal"></button>
                            </div>
                            <div class="modal-body">
                                <form id="userForm" class="row gy-1 pt-75 flex w-full mx-auto" enctype="multipart/form-data" onsubmit="return false">
                                    <input type="text" name="user_id" class="form-control form-control" id="user_id" hidden />
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="employee_name" class="col-sm-3 font-bold">Nama Pegawai <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                          <input type="text" name="employee_name" class="form-control form-control" id="employee_name" required />
                                        </div>
                                        {{-- <div class="alert alert-danger mt-2 d-none text-center" role="alert" id="alert-employee_name"></div> --}}
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="employee_id" class="col-sm-3 font-bold">Id Pegawai <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                          <input type="text" name="employee_id" class="form-control form-control" id="employee_id" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="colFormLabelLg" class="col-sm-3 font-bold">Tempat, tanggal lahir</label>
                                        <div class="col-sm-3">
                                          <input type="text" name="birth_place" class="form-control form-control" id="birth_place" />
                                        </div>
                                        <div class="col-sm-2">
                                            <select name="dob" class="select2-size-lg form-select" id="day-select">
                                                @for($i=1; $i<=31; $i++)
                                                    <option value="{{ $i }}" {{ $i == 1 ? 'selected' : '' }}>{{ $i }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <select name="mob" class="select2-size-lg form-select" id="month-select">
                                                @for($i=1; $i<=12; $i++)
                                                    <option value="{{ $i }}" {{ $i == 1 ? 'selected' : '' }}>{{ $i }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <select class="form-select" name="yob" id="year-select">
                                                @for($year=date('Y'); $year>=date('Y')-100; $year--)
                                                    <option value="{{ $year }}" {{ $year == date('Y') ? 'selected' : '' }}>{{ $year }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="address" class="col-sm-3 font-bold">Alamat</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="address" class="form-control form-control" id="address" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="email" class="col-sm-3 font-bold">Email <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                          <input type="text" name="email" class="form-control form-control" id="email" required />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2" id="inputPassword">
                                        <label for="password" class="col-sm-3 font-bold">Password <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                          <input type="password" name="password" class="form-control form-control" id="password"/>
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto align-items-center mb-2">
                                        <label for="colFormLabelLg" class="col-sm-3 font-bold">Jenis Kelamin</label>
                                        <div class="col-sm-4">
                                            <div class="align-items-center justify-center">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="L" />
                                                <label class="form-check-label" for="inlineRadio1">Laki-laki</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="align-items-center justify-center">
                                                <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="P" />
                                                <label class="form-check-label" for="inlineRadio2">Perempuan</label>
                                            </div>
                                        </div>
                                    </div>                                      
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="position" class="col-sm-3 font-bold">Jabatan</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="position" class="form-control form-control" id="position" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="role" class="col-sm-3 font-bold">Role <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select class="select2-size-lg form-select" name="role" id="role" required>
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
            <!--/ Basic table -->
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
    <script type="text/javascript">
         $(document).ready(function() {
            $('#btnSubmit').prop('disabled', false);
            $('#email').prop('disabled', false);

            var isUpdate = false;

            $('#closeModal').click(function(){
                $('#userForm')[0].reset();
            });

            $('body').on('click', '#addBtn', function(){
                $('#inputPassword').removeAttr('hidden');
                $('#email').removeAttr('readonly');
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
                        success:function(response){
                            console.log(response);
                            $('#btnSubmit').prop('disabled', true);
                            $("#btnSubmit").removeClass("loading");
                            // Reset form values
                            $('#userForm')[0].reset();
                            
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

                            $('form')[0].reset();

                            $(':input').val('').prop('disabled', false);
                            $('.divPassword').show();
                            isUpdate = false;
                            

                        },
                        error:function(error){
                            $("#btnSubmit").removeClass("loading");
                            if (error.responseJSON) {
                                if (error.responseJSON.employee_picture) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.employee_picture[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.role) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.role[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.position) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.position[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.gender) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.gender[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.password) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.password[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.email) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.email[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.address) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.address[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.yob) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.yob[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.mob) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.mob[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.dob) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.dob[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.birth_place) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.birth_place[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.employee_id) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.employee_id[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
                                
                                if (error.responseJSON.employee_name) {
                                    Swal.fire({
                                        type: 'error',
                                        icon: 'error',
                                        title: error.responseJSON.employee_name[0],
                                        showConfirmButton: false,
                                        timer: 3000
                                    });
                                }
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
                order: [],
                ajax: "{{ route('users.list') }}",
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
                                filename: 'Data User',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
                                filename: 'Data User',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
                                orientation: 'landscape',
                                filename: 'Data User',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8] },
                                customize: function(doc) {
                                    doc.content[0].text = 'Data User';
                                }
                            }
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                            $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                        },
                        {
                        text: feather.icons['plus'].toSvg({ class: 'me-50 font-small-4' }) + 'Add',
                        className: 'create-new btn btn-primary',
                        attr: {
                            'id': 'addBtn',
                            'data-bs-toggle': 'modal',
                            'data-bs-target': '#userModal'
                        },
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                        }
                    }
                ],
                //dom: 'Bfrtip',
                columns: [
                    {
                        data: 'action', 
                        name: 'action'
                    },
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'name', name: 'name'},
                    {data: 'employee_id', name: 'employee_id'},
                    {data: 'ttl', name: 'ttl'},
                    {data: 'address', name: 'address'},
                    {data: 'email', name: 'email'},
                    {data: 'gender', name: 'gender'},
                    {data: 'employee_position', name: 'employee_position'},
                    {data: 'user_pic', name: 'user_pic'},
                    {data: 'role', name: 'role'},
                    // {data: 'created_by', name: 'created_by'},
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

            $('body').on('click', '#btn-edit-user', function () {
                let user_id = $(this).data('id');

                //fetch detail post with ajax
                $.ajax({
                    url: '/user/' + user_id,
                    type: "GET",
                    cache: true,
                    success:function(response){
                        isUpdate = true;
                        console.log(response.data.birth_date);
                        if (response.data.birth_date !== null) {
                            let birth_date = response.data.birth_date.split("-");
                            let yob = birth_date[0];
                            let mob = birth_date[1].replace('0', '');
                            let dob = birth_date[2].replace('0', '');
                            $('#day-select').val(dob);
                            $('#month-select').val(mob);
                            $('#year-select').val(yob);
                        }
                        
                        $('#user_id').val(response.data.id);
                        $('#employee_name').val(response.data.name);
                        $('#employee_id').val(response.data.employee_id);
                        $('#birth_place').val(response.data.birth_place);
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