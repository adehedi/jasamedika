<div class="main-menu-content">
    <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
        <li class="{{ (Route::is('dashboard')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ route('dashboard') }}"><i data-feather='home'></i><span class="menu-title text-truncate">Dashboard</span></a>
        </li>
        @hasrole('admin')
        <li class="{{ (Route::is('user')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ route('user') }}"><i data-feather='user'></i><span class="menu-title text-truncate">Data User</span></a>
        </li>
        @endhasrole
        <li class="{{ (Route::is('pasien')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ route('pasien') }}"><i data-feather='users'></i><span class="menu-title text-truncate">Data Pasien</span></a>
        </li>
        <!--<li class="{{ (Route::is('location')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ route('location') }}"><i data-feather='compass'></i><span class="menu-title text-truncate">Data Lokasi</span></a>
        </li>
        <li class="{{ (Route::is('patrol')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ route('patrol') }}"><i data-feather='book'></i><span class="menu-title text-truncate">Report</span></a>
        </li>-->
        @hasrole('admin')
        <!--<li class="{{ (Route::is('report')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ url('report') }}"><i data-feather='book-open'></i><span class="menu-title text-truncate">Rekap Report</span></a>
        </li>-->
        <li class="{{ (Route::is('kelurahan')) ? 'active' : '' }} nav-item">
            <a class="d-flex align-items-center" href="{{ url('kelurahan') }}"><i data-feather='map-pin'></i><span class="menu-title text-truncate">Kelurahan</span></a>
        </li>
        @endhasrole
    </ul>
</div>