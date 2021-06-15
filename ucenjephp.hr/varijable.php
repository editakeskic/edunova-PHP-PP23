
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
        <h1>Varijable</h1>
<pre>
// varijabla je prostor u memoriji
// varijabla nema eksplicitno navedeni tip podatka kao što je bilo u MariaDB
$varijabla=7; // varijabla je prostor u memoriji
          // varijabla nema eksplicitno navedeni tip podatka kao što je bilo u MariaDB
          $varijabla=7;
          echo gettype($varijabla), '&lt;br /&gt;';

          $varijabla='7';
          echo gettype($varijabla), '&lt;br /&gt;';

          $varijabla="7";
          echo gettype($varijabla), '&lt;br /&gt;';
          
          $varijabla=7.7;
          echo gettype($varijabla), '&lt;br /&gt;';

          $varijabla=true;
          echo gettype($varijabla), '&lt;br /&gt;';

          $varijabla=[];
          echo gettype($varijabla), '&lt;br /&gt;';

          $varijabla=new stdClass();
          echo gettype($varijabla), '&lt;br /&gt;';
</pre>
        </div>
        <div class="large-4 cell">
          <?php 

          // varijabla je prostor u memoriji
          // varijabla nema eksplicitno navedeni tip podatka kao što je bilo u MariaDB
          $varijabla=7;
          echo gettype($varijabla), '<br />';

          $varijabla='7';
          echo gettype($varijabla), '<br />';

          $varijabla="7";
          echo gettype($varijabla), '<br />';
          
          $varijabla=7.7;
          echo gettype($varijabla), '<br />';

          $varijabla=true;
          echo gettype($varijabla), '<br />';

          $varijabla=[];
          echo gettype($varijabla), '<br />';

          $varijabla=new stdClass();
          echo gettype($varijabla), '<br />';

          ?>
        </div>
      </div>
    </div>


<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
