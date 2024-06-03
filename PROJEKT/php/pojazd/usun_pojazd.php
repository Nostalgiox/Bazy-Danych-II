<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];

    // Wywołanie procedury usuwającej pojazd
    $query = 'BEGIN usun_pojazd(:id); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);

    // Wywołanie procedury usuwającej dane techniczne
    $query2 = 'BEGIN usun_dane_techniczne(:id); END;';
    $stmt2 = oci_parse($conn, $query2);
    oci_bind_by_name($stmt2, ':id', $id);

    // Wykonaj procedury z obsługą błędów
    $result1 = oci_execute($stmt);
    if (!$result1) {
        $e = oci_error($stmt);
        echo "Błąd usuwania pojazdu: " . $e['message'];
    }

    $result2 = oci_execute($stmt2);
    if (!$result2) {
        $e = oci_error($stmt2);
        echo "Błąd usuwania danych technicznych: " . $e['message'];
    }

    // Zwolnij zasoby
    oci_free_statement($stmt);
    oci_free_statement($stmt2);
    oci_close($conn);

    if ($result1 && $result2) {
        // Przekierowanie użytkownika z powrotem do strony głównej
        header("Location: ../../wyswietl_pojazdy.php");
        exit();
    } else {
        echo "Nie udało się usunąć pojazdu lub danych technicznych.";
    }
} else {
    echo "Niepoprawne żądanie.";
}
?>
