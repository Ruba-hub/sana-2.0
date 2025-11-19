-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2025 at 06:31 PM
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
('14fdf9d1-c45d-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 12:00:51', '2025-11-18 12:00:51'),
('1e623b00-c51f-11f0-91f9-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-19 11:09:49', '2025-11-19 11:09:49'),
('3ef36011-c483-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 16:34:02', '2025-11-18 16:34:02'),
('5f754e69-c47d-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 15:51:59', '2025-11-18 15:51:59'),
('9176c978-c47c-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 15:46:14', '2025-11-18 15:46:14'),
('91de9cc1-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:41:49', '2025-11-18 14:41:49'),
('91e5c3b3-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:41:49', '2025-11-18 14:41:49'),
('a4a4cb29-c473-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 14:42:21', '2025-11-18 14:42:21'),
('b89bd8ab-c45c-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 11:58:16', '2025-11-18 11:58:16'),
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
('0dcfffc1-c45d-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 12:00:39', NULL),
('14ffa711-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'Thanks for sharing! How are you feeling after that?', NULL, 0, NULL, '2025-11-18 12:00:51', NULL),
('1d09c5af-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:33:05', NULL),
('1e663f46-c51f-11f0-91f9-040e3cd25f75', '1e623b00-c51f-11f0-91f9-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-19 11:09:49', NULL),
('211f5bda-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:33:12', NULL),
('26f50862-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'You’re very welcome! If there’s anything on your mind or any stress you want to talk through, I’m here to listen. How are you feeling today?', NULL, 0, NULL, '2025-11-18 12:01:21', NULL),
('34991dfd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'user', 'im feeling sad and overwhelmed', NULL, 0, NULL, '2025-11-18 12:16:03', NULL),
('369a89bd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling this way. It sounds really tough to be overwhelmed and sad at the same time. Would you like to share what\'s been on your mind lately?', NULL, 0, NULL, '2025-11-18 12:16:06', NULL),
('3ef3d171-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:34:02', NULL),
('430a4556-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:34:09', NULL),
('5f76caf8-c47d-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:51:59', NULL),
('917a81ac-c47c-11f0-99c8-040e3cd25f75', '9176c978-c47c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:46:14', NULL),
('91e172eb-c473-11f0-99c8-040e3cd25f75', '91de9cc1-c473-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('91e751b0-c473-11f0-99c8-040e3cd25f75', '91e5c3b3-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('a4a55938-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:42:21', NULL),
('a61fa91b-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there something on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 14:42:23', NULL),
('aa3d2acd-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'yes', NULL, 0, NULL, '2025-11-18 14:42:30', NULL),
('ab26eec2-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I’m here for you. What’s been going on lately that’s on your mind?', NULL, 0, NULL, '2025-11-18 14:42:32', NULL),
('ae634f47-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'im stressed', NULL, 0, NULL, '2025-11-18 14:42:37', NULL),
('af4d0c88-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling stressed right now. It can really weigh on you. Would you like to share what\'s been making you feel this way?', NULL, 0, NULL, '2025-11-18 14:42:38', NULL),
('b89c59a3-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 11:58:16', NULL),
('bb1378ae-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Hey! It’s good to hear from you. How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 11:58:20', NULL),
('c2dfb097-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 11:58:33', NULL),
('f96fdfaf-c477-11f0-99c8-040e3cd25f75', 'f96e8ebb-c477-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 15:13:21', NULL),
('fac20fe9-c477-11f0-99c8-040e3cd25f75', 'f96e8ebb-c477-11f0-99c8-040e3cd25f75', 'sana', 'Hello again! How\'s your day going so far? Anything you\'d like to share or talk about?', NULL, 0, NULL, '2025-11-18 15:13:23', NULL);

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
('40d1e2dd-c45b-11f0-99c8-040e3cd25f75', 'abdelkalik.ruba@studmc.kiu.ac.ug', 'Ruba Imam', 'student', '$2y$10$UUkDW.6TbC4AZ/XT3jJXruLwYc51Z54ROZHJtPgm7e1cgQByp4DDa', '2025-11-18 11:47:45', NULL);

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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment_id` (`attachment_id`),
  ADD KEY `idx_messages_conv_time` (`conversation_id`,`created_at`),
  ADD KEY `idx_messages_conv_seq` (`conversation_id`,`seq`);

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
