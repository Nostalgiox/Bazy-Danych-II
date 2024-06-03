<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $pojemnosc_silnika = $_POST['pojemnosc_silnika'];
    $moc_silnika = $_POST['moc_silnika'];
    $rodzaj_paliwa = $_POST['rodzaj_paliwa'];
    $gaz = $_POST['gaz'];
    $stan_licznika = $_POST['stan_licznika'];

    $query = 'BEGIN aktualizuj_dane_techniczne(:id, :pojemnosc_silnika, :moc_silnika, :rodzaj_paliwa, :gaz, :stan_licznika); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);
    oci_bind_by_name($stmt, ':pojemnosc_silnika', $pojemnosc_silnika);
    oci_bind_by_name($stmt, ':moc_silnika', $moc_silnika);
    oci_bind_by_name($stmt, ':rodzaj_paliwa', $rodzaj_paliwa);
    oci_bind_by_name($stmt, ':gaz', $gaz);
    oci_bind_by_name($stmt, ':stan_licznika', $stan_licznika);
    oci_execute($stmt);
    oci_free_statement($stmt);
    oci_close($conn);

    // Przekierowanie na stronę z listą pojazdów po zapisaniu zmian
    header("Location: ../../wyswietl_dane_techniczne.php?id=$id");
    exit();
}
?>
