-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 12:33 PM
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
('02f4075c-c94b-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:34:05', '2025-11-24 18:34:05'),
('12a1d598-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:41:41', '2025-11-24 18:41:41'),
('14fdf9d1-c45d-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 12:00:51', '2025-11-18 12:00:51'),
('1e623b00-c51f-11f0-91f9-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-19 11:09:49', '2025-11-19 11:09:49'),
('2af24413-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:42:22', '2025-11-24 18:42:22'),
('3ab412a3-c94c-11f0-90a0-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-24 18:42:48', '2025-11-24 18:42:48'),
('3ef36011-c483-11f0-99c8-040e3cd25f75', '40d1e2dd-c45b-11f0-99c8-040e3cd25f75', NULL, 'active', '2025-11-18 16:34:02', '2025-11-18 16:34:02'),
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
('02f7631d-c94b-11f0-90a0-040e3cd25f75', '02f4075c-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:34:05', NULL),
('04e1a78c-c94b-11f0-90a0-040e3cd25f75', '02f4075c-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-24 18:34:08', NULL),
('0dcfffc1-c45d-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 12:00:39', NULL),
('12a334d6-c94c-11f0-90a0-040e3cd25f75', '12a1d598-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:41:41', NULL),
('1410aeaa-c94c-11f0-90a0-040e3cd25f75', '12a1d598-c94c-11f0-90a0-040e3cd25f75', 'sana', 'I’m here for you. Is there something on your mind you’d like to talk about today?', NULL, 0, NULL, '2025-11-24 18:41:43', NULL),
('14ffa711-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'Thanks for sharing! How are you feeling after that?', NULL, 0, NULL, '2025-11-18 12:00:51', NULL),
('15cfc822-c92b-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:45:33', NULL),
('160d23b1-c92b-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-24 14:45:33', NULL),
('1d09c5af-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:33:05', NULL),
('1e663f46-c51f-11f0-91f9-040e3cd25f75', '1e623b00-c51f-11f0-91f9-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-19 11:09:49', NULL),
('211f5bda-c483-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:33:12', NULL),
('26f50862-c45d-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'You’re very welcome! If there’s anything on your mind or any stress you want to talk through, I’m here to listen. How are you feeling today?', NULL, 0, NULL, '2025-11-18 12:01:21', NULL),
('2af33619-c94c-11f0-90a0-040e3cd25f75', '2af24413-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:42:22', NULL),
('2c28d3bf-c94c-11f0-90a0-040e3cd25f75', '2af24413-c94c-11f0-90a0-040e3cd25f75', 'sana', 'Hello! It’s okay to start small. What’s one thing on your mind right now?', NULL, 0, NULL, '2025-11-24 18:42:24', NULL),
('2ea0b21f-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-26 13:46:36', NULL),
('30681f59-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'Hi there! It’s good to hear from you. How are you feeling today?', NULL, 0, NULL, '2025-11-26 13:46:39', NULL),
('34991dfd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'user', 'im feeling sad and overwhelmed', NULL, 0, NULL, '2025-11-18 12:16:03', NULL),
('369a89bd-c45f-11f0-99c8-040e3cd25f75', '14fdf9d1-c45d-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling this way. It sounds really tough to be overwhelmed and sad at the same time. Would you like to share what\'s been on your mind lately?', NULL, 0, NULL, '2025-11-18 12:16:06', NULL),
('3ab53701-c94c-11f0-90a0-040e3cd25f75', '3ab412a3-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:42:48', NULL),
('3c4c13cc-c94c-11f0-90a0-040e3cd25f75', '3ab412a3-c94c-11f0-90a0-040e3cd25f75', 'sana', 'Hi again! Sometimes just saying hi can be a way to check in with yourself. How are you feeling in this moment?', NULL, 0, NULL, '2025-11-24 18:42:51', NULL),
('3ef3d171-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 16:34:02', NULL),
('430a4556-c483-11f0-99c8-040e3cd25f75', '3ef36011-c483-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 16:34:09', NULL),
('58663020-c92b-11f0-90a0-040e3cd25f75', '5865878b-c92b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:47:25', NULL),
('59be5f26-c92b-11f0-90a0-040e3cd25f75', '5865878b-c92b-11f0-90a0-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-24 14:47:27', NULL),
('5f76caf8-c47d-11f0-99c8-040e3cd25f75', '5f754e69-c47d-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:51:59', NULL),
('6098e961-c94b-11f0-90a0-040e3cd25f75', '60972d39-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:36:42', NULL),
('62020724-c94b-11f0-90a0-040e3cd25f75', '60972d39-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hello again! Sometimes it helps just to say hi. How’s your day going so far? Anything you\'d like to share?', NULL, 0, NULL, '2025-11-24 18:36:45', NULL),
('750863bf-c94b-11f0-90a0-040e3cd25f75', '7506a4a4-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:37:17', NULL),
('76286a6c-c94b-11f0-90a0-040e3cd25f75', '7506a4a4-c94b-11f0-90a0-040e3cd25f75', 'sana', 'Hey! I’m here whenever you want to chat. What’s been on your mind lately?', NULL, 0, NULL, '2025-11-24 18:37:19', NULL),
('8526f66a-c952-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'im extremely stressed with school', NULL, 0, NULL, '2025-11-24 19:27:50', NULL),
('868002b8-c952-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'I’m sorry to hear that school is feeling so overwhelming right now. It’s really common to feel stressed, especially when things pile up. Would you like to share what’s been the most challenging part for you lately?', NULL, 0, NULL, '2025-11-24 19:27:52', NULL),
('917a81ac-c47c-11f0-99c8-040e3cd25f75', '9176c978-c47c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 15:46:14', NULL),
('91e172eb-c473-11f0-99c8-040e3cd25f75', '91de9cc1-c473-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('91e751b0-c473-11f0-99c8-040e3cd25f75', '91e5c3b3-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:41:49', NULL),
('a4a55938-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 14:42:21', NULL),
('a61fa91b-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'Hi there! How are you feeling today? Is there something on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 14:42:23', NULL),
('a6566b39-c94c-11f0-90a0-040e3cd25f75', 'a653cdcd-c94c-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:45:49', NULL),
('a861f7d6-c94c-11f0-90a0-040e3cd25f75', 'a653cdcd-c94c-11f0-90a0-040e3cd25f75', 'sana', 'I’m here with you. If you want, you can tell me what’s going on or how you’re feeling right now.', NULL, 0, NULL, '2025-11-24 18:45:52', NULL),
('aa3d2acd-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'yes', NULL, 0, NULL, '2025-11-18 14:42:30', NULL),
('ab26eec2-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I’m here for you. What’s been going on lately that’s on your mind?', NULL, 0, NULL, '2025-11-18 14:42:32', NULL),
('ac508f37-cab5-11f0-993c-040e3cd25f75', '87ed64c7-ca10-11f0-9183-040e3cd25f75', 'sana', 'It sounds like your hunger is really distracting you right now. Sometimes when we\'re busy or stressed with studies, it’s easy to forget to eat properly. Do you think grabbing a quick, nourishing snack might help you feel a bit better?', NULL, 0, NULL, '2025-11-26 13:50:07', NULL),
('ae634f47-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'user', 'im stressed', NULL, 0, NULL, '2025-11-18 14:42:37', NULL),
('af4d0c88-c473-11f0-99c8-040e3cd25f75', 'a4a4cb29-c473-11f0-99c8-040e3cd25f75', 'sana', 'I\'m sorry you\'re feeling stressed right now. It can really weigh on you. Would you like to share what\'s been making you feel this way?', NULL, 0, NULL, '2025-11-18 14:42:38', NULL),
('b78028c9-c94b-11f0-90a0-040e3cd25f75', 'b77f7cd7-c94b-11f0-90a0-040e3cd25f75', 'user', 'im good how about you?', NULL, 0, NULL, '2025-11-24 18:39:08', NULL),
('b89c59a3-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-18 11:58:16', NULL),
('b92f2027-c94b-11f0-90a0-040e3cd25f75', 'b77f7cd7-c94b-11f0-90a0-040e3cd25f75', 'sana', 'I\'m glad to hear you\'re doing good! I\'m here to support you, so if there\'s anything on your mind—whether it\'s study stress, motivation, or just how you\'re feeling—I\'m all ears. How has your week been so far?', NULL, 0, NULL, '2025-11-24 18:39:11', NULL),
('bb1378ae-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Hey! It’s good to hear from you. How are you feeling today? Is there anything on your mind you\'d like to talk about?', NULL, 0, NULL, '2025-11-18 11:58:20', NULL),
('bc9476c3-c92b-11f0-90a0-040e3cd25f75', 'bc926bef-c92b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 14:50:13', NULL),
('bdda5cb4-c92b-11f0-90a0-040e3cd25f75', 'bc926bef-c92b-11f0-90a0-040e3cd25f75', 'sana', 'Hey again! It’s okay if you just want to say hi. How’s your day going so far?', NULL, 0, NULL, '2025-11-24 14:50:15', NULL),
('c2dfb097-c45c-11f0-99c8-040e3cd25f75', 'b89bd8ab-c45c-11f0-99c8-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Empty response from workflow', NULL, 0, NULL, '2025-11-18 11:58:33', NULL),
('cfb36392-c94b-11f0-90a0-040e3cd25f75', 'cfb283f9-c94b-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 18:39:49', NULL),
('d10c6059-c94b-11f0-90a0-040e3cd25f75', 'cfb283f9-c94b-11f0-90a0-040e3cd25f75', 'sana', 'I’m here to listen whenever you’re ready to share. How have things been for you lately?', NULL, 0, NULL, '2025-11-24 18:39:51', NULL),
('dee455c7-c94f-11f0-90a0-040e3cd25f75', 'dee33122-c94f-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 19:08:52', NULL),
('e00a55e4-c94f-11f0-90a0-040e3cd25f75', 'dee33122-c94f-11f0-90a0-040e3cd25f75', 'sana', 'Hello! It’s okay if you’re not sure what to say yet. Whenever you feel ready, I’m here to listen. How are you doing today?', NULL, 0, NULL, '2025-11-24 19:08:54', NULL),
('e3fbca5f-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'hi', NULL, 0, NULL, '2025-11-24 19:16:10', NULL),
('e50fbb31-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'Hi! I’m glad you’re here. Is there something on your mind you’d like to share or talk about?', NULL, 0, NULL, '2025-11-24 19:16:12', NULL),
('e8555817-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'user', 'im tired', NULL, 0, NULL, '2025-11-24 19:16:18', NULL),
('e9f43ec4-c950-11f0-90a0-040e3cd25f75', 'e3fae0da-c950-11f0-90a0-040e3cd25f75', 'sana', 'I’m sorry to hear you’re feeling tired. That can be really draining, especially when you’ve got a lot going on. Is there something specific making you feel this way, like your workload or maybe lack of rest?', NULL, 0, NULL, '2025-11-24 19:16:20', NULL),
('f7e02713-c92a-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'user', 'hello', NULL, 0, NULL, '2025-11-24 14:44:43', NULL),
('f89f0e9c-c92a-11f0-90a0-040e3cd25f75', 'f7ded2d5-c92a-11f0-90a0-040e3cd25f75', 'sana', 'Sorry, I could not reach the workflow: Failed to fetch', NULL, 0, NULL, '2025-11-24 14:44:44', NULL),
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
-- AUTO_INCREMENT for table `mood_logs`
--
ALTER TABLE `mood_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
