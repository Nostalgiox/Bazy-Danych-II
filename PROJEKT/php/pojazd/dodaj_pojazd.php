<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Marka = $_POST['Marka'];
    $Model = $_POST['Model'];
    $Rok_produkcji = $_POST['Rok_produkcji'];
    $Kolor = $_POST['Kolor'];
    $typ_pojazdu = $_POST['typ_pojazdu'];
    $dostepny = $_POST['dostepny'];
    $numer_VIN = $_POST['numer_VIN'];

    $pojemnosc_silnika = $_POST['pojemnosc_silnika'];
    $moc_silnika = $_POST['moc_silnika'];
    $rodzaj_paliwa = $_POST['rodzaj_paliwa'];
    $gaz = $_POST['gaz'];
    $stan_licznika = $_POST['stan_licznika'];
    
    // Dodaj dane techniczne
    $query_dane_techniczne = 'BEGIN dodaj_dane_techniczne(:pojemnosc_silnika, :moc_silnika, :rodzaj_paliwa, :gaz, :stan_licznika); END;';
    $stmt_dane_techniczne = oci_parse($conn, $query_dane_techniczne);
    oci_bind_by_name($stmt_dane_techniczne, ':pojemnosc_silnika', $pojemnosc_silnika);
    oci_bind_by_name($stmt_dane_techniczne, ':moc_silnika', $moc_silnika);
    oci_bind_by_name($stmt_dane_techniczne, ':rodzaj_paliwa', $rodzaj_paliwa);
    oci_bind_by_name($stmt_dane_techniczne, ':gaz', $gaz);
    oci_bind_by_name($stmt_dane_techniczne, ':stan_licznika', $stan_licznika);
    oci_execute($stmt_dane_techniczne);
    oci_free_statement($stmt_dane_techniczne);

    // Pobierz id ostatnio dodanego rekordu z tabeli Dane_techniczne
    $query_last_id = 'SELECT Dane_techniczne_seq.CURRVAL AS "id" FROM dual';
    $stmt_last_id = oci_parse($conn, $query_last_id);
    oci_execute($stmt_last_id);
    $row = oci_fetch_assoc($stmt_last_id);
    $id_dane_techniczne = (int)$row['id'];
    oci_free_statement($stmt_last_id);

    // Dodaj pojazd
    $query_pojazd = 'BEGIN dodaj_pojazd(:Marka, :Model, :Rok_produkcji, :Kolor, :id_dane_techniczne, :typ_pojazdu, :dostepny, :numer_VIN); END;';
    $stmt_pojazd = oci_parse($conn, $query_pojazd);
    oci_bind_by_name($stmt_pojazd, ':Marka', $Marka);
    oci_bind_by_name($stmt_pojazd, ':Model', $Model);
    oci_bind_by_name($stmt_pojazd, ':Rok_produkcji', $Rok_produkcji);
    oci_bind_by_name($stmt_pojazd, ':Kolor', $Kolor);
    oci_bind_by_name($stmt_pojazd, ':id_dane_techniczne', $id_dane_techniczne);
    oci_bind_by_name($stmt_pojazd, ':typ_pojazdu', $typ_pojazdu);
    oci_bind_by_name($stmt_pojazd, ':dostepny', $dostepny);
    oci_bind_by_name($stmt_pojazd, ':numer_VIN', $numer_VIN);
    oci_execute($stmt_pojazd);
    oci_free_statement($stmt_pojazd);

    // Pobierz ID cennika z formularza
    $id_cennik = (int)$_POST['id_cennik'];

    var_dump($id_cennik);

    // Pobierz ID ostatnio dodanego pojazdu
    $query_last_vehicle_id = 'SELECT "Pojazd_seq".CURRVAL AS "id" FROM dual';
    $stmt_last_vehicle_id = oci_parse($conn, $query_last_vehicle_id);
    oci_execute($stmt_last_vehicle_id);
    $row = oci_fetch_assoc($stmt_last_vehicle_id);
    $id_pojazdu = (int)$row['id'];
    oci_free_statement($stmt_last_vehicle_id);

    // Dodaj wpis do tabeli Historia
    $query_historia = 'BEGIN dodaj_historie(:id_cennik, :id_pojazd); END;';
    $stmt_historia = oci_parse($conn, $query_historia);
    oci_bind_by_name($stmt_historia, ':id_cennik', $id_cennik);
    oci_bind_by_name($stmt_historia, ':id_pojazd', $id_pojazdu);
    if (!oci_execute($stmt_historia)) {
        $error_message = oci_error($stmt_historia)['message'];
        echo "Błąd podczas wykonywania procedury dodawania historii: $error_message";
    }
    oci_free_statement($stmt_historia);


    oci_close($conn);


    header("Location: ../../wyswietl_pojazdy.php");
}
?>
