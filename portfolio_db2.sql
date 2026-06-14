-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2026 at 03:28 AM
-- Server version: 8.0.46-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Article`
--

CREATE TABLE `Article` (
  `id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `authorId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Article`
--

INSERT INTO `Article` (`id`, `title`, `slug`, `content`, `published`, `authorId`, `createdAt`, `updatedAt`) VALUES
(1, 'Hello World Article', 'hello-world-article', 'This is my first seeded article. i hope i can post more articles here, hehe... se yaa..', 1, 1, '2025-11-22 10:09:00.132', '2025-12-20 15:57:17.265'),
(3, 'Singkat cerita', 'singkat-cerita', 'Awalnya merasa salah jurusan, mahasiswa informatika ini sempat ingin menyerah. Namun lewat proses, kegagalan, dan ketekunan, ia akhirnya mampu menjalani perkuliahan dengan lancar. Berhasil!!', 1, 1, '2025-12-20 16:14:58.761', '2025-12-20 16:22:44.920'),
(4, 'Keliling Nusantara Lewat Kopi', 'keliling-nusantara-lewat-kopi', 'Jujur aja, dulu aku tuh cuma ngopi buat melek doang. Tapi seiring waktu, aku mulai penasaran kenapa kopi dari coffee shop satu dengan yang lain bisa beda banget rasanya. Ternyata, Indonesia punya segudang kopi lokal dengan karakter unik yang bikin kita bisa \"traveling\" lewat secangkir kopi. Setiap daerah punya cerita tersendiri soal kopinya, dan ini yang bikin petualangan ngopi jadi seru. Kalau kalian belum nyoba berbagai kopi nusantara, honestly rasanya kayak kehilangan kesempatan buat kenal Indonesia lebih dalam lewat cita rasa yang berbeda-beda.\nNah, let me share beberapa yang sempat aku coba. Kopi Gayo dari Aceh punya aroma tajam banget tapi surprisingly ga ninggalin rasa pahit yang lengket di lidah – ini jadi pilihan aman buat pemula yang baru mulai appreciate kopi. Terus ada Kopi Kintamani dari Bali yang rasanya kayak buah-buahan segar dengan sentuhan asam mirip jeruk atau lemon. Uniknya, rasa ini muncul karena tanaman kopinya ditanam bareng dengan pohon buah di sekitarnya, jadi ada cross-flavor gitu. Kalau kalian suka yang lebih kuat dan berkarakter, Kopi Toraja adalah jawaban – rasanya bold dengan tingkat keasaman rendah plus ada hint rempah yang bikin hangat di tenggorokan. Yang paling bikin aku tertarik tuh Kopi Papua Wamena dengan rasanya yang ringan, aroma coklat dan floral, teksturnya lembut nyaris tanpa ampas, dan yang bikin special adalah proses penanamannya yang organik tanpa bahan kimia. Masih ada juga Kopi Lampung yang Robustanya halus tapi tetap kuat, Flores Bajawa yang manis dengan nuansa kacang-kacangan, sampe Kopi Jawa yang legendaris sejak era kolonial.\nSoal nyeduh kopi, sebenarnya banyak banget metode yang bisa kalian coba dan masing-masing ngasih pengalaman yang beda. Kalau kalian pengen praktis dan hasilnya konsisten, pakai V60 atau Vietnam Drip bisa jadi starting point yang oke – tinggal tuang air panas pelan-pelan, tunggu beberapa menit, dan done. French Press juga populer karena simpel dan ngasih body kopi yang lebih tebal, cocok buat yang suka kopi dengan tekstur creamy. Kalau mau yang lebih smooth dan less bitter, Cold Brew bisa jadi pilihan – kalian cuma perlu rendamin kopi dalam air dingin selama 12-24 jam, hasilnya kopi yang lembut di lidah dengan tingkat keasaman rendah. Buat yang suka nge-experiment dan punya waktu lebih, Aeropress ngasih kontrol penuh terhadap ekstraksi kopi, kalian bisa main-main dengan suhu air, tekanan, dan durasi brewing sampai nemu sweet spot yang pas buat selera kalian. Yang paling klasik dan masih jadi favorit banyak orang tuh moka pot atau manual brew pakai cangkir dan saringan kain ala nenek-nenek dulu – simple tapi hasilnya autentik banget.\nYang bikin seru dari ngopi dengan kopi nusantara tuh kalian bisa mix and match antara jenis kopi dengan teknik seduhan. Misalnya, Kopi Gayo yang aromatic cocok banget diseduh pakai V60 biar keluar semua kompleksitas rasanya, sedangkan Kopi Toraja yang bold perfect kalau diseduh pakai French Press buat dapet full body-nya. Kopi Kintamani yang fruity malah bisa jadi pilihan unik buat Cold Brew karena rasa buahnya bakal lebih menonjol. Jadi next time kalau mau ngopi, coba deh eksplorasi kombinasi kopi lokal kita dengan berbagai teknik seduhan. Ga cuma dapat rasa yang enak, tapi juga supporting petani lokal dan ikut melestarikan kekayaan kopi nusantara yang luar biasa ini.', 0, 1, '2025-12-21 12:17:23.687', '2025-12-21 12:17:23.687'),
(5, 'Waterfall Method', 'waterfall-method', '    Analoginya: Membangun rumah. Semua denah (requirement & design) harus disetujui dan final sebelum pembangunan (coding) dimulai.\n\n    Karakteristik: Fase demi fase secara berurutan. Hanya bisa melanjutkan ke fase berikutnya jika fase sebelumnya telah 100% selesai dan disetujui.\n\n    Kelebihan: Mudah dikelola, jelas milestone-nya, dokumentasi kuat, cocok untuk proyek dengan anggaran/timeline tetap.\n\n    Kekurangan: Risiko tinggi jika ada perubahan, pelanggan baru melihat hasil di akhir (risiko mismatch), dan feedback terlambat.', 0, 1, '2026-01-01 12:07:23.449', '2026-01-01 12:07:23.449');

-- --------------------------------------------------------

--
-- Table structure for table `ArticleTag`
--

CREATE TABLE `ArticleTag` (
  `articleId` int NOT NULL,
  `tagId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ArticleTag`
--

INSERT INTO `ArticleTag` (`articleId`, `tagId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 12),
(3, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 23),
(5, 24),
(5, 25),
(5, 26);

-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE `Comment` (
  `id` int NOT NULL,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorId` int NOT NULL,
  `articleId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Comment`
--

INSERT INTO `Comment` (`id`, `content`, `authorId`, `articleId`, `createdAt`, `updatedAt`) VALUES
(1, 'Nice article! 🚀', 2, 1, '2025-11-22 10:09:00.182', '2025-11-22 10:09:00.182'),
(2, 'Nice broo', 1, 3, '2025-12-21 13:22:08.312', '2025-12-21 13:22:08.312'),
(3, 'uyyyy', 1, 5, '2026-02-09 07:21:44.826', '2026-02-09 07:21:44.826');

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `id` int NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageableType` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageableId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `demoUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `githubUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technologies` json DEFAULT NULL,
  `authorId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`id`, `title`, `slug`, `description`, `content`, `published`, `demoUrl`, `githubUrl`, `technologies`, `authorId`, `createdAt`, `updatedAt`) VALUES
(1, 'ERP System - Biliva Nature', 'erp-system-biliva-nature', 'Integrated ERP system for stock management, transactions, customer service, and heavy equipment dealer using Laravel and other libraries and tools', NULL, 1, '#', '#', '[\"laravel\", \"mysql\", \"jquery\", \"bootstrap\"]', 1, '2025-12-20 10:37:13.417', '2025-12-20 10:37:13.417'),
(2, 'Muattrans & Muatparts Plus', 'muattrans-muatparts-plus', 'Modern web application with Next.js and backend API integration for dynamic data display', NULL, 1, '#', '#', '[\"next.js\", \"tailwind-css\", \"api-integration\", \"react\", \"zustand\"]', 1, '2025-12-20 10:37:13.445', '2025-12-20 10:37:13.445'),
(3, 'Ayo on Time', 'ayo-on-time', 'Student attendance journal application that records student attendance in real-time using Next.js and backend API integration', NULL, 1, 'https://ayoontime.magentaa.space/', 'https://github.com/Fawwazxdam/attendance-app-fe.git', '[\"next.js\", \"tailwind-css\", \"api-integration\", \"laravel\", \"mysql\", \"zustand\"]', 1, '2025-12-20 10:37:13.471', '2025-12-20 10:37:13.471'),
(4, 'MERAKIT', 'task-tracker', 'Sebuah aplikasi web task tracker komprehensif yang dibangun untuk mensimulasikan alur kerja Agile/Scrum. Aplikasi ini memungkinkan pengguna membuat environment kerja yang terisolasi per proyek, mengelola siklus hidup tugas (task lifecycle) dari backlog hingga selesai, serta mengatur hak akses kolaborator.', '', 0, 'https://meraakit.vercel.app/login', 'https://github.com/Fawwazxdam/task-tracker-next.git', '[\"nextjs\", \"laravel\", \"apiintegration\", \"zustand\", \"tailwindcss\", \"hooks\"]', 1, '2025-12-21 12:52:37.676', '2026-02-04 13:26:03.346'),
(6, 'EL-WAREG', 'el-wareg', '**EL-WAREG** adalah platform web modern untuk berbagi dan menemukan resep masakan dari seluruh dunia. Dibangun dengan teknologi terkini untuk memberikan pengalaman pengguna yang luar biasa.', '', 0, 'el-wareg.vercel.app', 'https://github.com/Fawwazxdam/elwareg.git', '[\"Next.js\", \"react-hook-form\", \"supabase\", \"api\", \"postgres\", \"tailwindcss\"]', 1, '2026-01-25 10:11:57.881', '2026-01-25 10:13:14.637'),
(7, 'NRM-APP (POS)', 'nrm-app-(pos)', 'Web-app yang dirancang untuk manajemen transaksi penjualan, pembelian, inventory, produk dan keuangan. digunakan untuk transaksi yang cepat dan presisi dengan qr code pendukung', 'Aplikasi pos untuk salah 1 toko retail spareparts mobil', 0, '', '', '[\"Laravel\", \"react.js\", \"inertia\", \"mysql\", \"tailwindcss\", \"PHP\", \"multirole-permission\", \"pos\", \"store-management\"]', 1, '2026-04-26 06:07:20.923', '2026-04-26 06:08:38.287');

-- --------------------------------------------------------

--
-- Table structure for table `ProjectTag`
--

CREATE TABLE `ProjectTag` (
  `projectId` int NOT NULL,
  `tagId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ProjectTag`
--

INSERT INTO `ProjectTag` (`projectId`, `tagId`) VALUES
(2, 1),
(1, 4),
(3, 4),
(1, 5),
(3, 5),
(1, 6),
(1, 7),
(2, 8),
(3, 8),
(6, 8),
(2, 9),
(3, 9),
(2, 10),
(3, 10),
(2, 11),
(3, 11),
(4, 21),
(7, 21),
(4, 22),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(7, 31),
(7, 32),
(7, 33);

-- --------------------------------------------------------

--
-- Table structure for table `Tag`
--

CREATE TABLE `Tag` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Tag`
--

INSERT INTO `Tag` (`id`, `name`, `slug`) VALUES
(1, 'react', 'react'),
(2, 'javascript', 'javascript'),
(3, 'backend', 'backend'),
(4, 'laravel', 'laravel'),
(5, 'mysql', 'mysql'),
(6, 'jquery', 'jquery'),
(7, 'bootstrap', 'bootstrap'),
(8, 'next.js', 'next.js'),
(9, 'tailwind-css', 'tailwind-css'),
(10, 'api-integration', 'api-integration'),
(11, 'zustand', 'zustand'),
(12, 'salah', 'salah'),
(13, 'jurusan', 'jurusan'),
(14, 'coffee', 'coffee'),
(15, 'indonesia', 'indonesia'),
(16, 'papua', 'papua'),
(17, 'gayo', 'gayo'),
(18, 'programmer', 'programmer'),
(19, 'kopi', 'kopi'),
(20, 'nusantara', 'nusantara'),
(21, 'tech', 'tech'),
(22, 'tasktracker', 'tasktracker'),
(23, 'waterfall', 'waterfall'),
(24, 'development', 'development'),
(25, 'software', 'software'),
(26, 'method', 'method'),
(27, 'resep', 'resep'),
(28, 'postgresql', 'postgresql'),
(29, 'supabase', 'supabase'),
(30, 'masakan', 'masakan'),
(31, 'pos', 'pos'),
(32, 'it', 'it'),
(33, 'mini-erp', 'mini-erp');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `email`, `name`, `createdAt`, `updatedAt`, `phone_number`) VALUES
(1, 'admin@example.com', 'Administrator', '2025-11-22 10:08:59.988', '2025-11-22 10:08:59.988', '081234567890'),
(2, 'user@example.com', 'Regular User', '2025-11-22 10:09:00.011', '2025-11-22 10:09:00.011', '081234567891');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('1b7bb9b8-1935-4dc0-a356-ed8cd61d9115', 'a13f4a000dd18db518407ecac6e561f594e7e19f255093d729f54c89413bd82f', '2025-12-21 12:42:32.374', '20251221124231_make_technologies_optional', NULL, NULL, '2025-12-21 12:42:31.926', 1),
('24e482d1-31b9-4853-b1ea-2c7257ea68f8', '1d236c6f5b200907e8b72a2d930a1600a2a6b29aa6dd70e0165f500c49166f62', '2025-12-21 11:58:16.028', '20251221115815_update_content_description_to_text', NULL, NULL, '2025-12-21 11:58:15.184', 1),
('a3210239-e5b8-4eee-8cd3-c70af2662d72', '2f5363561a815dd9626e4fdcc998491792b6831cfe8e32ae8c9862a9117f861a', '2025-11-22 09:56:43.616', '20251122095643_update_user_table', NULL, NULL, '2025-11-22 09:56:43.301', 1),
('afccc5e3-014f-4e56-bcd0-f3e1d16ce18c', '03597341018ddf2410f354120c62950e0510fff0d51c3b7b93b2a957fcc2faa7', '2025-11-22 09:54:49.742', '20251122090722_init', NULL, NULL, '2025-11-22 09:54:47.143', 1),
('f32a46e5-ae09-46f3-800d-b7d57261b143', '442d90406f4cdf513957ec7be3667fa1b64f03f36b66fe321246ffeef45c0b45', '2025-12-20 08:26:19.943', '20251220082618_add_projects_and_images', NULL, NULL, '2025-12-20 08:26:18.292', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Article_slug_key` (`slug`),
  ADD KEY `Article_authorId_fkey` (`authorId`);

--
-- Indexes for table `ArticleTag`
--
ALTER TABLE `ArticleTag`
  ADD PRIMARY KEY (`articleId`,`tagId`),
  ADD KEY `ArticleTag_tagId_fkey` (`tagId`);

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Comment_authorId_fkey` (`authorId`),
  ADD KEY `Comment_articleId_fkey` (`articleId`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Project_slug_key` (`slug`),
  ADD KEY `Project_authorId_fkey` (`authorId`);

--
-- Indexes for table `ProjectTag`
--
ALTER TABLE `ProjectTag`
  ADD PRIMARY KEY (`projectId`,`tagId`),
  ADD KEY `ProjectTag_tagId_fkey` (`tagId`);

--
-- Indexes for table `Tag`
--
ALTER TABLE `Tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Tag_name_key` (`name`),
  ADD UNIQUE KEY `Tag_slug_key` (`slug`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Article`
--
ALTER TABLE `Article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Tag`
--
ALTER TABLE `Tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Article`
--
ALTER TABLE `Article`
  ADD CONSTRAINT `Article_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `ArticleTag`
--
ALTER TABLE `ArticleTag`
  ADD CONSTRAINT `ArticleTag_articleId_fkey` FOREIGN KEY (`articleId`) REFERENCES `Article` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ArticleTag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `Tag` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_articleId_fkey` FOREIGN KEY (`articleId`) REFERENCES `Article` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Comment_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `Project_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `ProjectTag`
--
ALTER TABLE `ProjectTag`
  ADD CONSTRAINT `ProjectTag_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ProjectTag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `Tag` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
