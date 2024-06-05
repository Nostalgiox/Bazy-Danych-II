<?php
// Połączenie z bazą danych
require_once("../conn.php");

// Zapytanie SQL
$query = 'SELECT * FROM "Klienci"';
$stmt = oci_parse($conn, $query);
oci_execute($stmt);

// Generowanie rozwijanej listy z klientami
echo '<select name="id_klienta" id="id_klienta" class="form-control">';
while ($row = oci_fetch_assoc($stmt)) {
    echo '<option value="' . $row['id'] . '">' . $row['imie'] . ' ' . $row['nazwisko'] . '</option>';
}
echo '</select>';

// Zwolnienie zasobów
oci_free_statement($stmt);
oci_close($conn);
?>
