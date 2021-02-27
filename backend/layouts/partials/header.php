<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
  <div class="container-fluid">
    <a class="navbar-branch" href="#">
      <img src="/shophoatuoi/assets/frontend/img/logo.jpg" class="hinhlogo" height="50"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">


        <?php
        // Đã đăng nhập rồi -> hiển thị tên Người dùng và menu Đăng xuất
        if (isset($_SESSION['kh_tendangnhap_logged']) && !empty($_SESSION['kh_tendangnhap_logged'])) :
        ?>
          
          <li class="nav-item text-nowrap">
            <a class="nav-link" href="/shophoatuoi/backend/auth/logout.php">Đăng xuất <?= $_SESSION['kh_tendangnhap_logged']; ?></a>
          </li>
        <?php else : ?>
          <li class="nav-item text-nowrap">
            <a class="nav-link" href="/shophoatuoi/backend/auth/login.php">Đăng nhập</a>
          </li>
        <?php endif; ?>

        <div class="input-group-prepend">
          <span class="input-group-text">
            <i class="fa fa-user"></i>
          </span>
        </div>
      </ul>
    </div>
  </div>
</nav>

<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
  <a class="navbar-brand" href="/"></a><b>FLOWERSTORE</b>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

    </ul>

    <ul class="navbar-nav px-3 ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/shophoatuoi/backend/pages/dashboard.php">Quản lý</a>
      </li>

     
     





    </ul>
  </div>
</nav>