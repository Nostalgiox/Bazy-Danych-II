<?php
// Połączenie z bazą danych
require_once '../conn.php';

// Sprawdzenie, czy przekazano parametr id
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Wywołanie procedury przechowywanej do usunięcia danych
    $deleteCennikData = oci_parse($conn, 'BEGIN usun_cennik(:id); END;');
    oci_bind_by_name($deleteCennikData, ':id', $id);
    oci_execute($deleteCennikData);
    oci_free_statement($deleteCennikData);

    // echo '<p>Rekord został pomyślnie usunięty.</p>';
    header("Location: ../../wyswietl_cennik.php");
}
?>
