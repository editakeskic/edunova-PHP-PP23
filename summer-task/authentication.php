<?php

if($_POST['email']==='user1@email.com' && $_POST['password']==='enter'){
    session_start();
    $_SESSION['authenticized']=$_POST['email'];
    header('location: protectedPage.php');
}else{
    header('location: index.php');
}
