<?php
if (isset($_SESSION['kh_tendangnhap_logged']) == false) {
	// Nếu người dùng chưa đăng nhập thì chuyển hướng website sang trang đăng nhập
	header('Location: /shophoatuoi/backend/auth/login');
}else {
	if (isset($_SESSION['kh_quantri']) == true) {
		// Ngược lại nếu đã đăng nhập
		$_SESSION['kh_quantri'] = $kh_quantri;
		// Kiểm tra quyền của người đó có phải là admin hay không
		if ($kh_quantri == '0') {
			// Nếu không phải admin thì xuất thông báo
			echo "Bạn không đủ quyền truy cập vào trang này<br>";
            
			echo "<a href='/shophoatuoi/backend/'> Click để về lại trang chủ</a>";
			exit();
		}
	}
}
?>