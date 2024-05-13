<?php
// Buat koneksi ke database
$host = "localhost";
$username = "root";
$password = "";
$database = "moprog_database_mahasiswa";

$conn = new mysqli($host, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Query untuk mengambil data mahasiswa
$query = "SELECT * FROM mahasiswa";
$result = $conn->query($query);

if ($result === false) {
    die("Error dalam menjalankan query: " . $conn->error);
}

// Ambil semua baris hasil sebagai array asosiatif
$data = $result->fetch_all(MYSQLI_ASSOC);

// Konversi data menjadi format JSON dan kirimkan sebagai respons
echo json_encode($data);

// Tutup koneksi
$conn->close();
?>