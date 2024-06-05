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
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Strona główna
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Klienci
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dodaj_klienta.php">Dodaj klienta</a>
                                    <a class="nav-link" href="wyswietl_klientow.php">Wyświetl klientów</a>
                                </nav>
                            </div>


                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Ubezpieczenie
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dodaj_ubezpieczenie.php">Dodaj ubezpieczenie</a>
                                    <a class="nav-link" href="wyswietl_ubezpieczenia.php">Wyświetl ubezpieczenia</a>
                                </nav>
                            </div>


                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Pojazd
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dodaj_pojazd.php">Dodaj pojazd</a>
                                    <a class="nav-link" href="wyswietl_pojazdy.php">Wyświetl pojazdy</a>
                                </nav>
                            </div>
                            
                    </div>
                    
                </nav>
            </div>
            
        </div>
        <br>
        <div id="layoutSidenav_content" class="container mt-5">
        <h2>Lista Klientów</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Adres</th>
                    <th>Akcje</th> <!-- Dodaj kolumnę akcji -->
                </tr>
            </thead>
            <tbody>
                <?php
                require_once("php/conn.php");
                // Pobierz wszystkich klientów i ich adresy z bazy danych
                $query = 'SELECT K."id", K."imie", K."nazwisko", A."kod_pocztowy", A."miejscowosc", A."ulica", A."nr_domu", A."nr_lokalu" FROM "Klienci" K JOIN "Adres" A ON K."id_adresu" = A."id"';
                $stmt = oci_parse($conn, $query);
                oci_execute($stmt);

                // Wyświetl każdego klienta w tabeli
                while ($row = oci_fetch_assoc($stmt)) {
                    echo '<tr>';
                    echo '<td>' . $row['imie'] . '</td>';
                    echo '<td>' . $row['nazwisko'] . '</td>';
                    echo '<td>' . $row['kod_pocztowy'] . ' ' . $row['miejscowosc'] . ', ul. ' . $row['ulica'] . ' ' . $row['nr_domu'];
                    if ($row['nr_lokalu']) {
                        echo '/' . $row['nr_lokalu'];
                    }
                    echo '</td>';
                    // Dodaj przyciski edytuj i usuń dla każdego klienta
                    echo '<td>';
                    echo '<a href="edytuj_klienta.php?id=' . $row['id'] . '" class="btn btn-warning btn-sm">Edytuj</a>';
                    echo '<a href="php/klienci/usun_klienta.php?id=' . $row['id'] . '" class="btn btn-danger btn-sm ml-2" onclick="return confirm(\'Czy na pewno chcesz usunąć tego klienta?\')">Usuń</a>';
                    echo '</td>';
                    echo '</tr>';
                }
                oci_free_statement($stmt);
                ?>
            </tbody>
        </table>
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
