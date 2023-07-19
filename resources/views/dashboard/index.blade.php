@extends('layouts.main')

@section('page.content')

    <div class="content-overlay">
            
    </div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="card my-2">
                <div class="card-body">
                    <h2>Hai, {{ auth()->user()->name }}</h2>
                    <p>Selamat Datang Kembali di Aplikasi Portal</p>
                </div>
            </div>
        </div>
    </div>

@endsection