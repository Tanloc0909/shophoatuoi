<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<p><h3>Đăng nhập</h3></p>
<?php session_start(); ?>

<?php if(isset($_SESSION['dadangnhap']) && $_SESSION['dadangnhap'] == true): ?>

<h2> Bạn dã đang nhập với tên <?= $_SESSION['tendadangnhap'] ?></h2>
<a href="dangxuat.php">Bấm để đăng xuất</a>

<?php endif ?>

<form action="" name='frmLogin' method='POST'>
    Tên đang nhập <input name='username' /> <br>
    Mật khẩu <input name="password" /> <br>

    <button name='btnLogin'>Đăng nhập</button>

</form>

<?php
    if(isset($_POST['btnLogin'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        if($username == 'admin' && $password == '12345') {
            echo 'Đăng nhập thành công';

            $_SESSION['dadangnhap'] = true;
            $_SESSION['tendadangnhap'] =  $username;
        }

        else{
            echo 'Đăng nhập thất bại';
        }
    }
?>
    
</body>
</html>