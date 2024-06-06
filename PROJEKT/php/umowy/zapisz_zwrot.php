<?php
// Sprawdzenie, czy dane zostały przesłane
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sprawdzenie, czy przesłano wszystkie wymagane dane
    if(isset($_POST['umowa_id'], $_POST['stan_licznika']) && !empty($_POST['umowa_id']) && !empty($_POST['stan_licznika'])) {
        $umowa_id = $_POST['umowa_id'];
        $stan_licznika = $_POST['stan_licznika'];
        $dostepny = 'T';
        $status = 'zakonczona';

        // Zapisanie zwrotu do bazy danych
        require_once '../conn.php';

        // Pobranie ID pojazdu z umowy
        $query_pojazd_id = 'SELECT "id_pojazdu" FROM "Umowy_wypozyczenia" WHERE "id" = :id';
        $stmt_pojazd_id = oci_parse($conn, $query_pojazd_id);
        oci_bind_by_name($stmt_pojazd_id, ':id', $umowa_id);
        oci_execute($stmt_pojazd_id);
        $row_pojazd_id = oci_fetch_assoc($stmt_pojazd_id);
        $pojazd_id = $row_pojazd_id['id_pojazdu'];

        // Aktualizacja stanu licznika w tabeli "Dane_techniczne"
        $query_update_stan_licznika = 'UPDATE "Dane_techniczne" SET "stan_licznika" = :stan_licznika WHERE "id" = :pojazd_id';
        $stmt_update_stan_licznika = oci_parse($conn, $query_update_stan_licznika);
        oci_bind_by_name($stmt_update_stan_licznika, ':stan_licznika', $stan_licznika);
        oci_bind_by_name($stmt_update_stan_licznika, ':pojazd_id', $pojazd_id);
        $result_update_stan_licznika = oci_execute($stmt_update_stan_licznika);

        // Aktualizacja dostępności pojazdu
        $query_update_dostepnosc = 'UPDATE "Pojazd" SET "dostepny" = :dostepny WHERE "id" = :pojazd_id';
        $stmt_update_dostepnosc = oci_parse($conn, $query_update_dostepnosc);
        oci_bind_by_name($stmt_update_dostepnosc, ':dostepny', $dostepny);
        oci_bind_by_name($stmt_update_dostepnosc, ':pojazd_id', $pojazd_id);
        $result_update_dostepnosc = oci_execute($stmt_update_dostepnosc);

        // Aktualizacja statusu umowy na "zakończona"
        $query_update_status = 'UPDATE "Umowy_wypozyczenia" SET "status" = :status WHERE "id" = :umowa_id';
        $stmt_update_status = oci_parse($conn, $query_update_status);
        oci_bind_by_name($stmt_update_status, ':status', $status);
        oci_bind_by_name($stmt_update_status, ':umowa_id', $umowa_id);
        $result_update_status = oci_execute($stmt_update_status);

        // Wyświetlenie komunikatu o wyniku operacji
        if ($result_update_stan_licznika && $result_update_dostepnosc && $result_update_status) {
            echo "Zwrot został zapisany pomyślnie. Stan licznika pojazdu został zaktualizowany. Pojazd jest ponownie dostępny do wynajęcia.";
        } else {
            echo "Wystąpił błąd podczas aktualizacji zwrotu, stanu licznika pojazdu lub dostępności pojazdu.";
        }

        oci_free_statement($stmt_pojazd_id);
        oci_free_statement($stmt_update_stan_licznika);
        oci_free_statement($stmt_update_dostepnosc);
        oci_free_statement($stmt_update_status);
        oci_close($conn);
    } else {
        echo "Nieprawidłowe dane zwrotu.";
    }
} else {
    echo "Nieprawidłowe żądanie.";
}
?>
