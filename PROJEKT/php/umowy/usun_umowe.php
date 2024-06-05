<?php
require_once("../conn.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
    $id = $_POST["id"];

    $query = 'BEGIN usun_umowe(:id); END;';
    $stmt = oci_parse($conn, $query);
    oci_bind_by_name($stmt, ':id', $id);

    $result = oci_execute($stmt);

    if ($result) {
        header("Location: ../../wyswietl_umowy.php");
    } else {
        $e = oci_error($stmt);
        echo "Błąd usuwania umowy: " . $e['message'];
    }

    oci_free_statement($stmt);
    oci_close($conn);
}
?>
