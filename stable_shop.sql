-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 21, 2023 lúc 01:08 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `stable_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) NOT NULL,
  `brandname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `brandname`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', '<p>Adidas</p>', 1, '2023-03-20 13:14:15', '2023-03-20 13:14:15'),
(2, 'Nike', '<p>Nike</p>', 1, '2023-03-21 16:34:05', '2023-03-21 16:34:05'),
(3, 'MLB', '<p>MLB</p>', 1, '2023-03-21 16:34:10', '2023-03-21 16:34:10'),
(4, 'PUMA', '<p>PUMA</p>', 1, '2023-03-21 16:34:16', '2023-03-21 16:34:16'),
(5, 'Uniqlo', '<p>Uniqlo</p>', 1, '2023-03-21 16:34:21', '2023-03-21 16:34:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-03-21 16:47:09', '2023-03-21 16:47:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_detail_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` tinyint(4) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `categoryname`, `parent_id`, `description`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Man', 0, '<p>Man clothes</p>', 'man', 1, '2023-03-20 13:16:04', '2023-03-20 13:16:04'),
(2, 'Man Shorts', 1, '<p>Man Shorts</p>', 'man-shorts', 1, '2023-03-20 13:16:18', '2023-03-20 13:16:18'),
(3, 'Man T-Shirts', 1, '<p>Man T-Shirts</p>', 'man-t-shirts', 1, '2023-03-21 16:34:58', '2023-03-21 16:34:58'),
(4, 'Man Hoodie', 1, '<p>Man Hoodie</p>', 'man-hoodie', 1, '2023-03-21 16:35:18', '2023-03-21 16:35:59'),
(5, 'Man Sweater', 1, '<p>Man Sweater</p>', 'man-sweater', 1, '2023-03-21 16:35:39', '2023-03-21 16:36:04'),
(6, 'Women', 0, '<p>Women</p>', 'women', 1, '2023-03-21 16:36:14', '2023-03-21 16:36:42'),
(7, 'Kids', 0, '<p>Kids</p>', 'kids', 1, '2023-03-21 16:36:25', '2023-03-21 16:36:25'),
(8, 'Women Hoodie', 6, '<p>Women Hoodie</p>', 'women-hoodie', 1, '2023-03-21 16:36:54', '2023-03-21 16:36:54'),
(9, 'Women Jackets', 6, '<p>Women Jackets</p>', 'women-jackets', 1, '2023-03-21 16:37:05', '2023-03-21 16:38:04'),
(10, 'Kids Sweatshirt', 7, '<p>Kids Sweatshirt</p>', 'kids-sweatshirt', 1, '2023-03-21 16:37:28', '2023-03-21 16:37:28'),
(11, 'Kids T-Shirts', 7, '<p>Kids T-Shirts</p>', 'kids-t-shirts', 1, '2023-03-21 16:37:39', '2023-03-21 16:38:10'),
(12, 'Dress', 6, '<p>Dress</p>', 'dress', 1, '2023-03-21 17:24:29', '2023-03-21 17:24:29'),
(13, 'Man Blazer', 1, '<p>Man Blazer</p>', 'man-blazer', 1, '2023-03-21 17:27:02', '2023-03-21 17:27:02'),
(14, 'Kids Jacket', 7, '<p>Kids Jacket</p>', 'kids-jacket', 1, '2023-03-21 17:30:20', '2023-03-21 17:30:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phonenumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` float NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_fullname`, `user_email`, `user_phonenumber`, `user_country`, `user_address`, `user_postcode`, `status`, `discount`, `message`, `payment`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 2, 'Xuan Sang', 'xuansang332@gmail.com', '214124124', 'Vietnam', 'Vu ban, Nam Dinh', '07000', 4, 0, NULL, 'vnpay', 70, '2023-03-21 16:47:59', '2023-03-21 16:50:56'),
(2, 2, 'Xuan Sang', 'xuansang332@gmail.com', '214124124', 'Vietnam', 'Vu ban, Nam Dinh', '07000', 4, 0, NULL, 'vnpay', 70, '2023-03-21 16:48:06', '2023-03-21 16:50:56'),
(3, 2, 'Xuan Sang', 'xuansang332@gmail.com', '214124124', 'Vietnam', 'Thanh Loi, Nam Dinh', '07000', 4, 0, NULL, 'vnpay', 70, '2023-03-21 16:48:31', '2023-03-21 16:50:55'),
(4, 2, 'Xuan Sang', 'xuansang332@gmail.com', '214124124', 'Vietnam', 'Thanh Loi, Nam Dinh', '07000', 4, 0, NULL, 'paypal', 70, '2023-03-21 16:48:59', '2023-03-21 16:50:55'),
(5, 2, 'Xuan Sang', 'xuansang332@gmail.com', '214124124', 'Vietnam', 'Thanh Loi, Nam Dinh', '07000', 2, 0, NULL, 'cod', 70, '2023-03-21 16:49:18', '2023-03-21 16:51:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_detail_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `amount` float NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_detail_id`, `quantity`, `unit_price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 5, 15, 2, 35, 70, '2023-03-21 16:49:18', '2023-03-21 16:49:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `productname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `price_sale` float DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `view_count` int(11) DEFAULT NULL,
  `trending` tinyint(4) NOT NULL DEFAULT 0,
  `newarrival` tinyint(4) NOT NULL DEFAULT 0,
  `image_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `productname`, `price`, `price_sale`, `sku`, `featured`, `slug`, `quantity`, `description`, `created_by`, `view_count`, `trending`, `newarrival`, `image_1`, `image_2`, `sold`, `created_at`, `updated_at`) VALUES
(5, 3, 1, 'Adicolor Classics Trefoil Tee', 40, 35, 'HK5227', 1, 'adicolor-classics-trefoil-tee', 357, '<p>Adicolor Classics Trefoil Tee</p>', 1, 7, 1, 1, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', 2, '2023-03-21 16:39:58', '2023-03-21 16:51:07'),
(6, 8, 1, 'Adidas Adicolor Trefoil Hoodie', 66, 55, 'DLA123', 1, 'adidas-adicolor-trefoil-hoodie', 82, '<p>Adidas Adicolor Trefoil Hoodie</p>', 1, 0, 1, 1, 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-e67b59780db7531882ccd97c02e5f191.jpg', 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-6722875195654bc6a99c403abae747ae.jpg', 0, '2023-03-21 16:52:07', '2023-03-21 16:53:48'),
(7, 8, 1, 'Hoodie Classics Adicolor', 86, 65, 'HC4550', 0, 'hoodie-classics-adicolor', 60, '<p>Hoodie Classics Adicolor</p>', 1, 0, 0, 0, 'storage/uploads/product/hoodie-classics-adicolor-a647fd7377b68e7978de604fe6347fa0.jpg', 'storage/uploads/product/hoodie-classics-adicolor-2c9c451043aff2b1df1fafc14fde8ec6.jpg', 0, '2023-03-21 16:56:51', '2023-03-21 16:57:31'),
(8, 3, 4, 'Essentials Men\'s Logo Tee', 34, 41, 'PUM343', 1, 'essentials-mens-logo-tee', 147, '<p>Essentials Men\'s Logo Tee</p>', 1, 0, 0, 0, 'storage/uploads/product/essentials-mens-logo-tee-59bde59825b7d15462c82a9ef299d761.jpg', 'storage/uploads/product/essentials-mens-logo-tee-8b97b8518dba87e5b8f14f1582936817.jpg', 0, '2023-03-21 16:58:51', '2023-03-21 17:00:33'),
(9, 10, 1, 'Adidas x Classic LEGO® Crewneck', 35, 28, 'HS1165', 1, 'adidas-x-classic-lego-crewneck', 60, '<p>Adidas x Classic LEGO® Crewneck</p>', 1, 0, 1, 1, 'storage/uploads/product/adidas-x-classic-lego-crewneck-aa0a8115e70e227b36c91d8701db41e9.jpg', 'storage/uploads/product/adidas-x-classic-lego-crewneck-978cd96b26ad6b6a44b57b14cdebe9a3.jpg', 0, '2023-03-21 17:01:43', '2023-03-21 17:04:26'),
(10, 9, 2, 'Fast Running Jacket', 200, 185, 'HL1995', 1, 'fast-running-jacket', 60, '<p>Fast Running Jacket</p>', 1, 0, 1, 1, 'storage/uploads/product/fast-running-jacket-925a71372b0c68f7c119764d9dfb6e0c.jpg', 'storage/uploads/product/fast-running-jacket-cc0cd8142f21e82c596a1a7a7edcb0db.jpg', 0, '2023-03-21 17:05:50', '2023-03-21 17:06:40'),
(11, 11, 4, 'PUMA x POKÉMON Big Kids Tee', 45, 40, 'PUMA412', 1, 'puma-x-pokemon-big-kids-tee', 40, '<p>PUMA x POKÉMON Big Kids Tee</p>', 1, 0, 0, 1, 'storage/uploads/product/puma-x-pokemon-big-kids-tee-b8d13948dacf62416d03217efc342e69.jpg', 'storage/uploads/product/puma-x-pokemon-big-kids-tee-d4985897c05430161a2d9069524513b4.jpg', 0, '2023-03-21 17:08:42', '2023-03-21 17:09:19'),
(12, 2, 1, 'Train Icons Training Shorts', 0, 32, 'HD3556', 0, 'train-icons-training-shorts', 55, '<p>Train Icons Training Shorts</p>', 1, 4, 1, 1, 'storage/uploads/product/train-icons-training-shorts-a2f479c1f4b55e8e374ede7367c7398e.jpg', 'storage/uploads/product/train-icons-training-shorts-6de3c70b7bb34551171a9f099ba06101.jpg', 0, '2023-03-21 17:10:32', '2023-03-21 17:15:13'),
(13, 2, 1, 'Training Short', 40, 29, 'SH42422', 1, 'training-short', 43, '<p>Training Short</p>', 1, 0, 0, 1, 'storage/uploads/product/training-short-8536862f238329582c0be596c0805897.jpg', 'storage/uploads/product/training-short-04c22e5327c2048c7e30a34ce6b4e1bb.jpg', 0, '2023-03-21 17:14:17', '2023-03-21 17:14:53'),
(14, 4, 5, 'Sweat Pullover Hoodie', 100, 89, 'UNI232', 1, 'sweat-pullover-hoodie', 143, '<p>Sweat Pullover Hoodie</p>', 1, 0, 1, 0, 'storage/uploads/product/sweat-pullover-hoodie-324049a4a27017d33afd76ae12ceb33c.jpg', 'storage/uploads/product/sweat-pullover-hoodie-ef0262b0a9b988bf7148221b41b75a90.jpg', 0, '2023-03-21 17:18:11', '2023-03-21 17:23:05'),
(15, 12, 5, 'Printed V-Neck Long-Sleeve Mini Dress', 120, 105, 'UNI3443', 1, 'printed-v-neck-long-sleeve-mini-dress', 65, '<p>Printed V-Neck Long-Sleeve Mini Dress</p>', 1, 10, 1, 1, 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-3b87fab073de5fa198242bba36e3598c.jpg', 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-f42c5842edc0c419723318fa15771422.jpg', 0, '2023-03-21 17:24:16', '2023-03-21 19:03:49'),
(16, 13, 5, 'Comfort Jacket (Wool Like)', 300, 249, 'UNI980', 1, 'comfort-jacket-wool-like', 57, '<p>Comfort Jacket (Wool Like)</p>', 1, 3, 0, 1, 'storage/uploads/product/comfort-jacket-wool-like-f58cddd81d9eac5da76599d488026a45.jpg', 'storage/uploads/product/comfort-jacket-wool-like-5ba57a9cc03ac8899863a74260e3e2c9.jpg', 0, '2023-03-21 17:27:41', '2023-03-21 17:29:18'),
(17, 14, 5, 'Warm Padded Washable Quilted', 80, 75, 'UNI543', 1, 'warm-padded-washable-quilted', 85, '<p>Warm Padded Washable Quilted</p>', 1, 1, 1, 1, 'storage/uploads/product/warm-padded-washable-quilted-e3122f1efb70a6152f45a91c3bea6b55.jpg', 'storage/uploads/product/warm-padded-washable-quilted-b8474f6801e84003ded1d60e15b93e12.jpg', 0, '2023-03-21 17:30:04', '2023-03-21 17:32:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `colorImg_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colorImg_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `color`, `size`, `quantity`, `colorImg_1`, `colorImg_2`, `created_at`, `updated_at`) VALUES
(1, 5, 'White', 'XS', 9, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', '2023-03-21 16:40:16', '2023-03-21 16:40:16'),
(2, 5, 'White', 'S', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', '2023-03-21 16:40:27', '2023-03-21 16:40:27'),
(3, 5, 'White', 'M', 30, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', '2023-03-21 16:40:45', '2023-03-21 16:40:45'),
(4, 5, 'White', 'L', 30, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', '2023-03-21 16:40:55', '2023-03-21 16:40:55'),
(5, 5, 'White', 'XL', 30, 'storage/uploads/product/adicolor-classics-trefoil-tee-28306716d11788eec576ee53cd37f051.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c1bbc0f7d516cfaddcf9997af0e11dd9.jpg', '2023-03-21 16:41:07', '2023-03-21 16:41:07'),
(6, 5, 'Black', 'S', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-11ec6fcf1ea41cb9d9ed7bff8b06b911.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-9ab3e0942c90754f89dc6120dad1692d.jpg', '2023-03-21 16:42:43', '2023-03-21 16:42:43'),
(7, 5, 'Black', 'L', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-11ec6fcf1ea41cb9d9ed7bff8b06b911.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-9ab3e0942c90754f89dc6120dad1692d.jpg', '2023-03-21 16:42:56', '2023-03-21 16:42:56'),
(8, 5, 'Black', 'XL', 30, 'storage/uploads/product/adicolor-classics-trefoil-tee-11ec6fcf1ea41cb9d9ed7bff8b06b911.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-9ab3e0942c90754f89dc6120dad1692d.jpg', '2023-03-21 16:43:08', '2023-03-21 16:43:08'),
(9, 5, 'Black', 'M', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-11ec6fcf1ea41cb9d9ed7bff8b06b911.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-9ab3e0942c90754f89dc6120dad1692d.jpg', '2023-03-21 16:43:54', '2023-03-21 16:43:54'),
(10, 5, 'Red', 'S', 10, 'storage/uploads/product/adicolor-classics-trefoil-tee-b756a99275c930923da20941e0e7d6a4.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c4a04ec3e40755ebd23a37a330bb8fb1.jpg', '2023-03-21 16:44:08', '2023-03-21 16:44:08'),
(11, 5, 'Red', 'M', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-b756a99275c930923da20941e0e7d6a4.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c4a04ec3e40755ebd23a37a330bb8fb1.jpg', '2023-03-21 16:44:20', '2023-03-21 16:44:20'),
(12, 5, 'Red', 'M', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-b756a99275c930923da20941e0e7d6a4.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-c4a04ec3e40755ebd23a37a330bb8fb1.jpg', '2023-03-21 16:44:30', '2023-03-21 16:44:30'),
(13, 5, 'Pink', 'S', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-36389297da8cd328f97994347d668710.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-4e153289dd6ffbda12f24cc246f0ecff.jpg', '2023-03-21 16:44:46', '2023-03-21 16:45:36'),
(14, 5, 'Pink', 'L', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-36389297da8cd328f97994347d668710.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-4e153289dd6ffbda12f24cc246f0ecff.jpg', '2023-03-21 16:45:02', '2023-03-21 16:45:43'),
(15, 5, 'Grey', 'M', 18, 'storage/uploads/product/adicolor-classics-trefoil-tee-39cd820a1ff98ba8a339bed208696efd.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-17b5c24e0fdfe66fd3c11a2695309474.jpg', '2023-03-21 16:45:59', '2023-03-21 16:49:18'),
(16, 5, 'Grey', 'L', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-39cd820a1ff98ba8a339bed208696efd.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-17b5c24e0fdfe66fd3c11a2695309474.jpg', '2023-03-21 16:46:10', '2023-03-21 16:46:10'),
(17, 5, 'Grey', 'XL', 20, 'storage/uploads/product/adicolor-classics-trefoil-tee-39cd820a1ff98ba8a339bed208696efd.jpg', 'storage/uploads/product/adicolor-classics-trefoil-tee-17b5c24e0fdfe66fd3c11a2695309474.jpg', '2023-03-21 16:46:23', '2023-03-21 16:46:23'),
(18, 6, 'White', 'S', 20, 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-e67b59780db7531882ccd97c02e5f191.jpg', 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-6722875195654bc6a99c403abae747ae.jpg', '2023-03-21 16:53:15', '2023-03-21 16:53:15'),
(19, 6, 'White', 'M', 20, 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-e67b59780db7531882ccd97c02e5f191.jpg', 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-6722875195654bc6a99c403abae747ae.jpg', '2023-03-21 16:53:26', '2023-03-21 16:53:26'),
(20, 6, 'White', 'L', 20, 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-e67b59780db7531882ccd97c02e5f191.jpg', 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-6722875195654bc6a99c403abae747ae.jpg', '2023-03-21 16:53:37', '2023-03-21 16:53:37'),
(21, 6, 'White', 'XL', 22, 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-e67b59780db7531882ccd97c02e5f191.jpg', 'storage/uploads/product/adidas-adicolor-trefoil-hoodie-6722875195654bc6a99c403abae747ae.jpg', '2023-03-21 16:53:48', '2023-03-21 16:53:48'),
(22, 7, 'Pink', 'S', 10, 'storage/uploads/product/hoodie-classics-adicolor-a647fd7377b68e7978de604fe6347fa0.jpg', 'storage/uploads/product/hoodie-classics-adicolor-2c9c451043aff2b1df1fafc14fde8ec6.jpg', '2023-03-21 16:57:08', '2023-03-21 16:57:08'),
(23, 7, 'Pink', 'M', 20, 'storage/uploads/product/hoodie-classics-adicolor-a647fd7377b68e7978de604fe6347fa0.jpg', 'storage/uploads/product/hoodie-classics-adicolor-2c9c451043aff2b1df1fafc14fde8ec6.jpg', '2023-03-21 16:57:19', '2023-03-21 16:57:19'),
(24, 7, 'Pink', 'L', 30, 'storage/uploads/product/hoodie-classics-adicolor-a647fd7377b68e7978de604fe6347fa0.jpg', 'storage/uploads/product/hoodie-classics-adicolor-2c9c451043aff2b1df1fafc14fde8ec6.jpg', '2023-03-21 16:57:31', '2023-03-21 16:57:31'),
(25, 8, 'Black', 'S', 10, 'storage/uploads/product/essentials-mens-logo-tee-59bde59825b7d15462c82a9ef299d761.jpg', 'storage/uploads/product/essentials-mens-logo-tee-8b97b8518dba87e5b8f14f1582936817.jpg', '2023-03-21 16:59:07', '2023-03-21 16:59:07'),
(26, 8, 'Black', 'M', 11, 'storage/uploads/product/essentials-mens-logo-tee-59bde59825b7d15462c82a9ef299d761.jpg', 'storage/uploads/product/essentials-mens-logo-tee-8b97b8518dba87e5b8f14f1582936817.jpg', '2023-03-21 16:59:19', '2023-03-21 16:59:19'),
(27, 8, 'Black', 'L', 22, 'storage/uploads/product/essentials-mens-logo-tee-59bde59825b7d15462c82a9ef299d761.jpg', 'storage/uploads/product/essentials-mens-logo-tee-8b97b8518dba87e5b8f14f1582936817.jpg', '2023-03-21 16:59:30', '2023-03-21 16:59:30'),
(28, 8, 'White', 'M', 20, 'storage/uploads/product/essentials-mens-logo-tee-97fc938cf39a858597489763f640ec4a.jpg', 'storage/uploads/product/essentials-mens-logo-tee-ac5ac502ef8a21fd62d71adf32991a25.jpg', '2023-03-21 16:59:45', '2023-03-21 16:59:45'),
(29, 8, 'White', 'L', 20, 'storage/uploads/product/essentials-mens-logo-tee-97fc938cf39a858597489763f640ec4a.jpg', 'storage/uploads/product/essentials-mens-logo-tee-ac5ac502ef8a21fd62d71adf32991a25.jpg', '2023-03-21 16:59:57', '2023-03-21 16:59:57'),
(30, 8, 'Grey', 'M', 22, 'storage/uploads/product/essentials-mens-logo-tee-a493e574884bfec380af554d0ccdf940.jpg', 'storage/uploads/product/essentials-mens-logo-tee-ed0a05d4960932ccf3ea238aee4b0ac5.jpg', '2023-03-21 17:00:10', '2023-03-21 17:00:10'),
(31, 8, 'Grey', 'L', 22, 'storage/uploads/product/essentials-mens-logo-tee-a493e574884bfec380af554d0ccdf940.jpg', 'storage/uploads/product/essentials-mens-logo-tee-ed0a05d4960932ccf3ea238aee4b0ac5.jpg', '2023-03-21 17:00:23', '2023-03-21 17:00:23'),
(32, 8, 'Grey', 'XL', 20, 'storage/uploads/product/essentials-mens-logo-tee-a493e574884bfec380af554d0ccdf940.jpg', 'storage/uploads/product/essentials-mens-logo-tee-ed0a05d4960932ccf3ea238aee4b0ac5.jpg', '2023-03-21 17:00:33', '2023-03-21 17:00:33'),
(33, 9, 'White', 'XS', 40, 'storage/uploads/product/adidas-x-classic-lego-crewneck-aa0a8115e70e227b36c91d8701db41e9.jpg', 'storage/uploads/product/adidas-x-classic-lego-crewneck-978cd96b26ad6b6a44b57b14cdebe9a3.jpg', '2023-03-21 17:04:14', '2023-03-21 17:04:14'),
(34, 9, 'White', 'S', 20, 'storage/uploads/product/adidas-x-classic-lego-crewneck-aa0a8115e70e227b36c91d8701db41e9.jpg', 'storage/uploads/product/adidas-x-classic-lego-crewneck-978cd96b26ad6b6a44b57b14cdebe9a3.jpg', '2023-03-21 17:04:26', '2023-03-21 17:04:26'),
(35, 10, 'Orange', 'M', 20, 'storage/uploads/product/fast-running-jacket-925a71372b0c68f7c119764d9dfb6e0c.jpg', 'storage/uploads/product/fast-running-jacket-cc0cd8142f21e82c596a1a7a7edcb0db.jpg', '2023-03-21 17:06:11', '2023-03-21 17:06:11'),
(36, 10, 'Orange', 'L', 20, 'storage/uploads/product/fast-running-jacket-925a71372b0c68f7c119764d9dfb6e0c.jpg', 'storage/uploads/product/fast-running-jacket-cc0cd8142f21e82c596a1a7a7edcb0db.jpg', '2023-03-21 17:06:25', '2023-03-21 17:06:25'),
(37, 10, 'Orange', 'XL', 20, 'storage/uploads/product/fast-running-jacket-925a71372b0c68f7c119764d9dfb6e0c.jpg', 'storage/uploads/product/fast-running-jacket-cc0cd8142f21e82c596a1a7a7edcb0db.jpg', '2023-03-21 17:06:40', '2023-03-21 17:06:40'),
(38, 11, 'White', 'XS', 20, 'storage/uploads/product/puma-x-pokemon-big-kids-tee-b8d13948dacf62416d03217efc342e69.jpg', 'storage/uploads/product/puma-x-pokemon-big-kids-tee-d4985897c05430161a2d9069524513b4.jpg', '2023-03-21 17:09:06', '2023-03-21 17:09:06'),
(39, 11, 'White', 'S', 20, 'storage/uploads/product/puma-x-pokemon-big-kids-tee-b8d13948dacf62416d03217efc342e69.jpg', 'storage/uploads/product/puma-x-pokemon-big-kids-tee-d4985897c05430161a2d9069524513b4.jpg', '2023-03-21 17:09:19', '2023-03-21 17:09:19'),
(40, 12, 'midnightblue', 'S', 10, 'storage/uploads/product/train-icons-training-shorts-a2f479c1f4b55e8e374ede7367c7398e.jpg', 'storage/uploads/product/train-icons-training-shorts-6de3c70b7bb34551171a9f099ba06101.jpg', '2023-03-21 17:11:04', '2023-03-21 17:12:23'),
(41, 12, 'midnightblue', 'M', 22, 'storage/uploads/product/train-icons-training-shorts-a2f479c1f4b55e8e374ede7367c7398e.jpg', 'storage/uploads/product/train-icons-training-shorts-6de3c70b7bb34551171a9f099ba06101.jpg', '2023-03-21 17:12:16', '2023-03-21 17:12:16'),
(42, 12, 'midnightblue', 'L', 23, 'storage/uploads/product/train-icons-training-shorts-a2f479c1f4b55e8e374ede7367c7398e.jpg', 'storage/uploads/product/train-icons-training-shorts-6de3c70b7bb34551171a9f099ba06101.jpg', '2023-03-21 17:12:44', '2023-03-21 17:12:44'),
(43, 13, 'Black', 'S', 22, 'storage/uploads/product/training-short-8536862f238329582c0be596c0805897.jpg', 'storage/uploads/product/training-short-04c22e5327c2048c7e30a34ce6b4e1bb.jpg', '2023-03-21 17:14:38', '2023-03-21 17:14:38'),
(44, 13, 'Black', 'L', 21, 'storage/uploads/product/training-short-8536862f238329582c0be596c0805897.jpg', 'storage/uploads/product/training-short-04c22e5327c2048c7e30a34ce6b4e1bb.jpg', '2023-03-21 17:14:53', '2023-03-21 17:14:53'),
(45, 14, 'darkgreen', 'M', 20, 'storage/uploads/product/sweat-pullover-hoodie-324049a4a27017d33afd76ae12ceb33c.jpg', 'storage/uploads/product/sweat-pullover-hoodie-ef0262b0a9b988bf7148221b41b75a90.jpg', '2023-03-21 17:18:31', '2023-03-21 17:18:31'),
(46, 14, 'darkgreen', 'L', 20, 'storage/uploads/product/sweat-pullover-hoodie-324049a4a27017d33afd76ae12ceb33c.jpg', 'storage/uploads/product/sweat-pullover-hoodie-ef0262b0a9b988bf7148221b41b75a90.jpg', '2023-03-21 17:18:44', '2023-03-21 17:18:44'),
(47, 14, 'darkgreen', 'XL', 21, 'storage/uploads/product/sweat-pullover-hoodie-324049a4a27017d33afd76ae12ceb33c.jpg', 'storage/uploads/product/sweat-pullover-hoodie-ef0262b0a9b988bf7148221b41b75a90.jpg', '2023-03-21 17:18:55', '2023-03-21 17:18:55'),
(48, 14, 'darkgreen', 'XXL', 11, 'storage/uploads/product/sweat-pullover-hoodie-324049a4a27017d33afd76ae12ceb33c.jpg', 'storage/uploads/product/sweat-pullover-hoodie-ef0262b0a9b988bf7148221b41b75a90.jpg', '2023-03-21 17:21:56', '2023-03-21 17:21:56'),
(49, 14, 'Blue', 'S', 21, 'storage/uploads/product/sweat-pullover-hoodie-c0a2769ee35be3fb295971f89895ce66.jpg', 'storage/uploads/product/sweat-pullover-hoodie-83685ad4446398ea31ce616d262c5b56.jpg', '2023-03-21 17:22:13', '2023-03-21 17:22:13'),
(50, 14, 'Blue', 'L', 10, 'storage/uploads/product/sweat-pullover-hoodie-c0a2769ee35be3fb295971f89895ce66.jpg', 'storage/uploads/product/sweat-pullover-hoodie-83685ad4446398ea31ce616d262c5b56.jpg', '2023-03-21 17:22:29', '2023-03-21 17:22:29'),
(51, 14, 'White', 'S', 20, 'storage/uploads/product/sweat-pullover-hoodie-14c738bf6164b5c4b0dc8ffe9c62e07b.jpg', 'storage/uploads/product/sweat-pullover-hoodie-e1c242eb46fd8e44e6b0163fa8b43396.jpg', '2023-03-21 17:22:48', '2023-03-21 17:22:48'),
(52, 14, 'White', 'L', 20, 'storage/uploads/product/sweat-pullover-hoodie-14c738bf6164b5c4b0dc8ffe9c62e07b.jpg', 'storage/uploads/product/sweat-pullover-hoodie-e1c242eb46fd8e44e6b0163fa8b43396.jpg', '2023-03-21 17:23:05', '2023-03-21 17:23:05'),
(53, 15, 'indianred', 'M', 20, 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-3b87fab073de5fa198242bba36e3598c.jpg', 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-f42c5842edc0c419723318fa15771422.jpg', '2023-03-21 17:24:54', '2023-03-21 17:25:58'),
(54, 15, 'indianred', 'S', 20, 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-3b87fab073de5fa198242bba36e3598c.jpg', 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-f42c5842edc0c419723318fa15771422.jpg', '2023-03-21 17:25:08', '2023-03-21 17:26:02'),
(55, 15, 'indianred', 'XL', 25, 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-3b87fab073de5fa198242bba36e3598c.jpg', 'storage/uploads/product/printed-v-neck-long-sleeve-mini-dress-f42c5842edc0c419723318fa15771422.jpg', '2023-03-21 17:25:20', '2023-03-21 17:26:06'),
(56, 16, 'saddlebrown', 'M', 20, 'storage/uploads/product/comfort-jacket-wool-like-f58cddd81d9eac5da76599d488026a45.jpg', 'storage/uploads/product/comfort-jacket-wool-like-5ba57a9cc03ac8899863a74260e3e2c9.jpg', '2023-03-21 17:28:13', '2023-03-21 17:29:17'),
(57, 16, 'saddlebrown', 'L', 20, 'storage/uploads/product/comfort-jacket-wool-like-f58cddd81d9eac5da76599d488026a45.jpg', 'storage/uploads/product/comfort-jacket-wool-like-5ba57a9cc03ac8899863a74260e3e2c9.jpg', '2023-03-21 17:28:53', '2023-03-21 17:28:53'),
(58, 16, 'saddlebrown', 'XL', 17, 'storage/uploads/product/comfort-jacket-wool-like-f58cddd81d9eac5da76599d488026a45.jpg', 'storage/uploads/product/comfort-jacket-wool-like-5ba57a9cc03ac8899863a74260e3e2c9.jpg', '2023-03-21 17:29:07', '2023-03-21 17:29:07'),
(59, 17, 'lightpink', 'S', 40, 'storage/uploads/product/warm-padded-washable-quilted-e3122f1efb70a6152f45a91c3bea6b55.jpg', 'storage/uploads/product/warm-padded-washable-quilted-b8474f6801e84003ded1d60e15b93e12.jpg', '2023-03-21 17:30:59', '2023-03-21 17:32:15'),
(60, 17, 'lightpink', 'S', 30, 'storage/uploads/product/warm-padded-washable-quilted-e3122f1efb70a6152f45a91c3bea6b55.jpg', 'storage/uploads/product/warm-padded-washable-quilted-b8474f6801e84003ded1d60e15b93e12.jpg', '2023-03-21 17:31:49', '2023-03-21 17:31:49'),
(61, 17, 'lightpink', 'M', 15, 'storage/uploads/product/warm-padded-washable-quilted-e3122f1efb70a6152f45a91c3bea6b55.jpg', 'storage/uploads/product/warm-padded-washable-quilted-b8474f6801e84003ded1d60e15b93e12.jpg', '2023-03-21 17:32:05', '2023-03-21 17:32:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `gender`, `phonenumber`, `address`, `avatar`, `level`, `remember_token`, `active`, `country`, `postcode`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@localhost.com', '$2y$10$kB6Y9J76pPzRAfyMyUcyreZJsGkOounjzpqQOpIlLLIPEa6rVlFHe', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '2023-03-20 06:10:55', '2023-03-20 06:10:55'),
(2, 'Xuan Sang', 'xuansang332@gmail.com', '$2y$10$xUMFlw0kSiMOz.Ae6Zae4O84N2ZciTmT/wvjbcmpEVC5WJ5jRoZWS', 0, '214124124', 'Thanh Loi - Nam Dinh', 'storage/uploads/user/2023/03/21/avatar-xuan-sang-photo_2022-08-29_09-20-31.jpg', 2, NULL, 0, 'Vietnam', '07000', '2023-03-21 16:47:09', '2023-03-21 17:02:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2023-03-21 16:47:22', '2023-03-21 16:47:22'),
(2, 7, 2, '2023-03-21 17:32:32', '2023-03-21 17:32:32'),
(3, 9, 2, '2023-03-21 17:32:43', '2023-03-21 17:32:43');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
