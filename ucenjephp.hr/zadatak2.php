<?php
// Stranica prima GET parametar boja i u odnosu na primljenu boju
// (npr: blue, red, yellow,..) boja pozadine stranice je jednaka primljenoj boji

// stranicu dodati u izbornik

$boja = $_GET['boja'];

//+ u url dodajemo http://ucenjephp.hr/zadatak2.php?boja=pink

?>

<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foundation for Sites</title>
    <link rel="stylesheet" href="assets/css/foundation.css">
    <link rel="stylesheet" href="assets/css/style.css">

  </head>
<body style="background-color: <?php echo $boja ?>">

<div class="grid-container">
    <?php
    require_once 'izbornik.php';
    ?>
    <div class="grid-x grid-padding-x">
        <div class="large-6 cell">
        Zadatak 2
        </div>
    </div>
</div>

<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
