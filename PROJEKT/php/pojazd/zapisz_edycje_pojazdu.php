<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $Marka = $_POST['Marka'];
    $Model = $_POST['Model'];
    $Rok_produkcji = $_POST['Rok_produkcji'];
    $Kolor = $_POST['Kolor'];
    $typ_pojazdu = $_POST['typ_pojazdu'];
    $dostepny = $_POST['dostepny'];
    $numer_VIN = $_POST['numer_VIN'];
    $id_dane_techniczne = $_POST['id_dane_techniczne']; // dodana linia

    $query = 'BEGIN aktualizuj_pojazd(:id, :Marka, :Model, :Rok_produkcji, :Kolor, :id_dane_techniczne, :typ_pojazdu, :dostepny, :numer_VIN); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);
    oci_bind_by_name($stmt, ':Marka', $Marka);
    oci_bind_by_name($stmt, ':Model', $Model);
    oci_bind_by_name($stmt, ':Rok_produkcji', $Rok_produkcji);
    oci_bind_by_name($stmt, ':Kolor', $Kolor);
    oci_bind_by_name($stmt, ':id_dane_techniczne', $id_dane_techniczne); // zmiana
    oci_bind_by_name($stmt, ':typ_pojazdu', $typ_pojazdu);
    oci_bind_by_name($stmt, ':dostepny', $dostepny);
    oci_bind_by_name($stmt, ':numer_VIN', $numer_VIN);
    oci_execute($stmt);
    oci_free_statement($stmt);
    oci_close($conn);

    header("Location: ../../wyswietl_pojazdy.php");
    exit();
}
?>
