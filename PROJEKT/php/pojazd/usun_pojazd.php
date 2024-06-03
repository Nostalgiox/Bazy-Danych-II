<?php
require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];

    // Wywołanie procedury usuwającej pojazd
    $query = 'BEGIN usun_pojazd(:id); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);
    oci_execute($stmt);

    oci_free_statement($stmt);
    oci_close($conn);

    // Przekierowanie użytkownika z powrotem do strony głównej
    header("Location: ../../wyswietl_pojazdy.php");
    exit();
}
?>
