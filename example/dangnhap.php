<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session</title>
</head>
<body>
<h3>Session</h3>

<?php session_start();?>

<ul>
<li>Tên tk :<?= $_SESSION['tendangnhap']?> </li>
<li>Số lương : <? $_SESSION['soluong']?> </li>
</ul>


    
</body>
</html>