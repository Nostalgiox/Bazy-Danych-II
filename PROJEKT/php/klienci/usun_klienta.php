<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
    $id = $_GET["id"];

    // Usunięcie klienta o podanym ID z bazy danych
    $query_delete = 'DELETE FROM "Klienci" WHERE "id" = :id';
    $stmt_delete = oci_parse($conn, $query_delete);
    oci_bind_by_name($stmt_delete, ':id', $id);
    oci_execute($stmt_delete);

    oci_free_statement($stmt_delete);
    oci_close($conn);

    header("Location: ../../wyswietl_klientow.php"); // Przekierowanie do strony z listą klientów
    exit();
} else {
    echo "Nieprawidłowe żądanie.";
}
?>
