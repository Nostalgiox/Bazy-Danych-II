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
                            <h2>Szczegóły Umowy</h2>
                            <?php
                            // Sprawdzamy, czy przekazano poprawny identyfikator umowy
                            if (isset($_GET['id'])) {
                                // Pobieramy identyfikator umowy z URL
                                $umowa_id = $_GET['id'];

                                // Połączenie z bazą danych
                                require_once 'php/conn.php';

                                // Zapytanie SQL do pobrania szczegółowych informacji na temat umowy
                                $query = 'SELECT u.*, k."imie", k."nazwisko", k."pesel", p."Marka", p."Model", p."typ_pojazdu", ub."rodzaj_ubezpieczenia"
              FROM "Umowy_wypozyczenia" u
              JOIN "Klienci" k ON u."id_klienta" = k."id"
              JOIN "Pojazd" p ON u."id_pojazdu" = p."id"
              JOIN "Ubezpieczenie" ub ON u."id_ubezpieczenia" = ub."id"
              WHERE u."id" = :umowa_id';

                                $stmt = oci_parse($conn, $query);
                                oci_bind_by_name($stmt, ':umowa_id', $umowa_id);
                                oci_execute($stmt);

                                // Sprawdzamy, czy umowa została znaleziona
                                if ($row = oci_fetch_assoc($stmt)) {
                                    // Tabela związana z umową
                                    echo '<table class="table">';
                                    echo '<tbody>';
                                    echo '<tr><td>ID Umowy:</td><td>' . $row['id'] . '</td></tr>';
                                    echo '<tr><td>Data Wypożyczenia:</td><td>' . $row['data_wypozyczenia'] . '</td></tr>';
                                    echo '<tr><td>Data Oddania:</td><td>' . $row['data_oddania'] . '</td></tr>';
                                    echo '<tr><td>Status:</td><td>' . $row['status'] . '</td></tr>';
                                    echo '<tr><td>Stan Licznika Przed:</td><td>' . $row['stan_licznika_przed'] . '</td></tr>';
                                    echo '<tr><td>Łączna Cena:</td><td>' . $row['laczna_cena'] . 'zł</td></tr>';
                                    echo '<tr><td>Rodzaj Ubezpieczenia:</td><td>' . $row['rodzaj_ubezpieczenia'] . '</td></tr>';
                                    echo '</tbody>';
                                    echo '</table>';

                                    // Tabela związana z pojazdem
                                    echo '<h2>Szczegóły Pojazdu</h2>';
                                    echo '<table class="table">';
                                    echo '<tbody>';
                                    echo '<tr><td>Marka Pojazdu:</td><td>' . $row['Marka'] . '</td></tr>';
                                    echo '<tr><td>Model Pojazdu:</td><td>' . $row['Model'] . '</td></tr>';
                                    echo '<tr><td>Typ pojazdu:</td><td>' . $row['typ_pojazdu'] . '</td></tr>';
                                    echo '</tbody>';
                                    echo '</table>';

                                    // Tabela związana z klientem
                                    echo '<h2>Dane Klienta</h2>';
                                    echo '<table class="table">';
                                    echo '<tbody>';
                                    echo '<tr><td>Imię Klienta:</td><td>' . $row['imie'] . '</td></tr>';
                                    echo '<tr><td>Nazwisko Klienta:</td><td>' . $row['nazwisko'] . '</td></tr>';
                                    echo '<tr><td>PESEL Klienta:</td><td>' . $row['pesel'] . '</td></tr>';
                                    echo '</tbody>';
                                    echo '</table>';

                                    // Dodajemy sekcję dla formy płatności
                                    echo '<h2>Forma Płatności</h2>';
                                    $query_platnosc = 'SELECT * FROM "Forma_platnosci" WHERE "id_umowy" = :umowa_id';
                                    $stmt_platnosc = oci_parse($conn, $query_platnosc);
                                    oci_bind_by_name($stmt_platnosc, ':umowa_id', $umowa_id);
                                    oci_execute($stmt_platnosc);

                                    echo '<table class="table">';
                                    echo '<tbody>';
                                    echo '<tr><th>Rodzaj Płatności</th><th>Numer Karty</th><th>Data Wygaśnięcia Karty</th><th>CVV</th></tr>';
                                    while ($platnosc_row = oci_fetch_assoc($stmt_platnosc)) {
                                        echo '<tr>';
                                        echo '<td>' . $platnosc_row['rodzaj_platnosci'] . '</td>';
                                        echo '<td>' . $platnosc_row['nr_karty'] . '</td>';
                                        echo '<td>' . $platnosc_row['data_wygasniecia_karty'] . '</td>';
                                        echo '<td>' . $platnosc_row['CVV'] . '</td>';
                                        echo '</tr>';
                                    }
                                    echo '</tbody>';
                                    echo '</table>';
                                } else {
                                    echo '<p>Nie znaleziono umowy o podanym identyfikatorze.</p>';
                                }

                                oci_free_statement($stmt);
                                oci_close($conn);
                            } else {
                                echo '<p>Nieprawidłowy identyfikator umowy.</p>';
                            }
                            ?>
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