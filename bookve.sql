-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 04, 2021 lúc 04:57 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookve`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `idBook` int(250) NOT NULL,
  `idTravel` int(11) NOT NULL,
  `LastName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameUser` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TypeBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberSeat` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int(250) NOT NULL,
  `PlaceStart` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PlaceFinish` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateBooking` date NOT NULL,
  `TypeTravel` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`idBook`, `idTravel`, `LastName`, `nameUser`, `Phone`, `Email`, `TypeBus`, `NumberBus`, `NumberSeat`, `Price`, `PlaceStart`, `PlaceFinish`, `DateBooking`, `TypeTravel`) VALUES
(10, 1, 'Trần Nguyễn Tấn', 'Phát', '0123456789', 'phat@gmail.com', 'Normal', '01', 'F02', 500000, 'TP.Hồ Chí Minh', 'Hà Nội', '2020-08-13', 'Round-trip');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bus`
--

CREATE TABLE `bus` (
  `idBus` int(250) NOT NULL,
  `TypeBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bus`
--

INSERT INTO `bus` (`idBus`, `TypeBus`, `NumberBus`) VALUES
(1, 'Normal', '01'),
(2, 'Small', '02'),
(3, 'Normal', '03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `infotravel`
--

CREATE TABLE `infotravel` (
  `idInfo` int(250) NOT NULL,
  `TypeBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberBus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalSeats` int(250) NOT NULL,
  `ResidualSeats` int(250) NOT NULL,
  `PriceFront` int(250) NOT NULL,
  `PriceMiddle` int(250) NOT NULL,
  `PriceLast` int(250) NOT NULL,
  `PlaceStart` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StationStart` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PlaceFinish` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StationFinish` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Time` date NOT NULL,
  `TimeOut` date DEFAULT NULL,
  `TypeTravel` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `infotravel`
--

INSERT INTO `infotravel` (`idInfo`, `TypeBus`, `NumberBus`, `TotalSeats`, `ResidualSeats`, `PriceFront`, `PriceMiddle`, `PriceLast`, `PlaceStart`, `StationStart`, `PlaceFinish`, `StationFinish`, `Time`, `TimeOut`, `TypeTravel`, `Status`) VALUES
(1, 'Normal', '01', 45, 44, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hà Nội', 'Bến xe Mỹ Đình', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(2, 'Normal', '02', 45, 45, 250000, 125000, 25000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hà Nội', 'Bến xe Mỹ Đình', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(3, 'Normal', '03', 45, 45, 500000, 300000, 150000, 'Hà Nội', 'Bến xe Mỹ Đình', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(4, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hà Nội', 'Bến xe Mỹ Đình', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(5, 'Royal', '01', 12, 12, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hà Nội', 'Bến xe Mỹ Đình', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(6, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Lạt', 'Bến Xe Thành Bưởi', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(7, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Lạt', 'Bến Xe Thành Bưởi', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(8, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Lạt', 'Bến Xe Thành Bưởi', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(9, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'Hà Nội', 'Bến xe Mỹ Đình', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(10, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'Hà Nội', 'Bến xe Mỹ Đình', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(11, 'Royal', '01', 12, 12, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Lạt', 'Bến Xe Thành Bưởi', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(12, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'Đà Lạt', 'Bến Xe Thành Bưởi', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(13, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(14, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(15, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(16, 'Royal', '01', 12, 12, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(17, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(18, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(19, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(20, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(21, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hội An', 'Bến xe Hội An Nguyễn Tất Thành (Quảng Nam)', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(22, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hội An', 'Bến xe Hội An Nguyễn Tất Thành (Quảng Nam)', '2020-08-27', NULL, 'One-way-trip', 'wait'),
(23, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hội An', 'Bến xe Hội An Nguyễn Tất Thành (Quảng Nam)', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(24, 'Royal', '01', 12, 12, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Hội An', 'Bến xe Hội An Nguyễn Tất Thành (Quảng Nam)', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(25, 'Limousine', '01', 18, 18, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(26, 'Royal', '01', 12, 12, 500000, 250000, 50000, 'TP.Hồ Chí Minh', 'Bến xe miền Đông', 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(27, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', '2020-08-27', 'Round-trip', 'wait'),
(28, 'Normal', '01', 45, 45, 500000, 250000, 50000, 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu', 'TP.Hồ Chí Minh', 'Bến xe miền Đông', '2020-08-27', NULL, 'One-way-trip', 'wait');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `places`
--

CREATE TABLE `places` (
  `idPlaces` int(250) NOT NULL,
  `PlaceName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Station` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `places`
--

INSERT INTO `places` (`idPlaces`, `PlaceName`, `Station`) VALUES
(1, 'TP.Hồ Chí Minh', 'Bến xe miền Đông'),
(2, 'Hà Nội', 'Bến xe Mỹ Đình'),
(3, 'Đà Lạt', 'Bến Xe Thành Bưởi'),
(4, 'Đà Nẵng', 'Bến Xe Trung Tâm Đà Nẵng'),
(5, 'Vũng Tàu', 'Bến Xe Khách Vũng Tàu'),
(6, 'Hội An', 'Bến xe Hội An Nguyễn Tất Thành (Quảng Nam)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idUser` int(250) NOT NULL,
  `LastName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Area` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Role` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idUser`, `LastName`, `Name`, `Phone`, `Email`, `Password`, `Area`, `Role`) VALUES
(1, 'nguyen', 'admin', '123456', 'admin@gmail.com', '$2a$12$iK9xSxZmCC0lOW.KuC56vO/ppzQ3Mk9SGm7OliR4aB/qYSS2cOhj6', 'HCM', 'admin'),
(2, 'Leha', 'nguyen', '123456', 'nguyenleh1999@gmail.com', '$2a$12$gNnY2Zo5mkVk6LsQZGmy2O8TJt7KBh./MaJLPP.kNFWfhUi8rDEB6', 'HCM', 'Customer'),
(4, 'seller', 'nguyen', '123456', 'seller@gmail.com', '$2a$12$CGhbmBbIvrVZCiIK3jkNuO4GLytgVNPKiySEu7CgIhmiVGMhxWLTa', 'HCM', 'TicketSeller'),
(5, 'Trần Nguyễn Tấn', 'Phát', '0123456789', 'phat@gmail.com', '$2a$12$ZlFo288Db5cBgZ8U/i8eVuf6xVdhVjWhvKCvd2fk87uc/eHcn4naW', 'HCM', 'Customer');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`idBook`);

--
-- Chỉ mục cho bảng `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`idBus`);

--
-- Chỉ mục cho bảng `infotravel`
--
ALTER TABLE `infotravel`
  ADD PRIMARY KEY (`idInfo`);

--
-- Chỉ mục cho bảng `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`idPlaces`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `idBook` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `bus`
--
ALTER TABLE `bus`
  MODIFY `idBus` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `infotravel`
--
ALTER TABLE `infotravel`
  MODIFY `idInfo` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `places`
--
ALTER TABLE `places`
  MODIFY `idPlaces` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
