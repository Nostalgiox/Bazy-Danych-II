<?php
    require_once '../conn.php';
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
         

        $kwota_za_dzien = $_POST['kwota_za_dzien'];
        $kaucja = $_POST['kaucja'];
        $kara = $_POST['kara'];

        // Przygotowanie wywołania procedury
        $stmt = oci_parse($conn, 'BEGIN dodaj_cennik(:kwota_za_dzien, :kaucja, :kara); END;');

        // Przypisanie wartości do zmiennych w procedurze
        oci_bind_by_name($stmt, ':kwota_za_dzien', $kwota_za_dzien);
        oci_bind_by_name($stmt, ':kaucja', $kaucja);
        oci_bind_by_name($stmt, ':kara', $kara);

        // Wykonanie procedury
        if (oci_execute($stmt)) {
            echo "Cennik został dodany pomyślnie.";
        } else {
            $error = oci_error($stmt);
            echo "Błąd podczas dodawania cennika: " . $error['message'];
        }

        // Zwolnienie zasobów
        oci_free_statement($stmt);
        oci_close($conn);
    }
    ?>