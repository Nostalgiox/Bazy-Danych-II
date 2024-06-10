<?php
require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pojazdu = (int)$_POST["id_pojazdu"];
    $id_klienta = (int)$_POST["id_klienta"];
    $id_ubezpieczenia = (int)$_POST["id_ubezpieczenia"];
    $data_wypozyczenia = date('Y-m-d', strtotime($_POST["data_wypozyczenia"]));
    $data_oddania = date('Y-m-d', strtotime($_POST["data_oddania"]));
    $status = "aktywna";
    $rodzaj_platnosci = $_POST["rodzaj_platnosci"];
    $nr_karty = (int)$_POST["nr_karty"];
    $data_wygasniecia_karty = date('Y-m-d', strtotime($_POST["data_wygasniecia_karty"]));
    $CVV = (int)$_POST["CVV"];

    // Zapytanie SQL do dodania umowy
    $query = 'BEGIN dodaj_umowe(:id_pojazdu, :id_klienta, :id_ubezpieczenia, TO_DATE(:data_wypozyczenia, \'YYYY-MM-DD\'), 
    TO_DATE(:data_oddania, \'YYYY-MM-DD\'), :status, :rodzaj_platnosci, :nr_karty, TO_DATE(:data_wygasniecia_karty, \'YYYY-MM-DD\'), :CVV); END;';

    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id_pojazdu', $id_pojazdu);
    oci_bind_by_name($stmt, ':id_klienta', $id_klienta);
    oci_bind_by_name($stmt, ':id_ubezpieczenia', $id_ubezpieczenia);
    oci_bind_by_name($stmt, ':data_wypozyczenia', $data_wypozyczenia);
    oci_bind_by_name($stmt, ':data_oddania', $data_oddania);
    oci_bind_by_name($stmt, ':status', $status);
    oci_bind_by_name($stmt, ':rodzaj_platnosci', $rodzaj_platnosci);
    oci_bind_by_name($stmt, ':nr_karty', $nr_karty);
    oci_bind_by_name($stmt, ':data_wygasniecia_karty', $data_wygasniecia_karty);
    oci_bind_by_name($stmt, ':CVV', $CVV);

    $result = oci_execute($stmt);

    if ($result) {
        header("Location: ../../wyswietl_umowy.php");
    } else {
        $e = oci_error($stmt);
        echo "Błąd dodawania umowy: " . $e['message'];
    }

    oci_free_statement($stmt);
    oci_close($conn);
}
?>
