
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <?php include_once 'head.php'; ?>
  </head>
<body>

    <div class="grid-container">
      <?php 
      require_once 'izbornik.php';
      ?>
      <div class="grid-x grid-padding-x">
        <div class="large-8 cell" >
        <h1>Zadatak 4</h1>
<pre>
KASNIJE
</pre>
        </div>
        <div class="large-4 cell">
        <?php
// U izbornik postaviti poziv stranice zadatak4.php?naslov=2&tekst=Osijek
// stranica ispisuje primljeni tekst u velicini naslova (h1-h6)
// ukoliko je naslov manji od 1 ili veci od 6 stranica javlja poruku:
// Neispravan parametar
        


          $naslov = (int)$_GET['naslov'];
          $tekst = $_GET['tekst'];

          if($naslov < 1 || $naslov > 6){
            echo 'Neispravan parametar', '<br />';
          }else{
            echo "<h$naslov>$tekst</h$naslov>";
          }
          

         ?>
        </div>
      </div>
    </div>


<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
