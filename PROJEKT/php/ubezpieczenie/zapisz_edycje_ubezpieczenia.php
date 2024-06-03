<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];
    $rodzaj_ubezpieczenia = $_POST["rodzaj_ubezpieczenia"];
    $kwota_pokrycia = $_POST["kwota_pokrycia"];
    $skladka = $_POST["skladka"];

    // Wywołanie procedury aktualizuj_ubezpieczenie w bazie danych Oracle
    $query_aktualizuj = "BEGIN aktualizuj_ubezpieczenie(:p_id, :p_rodzaj_ubezpieczenia, :p_kwota_pokrycia, :p_skladka); END;";
    $stmt_aktualizuj = oci_parse($conn, $query_aktualizuj);
    oci_bind_by_name($stmt_aktualizuj, ':p_id', $id);
    oci_bind_by_name($stmt_aktualizuj, ':p_rodzaj_ubezpieczenia', $rodzaj_ubezpieczenia);
    oci_bind_by_name($stmt_aktualizuj, ':p_kwota_pokrycia', $kwota_pokrycia);
    oci_bind_by_name($stmt_aktualizuj, ':p_skladka', $skladka);
    oci_execute($stmt_aktualizuj);

    oci_free_statement($stmt_aktualizuj);
    oci_close($conn);

    // Przekierowanie na stronę listy ubezpieczeń po zapisaniu zmian
    header("Location: ../../wyswietl_ubezpieczenia.php");
    exit();
}
?>
