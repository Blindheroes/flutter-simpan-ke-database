<?php
// Buat koneksi ke database
$host = "localhost";
$username = "root";
$password = "";
$database = "moprog_database_mahasiswa";

$conn = new mysqli($host, $username, $password, $database);


$nrp = $_POST["NRP"];
$nama = $_POST["Nama Mahasiswa"];
$angkatan = $_POST["Angkatan"];

$data = mysqli_query($conn, "INSERT INTO `mahasiswa` (`NRP`, `Nama Mahasiswa`, `Angkatan`) VALUES ('$nrp', '$nama', '$angkatan');");

if ($data) {
    echo json_encode(['pesan' => 'Sukses!']);    # code...
} else {
    echo json_encode(['pesan' => 'Gagal!']);
}

?>