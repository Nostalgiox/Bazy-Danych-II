<?php
// Dane do połączenia z bazą danych Oracle
$host = 'localhost'; // adres hosta bazy danych
$dbname = 'bazy_danych'; // nazwa bazy danych
$username = 'bazy_danych'; // nazwa użytkownika bazy danych
$password = 'bazy_danych'; // hasło użytkownika bazy danych

// Łączenie z bazą danych Oracle
// $conn = oci_connect($username, $password, "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)))");

$conn = oci_connect($username, $password, "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=freepdb1)))");

// Sprawdzenie czy udało się połączyć z bazą danych
if (!$conn) {
    $error = oci_error();
    die("Błąd połączenia z bazą danych: " . $error['message']);
} 

// Aktywacja triggera
$query = 'ALTER TRIGGER sprawdz_data_oddania ENABLE';
$stmt = oci_parse($conn, $query);
$result = oci_execute($stmt);

// $query2 = 'ALTER TRIGGER update_laczna_cena_trigger ENABLE';
// $stmt2 = oci_parse($conn, $query2);
// $result2 = oci_execute($stmt2);

if (!$result) {
    $error = oci_error($stmt);
    die("Błąd podczas aktywowania triggera: " . $error['message']);
}

// if (!$result2) {
//     $error2 = oci_error($stmt2);
//     die("Błąd podczas aktywowania triggera: " . $error2['message']);
// }

//else {
//    echo "Połączenie z bazą danych Oracle zostało ustanowione.";
//}

// Tutaj możesz umieścić dodatkową logikę związana z bazą danych

// Zamykanie połączenia z bazą danych Oracle
// oci_close($conn);
?>
