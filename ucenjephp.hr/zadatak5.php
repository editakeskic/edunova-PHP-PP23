
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
        <h1>Zadatak 5</h1>
<pre>
KASNIJE
</pre>
        </div>
        <div class="large-4 cell">
        <?php
// U izbornik postaviti poziv stranice zadatak5.php?broj=2&ime=4&t=9
// stranica ispisuje najveći primljeni broj

          $broj = (int)$_GET['broj'];
          $ime = (int)$_GET['ime'];
          $t = (int)$_GET['t'];


          if($broj > $ime && $broj > $t){
              echo $broj;
          }
          else if($ime > $broj && $ime > $t) {
              echo $ime;
          }
          else if ($t > $ime && $t > $broj){
              echo $t;
          }
          else if ($broj = $ime = $t){
            echo 'Dva ili tri broja su ista';
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
