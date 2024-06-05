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



                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Umowy
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dodaj_umowe.php">Dodaj umowę</a>
                                    <a class="nav-link" href="wyswietl_umowy.php">Wyświetl umowy</a>
                                </nav>
                            </div>
                            
                    </div>
                    
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <h2>Edytuj Umowę</h2>
                <?php
                require_once 'php/conn.php';

                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    $query = 'SELECT * FROM "Umowy_wypozyczenia" WHERE "id" = :id';
                    $stmt = oci_parse($conn, $query);
                    oci_bind_by_name($stmt, ':id', $id);
                    oci_execute($stmt);

                    if ($row = oci_fetch_assoc($stmt)) {
                        ?>
                        <form action="php/umowy/edytuj_umowe.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                            <div class="form-group">
                                <label for="id_pojazdu">ID Pojazdu:</label>
                                <input type="number" class="form-control" id="id_pojazdu" name="id_pojazdu" value="<?php echo $row['id_pojazdu']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="id_klienta">ID Klienta:</label>
                                <input type="number" class="form-control" id="id_klienta" name="id_klienta" value="<?php echo $row['id_klienta']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="id_ubezpieczenia">ID Ubezpieczenia:</label>
                                <input type="number" class="form-control" id="id_ubezpieczenia" name="id_ubezpieczenia" value="<?php echo $row['id_ubezpieczenia']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="data_wypozyczenia">Data Wypożyczenia:</label>
                                <input type="date" class="form-control" id="data_wypozyczenia" name="data_wypozyczenia" value="<?php echo $row['data_wypozyczenia']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="data_oddania">Data Oddania:</label>
                                <input type="date" class="form-control" id="data_oddania" name="data_oddania" value="<?php echo $row['data_oddania']; ?>">
                            </div>
                            <div class="form-group">
                                <label for="status">Status:</label>
                                <input type="text" class="form-control" id="status" name="status" value="<?php echo $row['status']; ?>" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Zapisz zmiany</button>
                        </form>
                        <?php
                    } else {
                        echo "Umowa o podanym ID nie została znaleziona.";
                    }

                    oci_free_statement($stmt);
                    oci_close($conn);
                } else {
                    echo "ID umowy nie zostało przekazane.";
                }
                ?>
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
