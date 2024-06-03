<?php
require_once '../conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];
    $imie = $_POST["imie"];
    $nazwisko = $_POST["nazwisko"];
    $nr_dowodu = $_POST["nr_dowodu"];
    $pesel = $_POST["pesel"];

    // Aktualizacja danych klienta w bazie danych
    $query_update = 'UPDATE "Klienci" SET "imie" = :imie, "nazwisko" = :nazwisko, "nr_dowodu" = :nr_dowodu, "pesel" = :pesel WHERE "id" = :id';
    $stmt_update = oci_parse($conn, $query_update);

    oci_bind_by_name($stmt_update, ':id', $id);
    oci_bind_by_name($stmt_update, ':imie', $imie);
    oci_bind_by_name($stmt_update, ':nazwisko', $nazwisko);
    oci_bind_by_name($stmt_update, ':nr_dowodu', $nr_dowodu);
    oci_bind_by_name($stmt_update, ':pesel', $pesel);

    $result = oci_execute($stmt_update);

    if ($result) {
        echo "Dane klienta zostały zaktualizowane.";
        header("Location: ../../wyswietl_klientow.php");
    } else {
        echo "Wystąpił błąd podczas aktualizacji danych klienta.";
    }

    oci_free_statement($stmt_update);
    oci_close($conn);
} else {
    echo "Nieprawidłowe żądanie.";
}
?>
