
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
        <h1>IF</h1>
<pre>
KASNIJE
</pre>
        </div>
        <div class="large-4 cell">
        <?php
         //ovdje pišemo php kod
        
         $x = $_GET['broj'];

echo gettype($x),'<br />';

// if je binarno grananje, ima dvije grane
// if radi s boolean tipom podatka

// == koji provjerava samo po vrijednosti
// === provjerava po tipu i po vrijednosti
$uvjet = $x=='2';

echo gettype($uvjet), ' &gt;'. $uvjet, '&lt;<br />';

$uvjet = $x===2;

echo gettype($uvjet), ' &gt;'. $uvjet, '&lt;<br />';

if($uvjet){
  echo 'True grana';
}

if($x==='2'){
  echo 'Primljeni parametar je 2', '<br />';
}

$t=3;

// logički AND
// & provjerava oba uvjeta
// && ukoliko prvi uvjet nije zadovoljen ne provjerava se drugi
if($t>0 & $t<5){
  echo '1', '<br />';

}

// logički OR
// | provjerava oba uvjeta
// || ukoliko je prvi uvjet zadovoljen ne provjerava se drugi
if($t===6 || $t>10){
  echo '2', '<br />';
}

// logički NOT
// !
if($t!==5){
  echo '3', '<br />';
}

// puna implementacija if V1
if($t===5){
  echo '4', '<br />';
}else{
  echo '5', '<br />';
}

// puna implementacija if V2
if($t===2){
    echo '6', '<br />';
  }else if($t===8){
    echo '7', '<br />';
  }else{
    echo '8', '<br />';
  }


  //ugnježđeni if
  // elegantnije je sa and
  if($t>4){
    if($t<8){
      echo '9', '<br />';
    }
  }

  // ne raditi bez {} - uvijek će ispisati 11
if($t===5)
  echo '10', '<br />';
  echo '11', '<br />';

  // inline if (tercijarni operater ? : )
  $k=1;
  if($k===1){
    echo 'Super', '<br />';
  }else{
    echo 'NIJE ', 'Super', '<br />';
  }
  // 112 linija je ekvivalent 106 - 110
  echo $k===1 ? 'Super' : 'Loše ', '<br />';


  // koristiti ćemo funkciju isset()
  $broj = isset($_GET['broj']) ? (int)$_GET['broj'] : 0;
  
  
  //veći ekvivalent
  if(isset($_GET['broj'])){
    $broj = (int)$_GET['broj'];
  }else{
    echo 'Broj nije postavljen', '<br />';
    $broj=0;
  }

  echo $broj, '<br />';


         ?>
        </div>
      </div>
    </div>


<script src="assets/js/vendor.js"></script>
<script src="assets/js/foundation.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
