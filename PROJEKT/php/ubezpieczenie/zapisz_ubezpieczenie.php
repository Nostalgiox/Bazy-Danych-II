<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $rodzaj = $_POST["rodzaj"];
    $kwota = $_POST["kwota"];
    $skladka = $_POST["skladka"];

    $query = 'BEGIN dodaj_ubezpieczenie(:p_rodzaj, :p_kwota, :p_skladka); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':p_rodzaj', $rodzaj);
    oci_bind_by_name($stmt, ':p_kwota', $kwota);
    oci_bind_by_name($stmt, ':p_skladka', $skladka);

    oci_execute($stmt);

    oci_free_statement($stmt);
    oci_close($conn);

    header("Location: ../../wyswietl_ubezpieczenia.php");
    // exit();
}
?>
