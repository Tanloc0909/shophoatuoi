<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session</title>
</head>
<body>
<h3>Session</h3>

<?php
session_start();

$_SESSION['tendangnhap'] = 'LOC';
$_SESSION['soluong'] = '3';



$tendangnhap = 'loc';
$soluong = 3;

?>

<ul>
<li>Tên tk <?= $tendangnhap ?></li>
<li>Số lương <?= $soluong ?></li>
</ul>


    
</body>
</html>