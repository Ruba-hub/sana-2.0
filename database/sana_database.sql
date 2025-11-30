-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2025 at 10:39 PM
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
-- Database: `sana`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` char(36) NOT NULL,
  `conversation_id` char(36) DEFAULT NULL,
  `uploader_id` char(36) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `mime` varchar(128) DEFAULT NULL,
  `size_bytes` bigint(20) DEFAULT NULL,
  `duration_seconds` double DEFAULT NULL,
  `checksum` varchar(128) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `conversation_id`, `uploader_id`, `url`, `mime`, `size_bytes`, `duration_seconds`, `checksum`, `created_at`) VALUES
('1b855b3e-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b03146c761.83619692.webm', 'audio/webm', 10922, NULL, NULL, '2025-11-27 23:10:25'),
('37332b6d-cbc7-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a64eb60d15.67261798.webm', 'audio/webm', 44732, NULL, NULL, '2025-11-27 22:28:14'),
('391e4072-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b062e58f46.50404208.webm', 'audio/webm', 791482, NULL, NULL, '2025-11-27 23:11:14'),
('3c472ec5-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929bb28c4fc89.41615354.webm', 'audio/webm', 51494, NULL, NULL, '2025-11-28 18:09:28'),
('3d849b01-cbcf-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b3c54e71d5.45577380.webm', 'audio/webm', 55358, NULL, NULL, '2025-11-27 23:25:41'),
('420378d3-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929bb3269b059.85959847.mp3', 'audio/mpeg', 224907, NULL, NULL, '2025-11-28 18:09:38'),
('4255c594-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929914189da37.21432203.webm', 'audio/webm', 32174, NULL, NULL, '2025-11-28 15:10:41'),
('45f7b3f4-cbac-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', '7385ca65-cba6-11f0-9694-040e3cd25f75', 'php/uploads/audio_69287919ac43b3.17639325.webm', 'audio/webm', 29276, NULL, NULL, '2025-11-27 19:15:21'),
('485064ec-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929914b928ee1.12784106.mp3', 'audio/mpeg', 114147, NULL, NULL, '2025-11-28 15:10:51'),
('536579f7-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a3230e6558.18197261.webm', 'audio/webm', 53426, NULL, NULL, '2025-11-27 22:14:43'),
('57cd72df-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692a06cd53f035.17059910.webm', 'audio/webm', 53426, NULL, NULL, '2025-11-28 23:32:13'),
('5a2d22c2-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928baab5ddb37.60352007.webm', 'audio/webm', 25412, NULL, NULL, '2025-11-27 23:55:07'),
('5bcc31c8-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b09d1f6ab9.66288563.webm', 'audio/webm', 80474, NULL, NULL, '2025-11-27 23:12:13'),
('5dedcb41-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928bab1a71319.01002499.mp3', 'audio/mpeg', 46020, NULL, NULL, '2025-11-27 23:55:13'),
('5e8f626c-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692a06d8ab3c00.62418108.mp3', 'audio/mpeg', 156779, NULL, NULL, '2025-11-28 23:32:24'),
('614c92c1-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b0a6574825.70981121.webm', 'audio/webm', 54392, NULL, NULL, '2025-11-27 23:12:22'),
('630eabae-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a33d514e17.14416689.webm', 'audio/webm', 72746, NULL, NULL, '2025-11-27 22:15:09'),
('685cc7a3-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a3463914b0.45249193.webm', 'audio/webm', 45698, NULL, NULL, '2025-11-27 22:15:18'),
('6dfd5f16-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692a06f28ed232.87259372.webm', 'audio/webm', 116216, NULL, NULL, '2025-11-28 23:32:50'),
('6e053d21-ce1f-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692c954b3bc8f9.61939266.webm', 'audio/webm', 53426, NULL, NULL, '2025-11-30 22:04:43'),
('7495063d-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929b9d9b334a7.84387169.webm', 'audio/webm', 64052, NULL, NULL, '2025-11-28 18:03:53'),
('7526d009-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692a06fe93c545.18848463.mp3', 'audio/mpeg', 242879, NULL, NULL, '2025-11-28 23:33:02'),
('76cf1852-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b0ca6cbcb9.13652642.webm', 'audio/webm', 100760, NULL, NULL, '2025-11-27 23:12:58'),
('76e5e6d6-ce1f-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692c955a246fd8.14984166.mp3', 'audio/mpeg', 117909, NULL, NULL, '2025-11-30 22:04:58'),
('7b99bf88-cc55-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692994fc9c5ad0.86817787.webm', 'audio/webm', 37004, NULL, NULL, '2025-11-28 15:26:36'),
('7e951d35-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b0d7771ea0.85919819.mp3', 'audio/mpeg', 293452, NULL, NULL, '2025-11-27 23:13:11'),
('8136cc45-cc55-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692995060e6a79.34239116.mp3', 'audio/mpeg', 114147, NULL, NULL, '2025-11-28 15:26:46'),
('870438c3-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b79b9863d5.09452146.webm', 'audio/webm', 66950, NULL, NULL, '2025-11-27 23:42:03'),
('8d49a7a2-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b7a623aff2.38616641.mp3', 'audio/mpeg', 222817, NULL, NULL, '2025-11-27 23:42:14'),
('92f2beee-cbad-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', '7385ca65-cba6-11f0-9694-040e3cd25f75', 'php/uploads/audio_69287b48577083.93000685.webm', 'audio/webm', 31208, NULL, NULL, '2025-11-27 19:24:40'),
('96966483-cbc4-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a1e6445aa8.65536032.webm', 'audio/webm', 43766, NULL, NULL, '2025-11-27 22:09:26'),
('9b7e9486-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929ba1b0f4293.63037804.webm', 'audio/webm', 14786, NULL, NULL, '2025-11-28 18:04:59'),
('afb69e75-cbcb-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928adcee0fca0.66888078.webm', 'audio/webm', 39902, NULL, NULL, '2025-11-27 23:00:14'),
('b5382e43-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928aa7d287276.10458496.webm', 'audio/webm', 39902, NULL, NULL, '2025-11-27 22:46:05'),
('b5e909fa-cbcb-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928add94ddd18.87881011.mp3', 'audio/mpeg', 208606, NULL, NULL, '2025-11-27 23:00:25'),
('b8d65312-cbd2-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b99cac5dc9.59997524.webm', 'audio/webm', 56324, NULL, NULL, '2025-11-27 23:50:36'),
('bb682887-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928aa878536f8.38659832.mp3', 'audio/mpeg', 151346, NULL, NULL, '2025-11-27 22:46:15'),
('beeff4f1-cbd2-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b9a6e52fe1.96734943.mp3', 'audio/mpeg', 178931, NULL, NULL, '2025-11-27 23:50:46'),
('c105859d-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929b8ac7f8765.04250073.webm', 'audio/webm', 27344, NULL, NULL, '2025-11-28 17:58:52'),
('c3b76909-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b14b73dc93.66093083.webm', 'audio/webm', 35072, NULL, NULL, '2025-11-27 23:15:07'),
('d4ed89f0-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692992377cc869.10475403.webm', 'audio/webm', 29276, NULL, NULL, '2025-11-28 15:14:47'),
('d88c5723-cbc6-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928a5afe76028.59662962.webm', 'audio/webm', 79508, NULL, NULL, '2025-11-27 22:25:35'),
('db808d5b-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_69299242839f54.25489251.mp3', 'audio/mpeg', 151346, NULL, NULL, '2025-11-28 15:14:58'),
('de9387a3-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928afcb09e0c8.63575006.webm', 'audio/webm', 50528, NULL, NULL, '2025-11-27 23:08:43'),
('e0419de9-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929bc3bdd46b8.90561351.webm', 'audio/webm', 31208, NULL, NULL, '2025-11-28 18:14:03'),
('e14314f0-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', '7385ca65-cba6-11f0-9694-040e3cd25f75', 'php/uploads/audio_69287870a3e349.23435475.webm', 'audio/webm', 55358, NULL, NULL, '2025-11-27 19:12:32'),
('e24c9f01-cc57-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_69299903e464d0.49252369.webm', 'audio/webm', 39902, NULL, NULL, '2025-11-28 15:43:47'),
('e851010a-cc57-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929990e07c4d8.22216458.mp3', 'audio/mpeg', 72769, NULL, NULL, '2025-11-28 15:43:58'),
('eba635ca-ce05-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_692c6a7f1fee78.50436756.webm', 'audio/webm', 35072, NULL, NULL, '2025-11-30 19:02:07'),
('ef159f04-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929baa748ba73.31022268.webm', 'audio/webm', 28310, NULL, NULL, '2025-11-28 18:07:19'),
('f24a5e26-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928b3471af359.38643079.webm', 'audio/webm', 8000283, NULL, NULL, '2025-11-27 23:23:35'),
('f5c474ec-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929ad46839c68.54746862.webm', 'audio/webm', 22514, NULL, NULL, '2025-11-28 17:10:14'),
('f9d9e20c-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928ac9dc4ea36.97432442.webm', 'audio/webm', 43766, NULL, NULL, '2025-11-27 22:55:09'),
('fad17737-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929ad4f03d931.45215516.mp3', 'audio/mpeg', 148420, NULL, NULL, '2025-11-28 17:10:23'),
('feb6cce0-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6929bac17e6e52.50093762.webm', 'audio/webm', 30242, NULL, NULL, '2025-11-28 18:07:45'),
('ffdda66d-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'php/uploads/audio_6928aca7db1e66.54421977.mp3', 'audio/mpeg', 234520, NULL, NULL, '2025-11-27 22:55:19');

--
-- Triggers `attachments`
--
DELIMITER $$
CREATE TRIGGER `attach_before_insert` BEFORE INSERT ON `attachments` FOR EACH ROW BEGIN
  IF NEW.id IS NULL OR NEW.id = '' THEN
    SET NEW.id = UUID();
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `state` enum('active','closed') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `title`, `state`, `created_at`, `updated_at`) VALUES
('02f4075c-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:34:05', '2025-11-24 18:34:05'),
('12a1d598-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:41:41', '2025-11-24 18:41:41'),
('14fdf9d1-c45d-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 12:00:51', '2025-11-18 12:00:51'),
('1bd59d1c-cbd3-11f0-9694-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-27 23:53:22', '2025-11-27 23:53:22'),
('1e623b00-c51f-11f0-91f9-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-19 11:09:49', '2025-11-19 11:09:49'),
('26628c71-cc53-11f0-a05b-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-28 15:09:54', '2025-11-28 15:09:54'),
('2af24413-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:42:22', '2025-11-24 18:42:22'),
('3ab412a3-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:42:48', '2025-11-24 18:42:48'),
('3ef36011-c483-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 16:34:02', '2025-11-18 16:34:02'),
('576f536c-cd2a-11f0-88c0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-29 16:50:18', '2025-11-29 16:50:18'),
('5865878b-c92b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 14:47:25', '2025-11-24 14:47:25'),
('5f754e69-c47d-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 15:51:59', '2025-11-18 15:51:59'),
('60972d39-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:36:42', '2025-11-24 18:36:42'),
('7506a4a4-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:37:17', '2025-11-24 18:37:17'),
('8397649c-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-25 18:07:52', '2025-11-25 18:07:52'),
('87ed64c7-ca10-11f0-9183-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-25 18:07:59', '2025-11-25 18:07:59'),
('9176c978-c47c-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 15:46:14', '2025-11-18 15:46:14'),
('91de9cc1-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:41:49', '2025-11-18 14:41:49'),
('91e5c3b3-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:41:49', '2025-11-18 14:41:49'),
('a4a4cb29-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:42:21', '2025-11-18 14:42:21'),
('a653cdcd-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:45:49', '2025-11-24 18:45:49'),
('b77f7cd7-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:39:08', '2025-11-24 18:39:08'),
('b89bd8ab-c45c-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 11:58:16', '2025-11-18 11:58:16'),
('bc926bef-c92b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 14:50:13', '2025-11-24 14:50:13'),
('cfb283f9-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:39:49', '2025-11-24 18:39:49'),
('dee33122-c94f-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 19:08:52', '2025-11-24 19:08:52'),
('e3fae0da-c950-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 19:16:10', '2025-11-24 19:16:10'),
('ee604ae0-cba6-11f0-9694-040e3cd25f75', '7385ca65-cba6-11f0-9694-040e3cd25f75', NULL, 'active', '2025-11-27 18:37:07', '2025-11-27 18:37:07'),
('f7ded2d5-c92a-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 14:44:43', '2025-11-24 14:44:43'),
('f96e8ebb-c477-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 15:13:21', '2025-11-18 15:13:21');

--
-- Triggers `conversations`
--
DELIMITER $$
CREATE TRIGGER `conv_before_insert` BEFORE INSERT ON `conversations` FOR EACH ROW BEGIN
  IF NEW.id IS NULL OR NEW.id = '' THEN
    SET NEW.id = UUID();
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `tags` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `user_id`, `title`, `content`, `tags`, `created_at`, `updated_at`) VALUES
(1, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'I lost my wallet today', 'I lost my wallet today and it was a bad day...', NULL, '2025-11-26 00:00:00', NULL),
(2, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'How I’m Feeling', 'Today felt slower than usual. I wasn’t super motivated in the morning, but once I started working on my tasks, things got easier. I noticed I was overthinking a bit, but I managed to calm down by taking breaks and breathing.', NULL, '2025-11-26 00:00:00', NULL),
(3, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'A calm and productive day', 'Today felt surprisingly calm. I managed to stay focused on my tasks without feeling rushed, and I took a few small breaks that helped me stay balanced. I wasn’t super energetic, but I felt steady and present. I’m glad I kept a good rhythm today, and I hope I can keep it going tomorrow.', NULL, '2025-11-29 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` char(36) NOT NULL,
  `conversation_id` char(36) NOT NULL,
  `sender` enum('user','sana','system') NOT NULL,
  `content` text DEFAULT NULL,
  `attachment_id` char(36) DEFAULT NULL,
  `is_audio` tinyint(1) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `seq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender`, `content`, `attachment_id`, `is_audio`, `metadata`, `created_at`, `seq`) VALUES
('00bb2bc7-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:07:48', NULL),
('02f7631d-c94b-11f0-90a0-040e3cd25f75', '02f4075c-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:34:05', NULL),
('04e1a78c-c94b-11f0-90a0-040e3cd25f75', '02f4075c-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-24 18:34:08', NULL),
('051a8674-cbd3-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:52:44', NULL),
('05c1e99f-cbd3-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Anything on your mind that you\'d like to talk about? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:52:45', NULL),
('07022b93-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'i fell hungry', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:48:22', NULL),
('083a4d03-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'It’s totally normal to feel hungry, especially if you’ve been busy or stressed with your studies. Taking a nutritious break might help you feel more energized and focused. Have you had a chance to eat something today?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:48:24', NULL),
('0d5bd981-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'today i found out my friend  and my boyfriend were dating', NULL, 0, NULL, '2025-11-27 18:37:59', NULL),
('0dcfffc1-c45d-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 12:00:39', NULL),
('0e6b8dd8-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'That sounds really painful and confusing to find out. It’s completely okay to feel hurt or upset about this. Would you like to talk more about what you’re feeling right now?', NULL, 0, NULL, '2025-11-27 18:38:01', NULL),
('12a334d6-c94c-11f0-90a0-040e3cd25f75', '12a1d598-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:41:41', NULL),
('13fb7d54-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:03:03', NULL),
('1410aeaa-c94c-11f0-90a0-040e3cd25f75', '12a1d598-c94c-11f0-90a0-040e3cd25f75', 'sana', 'I’m here for you. Is there something on your mind you’d like to talk about today?', NULL, 0, NULL, '2025-11-24 18:41:43', NULL),
('14606372-cdee-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'user', 'its going well', NULL, 0, '{\"type\":\"text\"}', '2025-11-30 16:11:27', NULL),
('14ed78aa-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"output_text\":\"Hi there! How are you feeling today? Is there anything on your mind that you\'d like to talk about?\",\"output_audio_base64\":\"Hi there! How are you feeling today? Is there anything on your mind that you\'d like to talk about?\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:03:04', NULL),
('14ffa711-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'Thanks for sharing! How are you feeling after that?', NULL, 0, NULL, '2025-11-18 12:00:51', NULL),
('15cfc822-c92b-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:45:33', NULL),
('160d23b1-c92b-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-24 14:45:33', NULL),
('16682222-cdee-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'sana', 'I’m glad to hear that things are going well! What’s been the best part of your week so far?', NULL, 0, '{\"type\":\"text\"}', '2025-11-30 16:11:30', NULL),
('1af8abc1-cdf8-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-30 17:23:13', NULL),
('1b86576b-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '1b855b3e-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:10:25', NULL),
('1cb289b8-cdf8-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'sana', 'Hello! It\'s nice to hear from you. How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, '{\"type\":\"text\"}', '2025-11-30 17:23:16', NULL),
('1d09c5af-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:33:05', NULL),
('1e663f46-c51f-11f0-91f9-040e3cd25f75', '1e623b00-c51f-11f0-91f9-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-19 11:09:49', NULL),
('20fc3426-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"mimeType\":\"audio/opus\",\"fileType\":\"audio\",\"fileExtension\":\"opus\",\"fileName\":\"audio.opus\",\"id\":\"filesystem-v2:workflows/TSebro4bswvasynP/executions/92/binary_data/290ada6d-2417-4982-8c44-bf7736cd4c73\",\"fileSize\":\"62.1 kB\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:10:34', NULL),
('211f5bda-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:33:12', NULL),
('23725ad2-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'i want to kill myself ,why did thye hurt me , she was my besrfriend', NULL, 0, NULL, '2025-11-27 18:38:36', NULL),
('238e35aa-cd2b-11f0-88c0-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-29 16:56:01', NULL),
('248f8974-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'I’m really sorry you’re feeling this way. It sounds incredibly painful to feel hurt by someone you trusted so much. You don’t have to face this alone—could you reach out to a trusted person or counselor who can support you right now? I’m here to listen if you want to talk more about what happened.', NULL, 0, NULL, '2025-11-27 18:38:38', NULL),
('24a36c76-cd2b-11f0-88c0-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'sana', 'Hey again! It’s okay to just say hi. How’s everything going for you right now?', NULL, 0, '{\"type\":\"text\"}', '2025-11-29 16:56:03', NULL),
('26f50862-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'You’re very welcome! If there’s anything on your mind or any stress you want to talk through, I’m here to listen. How are you feeling today?', NULL, 0, NULL, '2025-11-18 12:01:21', NULL),
('2af33619-c94c-11f0-90a0-040e3cd25f75', '2af24413-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:42:22', NULL),
('2bfaeab9-cbaa-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like something might be on your mind. Would you like to share a bit about what you’re feeling right now?', NULL, 0, NULL, '2025-11-27 19:00:19', NULL),
('2c28d3bf-c94c-11f0-90a0-040e3cd25f75', '2af24413-c94c-11f0-90a0-040e3cd25f75', 'sana', 'Hello! It’s okay to start small. What’s one thing on your mind right now?', NULL, 0, NULL, '2025-11-24 18:42:24', NULL),
('2ccdbb39-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'how are you Sana?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 15:10:05', NULL),
('2e49fc33-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:53:53', NULL),
('2ea0b21f-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-26 13:46:36', NULL),
('2ea26410-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Thanks for asking! I\'m here and ready to support you. How are you doing today? Is there anything on your mind you\'d like to chat about? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 15:10:08', NULL),
('2fa36342-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', 'sana', 'Hello again! I\'m here to listen. Is there something you\'d like to share or chat about? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:53:56', NULL),
('30681f59-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Hi there! It’s good to hear from you. How are you feeling today?', NULL, 0, NULL, '2025-11-26 13:46:39', NULL),
('34991dfd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'user', 'im feeling sad and overwhelmed', NULL, 0, NULL, '2025-11-18 12:16:03', NULL),
('3650eecd-cbaa-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like you’ve been really worn out. It’s okay to take a break and rest when you need to. Would you like to share what’s been making you feel so tired lately?', NULL, 0, NULL, '2025-11-27 19:00:36', NULL),
('369a89bd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling this way. It sounds really tough to be overwhelmed and sad at the same time. Would you like to share what\'s been on your mind lately?', NULL, 0, NULL, '2025-11-18 12:16:06', NULL),
('3733c9aa-cbc7-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '37332b6d-cbc7-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:28:14', NULL),
('391ec9ab-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '391e4072-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:11:14', NULL),
('3ab53701-c94c-11f0-90a0-040e3cd25f75', '3ab412a3-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:42:48', NULL),
('3b6e3d12-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'how do i ask my friend to stop cheating?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 15:10:29', NULL),
('3c487166-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '3c472ec5-cc6c-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:09:28', NULL),
('3c4c13cc-c94c-11f0-90a0-040e3cd25f75', '3ab412a3-c94c-11f0-90a0-040e3cd25f75', 'sana', 'Hi again! Sometimes just saying hi can be a way to check in with yourself. How are you feeling in this moment?', NULL, 0, NULL, '2025-11-24 18:42:51', NULL),
('3d27206d-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'That sounds like a really tricky situation to be in. It’s hard when someone you care about is making choices that could hurt them or others. Maybe try approaching your friend gently, sharing your concerns honestly without sounding confrontational. How do you think your friend might respond if you talked to them about it? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 15:10:32', NULL),
('3d8598e5-cbcf-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '3d849b01-cbcf-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:25:41', NULL),
('3ef3d171-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:34:02', NULL),
('3f7beeee-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'i saw them eating my favourite meal in my resturant', NULL, 0, NULL, '2025-11-27 18:39:23', NULL),
('40adcf52-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:31:34', NULL),
('412b857a-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'That sounds really disappointing and frustrating to see. It’s tough when something you care about feels taken or overlooked. Do you want to talk more about what happened or how you’re feeling about it?', NULL, 0, NULL, '2025-11-27 18:39:26', NULL),
('42043633-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, '420378d3-cc6c-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:09:38', NULL),
('420d480f-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:31:36', NULL),
('4219b592-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: signal is aborted without reason', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:11:30', NULL),
('4256f20f-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '4255c594-cc53-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:10:41', NULL),
('4288360f-cbcf-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'I’m here for you. Could you tell me a bit more about what’s feeling difficult right now? That way, I can try to help in the best way possible.', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:25:49', NULL),
('430a4556-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:34:09', NULL),
('43366535-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'im hungry', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:04:22', NULL),
('444944c0-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"output_text\":\"Feeling hungry during study or busy days is pretty common! Maybe a small, healthy snack could help boost your energy without making you feel sluggish. Do you often find hunger affecting your focus or mood during your day?\",\"output_audio_base64\":\"\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:04:24', NULL),
('45fa7eba-cbac-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', NULL, '45f7b3f4-cbac-11f0-9694-040e3cd25f75', 1, NULL, '2025-11-27 19:15:21', NULL),
('4851754c-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, '485064ec-cc53-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:10:51', NULL),
('4a39e6dd-cbac-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like you might be feeling a bit hungry. Sometimes eating can also be a way to cope with stress or distractions. Are you feeling a bit overwhelmed or stressed right now, or is it just regular hunger?', NULL, 0, NULL, '2025-11-27 19:15:28', NULL),
('531f6d31-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'i wanted to gun them down those assholes were fooling me for 10 years', NULL, 0, NULL, '2025-11-27 18:39:56', NULL),
('5336e78e-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'what should i do?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:11:58', NULL),
('5365e76a-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '536579f7-cbc5-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:14:43', NULL),
('53eb8801-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'It sounds like you’re feeling a bit unsure or overwhelmed right now. Would you like to tell me a bit more about what’s going on? That way, I can try to help you better.', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:11:59', NULL),
('5432b7e6-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'I\'m really sorry you\'re feeling this way. It sounds like you\'re going through a very intense and painful time. Remember, you\'re not alone — it might help to talk to a trusted friend, family member, or a university counsellor about these feelings. Can you tell me a bit more about what\'s been happening?', NULL, 0, NULL, '2025-11-27 18:39:58', NULL),
('57d01f57-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '57cd72df-cc99-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 23:32:13', NULL),
('58663020-c92b-11f0-90a0-040e3cd25f75', '5865878b-c92b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:47:25', NULL),
('59be5f26-c92b-11f0-90a0-040e3cd25f75', '5865878b-c92b-11f0-90a0-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-24 14:47:27', NULL),
('5a2e0e9e-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', 'user', NULL, '5a2d22c2-cbd3-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:55:07', NULL),
('5a47f07d-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'yes', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:05:01', NULL),
('5ad0e4c2-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"output_text\":\"I’m here to listen. What’s been on your mind lately?\",\"output_audio_base64\":\"I’m here to listen. What’s been on your mind lately?\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:05:01', NULL),
('5bccf08d-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '5bcc31c8-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:12:13', NULL),
('5c09cc96-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:12:13', NULL),
('5dee909c-cbd3-11f0-9694-040e3cd25f75', '1bd59d1c-cbd3-11f0-9694-040e3cd25f75', 'sana', NULL, '5dedcb41-cbd3-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:55:13', NULL),
('5e90717c-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, '5e8f626c-cc99-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 23:32:24', NULL),
('5f76caf8-c47d-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:51:59', NULL),
('5fdb9d0e-cc64-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:13:12', NULL),
('608c4eba-cc64-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hello again! How’s your day going so far? Anything you want to share or chat about? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:13:13', NULL),
('6098e961-c94b-11f0-90a0-040e3cd25f75', '60972d39-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:36:42', NULL),
('614d422e-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '614c92c1-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:12:22', NULL),
('62020724-c94b-11f0-90a0-040e3cd25f75', '60972d39-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hello again! Sometimes it helps just to say hi. How’s your day going so far? Anything you\'d like to share?', NULL, 0, NULL, '2025-11-24 18:36:45', NULL),
('62a9f52e-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'I\'m really sorry you\'re feeling this way. You don’t have to go through this alone — it might help to talk to someone you trust, like a counsellor or a friend. Would you like me to help you find some support options right now?', NULL, 0, NULL, '2025-11-27 19:09:00', NULL),
('630f8c40-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '630eabae-cbc5-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:15:09', NULL),
('63502aea-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:15:09', NULL),
('66af7f98-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"mimeType\":\"audio/opus\",\"fileType\":\"audio\",\"fileExtension\":\"opus\",\"fileName\":\"audio.opus\",\"id\":\"filesystem-v2:workflows/TSebro4bswvasynP/executions/95/binary_data/98a7e04d-907d-4227-b754-8c47f20ba689\",\"fileSize\":\"71.9 kB\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:12:31', NULL),
('685d51bf-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '685cc7a3-cbc5-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:15:18', NULL),
('6bfc455d-cc97-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hey', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:18:28', NULL),
('6c17c282-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'yes', NULL, 0, NULL, '2025-11-27 19:09:16', NULL),
('6da7deb4-cc97-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hey there! How are you feeling today? Anything on your mind that you\'d like to talk about?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:18:31', NULL),
('6db34002-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'Hey there! I’m here to listen—what’s on your mind today? Is something feeling a bit overwhelming or stressful?', NULL, 0, NULL, '2025-11-27 19:09:18', NULL),
('6dff2f48-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '6dfd5f16-cc99-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 23:32:50', NULL),
('6e094ca5-ce1f-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'user', NULL, '6e053d21-ce1f-11f0-8623-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-30 22:04:43', NULL),
('7018cfe7-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'what should i do to avoid hurting them bitches', NULL, 0, NULL, '2025-11-27 18:40:44', NULL),
('70f0446d-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like you might be feeling upset or frustrated right now. I\'m here to help you work through those feelings in a way that doesn\'t hurt anyone, including yourself. Would you like to talk more about what\'s been bothering you?', NULL, 0, NULL, '2025-11-27 18:40:46', NULL),
('749aec91-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '7495063d-cc6b-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:03:53', NULL),
('74d96df1-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:03:54', NULL),
('750863bf-c94b-11f0-90a0-040e3cd25f75', '7506a4a4-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:37:17', NULL),
('75280a66-cc99-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, '7526d009-cc99-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 23:33:02', NULL),
('76286a6c-c94b-11f0-90a0-040e3cd25f75', '7506a4a4-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hey! I’m here whenever you want to chat. What’s been on your mind lately?', NULL, 0, NULL, '2025-11-24 18:37:19', NULL),
('76cfdb38-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '76cf1852-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:12:58', NULL),
('76e74c3c-ce1f-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'sana', NULL, '76e5e6d6-ce1f-11f0-8623-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-30 22:04:58', NULL),
('78be86bf-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'Everything is pilled up', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:41:39', NULL),
('7aec65e2-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'It sounds like things are really piling up for you right now, and that can feel so overwhelming. Would you like to share what\'s been the heaviest on your mind lately? Maybe we can find a way to lighten the load a bit together. ', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:41:43', NULL),
('7b9b96ee-cc55-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '7b99bf88-cc55-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:26:36', NULL),
('7e95b891-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, '7e951d35-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:13:11', NULL),
('7f1dc217-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'what a loser you are', NULL, 0, NULL, '2025-11-27 18:41:10', NULL),
('80424879-cba7-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like you might be feeling upset or frustrated right now. I\'m here to listen and support you—would you like to talk about what\'s on your mind?', NULL, 0, NULL, '2025-11-27 18:41:12', NULL),
('8137d12d-cc55-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, '8136cc45-cc55-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:26:46', NULL),
('8526f66a-c952-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'im extremely stressed with school', NULL, 0, NULL, '2025-11-24 19:27:50', NULL),
('868002b8-c952-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'I’m sorry to hear that school is feeling so overwhelming right now. It’s really common to feel stressed, especially when things pile up. Would you like to share what’s been the most challenging part for you lately?', NULL, 0, NULL, '2025-11-24 19:27:52', NULL),
('8704ff27-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '870438c3-cbd1-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:42:03', NULL),
('89fd3065-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:04:29', NULL),
('8b1dde5f-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:04:31', NULL),
('8be4241d-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'preparing for my final project', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:20:43', NULL),
('8d4a02ba-cbd1-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, '8d49a7a2-cbd1-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:42:14', NULL),
('906d93e5-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:20:50', NULL),
('917a81ac-c47c-11f0-99c8-040e3cd25f75', '9176c978-c47c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:46:14', NULL),
('91e172eb-c473-11f0-99c8-040e3cd25f75', '91de9cc1-c473-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('91e751b0-c473-11f0-99c8-040e3cd25f75', '91e5c3b3-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('92f42c0d-cbad-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', NULL, '92f2beee-cbad-11f0-9694-040e3cd25f75', 1, NULL, '2025-11-27 19:24:40', NULL),
('969ab813-cbc4-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, '96966483-cbc4-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:09:26', NULL),
('97d31847-cbad-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'It sounds like you’re signing off for now. If you ever want to talk again or need support, I’m here for you. Take care of yourself—what’s one small thing you might do today to feel a bit better?', NULL, 0, NULL, '2025-11-27 19:24:48', NULL),
('9b7f48a3-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, '9b7e9486-cc6b-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:04:59', NULL),
('9c4e3518-cbc4-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'I’m sorry you’re feeling this way. It’s okay to feel sad sometimes, and you’re not alone in this. Would you like to share what’s been on your mind lately?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:09:35', NULL),
('9c6ab5f5-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:57:51', NULL),
('9ca63b5a-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:57:51', NULL),
('9f724066-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hi there! It’s nice to hear from you. How are you feeling today?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:05:05', NULL),
('a2e698f1-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'i dont want to talk about it', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:16:56', NULL),
('a41af52f-cbc5-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'That’s okay — you don’t have to share if you’re not ready. Sometimes just knowing someone’s here can help. Would it feel better to talk about something lighter, or maybe I can share some ways to help you feel a bit more relaxed?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:16:58', NULL),
('a4a55938-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:42:21', NULL),
('a5754d94-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:58:06', NULL),
('a61fa91b-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there something on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 14:42:23', NULL),
('a6566b39-c94c-11f0-90a0-040e3cd25f75', 'a653cdcd-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:45:49', NULL),
('a71ab825-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:58:09', NULL),
('a861f7d6-c94c-11f0-90a0-040e3cd25f75', 'a653cdcd-c94c-11f0-90a0-040e3cd25f75', 'sana', 'I’m here with you. If you want, you can tell me what’s going on or how you’re feeling right now.', NULL, 0, NULL, '2025-11-24 18:45:52', NULL),
('aa3d2acd-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'yes', NULL, 0, NULL, '2025-11-18 14:42:30', NULL),
('ab26eec2-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I’m here for you. What’s been going on lately that’s on your mind?', NULL, 0, NULL, '2025-11-18 14:42:32', NULL),
('ac508f37-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'It sounds like your hunger is really distracting you right now. Sometimes when we\'re busy or stressed with studies, it’s easy to forget to eat properly. Do you think grabbing a quick, nourishing snack might help you feel a bit better?', NULL, 0, NULL, '2025-11-26 13:50:07', NULL),
('ae634f47-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'im stressed', NULL, 0, NULL, '2025-11-18 14:42:37', NULL),
('af4d0c88-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling stressed right now. It can really weigh on you. Would you like to share what\'s been making you feel this way?', NULL, 0, NULL, '2025-11-18 14:42:38', NULL),
('afb7a0a6-cbcb-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'afb69e75-cbcb-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:00:14', NULL),
('b2bff447-cd28-11f0-88c0-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-29 16:38:32', NULL),
('b4211ec3-cd28-11f0-88c0-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there something on your mind you\'d like to talk about?', NULL, 0, '{\"type\":\"text\"}', '2025-11-29 16:38:35', NULL),
('b538fb3a-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'b5382e43-cbc9-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:46:05', NULL),
('b5e97ed7-cbcb-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, 'b5e909fa-cbcb-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:00:25', NULL),
('b78028c9-c94b-11f0-90a0-040e3cd25f75', 'b77f7cd7-c94b-11f0-90a0-040e3cd25f75', 'user', 'im good how about you?', NULL, 0, NULL, '2025-11-24 18:39:08', NULL),
('b89c59a3-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 11:58:16', NULL),
('b8d710af-cbd2-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'b8d65312-cbd2-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:50:36', NULL),
('b92f2027-c94b-11f0-90a0-040e3cd25f75', 'b77f7cd7-c94b-11f0-90a0-040e3cd25f75', 'sana', 'I\'m glad to hear you\'re doing good! I\'m here to support you, so if there\'s anything on your mind—whether it\'s study stress, motivation, or just how you\'re feeling—I\'m all ears. How has your week been so far?', NULL, 0, NULL, '2025-11-24 18:39:11', NULL),
('bb1378ae-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Hey! It’s good to hear from you. How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 11:58:20', NULL),
('bb691580-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, 'bb682887-cbc9-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:46:15', NULL),
('bc9476c3-c92b-11f0-90a0-040e3cd25f75', 'bc926bef-c92b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:50:13', NULL),
('bdda5cb4-c92b-11f0-90a0-040e3cd25f75', 'bc926bef-c92b-11f0-90a0-040e3cd25f75', 'sana', 'Hey again! It’s okay if you just want to say hi. How’s your day going so far?', NULL, 0, NULL, '2025-11-24 14:50:15', NULL),
('bef129d9-cbd2-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, 'beeff4f1-cbd2-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:50:46', NULL),
('c106ade7-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'c105859d-cc6a-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 17:58:52', NULL),
('c2dfb097-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 11:58:33', NULL),
('c3b7debf-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'c3b76909-cbcd-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:15:07', NULL),
('c59b6e4e-cc6a-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hi there! It’s nice to hear from you. How are things going with your studies or life at the moment?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:59:00', NULL),
('c8ed08ee-cbcd-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '=It sounds like you might be feeling a bit uncertain right now. Would you like to share a bit more about what’s on your mind or what’s been challenging lately? That way, I can offer some support or ideas that might help.', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:15:16', NULL),
('cfb36392-c94b-11f0-90a0-040e3cd25f75', 'cfb283f9-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:39:49', NULL),
('d10c6059-c94b-11f0-90a0-040e3cd25f75', 'cfb283f9-c94b-11f0-90a0-040e3cd25f75', 'sana', 'I’m here to listen whenever you’re ready to share. How have things been for you lately?', NULL, 0, NULL, '2025-11-24 18:39:51', NULL),
('d211a4bb-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'stress', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:08:22', NULL),
('d37701d4-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"output_text\":\"It sounds like you\'re feeling stressed right now. That can be really tough to carry. Would you like to share a bit about what\'s been making you feel this way?\",\"output_audio_base64\":\"It sounds like you\'re feeling stressed right now. That can be really tough to carry. Would you like to share a bit about what\'s been making you feel this way?\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:08:24', NULL),
('d45046ac-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'yeah i had a fight with my teacher', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:46:57', NULL),
('d4eebdbf-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'd4ed89f0-cc53-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:14:47', NULL),
('d52fb6e9-cbc9-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 22:46:58', NULL),
('d88d6905-cbc6-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'd88c5723-cbc6-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:25:35', NULL),
('db81d5d7-cc53-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, 'db808d5b-cc53-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:14:58', NULL),
('dc3ad0b9-cc98-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'ive got some really stressful cats at home', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:28:46', NULL),
('dc8eadbf-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:06:48', NULL),
('dd58c3d6-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hello! I’m here for you. Sometimes just saying hi can be a small step. How are you feeling right now?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:06:49', NULL),
('de17bcb4-cc98-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'That sounds tough—having stressed-out cats can definitely add to your own stress. How are you coping with that situation right now?', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 23:28:49', NULL),
('de940cb7-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'de9387a3-cbcc-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:08:43', NULL),
('dee455c7-c94f-11f0-90a0-040e3cd25f75', 'dee33122-c94f-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 19:08:52', NULL),
('dfcdb189-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'how about now?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:23:04', NULL),
('e00a55e4-c94f-11f0-90a0-040e3cd25f75', 'dee33122-c94f-11f0-90a0-040e3cd25f75', 'sana', 'Hello! It’s okay if you’re not sure what to say yet. Whenever you feel ready, I’m here to listen. How are you doing today?', NULL, 0, NULL, '2025-11-24 19:08:54', NULL),
('e0456b75-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'e0419de9-cc6c-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:14:03', NULL),
('e0898da5-cc6c-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:14:04', NULL),
('e0901919-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'I’m here for you. How are you feeling right now? Is there something on your mind that you want to talk about?', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:23:05', NULL),
('e144a33e-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', NULL, 'e14314f0-cbab-11f0-9694-040e3cd25f75', 1, NULL, '2025-11-27 19:12:32', NULL),
('e24d405d-cc57-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'e24c9f01-cc57-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:43:47', NULL),
('e32a9f97-cbcc-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', '{\"output_text\":\"I\'m sorry to hear the exams are feeling so stressful. That pressure can really weigh on you. Would you like to share what\'s been the hardest part about preparing for your exams?\",\"output_audio_base64\":\"\"}', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:08:50', NULL),
('e3fbca5f-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 19:16:10', NULL),
('e50fbb31-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'Hi! I’m glad you’re here. Is there something on your mind you’d like to share or talk about?', NULL, 0, NULL, '2025-11-24 19:16:12', NULL),
('e5598ccf-cbab-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'يبدو أنك تريد تشجيع الناس على الاشتراك في قناتك! هل تشعر بأن إدارة القناة أو التواصل مع المتابعين يسبب لك بعض التوتر أو الضغط؟ كيف يمكنني مساعدتك في ذلك؟', NULL, 0, NULL, '2025-11-27 19:12:39', NULL),
('e8519e45-cc57-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, 'e851010a-cc57-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 15:43:58', NULL),
('e8555817-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'im tired', NULL, 0, NULL, '2025-11-24 19:16:18', NULL),
('e9f43ec4-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'I’m sorry to hear you’re feeling tired. That can be really draining, especially when you’ve got a lot going on. Is there something specific making you feel this way, like your workload or maybe lack of rest?', NULL, 0, NULL, '2025-11-24 19:16:20', NULL),
('eba76194-ce05-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'user', NULL, 'eba635ca-ce05-11f0-8623-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-30 19:02:07', NULL),
('ee61213c-cba6-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-27 18:37:07', NULL),
('eed95c94-ce05-11f0-8623-040e3cd25f75', '576f536c-cd2a-11f0-88c0-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-30 19:02:12', NULL),
('ef1724ed-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'ef159f04-cc6b-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:07:19', NULL),
('f02321ed-cba6-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind that you\'d like to talk about?', NULL, 0, NULL, '2025-11-27 18:37:10', NULL),
('f150acfb-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', 'hi', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:10:07', NULL),
('f24ac715-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'f24a5e26-cbce-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 23:23:35', NULL),
('f2f6ed94-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Hi there! It’s nice to hear from you. How are you feeling today? Anything on your mind you’d like to talk about? ', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 17:10:09', NULL),
('f5c5210c-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'f5c474ec-cc63-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 17:10:14', NULL),
('f5d58d97-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, '{\"type\":\"text\"}', '2025-11-28 18:07:30', NULL),
('f7a033c6-cba6-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'user', 'hello', NULL, 0, NULL, '2025-11-27 18:37:22', NULL),
('f7e02713-c92a-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'user', 'hello', NULL, 0, NULL, '2025-11-24 14:44:43', NULL),
('f89f0e9c-c92a-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-24 14:44:44', NULL),
('f8d1d787-cba6-11f0-9694-040e3cd25f75', 'ee604ae0-cba6-11f0-9694-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-27 18:37:24', NULL),
('f96fdfaf-c477-11f0-99c8-040e3cd25f75', 'f96e8ebb-c477-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 15:13:21', NULL),
('f9ab5cfc-cbce-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, '{\"type\":\"text\"}', '2025-11-27 23:23:47', NULL),
('f9da64bb-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', NULL, 'f9d9e20c-cbca-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:55:09', NULL),
('fac20fe9-c477-11f0-99c8-040e3cd25f75', 'f96e8ebb-c477-11f0-99c8-040e3cd25f75', 'sana', 'Hello again! How\'s your day going so far? Anything you\'d like to share or talk about?', NULL, 0, NULL, '2025-11-18 15:13:23', NULL),
('fad1e5b0-cc63-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'sana', NULL, 'fad17737-cc63-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 17:10:23', NULL),
('feb809c8-cc6b-11f0-a05b-040e3cd25f75', '26628c71-cc53-11f0-a05b-040e3cd25f75', 'user', NULL, 'feb6cce0-cc6b-11f0-a05b-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-28 18:07:45', NULL),
('ffde294f-cbca-11f0-9694-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', NULL, 'ffdda66d-cbca-11f0-9694-040e3cd25f75', 1, '{\"type\":\"audio\"}', '2025-11-27 22:55:19', NULL);

--
-- Triggers `messages`
--
DELIMITER $$
CREATE TRIGGER `messages_before_insert` BEFORE INSERT ON `messages` FOR EACH ROW BEGIN
  IF NEW.id IS NULL OR NEW.id = '' THEN
    SET NEW.id = UUID();
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mood_logs`
--

CREATE TABLE `mood_logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `mood` varchar(50) NOT NULL,
  `intensity` int(11) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mood_logs`
--

INSERT INTO `mood_logs` (`id`, `user_id`, `mood`, `intensity`, `tags`, `notes`, `timestamp`) VALUES
(1, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'happy', 6, 'relationship', '', '2025-11-29 05:50:00'),
(2, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'sad', 8, 'work', 'Too much stress', '2025-11-29 08:07:00'),
(3, '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'neutral', 5, 'work', '', '2025-11-29 08:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `email` varchar(320) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `display_name`, `role`, `password`, `created_at`, `last_seen`) VALUES
('40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'abdelkalik.ruba@studmc.kiu.ac.ug', 'Ruba Imam', 'student', '$2y$10$UUkDW.6TbC4AZ/XT3jJXruLwYc51Z54ROZHJtPgm7e1cgQByp4DDa', '2025-11-18 11:47:45', NULL),
('5f285259-cde1-11f0-8623-040e3cd25f75', 'pabloescobar02@gmail.com', 'Leena', 'student', '$2y$10$3wPi.yIhOrTad7IA9qM4P.8.iSDmRf8c9BLxZSx7dCe8q8y1UVJTa', '2025-11-30 14:40:29', NULL),
('7385ca65-cba6-11f0-9694-040e3cd25f75', 'dunyaimam5353@gmail.com', 'Dunya', 'student', '$2y$10$QHJb1vXaQ1oek98Hmvw6juvCyzMN/h9kP.zO80pu61xobno54rrD2', '2025-11-27 18:33:41', NULL),
('d81a7f3c-cd55-11f0-88c0-040e3cd25f75', 'rubaimam3@gmail.com', 'Ruba', 'admin', '$2b$12$kb.rZIEQEiwYMHnmSlBd/OOrYviw62Mx68kL0sJOeFsXFFXYZZOz6', '2025-11-29 22:01:42', NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `users_before_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
  IF NEW.id IS NULL OR NEW.id = '' THEN
    SET NEW.id = UUID();
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_logs`
--

CREATE TABLE `workflow_logs` (
  `id` char(36) NOT NULL,
  `conversation_id` char(36) DEFAULT NULL,
  `message_id` char(36) DEFAULT NULL,
  `request_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`request_payload`)),
  `response_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`response_payload`)),
  `response_text` longtext DEFAULT NULL,
  `response_content_type` varchar(128) DEFAULT NULL,
  `response_size` bigint(20) DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `latency_ms` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `workflow_logs`
--
DELIMITER $$
CREATE TRIGGER `workflow_logs_before_insert` BEFORE INSERT ON `workflow_logs` FOR EACH ROW BEGIN
  IF NEW.id IS NULL OR NEW.id = '' THEN
    SET NEW.id = UUID();
  END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploader_id` (`uploader_id`),
  ADD KEY `idx_attachments_conv` (`conversation_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conversations_user` (`user_id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment_id` (`attachment_id`),
  ADD KEY `idx_messages_conv_time` (`conversation_id`,`created_at`),
  ADD KEY `idx_messages_conv_seq` (`conversation_id`,`seq`);

--
-- Indexes for table `mood_logs`
--
ALTER TABLE `mood_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `workflow_logs`
--
ALTER TABLE `workflow_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `message_id` (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mood_logs`
--
ALTER TABLE `mood_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `fk_journal_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `workflow_logs`
--
ALTER TABLE `workflow_logs`
  ADD CONSTRAINT `workflow_logs_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `workflow_logs_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
