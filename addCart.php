<?php
session_start();
if(!isset($_SESSION['cart'])){
    $arr = array();
    array_push($arr,$_GET['addCart']);
    $_SESSION['cart'] = $arr;
}
else{
    $arr = array();
    $arr = $_SESSION['cart'];
    array_push($arr,$_GET['addCart']);
    $_SESSION['cart'] = $arr;
}

header('Location: index.php');

?>