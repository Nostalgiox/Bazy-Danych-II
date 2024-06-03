<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];

    // Wywołanie procedury usun_ubezpieczenie w bazie danych Oracle
    $query_usun = "BEGIN usun_ubezpieczenie(:p_id); END;";
    $stmt_usun = oci_parse($conn, $query_usun);
    oci_bind_by_name($stmt_usun, ':p_id', $id);
    oci_execute($stmt_usun);

    oci_free_statement($stmt_usun);
    oci_close($conn);

    // Przekierowanie na stronę listy ubezpieczeń po usunięciu
    header("Location: ../../wyswietl_ubezpieczenia.php");
    exit();
}
?>
