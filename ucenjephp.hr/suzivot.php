
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
        <h1>Suživot PHP i HTML</h1>
          <pre <?php echo '>'; ?> <!-- Loša praksa -->
         KASNIJE
          </pre>
        </div>
        <!-- Loša praksa -->
        <div class="large-4 cell<?php echo '"' ?> 
        style="color: <?php echo 'blue'; ?> "> <!-- Dobra praksa -->
          <?php 
          //PHP generira HTML
          //primjer loše prakse
          echo '<hr />';
          ?>
        </div>
      </div>
    </div>


<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
