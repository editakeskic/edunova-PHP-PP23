<?php

session_start();

if(!isset($_SESSION['authorized'])){
    header('location: index.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    Welcome <?php echo $_SESSION['authorized'] ?> <a href="logout.php">Log me out</a>
</body>
</html>