
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
        <h1>Zadatak 3</h1>
<pre>
KASNIJE
</pre>
        </div>
        <div class="large-4 cell">
        <?php
         //ovdje pišemo php kod
        


          $a = (int) $_GET['b1'];
          $b = (int) $_GET['b2'];


          if($a > $b){
            echo $a, '<br />';
          }else if($a===$b){
            echo 'Jednaki su';
          }
          else{
            echo $b, '<br />';
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
