<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pobranie danych z formularza
    $kod_pocztowy = $_POST["kod_pocztowy"];
    $miejscowosc = $_POST["miejscowosc"];
    $ulica = $_POST["ulica"];
    $nr_domu = $_POST["nr_domu"];
    $nr_lokalu = $_POST["nr_lokalu"];
    $imie = $_POST["imie"];
    $nazwisko = $_POST["nazwisko"];
    $nr_dowodu = $_POST["nr_dowodu"];
    $pesel = $_POST["pesel"];

    // Sprawdzenie, czy adres już istnieje
    $query_check_adres = 'SELECT "id" FROM "Adres" WHERE "kod_pocztowy" = :p_kod_pocztowy AND "miejscowosc" = :p_miejscowosc AND "ulica" = :p_ulica AND "nr_domu" = :p_nr_domu AND "nr_lokalu" = :p_nr_lokalu';
    $stmt_check_adres = oci_parse($conn, $query_check_adres);
    
    oci_bind_by_name($stmt_check_adres, ':p_kod_pocztowy', $kod_pocztowy);
    oci_bind_by_name($stmt_check_adres, ':p_miejscowosc', $miejscowosc);
    oci_bind_by_name($stmt_check_adres, ':p_ulica', $ulica);
    oci_bind_by_name($stmt_check_adres, ':p_nr_domu', $nr_domu);
    oci_bind_by_name($stmt_check_adres, ':p_nr_lokalu', $nr_lokalu);
    
    oci_execute($stmt_check_adres);
    $row_check_adres = oci_fetch_assoc($stmt_check_adres);
    
    if ($row_check_adres) {
        // Jeśli adres istnieje, pobieramy jego ID
        $id_adresu = $row_check_adres['id'];
    } else {
        // Jeśli adres nie istnieje, dodajemy nowy adres
        $query_adres = "BEGIN dodaj_adres(:p_kod_pocztowy, :p_miejscowosc, :p_ulica, :p_nr_domu, :p_nr_lokalu); END;";
        $stmt_adres = oci_parse($conn, $query_adres);
        
        oci_bind_by_name($stmt_adres, ':p_kod_pocztowy', $kod_pocztowy);
        oci_bind_by_name($stmt_adres, ':p_miejscowosc', $miejscowosc);
        oci_bind_by_name($stmt_adres, ':p_ulica', $ulica);
        oci_bind_by_name($stmt_adres, ':p_nr_domu', $nr_domu);
        oci_bind_by_name($stmt_adres, ':p_nr_lokalu', $nr_lokalu);

        oci_execute($stmt_adres);

        // Pobranie ID dodanego adresu
        $query_last_id = 'SELECT Adres_seq.CURRVAL AS "id" FROM DUAL';
        $stmt_last_id = oci_parse($conn, $query_last_id);
        oci_execute($stmt_last_id);
        $row_last_id = oci_fetch_assoc($stmt_last_id);
        $id_adresu = $row_last_id['id'];

        oci_free_statement($stmt_adres);
        oci_free_statement($stmt_last_id);
    }
    oci_free_statement($stmt_check_adres);
    if(isset($id_adresu)) {
        // Wywołanie procedury dodaj_klienta w bazie danych Oracle
        $query_klient = "BEGIN dodaj_klienta(:p_imie, :p_nazwisko, :p_id_adresu, :p_nr_dowodu, :p_pesel); END;";
        $stmt_klient = oci_parse($conn, $query_klient);
        
        oci_bind_by_name($stmt_klient, ':p_imie', $imie);
        oci_bind_by_name($stmt_klient, ':p_nazwisko', $nazwisko);
        oci_bind_by_name($stmt_klient, ':p_id_adresu', $id_adresu);
        oci_bind_by_name($stmt_klient, ':p_nr_dowodu', $nr_dowodu);
        oci_bind_by_name($stmt_klient, ':p_pesel', $pesel);

        oci_execute($stmt_klient);


        //echo "Klient został dodany.";

        oci_free_statement($stmt_klient);
        header("Location: ../../wyswietl_klientow.php");
    } else {
        echo "Błąd: Nie udało się pobrać ID adresu";
    }
    oci_close($conn);
}
?>
