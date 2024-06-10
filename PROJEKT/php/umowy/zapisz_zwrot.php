<?php
require_once '../conn.php';

// Sprawdzenie, czy dane zostały przesłane
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sprawdzenie, czy przesłano wszystkie wymagane dane
    if(isset($_POST['umowa_id'], $_POST['stan_licznika']) && !empty($_POST['umowa_id']) && !empty($_POST['stan_licznika'])) {
        $umowa_id = $_POST['umowa_id'];
        $stan_licznika = $_POST['stan_licznika'];

        // Wywołanie procedury zapisz_zwrot
        $query = 'BEGIN zapisz_zwrot(:p_umowa_id, :p_stan_licznika); END;';
        $stmt = oci_parse($conn, $query);

        // Bind parametrów do procedury
        oci_bind_by_name($stmt, ':p_umowa_id', $umowa_id);
        oci_bind_by_name($stmt, ':p_stan_licznika', $stan_licznika);

        // Wykonanie procedury
        if (oci_execute($stmt)) {
            echo "Zwrot został zapisany pomyślnie. Stan licznika pojazdu został zaktualizowany. Pojazd jest ponownie dostępny do wynajęcia.";
            header("Location: ../../wyswietl_umowy.php");
        } else {
            echo "Wystąpił błąd podczas aktualizacji zwrotu, stanu licznika pojazdu lub dostępności pojazdu.";
        }

        oci_free_statement($stmt);
    } else {
        echo "Nieprawidłowe dane zwrotu.";
    }
} else {
    echo "Nieprawidłowe żądanie.";
}

oci_close($conn);
?>
