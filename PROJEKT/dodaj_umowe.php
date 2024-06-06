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
                        <a class="nav-link" href="index.html">
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
                            <h2>Dodaj Umowę</h2>
                            <form action="php/umowy/dodaj_umowe.php" method="post">
                                <div class="col-md-12">
                                    <div>
                                        <label for="id_pojazdu">Pojazd:</label>
                                        <?php
                                        // Połączenie z bazą danych
                                        require_once("php/conn.php");

                                        // Zapytanie SQL
                                        $query = 'SELECT * FROM "Pojazd" WHERE "dostepny" = \'T\'';
                                        $stmt = oci_parse($conn, $query);
                                        oci_execute($stmt);

                                        // Pętla wypisująca pojazdy w formie rozwijanej listy
                                        echo '<select name="id_pojazdu" id="id_pojazdu" class="form-control">';
                                        while ($row = oci_fetch_assoc($stmt)) {
                                            echo '<option value="' . (int)$row['id'] . '">' . $row['Marka'] . ' ' . $row['Model'] . '</option>';
                                        }
                                        echo '</select>';

                                        // Zwolnienie zasobów
                                        oci_free_statement($stmt);

                                        ?>
                                    </div>
                                    <div class="form-group">
                                        <label for="id_klienta">Klient:</label>
                                        <?php
                                        // Połączenie z bazą danych
                                        require_once("php/conn.php");

                                        // Zapytanie SQL
                                        $query = 'SELECT * FROM "Klienci"';
                                        $stmt = oci_parse($conn, $query);
                                        oci_execute($stmt);

                                        // Generowanie rozwijanej listy z klientami
                                        echo '<select name="id_klienta" id="id_klienta" class="form-control">';
                                        while ($row = oci_fetch_assoc($stmt)) {
                                            echo '<option value="' . (int)$row['id'] . '">' . $row['imie'] . ' ' . $row['nazwisko'] . '</option>';
                                        }
                                        echo '</select>';

                                        // Zwolnienie zasobów
                                        oci_free_statement($stmt);

                                        ?>

                                    </div>
                                    <div class="form-group">
                                        <label for="id_ubezpieczenia">Ubezpieczenie:</label>
                                        <?php
                                        // Połączenie z bazą danych
                                        require_once("php/conn.php");

                                        // Zapytanie SQL
                                        $query = 'SELECT * FROM "Ubezpieczenie"';
                                        $stmt = oci_parse($conn, $query);
                                        oci_execute($stmt);

                                        // Generowanie rozwijanej listy z ubezpieczeniami
                                        echo '<select name="id_ubezpieczenia" id="id_ubezpieczenia" class="form-control">';
                                        while ($row = oci_fetch_assoc($stmt)) {
                                            echo '<option value="' . (int)$row['id'] . '">' . $row['rodzaj_ubezpieczenia'] . '</option>';
                                        }
                                        echo '</select>';

                                        // Zwolnienie zasobów
                                        oci_free_statement($stmt);

                                        ?>

                                    </div>
                                    <div class="form-group">
                                        <label for="data_wypozyczenia">Data Wypożyczenia:</label>
                                        <input type="date" class="form-control" id="data_wypozyczenia" name="data_wypozyczenia" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="data_oddania">Data Oddania:</label>
                                        <input type="date" class="form-control" id="data_oddania" name="data_oddania">
                                    </div>
                                    <br>
                                    <button type="submit" class="btn btn-primary">Dodaj Umowę</button>
                                </div>
                            </form>

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
<?php oci_close($conn); ?>