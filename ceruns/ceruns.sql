-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 01:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ceruns`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_secrit_keys`
--

CREATE TABLE `api_secrit_keys` (
  `id` bigint(20) NOT NULL,
  `secrit_key` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_secrit_keys`
--

INSERT INTO `api_secrit_keys` (`id`, `secrit_key`, `date_added`) VALUES
(1, '$2y$10$7YJClnwKuSTiT9UAioMEd.M5h4XQao9VWajdq6pw7fkoB2vVevQFi', '2024-12-30 20:21:17'),
(2, '$2y$10$dHvuK6KmmapAUFb.c7WmpOA3r/e2CsmvzmQFkkW4KzT/l51joVLeS', '2024-12-30 20:25:08'),
(3, '$2y$10$Bvb9qXL3UX6AiKIuDsB3t.z/W/DNW/xrhE/KwbugI8h6cWSrzGQ6q', '2024-12-30 20:26:24'),
(4, '$2y$10$IttQhCEBA5VYrnSJWN0KIObm.pgmMB6QUT86ZbTlIMGkubkWeaGWK', '2024-12-30 20:27:00'),
(5, '$2y$10$RMZpvt./GKXtKdkORVHSEuLE/eTegVoIowYtyW5nfvmDuujddxOUu', '2024-12-31 11:15:17'),
(6, '$2y$10$7ysP8aBGAekUNHVbEPqlpukMIJ1kwH7W4VRd83cYc8aMG7cEkVAum', '2024-12-31 11:16:03'),
(7, '$2y$10$HIujnfuI5pKOScdIEcKYWuPaAig3dMzXAPhFCoHzJhjuFUtTtJGkm', '2024-12-31 11:17:03'),
(8, '$2y$10$loGkX46G9V9RH027JG/L2ezokZkZuTb15LDFGWK52uaO.DCHE0teu', '2024-12-31 11:17:49'),
(9, '$2y$10$Bp5xrsHdsTUfYFaBpefMIuRniAyLSNuG7/m/YY.XVegeqr8U3xhbW', '2024-12-31 11:18:42'),
(10, '$2y$10$dk6AJ64.525Yglq6iPB1hexutTVEA8mPcn1yHUEu3lICnmiuXlkZ6', '2024-12-31 11:19:38'),
(11, '$2y$10$1exTB/SOsLHNeYwPbMfgxO1v5jCY9KsU57wc71xzVUCW0kkloP1oO', '2024-12-31 11:20:58'),
(12, '$2y$10$.CyTxMwvfpkXxdJ/55SaQ.9ZAvtMiWRHJznAgHB03zfcUewEgLEsO', '2024-12-31 11:22:55'),
(13, '$2y$10$q3yOd88c8xngFJZpu757aOIawzsPm3uUMM4j411qThldRkMLrMgE6', '2024-12-31 11:23:52'),
(14, '$2y$10$EqOBCiQRDWqwqVFVRv6vM.pmWP3GSjPy6jo/NZbkik/aCXy2OokfC', '2024-12-31 11:24:16'),
(15, '$2y$10$f2WyxPdo6it/HSB8/6piNO1AhBuRSsUCGhth1xvOucKRMrN2NgQGW', '2024-12-31 11:24:57'),
(16, '$2y$10$cubq8J1eUpB09wZ.0z6lSe4bNwT2nKq7786HZmuMh9NhXWINaSZ4q', '2024-12-31 11:25:48'),
(17, '$2y$10$Yv2sUkOlgFDc17fycZqZp.lO9LTAlc1PHMa.vdD/vXA6VnwsiaICa', '2024-12-31 11:26:25'),
(18, '$2y$10$J0DRbMjpp8qG3xjQXt1LXeLvzzV1vs.IFoEVzg8bd.lOpJAnnb5PG', '2024-12-31 11:26:55'),
(19, '$2y$10$ePRlDj/GlliaYSAeG96HSe/gzUTK5mdKL69XMbl3cPNiqB0ZK73Y6', '2024-12-31 11:27:29'),
(20, '$2y$10$lZtiNXHDGWBzJLoDBhRbuu2a1gT9zY.eUpRi83P3hhp4hKN62uJMe', '2024-12-31 11:28:19'),
(21, '$2y$10$33KUg46l1m3jwLOSLXwJvuX8NIKOWmzw2tG6EZv7IMitfRvdNyBLq', '2024-12-31 11:35:19'),
(22, '$2y$10$8oD3GI/eC6KSNL3cdKu63OrmOmfcZRrtjJOlbKJ9l7z1W8JnmlZdK', '2024-12-31 11:36:17'),
(23, '$2y$10$lz/JknQkwPZkKrDVi8YEGuzwYIO2eRN4nWdUQL9pTGmTF8AAt68Y2', '2024-12-31 11:36:52'),
(24, '$2y$10$6TsrWsCcDjD9x6kDBCxnoeVl6o.LQxNu.9b4V5DOG/FeoPHT.0RH.', '2024-12-31 11:50:57'),
(25, '$2y$10$CPn/AMUGHIKiErcw0uzgh./HvmjHIMGFoUnM1Yr49y3NbAirMP8Q6', '2024-12-31 11:57:33'),
(26, '$2y$10$pXbNanEAbV1wHSAmGtpk1ODHQjcCRz/p4jbwfoYgG5RkLTQln.ltC', '2024-12-31 11:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `employer_name` varchar(255) NOT NULL,
  `employer_address` text NOT NULL,
  `employer_phone` varchar(50) DEFAULT NULL,
  `evidence_file_path` varchar(255) DEFAULT NULL,
  `evidence_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `full_name`, `contact_info`, `complaint_type`, `employer_name`, `employer_address`, `employer_phone`, `evidence_file_path`, `evidence_description`, `created_at`) VALUES
(1, 'أحمد محمد علي', 'ahmed@example.com', 'تأخير في صرف الرواتب', 'شركة التقنية المتطورة', 'الرياض - حي العليا - شارع العليا العام', '0501234567', '/uploads/complaints/evidence_123.pdf', 'نسخة من عقد العمل وكشف الحساب البنكي', '2025-06-02 18:54:45'),
(2, 'أحمد محمد علي', 'ahmed@example.com', 'تأخير في صرف الرواتب', 'شركة التقنية المتطورة', 'الرياض - حي العليا - شارع العليا العام', '0501234567', '/uploads/complaints/evidence_123.pdf', 'نسخة من عقد العمل وكشف الحساب البنكي', '2025-06-03 11:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `jops`
--

CREATE TABLE `jops` (
  `id` int(11) NOT NULL,
  `jop_title` varchar(255) NOT NULL,
  `jop_times` varchar(255) DEFAULT NULL,
  `jop_requirments` text DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `is_money` tinyint(1) DEFAULT 0,
  `money` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jops`
--

INSERT INTO `jops` (`id`, `jop_title`, `jop_times`, `jop_requirments`, `country`, `is_money`, `money`, `created_at`) VALUES
(6, '1', ',1,2,3,', 'Strong knowledge of Angular, HTML, CSS, TypeScript', 'Egypt', 1, 12000.00, '2025-06-03 10:39:12'),
(7, '1', ',1,2,3,', 'Strong knowledge of Angular, HTML, CSS, TypeScript', 'Egypt', 1, 12000.00, '2025-06-03 11:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `jop_position`
--

CREATE TABLE `jop_position` (
  `id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jop_position`
--

INSERT INTO `jop_position` (`id`, `date_added`, `name`) VALUES
(1, '2025-06-01 01:08:12', 'Content Writer'),
(2, '2025-06-01 01:08:12', 'Proofreader'),
(3, '2025-06-01 01:08:12', 'Graphic Designer'),
(4, '2025-06-01 01:08:12', 'Web Developer'),
(5, '2025-06-01 01:08:12', 'Mobile App Developer'),
(6, '2025-06-01 01:08:12', 'Translator'),
(7, '2025-06-01 01:08:12', 'Social Media Manager'),
(8, '2025-06-01 01:08:12', 'Digital Marketer'),
(9, '2025-06-01 01:08:12', 'Video Editor'),
(10, '2025-06-01 01:08:12', 'UI/UX Designer'),
(11, '2025-06-01 01:08:12', 'Virtual Assistant'),
(12, '2025-06-01 01:08:12', 'Data Entry Specialist'),
(13, '2025-06-01 01:08:12', 'Freelance Accountant'),
(14, '2025-06-01 01:08:12', 'Software Developer'),
(15, '2025-06-01 01:08:12', 'Nutrition Consultant'),
(16, '2025-06-01 01:08:12', 'Interior Designer'),
(17, '2025-06-01 01:08:12', 'Personal Trainer'),
(18, '2025-06-01 01:08:12', 'Online Tutor'),
(19, '2025-06-01 01:08:12', 'Photographer'),
(20, '2025-06-01 01:08:12', 'Audio Editor'),
(21, '2025-06-01 01:08:12', 'Business Consultant'),
(22, '2025-06-01 01:08:12', 'Game Developer'),
(23, '2025-06-01 01:08:12', 'AI Developer'),
(24, '2025-06-01 01:08:12', 'Legal Consultant'),
(25, '2025-06-01 01:08:12', 'Financial Advisor'),
(26, '2025-06-01 01:08:12', 'Technical Writer'),
(27, '2025-06-01 01:08:12', 'Ebook Editor'),
(28, '2025-06-01 01:08:12', 'Content Strategist'),
(29, '2025-06-01 01:08:12', 'WordPress Developer'),
(30, '2025-06-01 01:08:12', 'Flutter Developer'),
(31, '2025-06-01 01:08:12', 'React.js Developer'),
(32, '2025-06-01 01:08:12', 'Python Developer'),
(33, '2025-06-01 01:08:12', 'PHP Developer'),
(34, '2025-06-01 01:08:12', 'Shopify Developer'),
(35, '2025-06-01 01:08:12', 'Magento Developer'),
(36, '2025-06-01 01:08:12', 'Logo Designer'),
(37, '2025-06-01 01:08:12', 'Motion Graphics Designer'),
(38, '2025-06-01 01:08:12', '3D Designer'),
(39, '2025-06-01 01:08:12', 'T-Shirt Designer'),
(40, '2025-06-01 01:08:12', 'Business Card Designer'),
(41, '2025-06-01 01:08:12', 'Brochure Designer'),
(42, '2025-06-01 01:08:12', 'UI Designer'),
(43, '2025-06-01 01:08:12', 'UX Designer'),
(44, '2025-06-01 01:08:12', 'Wix Website Designer'),
(45, '2025-06-01 01:08:12', 'Squarespace Website Designer'),
(46, '2025-06-01 01:08:12', 'iOS App Developer'),
(47, '2025-06-01 01:08:12', 'Android App Developer'),
(48, '2025-06-01 01:08:12', 'PhoneGap Developer'),
(49, '2025-06-01 01:08:12', 'Xamarin Developer'),
(50, '2025-06-01 01:08:12', 'React Native Developer'),
(51, '2025-06-01 01:08:12', 'Ionic Developer'),
(52, '2025-06-01 01:08:12', 'Kotlin Developer'),
(53, '2025-06-01 01:08:12', 'Swift Developer'),
(54, '2025-06-01 01:08:12', 'Java Developer'),
(55, '2025-06-01 01:08:12', 'Objective-C Developer'),
(56, '2025-06-01 01:08:12', 'C# Developer'),
(57, '2025-06-01 01:08:12', 'C++ Developer'),
(58, '2025-06-01 01:08:12', 'Ruby on Rails Developer'),
(59, '2025-06-01 01:08:12', 'Node.js Developer'),
(60, '2025-06-01 01:08:12', 'Angular Developer'),
(61, '2025-06-01 01:08:12', 'Vue.js Developer'),
(62, '2025-06-01 01:08:12', 'Laravel Developer'),
(63, '2025-06-01 01:08:12', 'Django Developer'),
(64, '2025-06-01 01:08:12', 'ASP.NET Developer'),
(65, '2025-06-01 01:08:12', 'Spring Boot Developer'),
(66, '2025-06-01 01:08:12', 'Express.js Developer'),
(67, '2025-06-01 01:08:12', 'Symfony Developer'),
(68, '2025-06-01 01:08:12', 'CodeIgniter Developer'),
(69, '2025-06-01 01:08:12', 'Zend Developer'),
(70, '2025-06-01 01:08:12', 'CakePHP Developer'),
(71, '2025-06-01 01:08:12', 'Yii Developer'),
(72, '2025-06-01 01:08:12', 'Phalcon Developer'),
(73, '2025-06-01 01:08:12', 'Slim Framework Developer'),
(74, '2025-06-01 01:08:12', 'Sails.js Developer'),
(75, '2025-06-01 01:08:12', 'Meteor.js Developer'),
(76, '2025-06-01 01:08:12', 'Ember.js Developer'),
(77, '2025-06-01 01:08:12', 'Backbone.js Developer'),
(78, '2025-06-01 01:08:12', 'Knockout.js Developer'),
(79, '2025-06-01 01:08:12', 'Polymer Developer'),
(80, '2025-06-01 01:08:12', 'Aurelia Developer'),
(81, '2025-06-01 01:08:12', 'Riot.js Developer'),
(82, '2025-06-01 01:08:12', 'Mithril.js Developer'),
(83, '2025-06-01 01:08:12', 'Nuxt.js Developer'),
(84, '2025-06-01 01:08:12', 'Next.js Developer');

-- --------------------------------------------------------

--
-- Table structure for table `jop_timing`
--

CREATE TABLE `jop_timing` (
  `id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jop_timing`
--

INSERT INTO `jop_timing` (`id`, `date_added`) VALUES
(1, '2025-06-01 00:49:25'),
(2, '2025-06-01 00:49:25'),
(3, '2025-06-01 00:49:59'),
(4, '2025-06-01 00:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `jop_timing_langs`
--

CREATE TABLE `jop_timing_langs` (
  `id` int(11) NOT NULL,
  `jop_timing_id` int(11) DEFAULT NULL,
  `lang_code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jop_timing_langs`
--

INSERT INTO `jop_timing_langs` (`id`, `jop_timing_id`, `lang_code`, `name`, `date_added`) VALUES
(1, 1, 'ar', 'عمل بدوام كامل', '2025-06-01'),
(2, 1, 'en', 'full-time', '2025-06-01'),
(3, 2, 'ar', 'عمل بدوام جزئي', '2025-06-01'),
(4, 2, 'en', 'part-time', '2025-06-01'),
(5, 3, 'ar', 'عقد', '2025-06-01'),
(6, 3, 'en', 'contract', '2025-06-01'),
(7, 4, 'ar', 'متدرب', '2025-06-01'),
(8, 4, 'en', 'intern', '2025-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` int(11) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `lang`, `name`, `date_added`, `added_by`) VALUES
(1, 'en', 'English', '2024-12-31 10:20:17', 1),
(2, 'ar', 'Arabic', '2024-12-31 11:28:19', 1),
(4, 'fr', 'frinche', '2024-12-31 11:36:52', 1),
(5, 'fr', 'frinche', '2024-12-31 11:50:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `code` longtext NOT NULL,
  `dial_code` varchar(5) NOT NULL,
  `open_location` enum('true','false') DEFAULT 'true',
  `password` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `exp_years` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `jop_times` text DEFAULT NULL,
  `jop_titles` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `img`, `email`, `mobile`, `code`, `dial_code`, `open_location`, `password`, `birth_date`, `gender`, `exp_years`, `country`, `jop_times`, `jop_titles`) VALUES
(9, 'Test User', NULL, 'test@example.com', '1234567890', '', '+20', 'true', '$2y$10$tr9PV0hObIK7smw8F2ZQPOEv9EHN.tPz2Tqm3uvti1zaHfELiCVWa', '1990-01-01', NULL, 3, 'Egypt', ',1,2,3,', ',1,2,3,');

-- --------------------------------------------------------

--
-- Table structure for table `users_login`
--

CREATE TABLE `users_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_login`
--

INSERT INTO `users_login` (`id`, `user_id`, `login_date`) VALUES
(1, 1, '2024-12-06 21:52:18'),
(2, 2, '2024-12-09 12:52:15'),
(3, 1, '2024-12-09 12:53:37'),
(4, 1, '2024-12-09 12:53:49'),
(5, 2, '2024-12-09 12:54:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_secrit_keys`
--
ALTER TABLE `api_secrit_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `secritkey` (`secrit_key`(70)) USING BTREE,
  ADD KEY `date_added` (`date_added`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jops`
--
ALTER TABLE `jops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jop_position`
--
ALTER TABLE `jop_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jop_timing`
--
ALTER TABLE `jop_timing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jop_timing_langs`
--
ALTER TABLE `jop_timing_langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jop_timing_id` (`jop_timing_id`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `dial_code` (`dial_code`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `img` (`img`),
  ADD KEY `email` (`email`),
  ADD KEY `open_location` (`open_location`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `users_login`
--
ALTER TABLE `users_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_secrit_keys`
--
ALTER TABLE `api_secrit_keys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jops`
--
ALTER TABLE `jops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jop_position`
--
ALTER TABLE `jop_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `jop_timing`
--
ALTER TABLE `jop_timing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jop_timing_langs`
--
ALTER TABLE `jop_timing_langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users_login`
--
ALTER TABLE `users_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jop_timing_langs`
--
ALTER TABLE `jop_timing_langs`
  ADD CONSTRAINT `jop_timing_langs_ibfk_1` FOREIGN KEY (`jop_timing_id`) REFERENCES `jop_timing` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
