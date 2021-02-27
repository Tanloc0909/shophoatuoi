-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table shophoatuoi.chudegopy
CREATE TABLE IF NOT EXISTS `chudegopy` (
  `cdgy_ma` int(11) NOT NULL,
  `cdgy_ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cdgy_ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.chudegopy: ~0 rows (approximately)
/*!40000 ALTER TABLE `chudegopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `chudegopy` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.dondathang
CREATE TABLE IF NOT EXISTS `dondathang` (
  `dh_ma` int(11) NOT NULL AUTO_INCREMENT,
  `dh_ngaylap` datetime NOT NULL,
  `dh_ngaygiao` datetime DEFAULT NULL,
  `dh_noigiao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dh_trangthaithanhtoan` int(11) NOT NULL,
  `httt_ma` int(11) NOT NULL,
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dh_ma`),
  KEY `dondathang_khachhang_idx` (`kh_tendangnhap`),
  KEY `dondathang_hinhthucthanhtoan_idx` (`httt_ma`),
  CONSTRAINT `dondathang_hinhthucthanhtoan` FOREIGN KEY (`httt_ma`) REFERENCES `hinhthucthanhtoan` (`httt_ma`),
  CONSTRAINT `dondathang_khachhang` FOREIGN KEY (`kh_tendangnhap`) REFERENCES `khachhang` (`kh_tendangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.dondathang: ~8 rows (approximately)
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
REPLACE INTO `dondathang` (`dh_ma`, `dh_ngaylap`, `dh_ngaygiao`, `dh_noigiao`, `dh_trangthaithanhtoan`, `httt_ma`, `kh_tendangnhap`) VALUES
	(1, '2013-02-21 16:45:44', '2013-02-01 00:00:00', 'Can Tho', 0, 1, 'vdduy'),
	(2, '2013-02-21 16:46:33', '2013-02-07 00:00:00', 'Ã¡dsadsad', 0, 1, 'vdduy'),
	(3, '2013-02-21 16:47:22', '2013-02-01 00:00:00', 'sdfsdf', 0, 1, 'vdduy'),
	(4, '2013-02-21 16:48:10', '2013-02-08 00:00:00', 'Can Tho', 0, 1, 'vdduy'),
	(5, '2013-02-21 16:48:59', '2013-02-09 00:00:00', 'Can Tho', 0, 1, 'vdduy'),
	(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cần Thơ', 0, 1, 'admin'),
	(7, '2021-02-26 00:00:00', '2021-02-27 00:00:00', 'Cần Thơ', 1, 3, 'dinhduyvo'),
	(8, '2021-02-12 00:00:00', '2021-03-04 00:00:00', 'Vị thanh', 0, 2, 'nta');
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.gopy
CREATE TABLE IF NOT EXISTS `gopy` (
  `gy_ma` int(11) NOT NULL,
  `gy_hoten` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_diachi` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_dienthoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_tieude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_noidung` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_ngaygopy` datetime DEFAULT NULL,
  `cdgy_ma` int(11) DEFAULT NULL,
  PRIMARY KEY (`gy_ma`),
  KEY `gopy_chudegopy_idx` (`cdgy_ma`),
  CONSTRAINT `gopy_chudegopy` FOREIGN KEY (`cdgy_ma`) REFERENCES `chudegopy` (`cdgy_ma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.gopy: ~0 rows (approximately)
/*!40000 ALTER TABLE `gopy` DISABLE KEYS */;
/*!40000 ALTER TABLE `gopy` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.hinhsanpham
CREATE TABLE IF NOT EXISTS `hinhsanpham` (
  `hsp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `hsp_tentaptin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_ma` int(11) NOT NULL,
  PRIMARY KEY (`hsp_ma`),
  KEY `fk_hinhsanpham_sanpham1_idx` (`sp_ma`),
  CONSTRAINT `fk_hinhsanpham_sanpham1` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.hinhsanpham: ~9 rows (approximately)
/*!40000 ALTER TABLE `hinhsanpham` DISABLE KEYS */;
REPLACE INTO `hinhsanpham` (`hsp_ma`, `hsp_tentaptin`, `sp_ma`) VALUES
	(37, '20210227151758_Langhoakhaitruonghongphat.jpg', 7),
	(38, '20210227151930_Langhoakhaitruonghongphat.jpg', 7),
	(39, '20210227151234_Langhoakhaitruonghongphat.jpg', 7),
	(40, '20210227150602_hoahongdo.jpg', 13),
	(41, '20210227152831_chaulanvang.jpg', 17),
	(42, '20210227152900_hoacamtaycdau.jpg', 15),
	(43, '20210227152933_chaulilihong.jpg', 16),
	(44, '20210227153027_vonghoacuc.jpg', 12),
	(45, '20210227153130_hoasen11.jpg', 14);
/*!40000 ALTER TABLE `hinhsanpham` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.hinhthucthanhtoan
CREATE TABLE IF NOT EXISTS `hinhthucthanhtoan` (
  `httt_ma` int(11) NOT NULL AUTO_INCREMENT,
  `httt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`httt_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.hinhthucthanhtoan: ~3 rows (approximately)
/*!40000 ALTER TABLE `hinhthucthanhtoan` DISABLE KEYS */;
REPLACE INTO `hinhthucthanhtoan` (`httt_ma`, `httt_ten`) VALUES
	(1, 'Tiá»n máº·t'),
	(2, 'Chuyá»ƒn khoáº£n'),
	(3, 'Paypal');
/*!40000 ALTER TABLE `hinhthucthanhtoan` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_matkhau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_gioitinh` int(11) NOT NULL,
  `kh_diachi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kh_dienthoai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ngaysinh` int(11) DEFAULT NULL,
  `kh_thangsinh` int(11) DEFAULT NULL,
  `kh_namsinh` int(11) NOT NULL,
  `kh_cmnd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_makichhoat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_trangthai` int(11) NOT NULL,
  `kh_quantri` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kh_tendangnhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.khachhang: ~5 rows (approximately)
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
REPLACE INTO `khachhang` (`kh_tendangnhap`, `kh_matkhau`, `kh_ten`, `kh_gioitinh`, `kh_diachi`, `kh_dienthoai`, `kh_email`, `kh_ngaysinh`, `kh_thangsinh`, `kh_namsinh`, `kh_cmnd`, `kh_makichhoat`, `kh_trangthai`, `kh_quantri`) VALUES
	('admin', '123', 'Quản trị', 1, 'Số 01 - Lý Tự Trọng - Cần Thơ', '0912.123.567', 'admin@salomon.vn', 2, 2, 1985, NULL, NULL, 1, 1),
	('dinhduyvo', '123', 'Vo Dinh Duy', 0, 'Can Tho', '07103.273.34433', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '', 1, 0),
	('nta', '|J	Ê7b¯aå• ”=Âd”ø”', 'Nguyen Thi A', 1, 'Cáº§n ThÆ¡', '0903100550', 'nta@gmail.com', 17, 5, 1987, '', '', 0, 0),
	('usermoi', 'fcea920f7412b5da7be0cf42b8c93759', 'Nguoi dung moi', 0, 'Can Tho', '07103-273.344', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '44766fb4dd4e4977e75a9321cbc6413e', 0, 0),
	('vdduy', 'fcea920f7412b5da7be0cf42b8c93759', 'Vo Dinh Duy', 0, 'Can Tho', '0975107705', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', 'â€zcnl82qbuj', 1, 0);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.khuyenmai
CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `km_ma` int(11) NOT NULL,
  `km_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km_noidung` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `km_tungay` date DEFAULT NULL,
  `km_denngay` date DEFAULT NULL,
  PRIMARY KEY (`km_ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.khuyenmai: ~0 rows (approximately)
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
REPLACE INTO `khuyenmai` (`km_ma`, `km_ten`, `km_noidung`, `km_tungay`, `km_denngay`) VALUES
	(1, 'Khai trương', 'Giảm 10%', '2021-02-27', '2021-02-28');
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.loaisanpham
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `lsp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `lsp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lsp_mota` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lsp_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.loaisanpham: ~3 rows (approximately)
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
REPLACE INTO `loaisanpham` (`lsp_ma`, `lsp_ten`, `lsp_mota`) VALUES
	(1, 'Hoa Chia Buồn', 'Hoa Kính Viếng, Tang Lễ'),
	(2, 'Hoa Tình Yêu', '  Valentine, 8/3..'),
	(4, 'Hoa Chúc Mừng', '  Khai Trương, Sinh Nhật..');
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.nhasanxuat
CREATE TABLE IF NOT EXISTS `nhasanxuat` (
  `nsx_ma` int(11) NOT NULL AUTO_INCREMENT,
  `nsx_ten` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nsx_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.nhasanxuat: ~5 rows (approximately)
/*!40000 ALTER TABLE `nhasanxuat` DISABLE KEYS */;
REPLACE INTO `nhasanxuat` (`nsx_ma`, `nsx_ten`) VALUES
	(1, 'Hồng'),
	(2, 'Lan'),
	(3, 'Huệ'),
	(4, 'Cúc'),
	(5, 'Ly');
/*!40000 ALTER TABLE `nhasanxuat` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `sp_ma` int(11) NOT NULL AUTO_INCREMENT,
  `sp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sp_gia` decimal(12,2) DEFAULT NULL,
  `sp_giacu` decimal(12,2) DEFAULT NULL,
  `sp_mota_ngan` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sp_mota_chitiet` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_ngaycapnhat` datetime NOT NULL,
  `sp_soluong` int(11) DEFAULT NULL,
  `lsp_ma` int(11) NOT NULL,
  `nsx_ma` int(11) NOT NULL,
  `km_ma` int(11) DEFAULT NULL,
  PRIMARY KEY (`sp_ma`),
  KEY `sanpham_loaisanpham_idx` (`lsp_ma`),
  KEY `sanpham_nhasanxuat_idx` (`nsx_ma`),
  KEY `sanpham_khuyenmai_idx` (`km_ma`),
  CONSTRAINT `sanpham_khuyenmai` FOREIGN KEY (`km_ma`) REFERENCES `khuyenmai` (`km_ma`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `sanpham_loaisanpham` FOREIGN KEY (`lsp_ma`) REFERENCES `loaisanpham` (`lsp_ma`),
  CONSTRAINT `sanpham_nhasanxuat` FOREIGN KEY (`nsx_ma`) REFERENCES `nhasanxuat` (`nsx_ma`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.sanpham: ~7 rows (approximately)
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
REPLACE INTO `sanpham` (`sp_ma`, `sp_ten`, `sp_gia`, `sp_giacu`, `sp_mota_ngan`, `sp_mota_chitiet`, `sp_ngaycapnhat`, `sp_soluong`, `lsp_ma`, `nsx_ma`, `km_ma`) VALUES
	(7, 'Hoa Khai Trương', 250000.00, 280000.00, 'Khai Trương Hồng Phát', '', '2020-01-28 10:42:08', 4, 4, 2, 1),
	(12, 'Hoa Chia Buồn', 200000.00, 250000.00, 'Hoa Viếng Lễ Tang', '', '2021-02-19 00:00:00', 2, 1, 1, 1),
	(13, 'Bó Hoa Hồng Đỏ', 150000.00, 180000.00, 'Hoa tặng người yêu', '', '2021-02-27 00:00:00', 2, 2, 1, 1),
	(14, 'Hoa Tươi', 100000.00, 120000.00, 'Chậu hoa lan', '', '2021-02-27 00:00:00', 1, 4, 2, 1),
	(15, 'Hoa Cô Dâu', 150000.00, 180000.00, 'Hoa Cô Dâu Cầm tay', '', '2021-02-27 00:00:00', 2, 2, 1, 1),
	(16, 'Chậu Hoa Ly', 100000.00, 120000.00, 'Chậu hoa Ly hồng', '', '2021-02-27 00:00:00', 2, 4, 5, NULL),
	(17, 'Chậu Hoa Lan Vàng', 200000.00, 230000.00, 'Chậu Hoa Lan màu vàng', '', '0000-00-00 00:00:00', 2, 4, 2, 1);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;

-- Dumping structure for table shophoatuoi.sanpham_dondathang
CREATE TABLE IF NOT EXISTS `sanpham_dondathang` (
  `sp_ma` int(11) NOT NULL,
  `dh_ma` int(11) NOT NULL,
  `sp_dh_soluong` int(11) NOT NULL,
  `sp_dh_dongia` decimal(12,2) NOT NULL,
  PRIMARY KEY (`sp_ma`,`dh_ma`),
  KEY `sanpham_donhang_sanpham_idx` (`sp_ma`),
  KEY `sanpham_donhang_dondathang_idx` (`dh_ma`),
  CONSTRAINT `sanpham_donhang_dondathang` FOREIGN KEY (`dh_ma`) REFERENCES `dondathang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sanpham_donhang_sanpham` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table shophoatuoi.sanpham_dondathang: ~2 rows (approximately)
/*!40000 ALTER TABLE `sanpham_dondathang` DISABLE KEYS */;
REPLACE INTO `sanpham_dondathang` (`sp_ma`, `dh_ma`, `sp_dh_soluong`, `sp_dh_dongia`) VALUES
	(7, 7, 2, 7500000.00),
	(7, 8, 4, 7500000.00);
/*!40000 ALTER TABLE `sanpham_dondathang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
