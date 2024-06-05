<?php
require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];
    $id_pojazdu = $_POST["id_pojazdu"];
    $id_klienta = $_POST["id_klienta"];
    $id_ubezpieczenia = $_POST["id_ubezpieczenia"];
    $data_wypozyczenia = date('Y/m/d', strtotime($_POST["data_wypozyczenia"]));
    $data_oddania = date('Y/m/d', strtotime($_POST["data_oddania"]));
    $status = $_POST["status"];

    $query = 'BEGIN edytuj_umowe(:id, :id_pojazdu, :id_klienta, :id_ubezpieczenia, TO_DATE(:data_wypozyczenia, \'YYYY-MM-DD\'), TO_DATE(:data_oddania, \'YYYY-MM-DD\'), :status); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);
    oci_bind_by_name($stmt, ':id_pojazdu', $id_pojazdu);
    oci_bind_by_name($stmt, ':id_klienta', $id_klienta);
    oci_bind_by_name($stmt, ':id_ubezpieczenia', $id_ubezpieczenia);
    oci_bind_by_name($stmt, ':data_wypozyczenia', $data_wypozyczenia);
    oci_bind_by_name($stmt, ':data_oddania', $data_oddania);
    oci_bind_by_name($stmt, ':status', $status);

    $result = oci_execute($stmt);

    if ($result) {
        header("Location: ../../wyswietl_umowy.php");
    } else {
        $e = oci_error($stmt);
        echo "Błąd edytowania umowy: " . $e['message'];
    }

    oci_free_statement($stmt);
    oci_close($conn);
}
?>
