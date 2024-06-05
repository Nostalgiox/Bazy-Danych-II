<?php
// Połączenie z bazą danych
require_once("../conn.php");

// Zapytanie SQL
$query = 'SELECT * FROM "Ubezpieczenie"';
$stmt = oci_parse($conn, $query);
oci_execute($stmt);

// Generowanie rozwijanej listy z ubezpieczeniami
echo '<select name="id_ubezpieczenia" id="id_ubezpieczenia" class="form-control">';
while ($row = oci_fetch_assoc($stmt)) {
    echo '<option value="' . $row['id'] . '">' . $row['rodzaj_ubezpieczenia'] . '</option>';
}
echo '</select>';

// Zwolnienie zasobów
oci_free_statement($stmt);
oci_close($conn);
?>
