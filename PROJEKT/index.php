<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand (po lewej stronie) -->
        <a class="navbar-brand ps-3 me-auto" href="index.html">Strona główna</a>

        <!-- Sidebar Toggle (po prawej stronie) -->
        <button class="btn btn-link btn-sm me-4" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    </nav>>

    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="index.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Strona główna
                        </a>
                        <div class="sb-sidenav-menu-heading">Interfejs</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseKlienci" aria-expanded="false" aria-controls="collapseKlienci">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Klienci
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseKlienci" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="dodaj_klienta.php">Dodaj klienta</a>
                                <a class="nav-link" href="wyswietl_klientow.php">Wyświetl klientów</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUbezpieczenia" aria-expanded="false" aria-controls="collapseUbezpieczenia">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Ubezpieczenia
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseUbezpieczenia" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="dodaj_ubezpieczenie.php">Dodaj ubezpieczenie</a>
                                <a class="nav-link" href="wyswietl_ubezpieczenia.php">Wyświetl ubezpieczenia</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePojazd" aria-expanded="false" aria-controls="collapsePojazd">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Pojazd
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePojazd" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="dodaj_pojazd.php">Dodaj pojazd</a>
                                <a class="nav-link" href="wyswietl_pojazdy.php">Wyświetl pojazdy</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUmowy" aria-expanded="false" aria-controls="collapsePojazd">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Umowy
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseUmowy" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="dodaj_umowe.php">Dodaj umowę</a>
                                <a class="nav-link" href="wyswietl_umowy.php">Wyświetl umowy</a>
                                <a class="nav-link" href="wyswietl_zwroty.php">Wyświetl zwroty</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCennik" aria-expanded="false" aria-controls="collapsePojazd">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Cennik
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseCennik" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="dodaj_cennik.php">Dodaj cennik</a>
                                <a class="nav-link" href="wyswietl_cennik.php">Wyświetl cennik</a>
                            </nav>
                        </div>


                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>ID Pojazdu</th>
                                        <th>Marka</th>
                                        <th>Model</th>
                                        <th>Przejechane Kilometry</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    require_once 'php/conn.php';

                                    // Pobranie bieżącej daty
                                    $obecna_data = date('Y-m-d');

                                    // Obliczenie daty z poprzedniego miesiąca
                                    $poprzedni_miesiac = date('Y-m', strtotime('-1 month', strtotime($obecna_data)));

                                    // Sprawdzenie, czy został wybrany miesiąc
                                    if (isset($_POST['miesiac'])) {
                                        $wybrany_miesiac = $_POST['miesiac'];
                                    } else {
                                        $wybrany_miesiac = $poprzedni_miesiac;
                                    }

                                    // Wywołanie funkcji oblicz_przejechane_kilometry z przekazaniem nazwy miesiąca
                                    $query = 'SELECT * FROM VW_KILOMETRY WHERE "miesiac" = :miesiac ORDER BY "id_pojazdu"';
                                    $stid = oci_parse($conn, $query);
                                    oci_bind_by_name($stid, ':miesiac', $wybrany_miesiac);
                                    oci_execute($stid);

                                    echo "<h4>Przejechane kilometry w miesiącu: " . $poprzedni_miesiac . " .</h4>";

                                    ?>
                                    <br>
                                    <form method="post">
                                        <div class="form-group">
                                            <label for="miesiac">Wybierz miesiąc:</label>
                                            <input type="month" id="miesiac" name="miesiac">
                                            <input type="submit" value="Pokaż statystyki">
                                        </div>
                                    </form>
                                    <br>
                                    <?php

                                    while ($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS)) {
                                        // if($row['przejechane_kilometry'] < 0) $row['przejechane_kilometry'] = 0; //
                                        echo "<tr>";
                                        echo "<td>" . $row['id_pojazdu'] . "</td>";
                                        echo "<td>" . $row['Marka'] . "</td>";
                                        echo "<td>" . $row['Model'] . "</td>";
                                        echo "<td>" . $row['przejechane_kilometry'] . " km</td>";
                                        echo "</tr>";
                                    }

                                    echo "</table>";

                                    // Zwolnienie zasobów
                                    oci_free_statement($stid);
                                    oci_close($conn);
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>