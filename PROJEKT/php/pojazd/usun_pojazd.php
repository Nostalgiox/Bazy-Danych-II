<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];

    // Sprawdzenie, czy pojazd jest powiązany z umową
    $checkQuery = 'SELECT COUNT(*) AS count FROM "Umowy_wypozyczenia" WHERE "id_pojazdu" = :id';
    $checkStmt = oci_parse($conn, $checkQuery);
    oci_bind_by_name($checkStmt, ':id', $id);
    oci_execute($checkStmt);
    $row = oci_fetch_assoc($checkStmt);
    oci_free_statement($checkStmt);

    if ($row['COUNT'] > 0) {
        echo "Nie można usunąć pojazdu, ponieważ jest powiązany z umową.";
    } else {
        // Wywołanie procedury usuwającej pojazd i dane techniczne
        $query = 'BEGIN usun_pojazd(:id); END;';
        $stmt = oci_parse($conn, $query);
        oci_bind_by_name($stmt, ':id', $id);

        $result1 = oci_execute($stmt);
        if (!$result1) {
            $e = oci_error($stmt);
            echo "Błąd usuwania pojazdu: " . $e['message'];
        }

        oci_free_statement($stmt);
        oci_close($conn);

        if ($result1) {
            // Przekierowanie użytkownika z powrotem do strony głównej
            header("Location: ../../wyswietl_pojazdy.php");
            exit();
        } else {
            echo "Nie udało się usunąć pojazdu.";
        }
    }
} else {
    echo "Niepoprawne żądanie.";
}
?>
