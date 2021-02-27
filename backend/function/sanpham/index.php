<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh sách Hình thức thanh toán</title>

    <?php include_once(__DIR__ . '/../../layouts/styles.php'); ?>

    <!-- DataTable CSS -->
    <link href="/Salomon/assets/vendor/DataTables/Buttons-1.6.5/css/buttons.bootstrap4.min.css" type="text/css" rel="stylesheet" />
    <link href="/Salomon/assets/vendor/DataTables/datatables.css" type="text/css" rel="stylesheet" />
</head>
<body>
    
    <!-- header -->
    <?php include_once(__DIR__ . '/../../layouts/partials/header.php'); ?>
    <!-- end header -->


    <div class="container-fluid">
        <div class="row">
            
                <!-- sidebar -->
                <?php include_once(__DIR__ . '/../../layouts/partials/sidebar.php'); ?>
                <!-- end sidebar -->
            
            <div class="col-md-9">
                <h1>Sản phẩm</h1>

                <!-- Block content -->
                <?php
                // Truy vấn database để lấy danh sách
                // 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
                include_once(__DIR__ . '/../../../dbconnect.php');

                // 2. Chuẩn bị câu truy vấn $sql
                // Sử dụng HEREDOC của PHP để tạo câu truy vấn SQL với dạng dễ đọc, thân thiện với việc bảo trì code
                $sql = <<<EOT
    SELECT sp.*
        , lsp.lsp_ten
        , nsx.nsx_ten
        , km.km_ten, km.km_noidung, km.km_tungay, km.km_denngay
    FROM `sanpham` sp
    JOIN `loaisanpham` lsp ON sp.lsp_ma = lsp.lsp_ma
    JOIN `nhasanxuat` nsx ON sp.nsx_ma = nsx.nsx_ma
    LEFT JOIN `khuyenmai` km ON sp.km_ma = km.km_ma
    ORDER BY sp.sp_ma DESC
EOT;

                // 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
                $result = mysqli_query($conn, $sql);

                // 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
                // Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
                // Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
                $formatedData = [];
                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                    $km_tomtat = '';
                    if (!empty($row['km_ten'])) {
                        // Sử dụng hàm sprintf() để chuẩn bị mẫu câu với các giá trị truyền vào tương ứng từng vị trí placeholder
                        $km_tomtat = sprintf(
                            "KM %s: %s từ ngày %s-%s",
                            $row['km_ten'],
                            $row['km_noidung'],
                            // Sử dụng hàm date($format, $timestamp) để chuyển đổi ngày thành định dạng Việt Nam (ngày/tháng/năm)
                            // Do hàm date() nhận vào là đối tượng thời gian, chúng ta cần sử dụng hàm strtotime() 
                            // để chuyển đổi từ chuỗi có định dạng 'yyyy-mm-dd' trong MYSQL thành đối tượng ngày tháng
                            date('d/m/Y', strtotime($row['km_tungay'])),    //vd: '2019-04-25'
                            date('d/m/Y', strtotime($row['km_denngay']))
                        );  //vd: '2019-05-10'
                    }
                    

                    $formatedData[] = array(
                        'sp_ma' => $row['sp_ma'],
                        'sp_ten' => $row['sp_ten'],
                        // Sử dụng hàm number_format(số tiền, số lẻ thập phân, dấu phân cách số lẻ, dấu phân cách hàng nghìn) 
                        // để định dạng số khi hiển thị trên giao diện. 
                        // Vd: 15800000 -> format thành 15,800,000.66 vnđ
                        'sp_gia' => number_format($row['sp_gia'], 2, ".", ",") . ' vnđ',
                        'sp_giacu' => number_format($row['sp_giacu'], 2, ".", ",") . ' vnđ',
                        'sp_mota_ngan' => $row['sp_mota_ngan'],
                        'sp_mota_chitiet' => $row['sp_mota_chitiet'],
                        'sp_ngaycapnhat' => date('d/m/Y H:i:s', strtotime($row['sp_ngaycapnhat'])),
                        'sp_soluong' => number_format($row['sp_soluong'], 0, ".", ","),
                        'lsp_ma' => $row['lsp_ma'],
                        'nsx_ma' => $row['nsx_ma'],
                        'km_ma' => $row['km_ma'],
                        // Các cột dữ liệu lấy từ liên kết khóa ngoại
                        'lsp_ten' => $row['lsp_ten'],
                        'nsx_ten' => $row['nsx_ten'],
                        'km_tomtat' => $km_tomtat,
                    );
                }
                ?>
                

                <a href="create.php" class="btn btn-primary">Thêm mới</a>
                <table id="tblDanhsach" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá sản phẩm</th>
                            <th>Loại sản phẩm</th>
                            <th>Loại hoa</th>
                            <th>Khuyến mãi</th>
                            <th>hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($formatedData as $sp): ?>
                        <tr>
                            <td><?php echo $sp['sp_ma'] ?></td>
                            <td><?= $sp['sp_ten'] ?></td>
                            <td><?= $sp['sp_gia'] ?></td>
                            <td><?= $sp['lsp_ten'] ?></td>
                            <td><?= $sp['nsx_ten'] ?></td>

                            <td><?= $sp['km_tomtat'] ?></td>
                        
                            <td>
                                <a href="edit.php?sp_ma=<?php echo $sp['sp_ma'] ?>" class="btn btn-success">Sửa</a>
                                <a href="delete.php?sp_ma=<?php echo $sp['sp_ma'] ?>" class="btn btn-danger">Xóa</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- footer -->
    <?php include_once(__DIR__ . '/../../layouts/partials/footer.php'); ?>
    <!-- end footer -->

    <?php include_once(__DIR__ . '/../../layouts/scripts.php'); ?>

    <!-- DataTable JS -->
    <script src="/Salomon/assets/vendor/DataTables/datatables.min.js"></script>
    <script src="/Salomon/assets/vendor/DataTables/Buttons-1.6.5/js/buttons.bootstrap4.min.js"></script>
    <script src="/Salomon/assets/vendor/DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
    <script src="/Salomon/assets/vendor/DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
    <script>
    $('#tblDanhsach').DataTable({
            dom: 'Blfrtip',
            buttons: [
                'copy', 'excel', 'pdf'
            ]
        });
    </script>
</body>
</html>