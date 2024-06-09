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
                        <div class="col-lg-6">
                            <form action="php/pojazd/dodaj_pojazd.php" method="post">
                                <h4>Dane Pojazdu</h4>
                                <div class="form-group">
                                    <label for="Marka">Marka:</label>
                                    <input type="text" class="form-control" id="Marka" name="Marka" required>
                                </div>
                                <div class="form-group">
                                    <label for="Model">Model:</label>
                                    <input type="text" class="form-control" id="Model" name="Model" required>
                                </div>
                                <div class="form-group">
                                    <label for="Rok_produkcji">Rok Produkcji:</label>
                                    <input type="number" class="form-control" id="Rok_produkcji" name="Rok_produkcji" required>
                                </div>
                                <div class="form-group">
                                    <label for="Kolor">Kolor:</label>
                                    <input type="text" class="form-control" id="Kolor" name="Kolor">
                                </div>
                                <div class="form-group">
                                    <label for="typ_pojazdu">Typ Pojazdu:</label>
                                    <input type="text" class="form-control" id="typ_pojazdu" name="typ_pojazdu">
                                </div>
                                <div class="form-group">
                                    <label for="dostepny">Dostępny:</label>
                                    <!-- <input type="text" class="form-control" id="dostepny" name="dostepny" maxlength="1"> -->
                                    <select class="form-control" name="dostepny" id="dostepny">
                                        <option value="T">Tak</option>
                                        <option value="N">Nie</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="numer_VIN">Numer VIN:</label>
                                    <input type="text" class="form-control" id="numer_VIN" name="numer_VIN" required maxlength="17">
                                </div>
                                <div class="form-group">
                                    <label for="id_cennik">Cennik:</label>
                                    <select class="form-control" id="id_cennik" name="id_cennik">
                                        <?php
                                        // Połączenie z bazą danych
                                        require_once 'php/conn.php';

                                        // Pobieranie dostępnych cenników
                                        $query = 'SELECT * FROM "Cennik"';
                                        $stid = oci_parse($conn, $query);
                                        oci_execute($stid);

                                        // Wyświetlanie opcji cenników w formularzu
                                        while (($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS)) != false) {
                                            echo "<option value='" . $row['id'] . "'>Kwota za dzień: " . $row['kwota_za_dzien'] . "zł, Kaucja:" . $row['kaucja'] . "zł</option>";
                                        }

                                        // Zamknięcie połączenia z bazą danych
                                        oci_free_statement($stid);
                                        oci_close($conn);
                                        ?>
                                    </select>
                                </div>

                            </form>
                        </div>
                        <div class="col-lg-6">
                            <form>
                                <h4>Dane Techniczne</h4>
                                <div class="form-group">
                                    <label for="pojemnosc_silnika">Pojemność Silnika:</label>
                                    <input type="number" class="form-control" id="pojemnosc_silnika" name="pojemnosc_silnika" required>
                                </div>
                                <div class="form-group">
                                    <label for="moc_silnika">Moc Silnika:</label>
                                    <input type="number" class="form-control" id="moc_silnika" name="moc_silnika" required>
                                </div>
                                <div class="form-group">
                                    <label for="rodzaj_paliwa">Rodzaj Paliwa:</label>
                                    <input type="text" class="form-control" id="rodzaj_paliwa" name="rodzaj_paliwa">
                                </div>
                                <div class="form-group">
                                    <label for="gaz">Gaz (T/N):</label>
                                    <input type="text" class="form-control" id="gaz" name="gaz" maxlength="1">
                                </div>
                                <div class="form-group">
                                    <label for="stan_licznika">Stan Licznika:</label>
                                    <input type="number" class="form-control" id="stan_licznika" name="stan_licznika" required>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary">Dodaj Pojazd</button>
                            </form>
                        </div>
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