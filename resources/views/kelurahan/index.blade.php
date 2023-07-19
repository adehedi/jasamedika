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
{{-- <div class="visible-print text-center">
    <img src="data:image/png;base64,{{ base64_encode(QrCode::format('png')->generate('Wow')) }}" alt="">
    <p>Scan me to return to the original page.</p>
</div> --}}

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
                            <h4 class="card-title">Data Kelurahan</h4>
                        </div>
                            <div class="demo-inline-spacing">
                                {{-- @hasrole('admin')<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kelurahanModal" id="addBtn">Add</button>@endhasrole --}}
                            </div>
                            <table class="datatables-basic table kelurahan-table" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Aksi</th>
                                        <th>No</th>
                                        <th>Kelurahan: </th>
                                        <th>Kecamatan: </th>
                                        <th>Kota/Kabupaten: </th>
                                        <th>Provinsi: </th>
                                        <th>Kode Pos: </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Modal to add new record -->
                
                <div class="modal fade" id="kelurahanModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel17">Form Add Kelurahan</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeFormModal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="text" name="kelurahan_id" class="form-control form-control" id="kelurahan_id" hidden />
                                <form id="kelurahanForm" class="row gy-1 pt-75 flex w-full mx-auto" enctype="multipart/form-data" onsubmit="return false">
                                    
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="village_district" class="col-sm-3 font-bold">Kelurahan</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="village_district" class="form-control form-control" id="village_district" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="subdistrict" class="col-sm-3 font-bold">Kecamatan</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="subdistrict" class="form-control form-control" id="subdistrict" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="city" class="col-sm-3 font-bold">Kota/Kabupaten</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="city" class="form-control form-control" id="city" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="province" class="col-sm-3 font-bold">Provinsi</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="province" class="form-control form-control" id="province" />
                                        </div>
                                    </div>
                                    <div class="row w-full mx-auto justify-center align-items-center mb-2">
                                        <label for="postal_code" class="col-sm-3 font-bold">Kode Pos</label>
                                        <div class="col-sm-9">
                                          <input type="text" name="postal_code" class="form-control form-control" id="postal_code" />
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

            $('#addBtn').click(function(){
                $('#inputPassword').removeAttr('hidden');
                $('#email').removeAttr('readonly');
            });

            // Add user
            $('form').submit(function(event) {
                event.preventDefault();
                
                // Add loading animation
                $("#btnSubmit").addClass("loading");

                let kelurahan_id = $('#kelurahan_id').val();
                let province = $('#province').val();
                let city = $('#city').val();
                let subdistrict = $('#subdistrict').val();
                let village_district = $('#village_district').val();
                let postal_code = $('#postal_code').val();
                
                if(isUpdate){
                    url = '/kelurahan/update';
                } else {
                    url = '/kelurahan/store';
                }

                // Post Request
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        "kelurahan_id": kelurahan_id,
                        "province": province,
                        "city": city,
                        "subdistrict": subdistrict,
                        "village_district": village_district,
                        "postal_code": postal_code,
                    },
                    success:function(response){
                        console.log(response);
                        $('#btnSubmit').prop('disabled', true);
                        $("#btnSubmit").removeClass("loading");

                        // Reset form values
                        $('#kelurahanForm')[0].reset();

                        // Reset Qr Code
                        $('#barcodePreview').attr('hidden', true);
                        $('#imageQrCode').attr('hidden', true);
                        $('#imageQrCode').removeAttr('src', true);

                        //show success message
                        Swal.fire({
                            type: 'success',
                            icon: 'success',
                            title: `${response.message}`,
                            showConfirmButton: false,
                            timer: 3000
                        });

                        table.ajax.reload();

                        $('#kelurahanModal').modal('hide');
                        $("#btnSubmit").removeClass("loading");

                        $(':input').val('').prop('disabled', false);
                        $('.divPassword').show();
                        isUpdate = false;
                        

                    },
                    error:function(error){
                        $("#btnSubmit").removeClass("loading");

                        if (error.responseJSON.province && error.responseJSON.province[0]) {
                            Swal.fire({
                                type: 'error',
                                icon: 'error',
                                title: `${error.responseJSON.province[0]}`,
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }

                        if (error.responseJSON.city && error.responseJSON.city[0]) {
                            Swal.fire({
                                type: 'error',
                                icon: 'error',
                                title: `${error.responseJSON.city[0]}`,
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }

                        if (error.responseJSON.subdistrict && error.responseJSON.subdistrict[0]) {
                            Swal.fire({
                                type: 'error',
                                icon: 'error',
                                title: `${error.responseJSON.subdistrict[0]}`,
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }

                        if (error.responseJSON.village_district && error.responseJSON.village_district[0]) {
                            Swal.fire({
                                type: 'error',
                                icon: 'error',
                                title: `${error.responseJSON.village_district[0]}`,
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }

                        if (error.responseJSON.postal_code && error.responseJSON.postal_code[0]) {
                            Swal.fire({
                                type: 'error',
                                icon: 'error',
                                title: `${error.responseJSON.postal_code[0]}`,
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }
                    }
                });
            });

            var table = $('.kelurahan-table').DataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                scrollXInner: "100%",
                cache: true,
                order: [],
                ajax: "{{ url('kelurahans') }}",
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
                                filename: 'Data Lokasi',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10,11,12,13] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
                                filename: 'Data Lokasi',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10,11,12,13] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
                                orientation: 'landscape',
                                filename: 'Data Lokasi',
                                exportOptions: { columns: [1,2,3,4,5,6,7,8,9,10,11,12,13] }
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
                            'data-bs-target': '#kelurahanModal'
                        },
                        init: function (api, node, config) {
                            
                        }
                    }
                ],
                columns: [
                    {
                        data: 'action', 
                        name: 'action', 
                        orderable: true, 
                        searchable: true
                    },
                    {data: 'DT_RowIndex', name: 'DT_RowIndex'},
                    {data: 'village_district', name: 'village_district'},
                    {data: 'subdistrict', name: 'subdistrict'},
                    {data: 'city', name: 'city'},
                    {data: 'province', name: 'province'},
                    {data: 'postal_code', name: 'postal_code'},
                ]
            });

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            //delete on click
            $('body').on('click', '#btn-delete-kelurahan', function () {

                let kelurahan_id = $(this).data('id');
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
                            url: '/kelurahan/'+kelurahan_id,
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
            $('body').on('click', '#btn-edit-kelurahan', function () {
                let kelurahan_id = $(this).data('id');

                //fetch detail post with ajax
                $.ajax({
                    url: '/kelurahan/' + kelurahan_id,
                    type: "GET",
                    cache: true,
                    success:function(response){
                        isUpdate = true;
                        
                        $('#kelurahan_id').val(response.data.id);
                        $('#province').val(response.data.province);
                        $('#city').val(response.data.city);
                        $('#subdistrict').val(response.data.subdistrict);
                        $('#village_district').val(response.data.village_district);
                        $('#postal_code').val(response.data.postal_code);
                        
                        //open modal
                        $('#kelurahanModal').modal('show');
                    }
                });
            });

            $('#qrButton').click(function() {
                let qrCode = $('#barcode_code').val();
                var url = '/kelurahan/qrcode/' + qrCode;
                $.ajax({
                    url: url,
                    type: 'GET',
                    success: function(data) {
                        console.log(data);
                        $('#barcodePreview').removeAttr('hidden');
                        $('#imageQrCode').removeAttr('hidden');
                        $('#barcodePreview img').attr('src', `data:image/png;base64,${data}`);
                    }
                });
            });

            $('#closeFormModal').click(function(){
                $('#barcodePreview').attr('hidden', true);
                $('#imageQrCode').attr('hidden', true);
                $('#imageQrCode').removeAttr('src', true);
                $('#kelurahanForm')[0].reset();
            });
        });
    </script>

@endpush