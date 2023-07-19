<!DOCTYPE html>
<html>
<head>
<style>
#users {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#users td, #users th {
  border: 1px solid #ddd;
  padding: 8px;
}

#users tr:nth-child(even){background-color: #f2f2f2;}

#users tr:hover {background-color: #ddd;}

#users th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>

<table id="users">
  <tr>
    <th>Nama Petugas</th>
    <th>Longitude</th>
    <th>Latitude</th>
    <th>Kode QR</th>
    <th>Nama Gedung</th>
    <th>Lantai</th>
    <th>Nama Checkpoint</th>
    <th>Kategori Kondisi</th>
    <th>Keterangan Kondisi</th>
    <th>Created Data</th>
  </tr>
  @php
      $i = 0
  @endphp
  @foreach ($data as $item)
  {{-- @dd() --}}
    <tr>
      <td>{{$item['name']}}</td>
      <td>{{$item['longitude']}}</td>
      <td>{{$item['latitude']}}</td>
      <td>{{$item['barcode_code']}}</td>
      <td>{{$item['building_name']}}</td>
      <td>{{$item['floor']}}</td>
      <td>{{$item['check_point_name']}}</td>
      <td>{{$item['condition']}}</td>
      <td>{{$item['condition_note']}}</td>
      <td>{{$item['created_at']}}</td>
    </tr>
      @endforeach
</table>

</body>
</html>


