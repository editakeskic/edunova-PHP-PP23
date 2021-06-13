
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
          <pre>
          echo 'Hello world 1 &lt;br /&gt;', PHP_EOL;

        print 'Hello world 2' . PHP_EOL;

        echo "\t\tHello 3\n";
        print "Novi red 4\n";
          </pre>
        </div>
        <div class="large-4 cell">
          <?php 

        //https://stackoverflow.com/questions/234241/how-are-echo-and-print-different-in-php

          echo 'Hello world 1<br />', PHP_EOL;

          print 'Hello world 2' . PHP_EOL;

          echo "\t\tHello 3\n";
          print "Novi red 4\n";
          
          ?>
        </div>
      </div>
    </div>


<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
