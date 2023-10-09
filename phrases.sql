-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 09, 2023 at 05:39 AM
-- Server version: 8.1.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phrases`
--

-- --------------------------------------------------------

--
-- Table structure for table `consonants`
--

CREATE TABLE `consonants` (
  `id` int NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` enum('High','Low','Middle') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `spelling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `translation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dialogs`
--

CREATE TABLE `dialogs` (
  `id` int NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dialogs`
--

INSERT INTO `dialogs` (`id`, `description`) VALUES
(1, 'Tom meets Phan on Hornet app'),
(2, 'New dialog'),
(3, 'New dialog');

-- --------------------------------------------------------

--
-- Table structure for table `dialog_persons`
--

CREATE TABLE `dialog_persons` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dialog_persons`
--

INSERT INTO `dialog_persons` (`id`, `name`, `description`) VALUES
(1, 'Tom', 'Our sexy and smart black boy from who know where'),
(2, 'Phan', 'Young Thai boy looking for money and fun'),
(3, 'คุณพ่อ', 'Father'),
(4, 'เจมส์', 'James'),
(5, 'คุณแม่', 'Mother'),
(6, '', NULL),
(12, 'Pan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dialog_words`
--

CREATE TABLE `dialog_words` (
  `id` int NOT NULL,
  `dialog_id` int NOT NULL,
  `dialog_person_id` int NOT NULL,
  `word_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dialog_words`
--

INSERT INTO `dialog_words` (`id`, `dialog_id`, `dialog_person_id`, `word_id`) VALUES
(1, 1, 1, 99),
(2, 1, 2, 99),
(3, 2, 4, 137),
(4, 2, 3, 138),
(5, 2, 4, 139),
(6, 2, 3, 140),
(7, 2, 5, 141),
(8, 2, 4, 142),
(9, 2, 5, 143),
(10, 3, 1, 99),
(11, 3, 12, 99),
(12, 3, 1, 89),
(13, 3, 12, 105),
(14, 3, 1, 98),
(15, 3, 12, 334),
(16, 3, 12, 74),
(17, 3, 1, 82),
(18, 3, 12, 77),
(19, 3, 1, 157),
(20, 3, 12, 165),
(21, 3, 1, 319),
(22, 3, 1, 97);

-- --------------------------------------------------------

--
-- Table structure for table `vowels`
--

CREATE TABLE `vowels` (
  `id` int NOT NULL,
  `spelling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `th` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('short','long','long-short') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vowels`
--

INSERT INTO `vowels` (`id`, `spelling`, `th`, `type`) VALUES
(1, '/à/', '-ะ', 'short'),
(2, '/ì/', ' ิ', 'short'),
(3, '/ʉ/', ' ึ', 'short');

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` int NOT NULL,
  `base` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `th` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `spelling` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hidden_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `answered_at` timestamp NULL DEFAULT NULL,
  `priority` tinyint NOT NULL DEFAULT '1',
  `tags` set('vowels','consonants','colors','numbers','destination') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `base`, `th`, `spelling`, `hidden_at`, `is_active`, `comment`, `answered_at`, `priority`, `tags`) VALUES
(1, 'A little', 'นิดหน่อย', 'nítnòi\n', NULL, 1, NULL, '2023-09-06 04:45:25', 1, NULL),
(2, 'Also', 'ก็', 'goo\n', NULL, 0, NULL, '2023-03-08 11:18:08', 1, NULL),
(3, 'I\'m also fine', 'ผมก็สบายดี', NULL, NULL, 0, NULL, NULL, 1, NULL),
(4, 'And, with', 'กับ', 'gàp\n', NULL, 0, NULL, NULL, 1, NULL),
(5, 'At, in', 'ที่', NULL, '2023-03-08 17:29:56', 1, NULL, '2023-03-08 17:29:54', 1, NULL),
(6, 'Between', 'ระหว่าง', 'rá-wàang\n', NULL, 0, NULL, NULL, 1, NULL),
(7, 'But', 'แต่', 'dtɛ̀ɛ\r\n', NULL, 1, NULL, '2023-03-20 16:44:59', 1, ''),
(8, 'Can', 'ได้', 'dâai\n', NULL, 0, NULL, NULL, 1, NULL),
(9, 'Cheap', 'ถก', 'tùuk\n', NULL, 0, NULL, NULL, 1, NULL),
(10, 'Difficult', 'ยาก', 'yàak\n', NULL, 0, NULL, NULL, 1, NULL),
(11, 'Easy', 'ง่าย', 'ngâai\n', NULL, 0, NULL, NULL, 1, NULL),
(12, 'Expensive', 'เเพง', 'pɛɛng\n', NULL, 0, NULL, NULL, 1, NULL),
(13, 'He, she, him, her', 'เขา', 'káo\n', '2023-03-06 15:51:02', 1, NULL, '2023-03-06 15:51:00', 1, NULL),
(14, 'Here', 'ที่นี่', 'tîi-nîi\n', NULL, 1, NULL, '2023-03-23 11:19:20', 1, NULL),
(15, 'How many', 'กี่', 'gìi\n', NULL, 0, NULL, NULL, 1, NULL),
(16, 'How much', 'เท่าไหร่', 'tâo-rài\n', NULL, 1, NULL, '2023-03-22 10:17:42', 1, NULL),
(17, 'In', 'ใน', 'nai\n', NULL, 0, NULL, NULL, 1, NULL),
(18, 'It', 'มัน', 'man\n', NULL, 0, NULL, NULL, 1, NULL),
(19, 'On', 'บน', 'bon\n', NULL, 0, NULL, NULL, 1, NULL),
(20, 'One more time', 'อีกที', 'ìik-tii\n', NULL, 0, NULL, NULL, 1, NULL),
(21, 'Or', 'หรือ', 'rʉʉ\n', NULL, 0, NULL, NULL, 1, NULL),
(22, 'Over there', 'ที่โน่น', 'tîi-nôon\n', NULL, 0, NULL, NULL, 1, NULL),
(23, 'Person', 'คน', 'kon\n', NULL, 0, NULL, NULL, 1, NULL),
(24, 'Quick', 'เร็ว', 'reo\n', NULL, 0, NULL, NULL, 1, NULL),
(25, 'Same here', 'เช่นกัน', 'chen-gan\n', NULL, 0, NULL, NULL, 1, NULL),
(26, 'Slow', 'ช้า', 'cháa\n', NULL, 0, NULL, NULL, 1, NULL),
(27, 'That', 'นั่น', 'nan\n', NULL, 0, NULL, NULL, 1, NULL),
(28, 'There', 'ที่นั่น', 'tîi-nân\n', NULL, 0, NULL, NULL, 1, NULL),
(29, 'They, them', 'พวกเขา', 'pûal káo\n', NULL, 0, NULL, NULL, 1, NULL),
(30, 'This', 'นี่', 'nii\n', NULL, 0, NULL, NULL, 1, NULL),
(31, 'Under', 'ใต้', 'dtâai\n', NULL, 0, NULL, NULL, 1, NULL),
(32, 'Very difficult', 'ยากมาก', 'yâak mâak\n', NULL, 0, NULL, NULL, 1, NULL),
(33, 'Very, many', 'มาก', 'มาก\n', '2023-03-06 14:49:53', 1, NULL, '2023-03-06 14:49:50', 1, NULL),
(34, 'We, us', 'เรา', 'rao\r\n', '2023-03-06 14:50:09', 1, NULL, '2023-03-06 14:50:07', 1, NULL),
(35, 'Week', 'สัปดาห์', 'sapdaah\n', NULL, 0, NULL, NULL, 1, NULL),
(36, 'What', 'อะไร', 'a-rai\n', '2023-03-06 09:02:56', 1, NULL, NULL, 1, NULL),
(37, 'Where', 'ที่ไหน', 'tîi-nai\n', '2023-03-03 10:33:01', 1, NULL, NULL, 1, NULL),
(38, 'Will', 'จะ', 'yà\n', NULL, 0, NULL, NULL, 1, NULL),
(39, 'Time', 'เวลา', 'wee-laa\n', NULL, 0, NULL, NULL, 1, NULL),
(40, 'Hour', 'ชั่วโมง', 'chûa-moonɡ\n', NULL, 0, NULL, NULL, 1, NULL),
(41, 'Minute', 'นาที', 'naa-tii\n', NULL, 0, NULL, NULL, 1, NULL),
(42, 'Second', 'วินาที', 'wí-naa-tii\n', NULL, 0, NULL, NULL, 1, NULL),
(43, 'Exactly', 'ตรง', 'dtronɡ\n', NULL, 0, NULL, NULL, 1, NULL),
(44, 'Half', 'ครึ่ง', 'krʉ̂nɡ\n', NULL, 0, NULL, NULL, 1, NULL),
(45, 'Almost', 'เกือบ', 'ɡʉ̀ap\n', NULL, 0, NULL, NULL, 1, NULL),
(46, 'Than', 'กว่า', 'ɡwàa\r\n', NULL, 1, NULL, '2023-03-11 11:14:42', 1, NULL),
(47, 'Already', 'แล้ว', 'lɛ́ɛo\n', NULL, 0, NULL, NULL, 1, NULL),
(48, 'Fast', 'เร้ว', 'reo\n', NULL, 0, NULL, NULL, 1, NULL),
(49, 'Late', 'สาย', 'sǎai\n', NULL, 0, NULL, NULL, 1, NULL),
(50, 'Before, first, ahead', 'ก่อน', 'ɡɔ̀ɔn\n', NULL, 0, NULL, NULL, 1, NULL),
(51, 'After', 'หลัง', 'lǎnɡ\n', NULL, 0, NULL, NULL, 1, NULL),
(52, 'To come', 'มา', 'maa\n', NULL, 1, NULL, '2023-03-11 11:14:52', 1, NULL),
(53, 'To do', 'ทํา', 'tam\n', '2023-03-06 14:50:26', 1, NULL, '2023-03-06 14:50:23', 1, NULL),
(54, 'To be something', 'เป็น', 'bpen\n', '2023-03-06 14:50:45', 1, NULL, '2023-03-06 14:50:42', 1, NULL),
(55, 'To have', 'มี', 'mii\n', NULL, 1, NULL, '2023-03-11 11:14:59', 1, NULL),
(56, 'To be somewhere(live, stay)', 'อยู่', 'yùu\n', NULL, 1, NULL, '2023-03-23 10:52:50', 1, NULL),
(57, 'To get, want, take', 'เอา', 'ao\n', NULL, 0, NULL, NULL, 1, NULL),
(58, 'To go', 'ไป', 'bpai\n', '2023-03-06 14:52:04', 1, NULL, '2023-03-06 14:52:01', 1, NULL),
(59, 'To eat', 'กิน', 'gin\r\n', NULL, 1, NULL, '2023-03-16 18:55:05', 1, NULL),
(60, 'To drink', 'ดื่ม', 'dʉ̀ʉm\n', NULL, 0, NULL, NULL, 1, NULL),
(61, 'To watch', 'ดู', 'duu\n', NULL, 1, NULL, '2023-03-16 18:57:34', 1, NULL),
(62, 'To speak', 'พูด', 'pûut\n', NULL, 1, NULL, '2023-03-16 18:58:20', 1, NULL),
(63, 'To read', 'อ่าน', 'àan\n', NULL, 0, NULL, NULL, 1, NULL),
(64, 'To write', 'เขียน', 'kǐan\n', NULL, 0, NULL, NULL, 1, NULL),
(65, 'To study', 'เรียน', 'rian\n', NULL, 0, NULL, NULL, 1, NULL),
(66, 'To teach', 'สอน', 'sɔ̌ɔn\n', NULL, 0, NULL, NULL, 1, NULL),
(67, 'To work', 'ทํางาน', 'tam-ngaam\n', NULL, 0, NULL, NULL, 1, NULL),
(68, 'To wake up', 'ตื่นนอน', 'dtʉ̀ʉn nɔɔn\n', NULL, 0, NULL, NULL, 1, NULL),
(69, 'To like', 'ชอบ', 'chɔ̂ɔp\n', '2023-03-03 10:33:12', 1, NULL, NULL, 1, NULL),
(70, 'Can you read Thai?', 'คณอ่านภาษาไทยได็ไหม', 'khun aan oaa-saa tai daai-mai\n', NULL, 0, NULL, NULL, 1, NULL),
(71, 'You speak English very well', 'คุณพูดภาษาอังกฤษเก่งมาก', 'khun puut angrit geng maak\r\n', NULL, 1, NULL, '2023-03-12 04:39:29', 1, NULL),
(72, 'Where do you work?', 'คุณทํางานที่ไหน', 'kun tam-ngaan ti-nai\n', NULL, 1, NULL, '2023-03-11 18:21:33', 1, NULL),
(73, 'Can you speak English', 'คุณพูดภาษาอังกฤษได้ไหม', 'khoun phoud pha sa angrit dai mai?\r\n', NULL, 1, NULL, '2023-03-19 15:57:49', 1, NULL),
(74, 'Where are you from?', 'คุณมาจากที่ไหน', 'khoun ma dzak ti nai?\r\n', NULL, 1, NULL, '2023-03-16 18:59:17', 1, NULL),
(75, 'What about you? You?', 'คุณละ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(76, 'Where do you live?', 'คุณอยู่ที่ไหน', 'kun yùu tîi-nai\n', NULL, 1, NULL, '2023-03-23 10:53:30', 1, NULL),
(77, 'How old are you?', 'คุณอายุเท่าไหร่', 'khun aa-yú thâo-rài\r\n', NULL, 1, NULL, '2023-03-22 10:17:23', 1, NULL),
(78, 'See you tomorrow', 'เจอกันพรุ่งนี้', NULL, NULL, 1, NULL, '2023-03-12 19:02:24', 1, NULL),
(79, 'See you', 'เจอกันใหม่', NULL, NULL, 0, NULL, NULL, 1, NULL),
(80, 'I like you', 'ผมขอบคุณ', NULL, '2023-03-08 17:24:26', 1, NULL, '2023-03-08 17:24:24', 1, NULL),
(81, 'I can\'t speak Thai', 'คุณพูดภาษาไทยไม่ได้', 'chan phoud phasa thai mi dai\r\n', NULL, 0, NULL, NULL, 1, NULL),
(82, 'I\'m from Kenya', 'ผมมาจากเคนยา', 'pom ma chak kenia\r\n', NULL, 1, NULL, '2023-03-13 06:10:16', 1, NULL),
(83, 'I don’t understand', 'ผมไม่เข้าใจ', 'pom mai khao jai\r\n', NULL, 1, NULL, '2023-06-15 15:23:46', 1, NULL),
(84, 'I didn\'t mean it, sorry.', 'ผมไม่ได้เจตนา ขอโทษ', 'chan may day ceettanaa khoo thood kh\r\n', NULL, 0, NULL, '2023-03-08 17:45:42', 1, NULL),
(85, 'What is your name?', 'คุณชื่ออะไร', NULL, NULL, 1, NULL, '2023-03-10 08:00:35', 1, NULL),
(86, 'See you soon', 'เดี๋ยวเจอกัน', NULL, NULL, 1, NULL, '2023-03-13 05:13:13', 1, NULL),
(87, 'I like you too', 'ผมชอบคุณเหมือนกัน', NULL, NULL, 0, NULL, '2023-03-08 17:44:48', 1, NULL),
(88, 'I\'m looking for sex right now', 'ผมกําลังหาเซ็กตอนนี้', NULL, NULL, 1, NULL, '2023-03-13 05:18:27', 1, NULL),
(89, 'My name is Tom', 'ผมขื่อทอม', NULL, NULL, 1, NULL, '2023-03-22 10:18:06', 1, NULL),
(90, 'Good night my love', 'ฝันดีนะที่รัก', NULL, NULL, 1, NULL, '2023-03-13 05:26:21', 1, NULL),
(91, 'I\'m at home', 'พมอยู่ที่บ้านๅ', 'pom yùu tîi báan\n', NULL, 0, NULL, NULL, 1, NULL),
(93, 'That is very expensive', 'แพงมาก', 'pɛɛng mâak\n', NULL, 0, NULL, NULL, 1, NULL),
(94, 'No', 'ไม่', 'mai\n', NULL, 1, NULL, '2023-03-13 05:26:46', 1, NULL),
(95, 'You are welcome', 'ไม่เป็นไร', 'mai bpenrai\n', NULL, 0, NULL, NULL, 1, NULL),
(96, 'Good night', 'ราตรีสวัสดิ์', 'raatrii sawat\n', NULL, 0, NULL, NULL, 1, NULL),
(97, 'What is your Line ID?', 'ไลน์ไอดีของคุณคืออะไร', NULL, NULL, 1, NULL, '2023-03-13 05:34:24', 1, NULL),
(98, 'How are you?', 'สบายดีไหม', 'sa bai dee mai?\n', NULL, 1, NULL, '2023-03-22 10:19:04', 1, NULL),
(99, 'Hello', 'สวัสดี', NULL, '2023-03-06 15:47:32', 1, NULL, '2023-03-06 15:47:29', 1, NULL),
(100, 'Good afternoon', 'สวัสดีตอนบ่าย', 'sawàt dii tɔɔn bàay\n', NULL, 0, NULL, NULL, 1, NULL),
(101, 'Good morning', 'สวัสดีตอนเ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(102, 'How are things going?', 'หมู่นี้เป็นอย่างไรบ้าง', 'muu nii pen yaan ray baan\n', NULL, 0, NULL, NULL, 1, NULL),
(104, 'How much is this one?', 'อันนี้เท่าไหร่', 'an níi tâo-rài\n', NULL, 0, NULL, NULL, 1, NULL),
(105, 'Nice to meet you', 'ยินดีที่ได้รู้จัก', 'yin-dii thîi dâai rúu-jàk', NULL, 1, NULL, '2023-07-10 16:46:16', 1, NULL),
(107, 'So sorry', 'ขอไทษจริงๆ', 'khoo thoot cin cin\n', NULL, 0, NULL, NULL, 1, NULL),
(108, 'Thank you', 'ขอบคุณ', 'khob khun\n', '2023-03-13 05:34:50', 1, NULL, '2023-03-13 05:34:47', 1, NULL),
(109, 'Thank you very much', 'ขอบคุณมาก', 'khoop khun maak\n', '2023-03-13 05:35:09', 1, NULL, '2023-03-13 05:35:06', 1, NULL),
(112, 'And you?', 'คูณล่ะ', 'kun lâ\n', NULL, 0, NULL, NULL, 1, NULL),
(113, 'Yes', 'ใช่', 'chai\n', NULL, 0, NULL, NULL, 1, NULL),
(114, 'Good night, sweetheart ', 'ฝันดีนะคับที่รัก', NULL, NULL, 0, NULL, NULL, 1, NULL),
(115, 'Long time no see', 'ไม่เจอกันนาน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(116, 'Don’t mention it', 'ไม่ต้งเกรงใจ', 'may ton kreen cay\n', NULL, 0, NULL, NULL, 1, NULL),
(117, 'Bye', 'ลาก่อน', 'laa koon\n', NULL, 0, NULL, NULL, 1, NULL),
(118, 'Hello everyone ', 'สวัสดีทุกคน', 'swasdi thuk khun\n', NULL, 0, NULL, NULL, 1, NULL),
(119, 'Do you understand?', 'เข้าใจไหม', 'kao-jai mai\n', NULL, 0, NULL, NULL, 1, NULL),
(120, 'You are very funny', 'คุณเป็นคนตลกมาก', NULL, NULL, 0, NULL, NULL, 1, NULL),
(121, 'What nationality are you?', 'คูณเป้นคนอะไร', 'kun bpen kon a rai\n', NULL, 0, NULL, NULL, 1, NULL),
(122, 'I like to drink beer', 'พมชอบกินเบียร์', 'pon choop gin bia\n', NULL, 0, NULL, NULL, 1, NULL),
(123, 'The store is closing', 'ร้านค้าใกล้จะปิดแล้ว', 'raan khaa klay ca pit leew\n', NULL, 0, NULL, NULL, 1, NULL),
(124, 'Where did you learn English?', 'คุณเรียนภาษาอังกฤษที่ไหน', 'khun rian paa-saa angrit ti nai', NULL, 0, NULL, NULL, 1, NULL),
(126, 'That', 'ที่', 'thîi', NULL, 0, 'preposition, pronoun, noun', NULL, 1, NULL),
(128, 'Welcome, pleasure', 'ยินดี', 'yin-dii', NULL, 1, NULL, '2023-03-13 05:35:44', 1, NULL),
(129, 'To know someone', 'รู้จัก', 'rúu-jàk', NULL, 0, NULL, '2023-04-10 15:22:55', 1, NULL),
(130, 'To get', 'ได้', 'dâai', NULL, 0, 'verb, auxiliary verb', NULL, 1, NULL),
(131, 'Now', 'ตอนนี้', NULL, NULL, 1, NULL, '2023-03-23 10:52:31', 1, NULL),
(132, 'Every day', 'ทุกวัน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(133, 'от, из', 'จาก', NULL, NULL, 1, NULL, '2023-04-10 14:49:18', 1, NULL),
(134, 'You', 'คุณ', 'khun', '2023-03-08 17:38:51', 1, NULL, '2023-03-08 17:38:49', 1, NULL),
(135, 'Age', 'อายุ', NULL, NULL, 1, NULL, '2023-03-16 18:52:30', 1, NULL),
(136, 'Why', 'ทําไม', NULL, NULL, 0, NULL, NULL, 1, NULL),
(137, 'Who is the person wearing a brown outfit?', 'คนที่ใส่ชุดสีนํ้าตาลคือใคร', 'khon thîi sài chút sǐi-nám-dtaan khuue khrai khráp\n', NULL, 0, NULL, NULL, 1, NULL),
(138, '(laughing) Oh...he\'s a police officer', '(หัวเราะ)อ้อ...เขาเป็ นตํารวจน่ะ', '(laughing) âaw...khǎo bpen dtam-rùuat nâ khráp\n', NULL, 0, NULL, NULL, 1, NULL),
(139, 'And that boy wearing orange cloth is a monk, right?', 'แล้ วเด็กผู้ชายคนนันที่ใส่ผ้าสีส้มเป็นพระสงฆ์ใช่ไหม', 'láaeo dèk phûu-chaai khon nán thîi sài phâa sǐi-sôm bpen phrá-sǒng châi mǎi khráp\n', NULL, 0, NULL, NULL, 1, NULL),
(140, 'No. That\'s a novice', 'ไม่ใช่ นั่นเณร', 'mâi châi khráp. nân neen khráp\n', NULL, 0, NULL, NULL, 1, NULL),
(141, 'We\'re home', 'ถึงบ้านแล้ว', 'thǔeng bâan láaeo', NULL, 0, NULL, NULL, 1, NULL),
(142, 'Which house is it?', 'หลังไหน', 'lǎng nǎi khráp\n', NULL, 0, NULL, NULL, 1, NULL),
(143, 'It\'s the house with the bamboo', 'บ้านที่มีต้นไผ่', 'bâan thîi mii dtôn-phài', NULL, 0, NULL, NULL, 1, NULL),
(144, 'Home, house', 'บ้าน', 'bâan', NULL, 0, 'Noun\n', NULL, 1, NULL),
(145, 'Novice monk', 'เณร', 'neen', NULL, 0, 'noun\n', NULL, 1, NULL),
(146, 'Buddhist monk', 'พระสงฆ์', 'phrá-sǒng', NULL, 0, 'noun\n', NULL, 1, NULL),
(147, 'Orange', 'สีส้ม', 'sǐi-sôm', '2023-03-09 18:18:44', 0, 'noun, adjective\n', NULL, 1, NULL),
(148, 'Boy', 'เด็กผู้ชาย', 'dèk-phûu-chaai', NULL, 0, 'Noun\n', NULL, 1, NULL),
(149, 'Police, Policeman', 'ตํารวจ', 'dtam-rùuat', NULL, 0, 'Noun\n', NULL, 1, NULL),
(150, 'Brown', 'สีนํ้าตาล', 'sǐi-nám-dtaan', NULL, 0, 'noun, adjective\n', NULL, 1, NULL),
(151, 'To put in, to wear', 'ใส่', 'sài', NULL, 0, 'verb\n', NULL, 1, NULL),
(152, 'Bamboo', 'ต้นไผ่', 'dtôn-phài', NULL, 0, 'noun', NULL, 1, NULL),
(153, 'Hello(informal)', 'หวัดดี', 'wat-dii', NULL, 0, NULL, NULL, 1, NULL),
(154, 'It\'s no problem', 'ไม่เป็นไร', 'mâi-bpen-rai', NULL, 0, NULL, NULL, 1, NULL),
(155, 'Appointment', 'นัด', 'nát', NULL, 0, NULL, NULL, 1, NULL),
(156, 'Do you speak English?', 'คุณพูดภาษาอังกฤษได้ไหม', 'khun phûut phaa-sǎa-ang-grìt dâai mǎi', NULL, 1, NULL, '2023-03-13 11:48:09', 1, NULL),
(157, 'I\'m 38 years old', 'ผมอายุ38ปี', 'phǒm aa-yú sǎam sìp gâo bpii', NULL, 1, NULL, '2023-03-24 06:42:25', 8, NULL),
(158, 'I am American', 'ผมเป็นคนอเมริกนั', 'phǒm bpen khon-à-mee-rí-gan', NULL, 0, NULL, NULL, 1, NULL),
(159, 'How much does this cost?', 'อันนี้ราคาเท่าไหร่', 'an-níi raa-khaa thâo-rài', NULL, 0, NULL, NULL, 1, NULL),
(160, 'OK, I\'ll take this one', 'โอเค ผมเอาอันนี้แห', 'OK. phǒm ao an-níi làe', NULL, 0, NULL, NULL, 1, NULL),
(161, 'It\'s a little too expensive', 'มันแพงไปหน่อย', 'man phaaeng bpai nàwy', NULL, 0, NULL, NULL, 1, NULL),
(162, 'Price', 'ราคา', 'raa-khaa', NULL, 0, 'noun, verb', NULL, 1, NULL),
(163, 'What is this called?', 'อันนี่เรียกว่าอะไร', 'an-níi rîiak wâa à-rai', NULL, 0, NULL, NULL, 1, NULL),
(164, 'One', 'หนึ่ง', 'nùeng', NULL, 1, 'numbers', '2023-03-24 06:38:38', 1, 'numbers'),
(165, 'What are you doing?', 'คุณกําลังทําอะไร', 'khun gam-lang tham à-rai', NULL, 1, NULL, '2023-03-13 11:52:27', 1, NULL),
(166, 'I am studying', 'ผมกําลังเรียนอยู่', 'khun gam-lang riian yùu khâ', NULL, 0, NULL, NULL, 1, NULL),
(167, 'Being', 'กําลัง', 'gam-lang', NULL, 0, 'verb, auxiliary verb', NULL, 1, NULL),
(168, '..is doing..', 'กําลัง...อยู่', 'gam-lang...yùu', NULL, 0, 'auxiliary verb', NULL, 1, NULL),
(169, 'I don\'t know what to do', 'ผมไม่รู้จะทําอย่างไรดี', 'khun mâi rúu jà tham yàang-rai dii', NULL, 0, NULL, NULL, 1, NULL),
(170, 'Long time no see', 'ไม่ได้เจอกันตั้งนาน', 'ไม่ได้ เจอกันตังนาน', NULL, 0, NULL, NULL, 1, NULL),
(171, 'Have a safe trip', 'เดินทางปลอดภัยนะ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(172, 'Delicious', 'อร่อย', 'à-ròi', NULL, 0, 'Adjective', NULL, 1, NULL),
(173, 'Could you please get me a glass of cold water?', 'ขอนํ้าเย็นหนึ่งแก้ว', 'khǎaw náam yen nùeng gâaeo', NULL, 0, NULL, NULL, 1, NULL),
(174, 'What time do you eat dinner?', 'คุณกินข้าวเย็นกี่โมง', 'kun gin kâao-yen gìi moong', NULL, 0, NULL, NULL, 1, NULL),
(175, 'Weekend', 'เสาร์อาทิตย์', 'sǎo-aa-tít', NULL, 0, NULL, NULL, 1, NULL),
(176, 'I will go to Thailand in September', 'ผมจะไปเมืองไทยเดือนกัมยา', 'pǒm jà bpai mʉanɡ tai dʉan ɡan yaa', NULL, 0, NULL, NULL, 1, NULL),
(177, 'Month', 'เดือน', 'dʉan', NULL, 0, NULL, NULL, 1, NULL),
(178, 'Every', 'ทุก', 'tùk', NULL, 1, NULL, '2023-03-13 12:48:35', 1, NULL),
(179, 'Tomorrow ', 'พรุ่งนี้', 'prûng níi', NULL, 1, NULL, '2023-03-13 13:14:19', 1, NULL),
(180, 'Today', 'วันนี้', 'wanníi', NULL, 1, NULL, '2023-03-13 12:49:05', 1, NULL),
(181, 'Yesterday ', 'เมื่อวานนี้', 'mʉ̂a waanníi', NULL, 1, NULL, '2023-03-13 12:51:55', 1, NULL),
(182, 'Year', 'ปี', 'bpii', NULL, 0, NULL, NULL, 1, NULL),
(183, 'This year', 'ปีนี้', 'bpii níi', NULL, 0, NULL, NULL, 1, NULL),
(184, 'Every week', 'ทุกอาทิตย์', 'túk aa tít', NULL, 0, NULL, NULL, 1, NULL),
(185, 'Last year', 'ปีที่แล้ว', 'bpii tîi lɛ́ɛo', NULL, 0, NULL, NULL, 1, NULL),
(186, 'Next year', 'ปีหน้า', 'bpii nâa', NULL, 0, NULL, NULL, 1, NULL),
(187, 'Morning', 'เข้า', 'cháao', NULL, 0, NULL, NULL, 1, NULL),
(188, 'Evening', 'เย็น', 'yen', NULL, 0, NULL, NULL, 1, NULL),
(189, 'This evening', 'เย็นนี้', 'yen níi', NULL, 0, NULL, NULL, 1, NULL),
(190, 'Night', 'คืน', 'kʉʉn', NULL, 0, NULL, NULL, 1, NULL),
(191, 'Tonight', 'คืนน้ี', 'kʉʉn níi', NULL, 0, NULL, NULL, 1, NULL),
(192, 'Last night', 'เมื่อคืนนี้', 'mʉ̂a kʉʉn níi', NULL, 0, NULL, NULL, 1, NULL),
(193, 'Friend', 'เพื่อน', 'pʉ̂an', NULL, 0, NULL, NULL, 1, NULL),
(194, 'Must', 'ต้อง', 'dtông', NULL, 0, NULL, NULL, 1, NULL),
(195, 'I don\'t know', 'ผมไม่รู้', NULL, NULL, 0, NULL, NULL, 1, NULL),
(196, 'Name', 'ชื่อ', 'chʉʉ', NULL, 0, NULL, NULL, 1, NULL),
(197, 'I', 'ผม', NULL, NULL, 0, NULL, NULL, 1, NULL),
(198, 'Tom speaking', 'ทมพูด', 'tom pûut', NULL, 0, NULL, NULL, 1, NULL),
(199, 'Are you free tomorrow night?', 'คืนพรุ่งนี้ว่างไหม', 'kʉʉn prûnɡ nii wâanɡ mái', NULL, 1, NULL, '2023-03-13 13:03:54', 1, NULL),
(200, 'Do you want to go with me?', 'ไปด้วยกันไหม', 'bpai dûai gan mái', NULL, 1, NULL, '2023-03-13 19:19:16', 1, NULL),
(201, 'What day is today?', 'วันนี้วันอะไร', 'wan níi wan àrai', NULL, 0, NULL, NULL, 1, NULL),
(202, 'What did you do last night?', 'เมื่อคืนนี้คุณทําอะไร', 'mʉa kʉʉn níi kun tam árai', NULL, 0, NULL, NULL, 1, NULL),
(203, 'Not so …', 'ไม่ค่อย …', 'mâi kôoi', NULL, 0, NULL, NULL, 1, NULL),
(204, 'To run', 'วิ่ง', 'wîng', NULL, 0, NULL, NULL, 1, NULL),
(205, 'To buy', 'ซื้อ', 'sʉ́ʉ', NULL, 1, NULL, '2023-03-23 11:17:32', 1, NULL),
(206, 'To sell', 'ขาย', 'kǎai', NULL, 0, NULL, NULL, 1, NULL),
(207, 'To walk', 'เดิน', 'dəən', NULL, 0, NULL, NULL, 1, NULL),
(208, 'To listen', 'ฟัง', 'fang', NULL, 0, NULL, NULL, 1, NULL),
(209, 'Good', 'ดี', 'dii', NULL, 0, NULL, NULL, 1, NULL),
(210, 'To drive', 'ขับ', 'kàp', NULL, 0, NULL, NULL, 1, NULL),
(211, 'May I speak with Tom?', 'ขอสายกับคุณทม', 'kɔ̌ɔ sǎai ɡàp kun tom', NULL, 0, NULL, NULL, 1, NULL),
(212, 'I’m going to eat', 'กําลังจะทานข้าว', NULL, NULL, 0, NULL, NULL, 1, NULL),
(213, 'What do you want to do?', 'คุณอยากทําอะไร', 'kun yàak tam àrai', NULL, 1, NULL, '2023-03-13 19:23:43', 1, NULL),
(214, 'This one is not very good', 'อันนี้ไม่ค่อยดี', 'an níi mâi kɔ̂i dii', NULL, 0, NULL, NULL, 1, NULL),
(215, 'What did you buy?', 'ซื้ออะไรมา', 'sʉ́ʉ àrai maa', NULL, 0, NULL, NULL, 1, NULL),
(216, 'I want to go to see you', 'ผมอยากไปหาคุณ', 'pǒm yàak bpai hǎa kun', NULL, 0, NULL, NULL, 1, NULL),
(217, 'Who', 'ใคร', 'krai', NULL, 1, NULL, '2023-03-22 06:39:48', 1, NULL),
(218, 'Whose', 'ของใคร', 'kɔ̌ɔnɡ krai', NULL, 0, NULL, NULL, 1, NULL),
(219, 'To remember ', 'จําได้', 'jam dâai', NULL, 0, NULL, NULL, 1, NULL),
(220, 'Can’t remember', 'จําไหมได้', 'jam mâi dâai', NULL, 0, NULL, NULL, 1, NULL),
(221, 'Do you remember?', 'จําได้ไหม', 'jam dâai mái', NULL, 0, NULL, NULL, 1, NULL),
(222, 'When did you come to Thailand?', 'คุณมาเมืองไทยเมื่อไหร่', 'kun maa mʉang tai mʉa rài', NULL, 0, NULL, NULL, 1, NULL),
(223, 'When', 'เมื่อไหร่', 'mʉ̂a rái', NULL, 0, NULL, NULL, 1, NULL),
(224, 'This is mine', 'นี่จองผม', 'nîi kɔ̌ɔnɡ pǒm', NULL, 0, NULL, NULL, 1, NULL),
(225, 'Do you remember me?', 'จําผมได้ไหม', 'จjam pǒm dâai mái', NULL, 0, NULL, NULL, 1, NULL),
(226, 'Do you know him?', 'รู้จักเคขาไหม', 'rúu jàk káo mái', NULL, 0, NULL, NULL, 1, NULL),
(227, 'Arm', 'แขน', 'kɛ̌ɛn', NULL, 0, NULL, NULL, 1, NULL),
(228, 'Thing', 'ของ', 'kɔ̌ɔnɡ', NULL, 0, NULL, NULL, 1, NULL),
(229, 'What’s the matter?', 'เป็นอะไร', 'bpen à rai', NULL, 0, NULL, NULL, 1, NULL),
(230, 'What will you buy?', 'จะซื้ออะไร', 'jà sʉ́ʉ à rai', NULL, 0, NULL, NULL, 1, NULL),
(231, 'What will you do today?', 'วันนี้คุณจะทําอะไร', 'wanníi kun jà tam à rai', NULL, 0, NULL, NULL, 1, NULL),
(232, 'Per', 'ละ', 'lá', NULL, 0, NULL, NULL, 1, NULL),
(233, 'I want to have a mustache', 'ผมอยากมีหนวด', 'pom yàak mii nùat', NULL, 0, NULL, NULL, 1, NULL),
(234, 'To want', 'อยาก', 'yàak', NULL, 1, NULL, '2023-03-13 19:21:12', 1, NULL),
(236, 'To love', 'รัก', 'rák', NULL, 1, NULL, '2023-03-10 09:49:45', 1, NULL),
(237, 'Doctor', 'หมอ', 'mɔ̌ɔ', NULL, 0, NULL, NULL, 1, NULL),
(238, 'Student', 'นกเรียน', 'nák rian', NULL, 0, NULL, NULL, 1, NULL),
(239, 'What kind of work do you do?', 'คุณทํางามอะไร', 'kun tam ngaan à rai', NULL, 0, NULL, NULL, 1, NULL),
(240, 'Why do you study Thai?', 'ทําไมคุณเรียนภาษาไทย', 'tammai kun rian paa saa tai', NULL, 0, NULL, NULL, 1, NULL),
(241, 'Because I like Thai people very much', 'เพราะว่าผมขอบคนไทยมาก', 'prɔ́ wâa pǒm chɔ̂ɔp kon tai mâak', NULL, 0, NULL, NULL, 1, NULL),
(242, 'I love you very much', 'ผมรักคุณมาก', 'pom rak kun maak', NULL, 0, NULL, NULL, 1, NULL),
(243, 'Which, where', 'ไหน', 'nai', NULL, 0, NULL, NULL, 1, NULL),
(244, 'I need to go to the bathroom', 'ผมอยากไปห้องน้ำ', 'pom yaak bpai hong nam', NULL, 0, NULL, NULL, 1, NULL),
(245, 'I like white color more than black', 'ผมขอยสีขาวมากกว่าสีดํา', NULL, NULL, 0, NULL, NULL, 1, NULL),
(246, 'Really, indeed', 'จริงๆ', 'cring cring', NULL, 0, NULL, NULL, 1, NULL),
(247, 'If', 'ถ้า', NULL, NULL, 0, NULL, NULL, 1, NULL),
(248, 'If you’d have a lot of money what would you want to do', 'ถ้าคุณมีเงินมากๆคุณอยากจะทําอะไร', NULL, NULL, 0, NULL, NULL, 1, NULL),
(249, 'Money', 'เงิน', 'ngeng', NULL, 0, NULL, NULL, 1, NULL),
(250, 'To learn', 'ษา', NULL, NULL, 0, NULL, NULL, 1, NULL),
(251, 'Last', 'ที่แล้ว', NULL, NULL, 0, NULL, NULL, 1, NULL),
(252, 'Hot', 'ร้อน', 'rɔ́ɔn', NULL, 0, NULL, NULL, 1, NULL),
(253, 'Cold, cool', 'เย็น', 'yen', NULL, 0, NULL, NULL, 1, NULL),
(254, 'Little', 'น้อย', 'nɔ́ɔi', NULL, 0, NULL, NULL, 1, NULL),
(255, 'Old', 'อายุน้มาก', 'aa yú maak', NULL, 0, 'แก่ - gɛ̀ɛ', NULL, 1, NULL),
(256, 'Young', 'อายุน้อย', 'aa yú nóoi', NULL, 0, NULL, NULL, 1, NULL),
(257, 'Most', 'ที่สุด', 'tii sùt', NULL, 0, NULL, NULL, 1, NULL),
(258, 'Cute', 'น่ารัก', 'nâa rák', NULL, 0, NULL, NULL, 1, NULL),
(259, 'Bad', 'เลว', 'leeo', NULL, 0, NULL, NULL, 1, NULL),
(260, 'Can you make it four hundreds?', 'สี่ร้อยได้ไหม', 'sìi róoi dâai mái', NULL, 0, NULL, NULL, 1, NULL),
(261, 'This is the best', 'อันนี้ดีที่สุด', 'an níi dii tii sùt', NULL, 0, NULL, NULL, 1, NULL),
(262, 'Which one is better?', 'อันไกนดีกว่า', 'an níi dii gwàa', NULL, 0, NULL, NULL, 1, NULL),
(263, 'There are five people in the room', 'มีคนห้าคนอยุในห้อง', 'mii kon hâa kon yùu nai hông', NULL, 0, NULL, NULL, 1, NULL),
(264, 'How many siblins do you have?', 'คุณมีพี่น้องกี่คน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(265, 'Because', 'เพราะว่า', NULL, NULL, 0, NULL, NULL, 1, NULL),
(266, 'With', 'กับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(267, 'Do you understand?', 'เข้าใจมั้ย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(268, 'What’s your name?', 'นายชื่อไรอ่ะ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(269, 'Cool', 'แจ่มเลย', NULL, NULL, 0, 'It’s cool', NULL, 1, NULL),
(270, 'Look', 'เนี่ย', NULL, NULL, 0, 'Hey look at this', NULL, 1, NULL),
(271, 'Hey', 'เห้ย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(272, 'What are you doing?', 'ทําไรอะ', NULL, NULL, 1, 'Informal', '2023-04-10 07:26:42', 1, NULL),
(273, 'Wait', 'เดี๋ยวดิ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(274, 'I see', 'เอ่อ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(275, 'Good', 'เก่ง', NULL, NULL, 1, NULL, '2023-03-12 04:41:10', 1, NULL),
(276, 'What are you doing?', 'ทําไรยุ', NULL, NULL, 0, NULL, '2023-03-11 18:09:23', 1, NULL),
(277, 'English', 'ภาษาอังกฤษ', NULL, NULL, 0, NULL, '2023-03-11 18:17:56', 1, NULL),
(278, 'Is it', 'ไหม', NULL, NULL, 0, NULL, NULL, 1, NULL),
(279, 'To meet', 'เจอกัน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(280, 'Sex', 'เซ็ก', NULL, NULL, 0, NULL, NULL, 1, NULL),
(281, 'Looking for', 'กำลังหา', NULL, NULL, 0, NULL, NULL, 1, NULL),
(282, 'Dream', 'ฝัน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(283, 'Phrase softner', 'นะ', NULL, NULL, 0, 'Particle', NULL, 1, NULL),
(284, 'Sweetheart', 'ที่รัก', NULL, NULL, 0, NULL, NULL, 1, NULL),
(285, 'What is', 'คืออะไร', NULL, NULL, 0, NULL, NULL, 1, NULL),
(286, 'Line ID', 'ไลน์ไอดี', NULL, NULL, 0, NULL, NULL, 1, NULL),
(287, 'Your, my', 'ของผม', 'khǎawng pom', NULL, 1, NULL, '2023-03-13 06:01:28', 1, NULL),
(288, 'Can?', 'ได้ไหม', NULL, NULL, 1, NULL, '2023-03-13 11:50:28', 1, NULL),
(290, 'Free', 'ว่าง', NULL, NULL, 1, NULL, '2023-03-13 13:14:02', 1, NULL),
(291, 'Together', 'ด้วยกัน', NULL, NULL, 1, NULL, '2023-03-13 19:28:33', 1, NULL),
(292, 'Zero', 'ศูนย์', 'sǔun', NULL, 1, NULL, '2023-03-24 06:40:33', 1, 'numbers'),
(294, 'Two', 'สอง', 'sǎawng', NULL, 1, NULL, '2023-03-24 08:02:26', 1, 'numbers'),
(295, 'Three', 'สาม', 'sǎam', NULL, 1, NULL, '2023-03-24 08:02:42', 1, 'numbers'),
(296, 'Four', 'สี่', 'sìi', NULL, 1, NULL, '2023-03-30 18:43:04', 1, 'numbers'),
(297, 'Five', 'ห้า', 'hâa', NULL, 1, NULL, '2023-03-16 18:49:59', 1, 'numbers'),
(298, 'Six', 'หก', 'hòk', NULL, 1, NULL, '2023-03-16 18:50:14', 1, 'numbers'),
(299, 'Seven', 'เจ็ด', 'jèt', NULL, 1, NULL, '2023-03-16 18:50:38', 1, 'numbers'),
(300, 'Eight', 'แปด', 'bpàaet', NULL, 1, NULL, '2023-03-16 18:51:26', 1, 'numbers'),
(301, 'Nine', 'เก้า', 'gâo', NULL, 1, NULL, '2023-03-24 06:37:49', 1, 'numbers'),
(303, 'Who is it? (to female speaker)', 'นี่ใครคะ', 'nîi khrai khá', NULL, 0, NULL, NULL, 1, NULL),
(304, 'It\'s me', 'ผมเอง', 'pom eeng', NULL, 0, NULL, NULL, 1, NULL),
(305, 'To be', 'คือ', 'khuue', NULL, 0, NULL, NULL, 1, NULL),
(306, 'Who is ...', 'คือใคร', 'khuue krai', NULL, 0, NULL, NULL, 1, NULL),
(307, 'White', 'ขาว', 'k̄hāw', NULL, 1, NULL, '2023-03-30 18:46:48', 1, 'colors'),
(308, 'I\'m going now', 'ไปก่อนนะ', 'bpai gàawn ná', NULL, 0, NULL, NULL, 1, NULL),
(309, 'Next', 'หน้า', 'nâa', NULL, 0, NULL, NULL, 1, NULL),
(310, 'Two tickets to Pattaya please', 'ขอตั๋วไปพัทยาสองใบ', 'khǎaw dtǔua bpai phát-thá-yaa sǎawng bai', NULL, 0, NULL, NULL, 1, NULL),
(311, 'I slept for ten hours last night', 'เมื่อคืนฉันนอนไปสิบชั่วโมง', 'mûuea-khuuen chǎn naawn bpai sìp chûua-khǎo raaw yùu thîi sà-nǎam-bin hâa chûua-\r\nmoong', NULL, 0, NULL, NULL, 1, NULL),
(312, 'Who is going to the beach next weekend?', 'ใครจะไปทะเลเสาร์อาทิตย์หน้าบ้าง', 'khrai jà bpai thá-lee sǎo aa-thít nâa bâang', NULL, 0, NULL, NULL, 1, NULL),
(313, 'Within, in', 'ในอีก', 'nai èek', NULL, 0, NULL, NULL, 1, NULL),
(314, 'I leave in two hours', 'ฉันจะไปในอีกสองชั่วโมง', 'chǎn bpai naièek sǎawng chûua-moong', NULL, 0, NULL, NULL, 1, NULL),
(315, 'When does the football game start?', 'ฟุตบอลจะเริ่ มเมื่อไหร่', 'fút-baawn jà rôoem mûuea-rài.', NULL, 0, NULL, NULL, 1, NULL),
(316, 'Start, begin', 'เริ่ม', 'rôoem', NULL, 0, NULL, NULL, 1, NULL),
(317, 'He waited five hours in the airport', 'เขารออยูที่สนามบินห้าชั่วโมง', 'khǎo raaw yùu thîi sà-nǎam-bin hâa chûua-moong', NULL, 0, NULL, NULL, 1, NULL),
(318, 'What are you doing?', 'ทำไรอะไรอยู่ครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(319, 'I\'m working now', 'ผมทำงานอยู่', 'tam-ngaan yuu', NULL, 1, NULL, '2023-06-15 15:28:38', 1, NULL),
(320, 'I have a duty', 'ผมมีหน้าที่', NULL, NULL, 0, NULL, NULL, 1, NULL),
(321, 'Let\'s go', 'จัดไป', NULL, NULL, 0, NULL, NULL, 1, NULL),
(322, 'I promise ', 'ผมสัญญา', NULL, NULL, 1, NULL, NULL, 1, NULL),
(323, 'You all', 'ของพวกคุณ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(324, 'Look after, care', 'ดูแล', NULL, NULL, 0, NULL, NULL, 1, NULL),
(325, 'Very well, decent', 'อย่างดี', NULL, NULL, 0, NULL, NULL, 1, NULL),
(326, 'For a period of one year', 'ตลอดระยะเวลาหนึ่งปี', NULL, NULL, 0, NULL, NULL, 1, NULL),
(327, 'And', 'และ', NULL, NULL, 1, NULL, NULL, 1, NULL),
(329, 'And I hope', 'และผมหวังว่า', NULL, NULL, 1, NULL, NULL, 1, NULL),
(330, 'Unless', 'จนกว่า', NULL, NULL, 0, NULL, NULL, 1, NULL),
(331, 'Don\'t be late', 'ห้ามมาสาย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(332, 'System', 'ระบบ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(333, 'And finally', 'และสุดท้าย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(334, 'I\'m fine', 'สบายดี', NULL, NULL, 1, NULL, '2023-04-10 07:28:32', 1, NULL),
(336, 'Too', 'เช่นกัน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(337, 'Thank you', 'ขอบคุณครับ', NULL, NULL, 1, NULL, NULL, 1, NULL),
(344, 'Where are you going?', 'คุณกําลังไปที่ไหน', 'khun gam-lang bpai thîi-nǎi', NULL, 0, NULL, NULL, 1, NULL),
(348, 'How long have you been here?', 'คุณอยูที่นี่นานเท่าไหร่แล้ว', 'khun yùu thîi nîi naan thâo-rài láaeo', NULL, 0, NULL, NULL, 1, NULL),
(349, 'I\'ll stay in Bangkok for four days', 'ผมจะพักอยู่ที่กรุงเทพฯสีวัน', 'pom jà phák yùu thîi grung-thêep sìi wan', NULL, 0, NULL, NULL, 1, NULL),
(350, 'Where are you going tomorrow night?', 'คืนพรุ่งนี้คุณจะไปที่ไหน', 'khuuen phrûng-níi khun jà bpai thîi nǎi', NULL, 0, NULL, NULL, 1, NULL),
(351, 'Very cute', 'น่ารักจัง', NULL, NULL, 0, NULL, NULL, 1, NULL),
(352, 'You came to the bar last night', 'คุณมาที่บาร์เมื่อคืน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(353, 'Why would anyone want to date me?', 'ทําไมใครๆก็อยากจะออกเดทกับฉัน', 'tham-mai khrai-khrai gâaw yàak jà àawk dèet gáp pom', NULL, 0, NULL, NULL, 1, NULL),
(354, 'I will always love you', 'ผมจะรักคุณตลอดไป', 'phǒm jà rák khun dtà-làawt-bpai.', NULL, 0, NULL, NULL, 1, NULL),
(355, 'Could you say that more slowly?', 'ช่วยพูดช้าๆได้ ไหม', 'chûuai phûut cháa-cháa dâai mǎi?', NULL, 0, NULL, NULL, 1, NULL),
(356, 'Why are you late?', 'ทําไมคุณมาสาย', 'tham-mai khun maa sǎai', NULL, 0, NULL, NULL, 1, NULL),
(357, 'Why do you leave so early?', 'ทําไมคุณกลับเร็วจัง', 'tham-mai khun glàp reo jang', NULL, 0, NULL, NULL, 1, NULL),
(358, 'I don\'t have time', 'ผมไม่มีเวลา', 'pom mâi mii wee-laa', NULL, 0, NULL, NULL, 1, NULL),
(359, 'Time\'s up!', 'หมดเวลาแล้ว', 'mòt wee-laa láaeo', NULL, 0, NULL, NULL, 1, NULL),
(360, 'Do you understand?', 'คุณเข้าใจไหม', 'khun khâo-jai mǎi', NULL, 0, NULL, NULL, 1, NULL),
(361, 'Do you like chocolate?', 'คุณชอบช็อคโกแลตไหม', 'khun châawp châwk goo láet máai', NULL, 0, NULL, NULL, 1, NULL),
(362, 'I don\'t like this', 'ผมไม่ชอบอันนี้', 'pom mâi châawp an-níi', NULL, 0, NULL, NULL, 1, NULL),
(363, 'Can I see the menu?', 'ขอดูเมนูได้ไหม', 'khǎaw duu mee-nuu dâai', NULL, 0, NULL, NULL, 1, NULL),
(364, 'What do you recommend?', 'มีอะไรแนะนําไหมคะ', 'mii à-rai náe-nam máai khá', NULL, 0, NULL, NULL, 1, NULL),
(365, 'To recommend', 'แนะนํา', 'náe-nam', NULL, 0, NULL, NULL, 1, NULL),
(366, 'To request', 'ขอ', 'khǎaw', NULL, 0, NULL, NULL, 1, NULL),
(367, 'You are the right one for me', 'คุณคือคนที่ใช่สําหรับผม', 'khun khuue khon thîi châi sǎm-ràp phǒm.', NULL, 0, NULL, NULL, 1, NULL),
(368, 'Can you bring the bill, please?', 'เช็คบิลด้วย', 'chék bin dûuai', NULL, 0, NULL, NULL, 1, NULL),
(369, 'Keep the change', 'เก็บเงินทอนไว้เถอะ', 'khǎaw-thôot ngoen-thaawn phìt khâ', NULL, 0, NULL, NULL, 1, NULL),
(370, 'Let\'s go find something to eat', 'ไปหาอะไรทานกันเถอะ', 'bpai hǎa à-rai thaan gan thòe', NULL, 0, NULL, NULL, 1, NULL),
(371, 'Do you have plans on Friday night?', 'คืนวันศุกร์ มีแผนหรือเปล่า', 'khuuen wan sùk mii phǎaen rǔe bplàao', NULL, 0, NULL, NULL, 1, NULL),
(372, 'Will you join?', 'ไปด้วยกันไหม', 'bpai dûuai gan máai', NULL, 0, NULL, NULL, 1, NULL),
(373, 'I bought this house two years ago', 'ผมซื้อบ้านหลังนี้เมื่อสองปีก่อน', 'pom súue bâan lǎng níi mûuea sǎawng bpii gàawn', NULL, 0, NULL, NULL, 1, NULL),
(374, 'Turn', 'เสี้ยว', 'liao', NULL, 0, NULL, NULL, 1, 'destination'),
(375, 'Left', 'ฃ้าย', 'saai', NULL, 0, NULL, NULL, 1, 'destination'),
(376, 'Right', 'ขวา', 'kwaa', NULL, 0, NULL, NULL, 1, 'destination'),
(377, 'At', 'ดรง', 'dtrong', NULL, 0, NULL, NULL, 1, 'destination'),
(378, 'Straight', 'ตรงไป', 'dtrong-bpai', NULL, 0, NULL, NULL, 1, 'destination'),
(379, 'Over here, right here', 'ตรงนี้', 'dtrong-nii', NULL, 0, NULL, NULL, 1, 'destination'),
(380, 'Over there, right there', 'ตรงนั้น', 'dtrong-nan', NULL, 0, NULL, NULL, 1, 'destination'),
(381, 'Left hand side', 'ช้ายมือ', 'saai-mʉʉ', NULL, 0, NULL, NULL, 1, 'destination'),
(382, 'Right hand side', 'ขวามือ', 'kwaa-mʉʉ', NULL, 0, NULL, NULL, 1, 'destination'),
(383, 'In fron of, ahead', 'ข้างหน้า', 'kaang-naa', NULL, 0, NULL, NULL, 1, 'destination'),
(384, 'Behind', 'ข้างหลัง', 'kaang-lang', NULL, 0, NULL, NULL, 1, 'destination'),
(385, 'Inside', 'จข้างใน', 'kaang-nai', NULL, 0, NULL, NULL, 1, 'destination'),
(386, 'Outside', 'ข้งนอก', 'kaang-nook', NULL, 0, NULL, NULL, 1, 'destination'),
(387, 'Crossroad', 'สี่แยก', 'sii-yeek', NULL, 0, NULL, NULL, 1, NULL),
(388, 'Bus stop', 'ป้ายรถเมล์', 'bpaai-rotmee', NULL, 0, NULL, NULL, 1, NULL),
(389, 'Station', 'สถานี', 'sa-taa-nii', NULL, 0, NULL, NULL, 1, NULL),
(390, 'Railway station', 'สถานีรถไฟ', 'sa-taa-nii-rot-fai\r\n', NULL, 0, NULL, NULL, 1, NULL),
(391, 'Good luck', 'โชคดีนะ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(392, 'I can speak Thai a little', 'ผมพูดภาษาไทยนิดหน่อย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(393, 'Come again', 'มาอีกครั้ง', NULL, NULL, 1, NULL, NULL, 1, NULL),
(394, 'Where are you?', 'อยู่ที่ไหน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(395, 'Wait a moment, please', 'รออีกสักครู่', NULL, NULL, 0, NULL, NULL, 1, NULL),
(396, 'Do you have any plans?', 'มีแผนอะไร', NULL, NULL, 1, NULL, NULL, 1, NULL),
(397, 'How are you?', 'เป็นอย่างไรบ้าง', NULL, NULL, 1, NULL, NULL, 1, NULL),
(398, 'Do you have line?', 'แถวไหน', 'taeo nai', NULL, 1, NULL, '2023-06-15 15:22:03', 1, NULL),
(399, 'Me too', 'เหมือนกัน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(400, 'Are you hungry?', 'คุณหิวไหม', NULL, NULL, 0, NULL, '2023-09-05 09:18:38', 1, NULL),
(401, 'hi', 'หวัดดี', NULL, NULL, 0, NULL, NULL, 1, NULL),
(402, 'Are you top or bottom?', 'แบบไหน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(403, 'Where are you?', 'อยู่ไหนครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(404, 'Hey!', 'ไง', NULL, NULL, 0, NULL, NULL, 1, NULL),
(405, 'I\'m sorry', ' โทษนะ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(406, 'Are you hungry?', ' คุณหิวไหม?', NULL, NULL, 0, NULL, NULL, 1, NULL),
(407, 'Greetings', 'ทักทาย', NULL, NULL, 0, NULL, NULL, 1, NULL),
(408, 'How long are you staying in Thailand', 'มาอยู่ไทยนานยังครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(409, 'Are you alone?', 'คนเดียวหรอครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(410, 'I\'m reading a book', 'อ่านหนังสือครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(411, 'Me too', 'เช่นกันครับ', NULL, NULL, 0, NULL, NULL, 1, NULL),
(413, 'Wow!', 'ว้าว', NULL, NULL, 0, NULL, NULL, 1, NULL),
(414, 'What are you doing?', 'ทำไร', NULL, NULL, 0, NULL, NULL, 1, NULL),
(415, 'I\'m horny', 'เงี่ยน', NULL, NULL, 0, NULL, NULL, 1, NULL),
(416, 'What are you looking for?', 'หาไร', NULL, NULL, 0, NULL, NULL, 1, NULL),
(417, 'Who are you with?', 'คุณอยู่กับใคร', NULL, NULL, 0, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `words_composition`
--

CREATE TABLE `words_composition` (
  `id` int NOT NULL,
  `word_id` int NOT NULL,
  `child_word_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `words_composition`
--

INSERT INTO `words_composition` (`id`, `word_id`, `child_word_id`) VALUES
(26, 70, 63),
(28, 71, 33),
(30, 71, 62),
(31, 71, 134),
(27, 71, 275),
(29, 71, 277),
(21, 72, 37),
(4, 74, 37),
(2, 74, 52),
(3, 74, 133),
(1, 74, 134),
(20, 76, 37),
(12, 76, 56),
(11, 77, 16),
(10, 77, 134),
(5, 77, 135),
(32, 78, 179),
(33, 78, 279),
(46, 82, 133),
(34, 88, 131),
(35, 88, 280),
(36, 88, 281),
(37, 90, 209),
(38, 90, 282),
(39, 90, 283),
(40, 90, 284),
(72, 91, 56),
(42, 97, 134),
(43, 97, 285),
(44, 97, 286),
(45, 97, 287),
(66, 97, 305),
(8, 105, 5),
(7, 105, 128),
(6, 105, 129),
(9, 105, 130),
(59, 122, 59),
(23, 124, 37),
(69, 137, 306),
(22, 142, 243),
(14, 157, 135),
(13, 157, 182),
(15, 157, 197),
(58, 174, 59),
(24, 199, 179),
(47, 199, 190),
(49, 199, 278),
(48, 199, 290),
(51, 200, 58),
(52, 200, 278),
(50, 200, 291),
(56, 213, 36),
(57, 213, 53),
(55, 213, 134),
(53, 213, 234),
(16, 220, 219),
(17, 221, 219),
(18, 222, 223),
(77, 230, 36),
(78, 230, 38),
(76, 230, 205),
(25, 248, 247),
(74, 264, 15),
(75, 264, 23),
(64, 285, 305),
(61, 303, 30),
(60, 303, 217),
(70, 314, 313),
(71, 315, 316),
(73, 317, 56);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consonants`
--
ALTER TABLE `consonants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dialogs`
--
ALTER TABLE `dialogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dialog_persons`
--
ALTER TABLE `dialog_persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dialog_words`
--
ALTER TABLE `dialog_words`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dialog_id` (`dialog_id`),
  ADD KEY `dialog_person_id` (`dialog_person_id`),
  ADD KEY `word_id` (`word_id`);

--
-- Indexes for table `vowels`
--
ALTER TABLE `vowels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base` (`base`,`th`);

--
-- Indexes for table `words_composition`
--
ALTER TABLE `words_composition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `word_id_2` (`word_id`,`child_word_id`),
  ADD KEY `word_id` (`word_id`),
  ADD KEY `in_word_id` (`child_word_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consonants`
--
ALTER TABLE `consonants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dialogs`
--
ALTER TABLE `dialogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dialog_persons`
--
ALTER TABLE `dialog_persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dialog_words`
--
ALTER TABLE `dialog_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `vowels`
--
ALTER TABLE `vowels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;

--
-- AUTO_INCREMENT for table `words_composition`
--
ALTER TABLE `words_composition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dialog_words`
--
ALTER TABLE `dialog_words`
  ADD CONSTRAINT `dialog_words_ibfk_1` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `dialog_words_ibfk_2` FOREIGN KEY (`dialog_person_id`) REFERENCES `dialog_persons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `dialog_words_ibfk_3` FOREIGN KEY (`word_id`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `words_composition`
--
ALTER TABLE `words_composition`
  ADD CONSTRAINT `words_composition_ibfk_1` FOREIGN KEY (`child_word_id`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `words_composition_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
