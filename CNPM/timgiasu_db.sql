-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Nov 09, 2025 at 05:58 PM
-- Server version: 12.0.2-MariaDB-ubu2404
-- PHP Version: 8.3.26

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timgiasu_db`
--
CREATE DATABASE IF NOT EXISTS `timgiasu_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `timgiasu_db`;

-- --------------------------------------------------------

--
-- Table structure for table `CapHoc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 04:09 PM
--

DROP TABLE IF EXISTS `CapHoc`;
CREATE TABLE IF NOT EXISTS `CapHoc` (
  `MaCapHoc` int(11) NOT NULL AUTO_INCREMENT,
  `TenCapHoc` varchar(100) NOT NULL,
  PRIMARY KEY (`MaCapHoc`),
  UNIQUE KEY `TenCapHoc` (`TenCapHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `CapHoc`
--

TRUNCATE TABLE `CapHoc`;
--
-- Dumping data for table `CapHoc`
--

INSERT DELAYED IGNORE INTO `CapHoc` VALUES(1, 'Cấp 2');
INSERT DELAYED IGNORE INTO `CapHoc` VALUES(2, 'Cấp 3');
INSERT DELAYED IGNORE INTO `CapHoc` VALUES(3, 'Luyện thi Đại Học');

-- --------------------------------------------------------

--
-- Table structure for table `DanhGia`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:37 PM
--

DROP TABLE IF EXISTS `DanhGia`;
CREATE TABLE IF NOT EXISTS `DanhGia` (
  `MaDanhGia` int(11) NOT NULL AUTO_INCREMENT,
  `MaLopHoc` int(11) NOT NULL,
  `MaNguoiDanhGia` int(11) DEFAULT NULL,
  `MaNguoiBiDanhGia` int(11) DEFAULT NULL,
  `Diem` tinyint(4) NOT NULL,
  `NhanXet` text DEFAULT NULL,
  `ThoiGian` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaDanhGia`),
  UNIQUE KEY `MaLopHoc` (`MaLopHoc`),
  KEY `MaNguoiDanhGia` (`MaNguoiDanhGia`),
  KEY `MaNguoiBiDanhGia` (`MaNguoiBiDanhGia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `DanhGia`
--

TRUNCATE TABLE `DanhGia`;
--
-- Dumping data for table `DanhGia`
--

INSERT DELAYED IGNORE INTO `DanhGia` VALUES(1, 1, 4, 2, 5, 'a', '2025-11-09 16:37:24');
INSERT DELAYED IGNORE INTO `DanhGia` VALUES(4, 4, 4, 2, 5, 'hay', '2025-11-09 17:02:24');
INSERT DELAYED IGNORE INTO `DanhGia` VALUES(6, 5, 4, 2, 5, 'a', '2025-11-09 17:06:46');
INSERT DELAYED IGNORE INTO `DanhGia` VALUES(8, 6, 4, 2, 5, 'a', '2025-11-09 17:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `GiaoDich`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:37 PM
--

DROP TABLE IF EXISTS `GiaoDich`;
CREATE TABLE IF NOT EXISTS `GiaoDich` (
  `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT,
  `MaLopHoc` int(11) DEFAULT NULL,
  `MaNguoiTra` int(11) DEFAULT NULL,
  `MaNguoiNhan` int(11) DEFAULT NULL,
  `SoTien` decimal(10,2) NOT NULL,
  `PhuongThuc` varchar(50) DEFAULT NULL,
  `ThoiGianGiaoDich` timestamp NULL DEFAULT current_timestamp(),
  `TrangThai` enum('cho_xu_ly','thanh_cong','that_bai') NOT NULL,
  PRIMARY KEY (`MaGiaoDich`),
  KEY `MaLopHoc` (`MaLopHoc`),
  KEY `MaNguoiTra` (`MaNguoiTra`),
  KEY `MaNguoiNhan` (`MaNguoiNhan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `GiaoDich`
--

TRUNCATE TABLE `GiaoDich`;
--
-- Dumping data for table `GiaoDich`
--

INSERT DELAYED IGNORE INTO `GiaoDich` VALUES(1, 5, 4, 2, 150000.00, 'ChuyenKhoan', '2025-11-09 17:12:44', 'thanh_cong');
INSERT DELAYED IGNORE INTO `GiaoDich` VALUES(2, 4, 4, 2, 150000.00, 'ChuyenKhoan', '2025-11-09 17:12:47', 'thanh_cong');
INSERT DELAYED IGNORE INTO `GiaoDich` VALUES(3, 1, 4, 2, 150000.00, 'ChuyenKhoan', '2025-11-09 17:12:50', 'thanh_cong');
INSERT DELAYED IGNORE INTO `GiaoDich` VALUES(4, 1, 4, 2, 150000.00, 'ChuyenKhoan', '2025-11-09 17:12:50', 'thanh_cong');
INSERT DELAYED IGNORE INTO `GiaoDich` VALUES(5, 6, 4, 2, 150000.00, 'ViDienTu', '2025-11-09 17:37:39', 'thanh_cong');

-- --------------------------------------------------------

--
-- Table structure for table `GiaSu_KhuVuc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
--

DROP TABLE IF EXISTS `GiaSu_KhuVuc`;
CREATE TABLE IF NOT EXISTS `GiaSu_KhuVuc` (
  `MaGiaSu` int(11) NOT NULL,
  `MaQuanHuyen` int(11) NOT NULL,
  PRIMARY KEY (`MaGiaSu`,`MaQuanHuyen`),
  KEY `MaQuanHuyen` (`MaQuanHuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `GiaSu_KhuVuc`
--

TRUNCATE TABLE `GiaSu_KhuVuc`;
-- --------------------------------------------------------

--
-- Table structure for table `GiaSu_LichRanh`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:35 PM
--

DROP TABLE IF EXISTS `GiaSu_LichRanh`;
CREATE TABLE IF NOT EXISTS `GiaSu_LichRanh` (
  `MaLichRanh` int(11) NOT NULL AUTO_INCREMENT,
  `MaGiaSu` int(11) DEFAULT NULL,
  `NgayTrongTuan` tinyint(4) DEFAULT NULL,
  `GioBatDau` time DEFAULT NULL,
  `GioKetThuc` time DEFAULT NULL,
  PRIMARY KEY (`MaLichRanh`),
  KEY `MaGiaSu` (`MaGiaSu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `GiaSu_LichRanh`
--

TRUNCATE TABLE `GiaSu_LichRanh`;
--
-- Dumping data for table `GiaSu_LichRanh`
--

INSERT DELAYED IGNORE INTO `GiaSu_LichRanh` VALUES(1, 1, 2, '18:00:00', '21:00:00');
INSERT DELAYED IGNORE INTO `GiaSu_LichRanh` VALUES(2, 1, 4, '18:00:00', '21:00:00');
INSERT DELAYED IGNORE INTO `GiaSu_LichRanh` VALUES(3, 2, 0, '08:00:00', '17:00:00');
INSERT DELAYED IGNORE INTO `GiaSu_LichRanh` VALUES(4, 2, 6, '08:00:00', '17:00:00');
INSERT DELAYED IGNORE INTO `GiaSu_LichRanh` VALUES(5, 6, 1, '06:00:00', '09:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `GiaSu_MonHoc_CapHoc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:35 PM
--

DROP TABLE IF EXISTS `GiaSu_MonHoc_CapHoc`;
CREATE TABLE IF NOT EXISTS `GiaSu_MonHoc_CapHoc` (
  `MaGiaSu` int(11) NOT NULL,
  `MaMonHoc` int(11) NOT NULL,
  `MaCapHoc` int(11) NOT NULL,
  `HocPhi` decimal(10,2) NOT NULL,
  PRIMARY KEY (`MaGiaSu`,`MaMonHoc`,`MaCapHoc`),
  KEY `MaMonHoc` (`MaMonHoc`),
  KEY `MaCapHoc` (`MaCapHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `GiaSu_MonHoc_CapHoc`
--

TRUNCATE TABLE `GiaSu_MonHoc_CapHoc`;
--
-- Dumping data for table `GiaSu_MonHoc_CapHoc`
--

INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(1, 1, 2, 150000.00);
INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(1, 1, 3, 200000.00);
INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(1, 2, 2, 150000.00);
INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(2, 4, 1, 120000.00);
INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(2, 5, 1, 120000.00);
INSERT DELAYED IGNORE INTO `GiaSu_MonHoc_CapHoc` VALUES(6, 3, 2, 1000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `HoSoGiaSu`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:35 PM
--

DROP TABLE IF EXISTS `HoSoGiaSu`;
CREATE TABLE IF NOT EXISTS `HoSoGiaSu` (
  `MaGiaSu` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) NOT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `AnhDaiDien` varchar(255) DEFAULT NULL,
  `GioiThieu` text DEFAULT NULL,
  `TrinhDo` varchar(100) DEFAULT NULL,
  `DaDuyet` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`MaGiaSu`),
  UNIQUE KEY `MaTaiKhoan` (`MaTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `HoSoGiaSu`
--

TRUNCATE TABLE `HoSoGiaSu`;
--
-- Dumping data for table `HoSoGiaSu`
--

INSERT DELAYED IGNORE INTO `HoSoGiaSu` VALUES(1, 2, 'Nguyễn Văn A', '0987654321', 'Cầu Giấy, Hà Nội', NULL, '5 năm kinh nghiệm dạy Toán, Lý. Đã tốt nghiệp ĐH Sư Phạm.', 'Cử nhân Sư Phạm Toán', 1);
INSERT DELAYED IGNORE INTO `HoSoGiaSu` VALUES(2, 3, 'Trần Thị B', '0911223344', 'TP. Thái Nguyên', NULL, 'Sinh viên năm 4 ĐH KHTN, chuyên ngành Tiếng Anh.', 'Sinh viên năm 4', 1);
INSERT DELAYED IGNORE INTO `HoSoGiaSu` VALUES(5, 15, 'Gia Sư A', '123', 'Bắc Giang', NULL, 'Giỏi', 'Đại Học', 0);
INSERT DELAYED IGNORE INTO `HoSoGiaSu` VALUES(6, 16, 'Gia Sư B', '1235', 'Bắc Giang', NULL, 'tốt', 'THPT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `HoSoHocVien`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 04:48 PM
--

DROP TABLE IF EXISTS `HoSoHocVien`;
CREATE TABLE IF NOT EXISTS `HoSoHocVien` (
  `MaHocVien` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) NOT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `AnhDaiDien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaHocVien`),
  UNIQUE KEY `MaTaiKhoan` (`MaTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `HoSoHocVien`
--

TRUNCATE TABLE `HoSoHocVien`;
--
-- Dumping data for table `HoSoHocVien`
--

INSERT DELAYED IGNORE INTO `HoSoHocVien` VALUES(1, 4, 'Lý Văn Cường', '0382283914', 'Thái Nguyên', NULL);
INSERT DELAYED IGNORE INTO `HoSoHocVien` VALUES(2, 5, 'Lê Thị D', '0912345678', 'Hà Nội', NULL);
INSERT DELAYED IGNORE INTO `HoSoHocVien` VALUES(3, 6, 'Lý Văn Cường', '0382283914', 'Kiên Lao', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `KhuVuc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 04:09 PM
--

DROP TABLE IF EXISTS `KhuVuc`;
CREATE TABLE IF NOT EXISTS `KhuVuc` (
  `MaKhuVuc` int(11) NOT NULL AUTO_INCREMENT,
  `TenKhuVuc` varchar(100) NOT NULL,
  PRIMARY KEY (`MaKhuVuc`),
  UNIQUE KEY `TenKhuVuc` (`TenKhuVuc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `KhuVuc`
--

TRUNCATE TABLE `KhuVuc`;
--
-- Dumping data for table `KhuVuc`
--

INSERT DELAYED IGNORE INTO `KhuVuc` VALUES(2, 'Hà Nội');
INSERT DELAYED IGNORE INTO `KhuVuc` VALUES(1, 'Thái Nguyên');

-- --------------------------------------------------------

--
-- Table structure for table `LopHoc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:37 PM
--

DROP TABLE IF EXISTS `LopHoc`;
CREATE TABLE IF NOT EXISTS `LopHoc` (
  `MaLopHoc` int(11) NOT NULL AUTO_INCREMENT,
  `MaHocVien` int(11) DEFAULT NULL,
  `MaGiaSu` int(11) DEFAULT NULL,
  `MaMonHoc` int(11) DEFAULT NULL,
  `MaCapHoc` int(11) DEFAULT NULL,
  `NgayHoc` date DEFAULT NULL,
  `GioBatDau` time DEFAULT NULL,
  `GioKetThuc` time DEFAULT NULL,
  `HinhThuc` enum('online','offline') NOT NULL,
  `DiaDiem` varchar(255) DEFAULT NULL,
  `TrangThai` enum('cho_xac_nhan','da_xac_nhan','hoan_thanh','da_huy') NOT NULL,
  `GhiChuHocVien` text DEFAULT NULL,
  PRIMARY KEY (`MaLopHoc`),
  KEY `MaHocVien` (`MaHocVien`),
  KEY `MaGiaSu` (`MaGiaSu`),
  KEY `MaMonHoc` (`MaMonHoc`),
  KEY `MaCapHoc` (`MaCapHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `LopHoc`
--

TRUNCATE TABLE `LopHoc`;
--
-- Dumping data for table `LopHoc`
--

INSERT DELAYED IGNORE INTO `LopHoc` VALUES(1, 1, 1, 1, 2, '2025-11-10', '18:00:00', '19:30:00', 'offline', 'Nhà học viên', 'hoan_thanh', NULL);
INSERT DELAYED IGNORE INTO `LopHoc` VALUES(2, 1, 2, 4, 1, '2025-11-12', '17:00:00', '18:30:00', 'online', '', 'da_huy', NULL);
INSERT DELAYED IGNORE INTO `LopHoc` VALUES(3, 2, 1, 1, 2, '2025-11-15', '19:00:00', '20:30:00', 'offline', 'Nhà gia sư', 'hoan_thanh', NULL);
INSERT DELAYED IGNORE INTO `LopHoc` VALUES(4, 1, 1, 1, 2, '2025-11-06', '12:32:00', '12:30:00', 'offline', NULL, 'hoan_thanh', NULL);
INSERT DELAYED IGNORE INTO `LopHoc` VALUES(5, 1, 1, 1, 2, '2025-11-05', '04:09:00', '04:30:00', 'offline', NULL, 'hoan_thanh', NULL);
INSERT DELAYED IGNORE INTO `LopHoc` VALUES(6, 1, 1, 1, 2, '2025-11-05', '06:59:00', '06:30:00', 'offline', NULL, 'hoan_thanh', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MonHoc`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 04:09 PM
--

DROP TABLE IF EXISTS `MonHoc`;
CREATE TABLE IF NOT EXISTS `MonHoc` (
  `MaMonHoc` int(11) NOT NULL AUTO_INCREMENT,
  `TenMonHoc` varchar(100) NOT NULL,
  PRIMARY KEY (`MaMonHoc`),
  UNIQUE KEY `TenMonHoc` (`TenMonHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `MonHoc`
--

TRUNCATE TABLE `MonHoc`;
--
-- Dumping data for table `MonHoc`
--

INSERT DELAYED IGNORE INTO `MonHoc` VALUES(3, 'Hóa Học');
INSERT DELAYED IGNORE INTO `MonHoc` VALUES(5, 'Ngữ Văn');
INSERT DELAYED IGNORE INTO `MonHoc` VALUES(4, 'Tiếng Anh');
INSERT DELAYED IGNORE INTO `MonHoc` VALUES(1, 'Toán');
INSERT DELAYED IGNORE INTO `MonHoc` VALUES(2, 'Vật Lý');

-- --------------------------------------------------------

--
-- Table structure for table `PhanQuyen`
--
-- Creation: Nov 09, 2025 at 02:15 PM
--

DROP TABLE IF EXISTS `PhanQuyen`;
CREATE TABLE IF NOT EXISTS `PhanQuyen` (
  `MaPhanQuyen` int(11) NOT NULL AUTO_INCREMENT,
  `TenQuyen` varchar(50) NOT NULL,
  PRIMARY KEY (`MaPhanQuyen`),
  UNIQUE KEY `TenQuyen` (`TenQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `PhanQuyen`
--

TRUNCATE TABLE `PhanQuyen`;
--
-- Dumping data for table `PhanQuyen`
--

INSERT DELAYED IGNORE INTO `PhanQuyen` VALUES(1, 'Admin');
INSERT DELAYED IGNORE INTO `PhanQuyen` VALUES(2, 'GiaSu');
INSERT DELAYED IGNORE INTO `PhanQuyen` VALUES(3, 'HocVien');

-- --------------------------------------------------------

--
-- Table structure for table `QuanHuyen`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 04:09 PM
--

DROP TABLE IF EXISTS `QuanHuyen`;
CREATE TABLE IF NOT EXISTS `QuanHuyen` (
  `MaQuanHuyen` int(11) NOT NULL AUTO_INCREMENT,
  `TenQuanHuyen` varchar(100) NOT NULL,
  `MaKhuVuc` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaQuanHuyen`),
  KEY `MaKhuVuc` (`MaKhuVuc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `QuanHuyen`
--

TRUNCATE TABLE `QuanHuyen`;
--
-- Dumping data for table `QuanHuyen`
--

INSERT DELAYED IGNORE INTO `QuanHuyen` VALUES(1, 'TP. Thái Nguyên', 1);
INSERT DELAYED IGNORE INTO `QuanHuyen` VALUES(2, 'TP. Sông Công', 1);
INSERT DELAYED IGNORE INTO `QuanHuyen` VALUES(3, 'Quận Cầu Giấy', 2);
INSERT DELAYED IGNORE INTO `QuanHuyen` VALUES(4, 'Quận Ba Đình', 2);

-- --------------------------------------------------------

--
-- Table structure for table `TaiKhoan`
--
-- Creation: Nov 09, 2025 at 02:15 PM
-- Last update: Nov 09, 2025 at 05:34 PM
--

DROP TABLE IF EXISTS `TaiKhoan`;
CREATE TABLE IF NOT EXISTS `TaiKhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `MaPhanQuyen` int(11) DEFAULT NULL,
  `TrangThai` tinyint(4) DEFAULT 1,
  `NgayTao` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaTaiKhoan`),
  UNIQUE KEY `Email` (`Email`),
  KEY `MaPhanQuyen` (`MaPhanQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `TaiKhoan`
--

TRUNCATE TABLE `TaiKhoan`;
--
-- Dumping data for table `TaiKhoan`
--

INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(1, 'admin@gmail.com', 'admin', 1, 1, '2025-11-09 16:09:09');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(2, 'giasu1@gmail.com', '123', 2, 1, '2025-11-09 16:09:09');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(3, 'giasu2@gmail.com', '123', 2, 1, '2025-11-09 16:09:09');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(4, 'cuong@gmail.com', '123', 3, 1, '2025-11-09 16:09:09');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(5, 'hocvien2@gmail.com', '123', 3, 1, '2025-11-09 16:09:09');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(6, 'cuong1@gmail.com', '123', 3, 1, '2025-11-09 16:11:07');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(7, 'giasu_bachkhoa@gmail.com', '123', 2, 1, '2025-11-09 16:34:54');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(8, 'giasu_ielts@gmail.com', '123', 2, 1, '2025-11-09 16:34:54');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(9, 'hocvien_an@gmail.com', '123', 3, 1, '2025-11-09 16:34:54');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(10, 'hocvien_binh@gmail.com', '123', 3, 1, '2025-11-09 16:34:54');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(15, 'giasua@gmail.com', '123', 2, 1, '2025-11-09 17:26:58');
INSERT DELAYED IGNORE INTO `TaiKhoan` VALUES(16, 'giasub@gmail.com', '123', 2, 1, '2025-11-09 17:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `TinNhan`
--
-- Creation: Nov 09, 2025 at 02:15 PM
--

DROP TABLE IF EXISTS `TinNhan`;
CREATE TABLE IF NOT EXISTS `TinNhan` (
  `MaTinNhan` bigint(20) NOT NULL AUTO_INCREMENT,
  `MaNguoiGui` int(11) DEFAULT NULL,
  `MaNguoiNhan` int(11) DEFAULT NULL,
  `NoiDung` text NOT NULL,
  `ThoiGianGui` timestamp NULL DEFAULT current_timestamp(),
  `DaDoc` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`MaTinNhan`),
  KEY `MaNguoiGui` (`MaNguoiGui`),
  KEY `MaNguoiNhan` (`MaNguoiNhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `TinNhan`
--

TRUNCATE TABLE `TinNhan`;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `DanhGia`
--
ALTER TABLE `DanhGia`
  ADD CONSTRAINT `DanhGia_ibfk_1` FOREIGN KEY (`MaLopHoc`) REFERENCES `LopHoc` (`MaLopHoc`),
  ADD CONSTRAINT `DanhGia_ibfk_2` FOREIGN KEY (`MaNguoiDanhGia`) REFERENCES `TaiKhoan` (`MaTaiKhoan`),
  ADD CONSTRAINT `DanhGia_ibfk_3` FOREIGN KEY (`MaNguoiBiDanhGia`) REFERENCES `TaiKhoan` (`MaTaiKhoan`);

--
-- Constraints for table `GiaoDich`
--
ALTER TABLE `GiaoDich`
  ADD CONSTRAINT `GiaoDich_ibfk_1` FOREIGN KEY (`MaLopHoc`) REFERENCES `LopHoc` (`MaLopHoc`),
  ADD CONSTRAINT `GiaoDich_ibfk_2` FOREIGN KEY (`MaNguoiTra`) REFERENCES `TaiKhoan` (`MaTaiKhoan`),
  ADD CONSTRAINT `GiaoDich_ibfk_3` FOREIGN KEY (`MaNguoiNhan`) REFERENCES `TaiKhoan` (`MaTaiKhoan`);

--
-- Constraints for table `GiaSu_KhuVuc`
--
ALTER TABLE `GiaSu_KhuVuc`
  ADD CONSTRAINT `GiaSu_KhuVuc_ibfk_1` FOREIGN KEY (`MaGiaSu`) REFERENCES `HoSoGiaSu` (`MaGiaSu`),
  ADD CONSTRAINT `GiaSu_KhuVuc_ibfk_2` FOREIGN KEY (`MaQuanHuyen`) REFERENCES `QuanHuyen` (`MaQuanHuyen`);

--
-- Constraints for table `GiaSu_LichRanh`
--
ALTER TABLE `GiaSu_LichRanh`
  ADD CONSTRAINT `GiaSu_LichRanh_ibfk_1` FOREIGN KEY (`MaGiaSu`) REFERENCES `HoSoGiaSu` (`MaGiaSu`);

--
-- Constraints for table `GiaSu_MonHoc_CapHoc`
--
ALTER TABLE `GiaSu_MonHoc_CapHoc`
  ADD CONSTRAINT `GiaSu_MonHoc_CapHoc_ibfk_1` FOREIGN KEY (`MaGiaSu`) REFERENCES `HoSoGiaSu` (`MaGiaSu`),
  ADD CONSTRAINT `GiaSu_MonHoc_CapHoc_ibfk_2` FOREIGN KEY (`MaMonHoc`) REFERENCES `MonHoc` (`MaMonHoc`),
  ADD CONSTRAINT `GiaSu_MonHoc_CapHoc_ibfk_3` FOREIGN KEY (`MaCapHoc`) REFERENCES `CapHoc` (`MaCapHoc`);

--
-- Constraints for table `HoSoGiaSu`
--
ALTER TABLE `HoSoGiaSu`
  ADD CONSTRAINT `HoSoGiaSu_ibfk_1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `TaiKhoan` (`MaTaiKhoan`);

--
-- Constraints for table `HoSoHocVien`
--
ALTER TABLE `HoSoHocVien`
  ADD CONSTRAINT `HoSoHocVien_ibfk_1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `TaiKhoan` (`MaTaiKhoan`);

--
-- Constraints for table `LopHoc`
--
ALTER TABLE `LopHoc`
  ADD CONSTRAINT `LopHoc_ibfk_1` FOREIGN KEY (`MaHocVien`) REFERENCES `HoSoHocVien` (`MaHocVien`),
  ADD CONSTRAINT `LopHoc_ibfk_2` FOREIGN KEY (`MaGiaSu`) REFERENCES `HoSoGiaSu` (`MaGiaSu`),
  ADD CONSTRAINT `LopHoc_ibfk_3` FOREIGN KEY (`MaMonHoc`) REFERENCES `MonHoc` (`MaMonHoc`),
  ADD CONSTRAINT `LopHoc_ibfk_4` FOREIGN KEY (`MaCapHoc`) REFERENCES `CapHoc` (`MaCapHoc`);

--
-- Constraints for table `QuanHuyen`
--
ALTER TABLE `QuanHuyen`
  ADD CONSTRAINT `QuanHuyen_ibfk_1` FOREIGN KEY (`MaKhuVuc`) REFERENCES `KhuVuc` (`MaKhuVuc`);

--
-- Constraints for table `TaiKhoan`
--
ALTER TABLE `TaiKhoan`
  ADD CONSTRAINT `TaiKhoan_ibfk_1` FOREIGN KEY (`MaPhanQuyen`) REFERENCES `PhanQuyen` (`MaPhanQuyen`);

--
-- Constraints for table `TinNhan`
--
ALTER TABLE `TinNhan`
  ADD CONSTRAINT `TinNhan_ibfk_1` FOREIGN KEY (`MaNguoiGui`) REFERENCES `TaiKhoan` (`MaTaiKhoan`),
  ADD CONSTRAINT `TinNhan_ibfk_2` FOREIGN KEY (`MaNguoiNhan`) REFERENCES `TaiKhoan` (`MaTaiKhoan`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
