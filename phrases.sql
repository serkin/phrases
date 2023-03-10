-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 09, 2023 at 12:39 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

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
(2, 'New dialog');

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
(5, 'คุณแม่', 'Mother');

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
(9, 2, 5, 143);

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` int NOT NULL,
  `base` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `th` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `spelling` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `hidden_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3,
  `answered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `base`, `th`, `spelling`, `hidden_at`, `is_active`, `comment`, `answered_at`) VALUES
(1, 'A little', 'นิดหน่อย', 'nítnòi\n', NULL, 0, NULL, NULL),
(2, 'Also', 'ก็', 'goo\n', NULL, 0, NULL, '2023-03-08 11:18:08'),
(3, 'I\'m also fine', 'ผมก็สบายดี', NULL, NULL, 0, NULL, NULL),
(4, 'And, with', 'กับ', 'gàp\n', NULL, 0, NULL, NULL),
(5, 'At, in', 'ที่', NULL, '2023-03-08 17:29:56', 1, NULL, '2023-03-08 17:29:54'),
(6, 'Between', 'ระหว่าง', 'rá-wàang\n', NULL, 0, NULL, NULL),
(7, 'But', 'แต่', 'dtɛ̀ɛ\n', NULL, 0, NULL, NULL),
(8, 'Can', 'ได้', 'dâai\n', NULL, 0, NULL, NULL),
(9, 'Cheap', 'ถก', 'tùuk\n', NULL, 0, NULL, NULL),
(10, 'Difficult', 'ยาก', 'yàak\n', NULL, 0, NULL, NULL),
(11, 'Easy', 'ง่าย', 'ngâai\n', NULL, 0, NULL, NULL),
(12, 'Expensive', 'เเพง', 'pɛɛng\n', NULL, 0, NULL, NULL),
(13, 'He, she, him, her', 'เขา', 'káo\n', '2023-03-06 15:51:02', 1, NULL, '2023-03-06 15:51:00'),
(14, 'Here', 'ที่นี่', 'tîi-nîi\n', NULL, 1, NULL, '2023-03-09 11:27:47'),
(15, 'How many', 'กี่', 'gìi\n', NULL, 0, NULL, NULL),
(16, 'How much', 'เท่าไหร่', 'tâo-rài\n', NULL, 1, NULL, NULL),
(17, 'In', 'ใน', 'nai\n', NULL, 0, NULL, NULL),
(18, 'It', 'มัน', 'man\n', NULL, 0, NULL, NULL),
(19, 'On', 'บน', 'bon\n', NULL, 0, NULL, NULL),
(20, 'One more time', 'อีกที', 'ìik-tii\n', NULL, 0, NULL, NULL),
(21, 'Or', 'หรือ', 'rʉʉ\n', NULL, 0, NULL, NULL),
(22, 'Over there', 'ที่โน่น', 'tîi-nôon\n', NULL, 0, NULL, NULL),
(23, 'Person', 'คน', 'kon\n', NULL, 0, NULL, NULL),
(24, 'Quick', 'เร็ว', 'reo\n', NULL, 0, NULL, NULL),
(25, 'Same here', 'เช่นกัน', 'chen-gan\n', NULL, 0, NULL, NULL),
(26, 'Slow', 'ช้า', 'cháa\n', NULL, 0, NULL, NULL),
(27, 'That', 'นั่น', 'nan\n', NULL, 0, NULL, NULL),
(28, 'There', 'ที่นั่น', 'tîi-nân\n', NULL, 0, NULL, NULL),
(29, 'They, them', 'พวกเขา', 'pûal káo\n', NULL, 0, NULL, NULL),
(30, 'This', 'นี่', 'nii\n', NULL, 0, NULL, NULL),
(31, 'Under', 'ใต้', 'dtâai\n', NULL, 0, NULL, NULL),
(32, 'Very difficult', 'ยากมาก', 'yâak mâak\n', NULL, 0, NULL, NULL),
(33, 'Very, many', 'มาก', 'มาก\n', '2023-03-06 14:49:53', 1, NULL, '2023-03-06 14:49:50'),
(34, 'We, us', 'เรา', 'rao\r\n', '2023-03-06 14:50:09', 1, NULL, '2023-03-06 14:50:07'),
(35, 'Week', 'สัปดาห์', 'sapdaah\n', NULL, 0, NULL, NULL),
(36, 'What', 'อะไร', 'a-rai\n', '2023-03-06 09:02:56', 1, NULL, NULL),
(37, 'Where', 'ที่ไหน', 'tîi-nai\n', '2023-03-03 10:33:01', 1, NULL, NULL),
(38, 'Will', 'จะ', 'yà\n', NULL, 0, NULL, NULL),
(39, 'Time', 'เวลา', 'wee-laa\n', NULL, 0, NULL, NULL),
(40, 'Hour', 'ชั่วโมง', 'chûa-moonɡ\n', NULL, 0, NULL, NULL),
(41, 'Minute', 'นาที', 'naa-tii\n', NULL, 0, NULL, NULL),
(42, 'Second', 'วินาที', 'wí-naa-tii\n', NULL, 0, NULL, NULL),
(43, 'Exactly', 'ตรง', 'dtronɡ\n', NULL, 0, NULL, NULL),
(44, 'Half', 'ครึ่ง', 'krʉ̂nɡ\n', NULL, 0, NULL, NULL),
(45, 'Almost', 'เกือบ', 'ɡʉ̀ap\n', NULL, 0, NULL, NULL),
(46, 'Past', 'กว่า', 'ɡwàa\n', NULL, 0, NULL, NULL),
(47, 'Already', 'แล้ว', 'lɛ́ɛo\n', NULL, 0, NULL, NULL),
(48, 'Fast', 'เร้ว', 'reo\n', NULL, 0, NULL, NULL),
(49, 'Late', 'สาย', 'sǎai\n', NULL, 0, NULL, NULL),
(50, 'Before, first, ahead', 'ก่อน', 'ɡɔ̀ɔn\n', NULL, 0, NULL, NULL),
(51, 'After', 'หลัง', 'lǎnɡ\n', NULL, 0, NULL, NULL),
(52, 'To come', 'มา', 'maa\n', NULL, 1, NULL, NULL),
(53, 'To do', 'ทํา', 'tam\n', '2023-03-06 14:50:26', 1, NULL, '2023-03-06 14:50:23'),
(54, 'To be something', 'เป็น', 'bpen\n', '2023-03-06 14:50:45', 1, NULL, '2023-03-06 14:50:42'),
(55, 'To have', 'มี', 'mii\n', NULL, 1, NULL, NULL),
(56, 'To be somewhere(live, stay)', 'อยู่', 'yùu\n', NULL, 1, NULL, '2023-03-08 17:31:03'),
(57, 'To get, want, take', 'เอา', 'ao\n', NULL, 0, NULL, NULL),
(58, 'To go', 'ไป', 'bpai\n', '2023-03-06 14:52:04', 1, NULL, '2023-03-06 14:52:01'),
(59, 'To eat', 'กิน', 'gin\r\n', NULL, 1, NULL, '2023-03-08 11:19:45'),
(60, 'To drink', 'ดื่ม', 'dʉ̀ʉm\n', NULL, 0, NULL, NULL),
(61, 'To watch', 'ดู', 'duu\n', NULL, 1, NULL, '2023-03-08 11:20:11'),
(62, 'To speak', 'พูด', 'pûut\n', NULL, 1, NULL, '2023-03-08 11:20:43'),
(63, 'To read', 'อ่าน', 'àan\n', NULL, 0, NULL, NULL),
(64, 'To write', 'เขียน', 'kǐan\n', NULL, 0, NULL, NULL),
(65, 'To study', 'เรียน', 'rian\n', NULL, 0, NULL, NULL),
(66, 'To teach', 'สอน', 'sɔ̌ɔn\n', NULL, 0, NULL, NULL),
(67, 'To work', 'ทํางาน', 'tam-ngaam\n', NULL, 0, NULL, NULL),
(68, 'To wake up', 'ตื่นนอน', 'dtʉ̀ʉn nɔɔn\n', NULL, 0, NULL, NULL),
(69, 'To like', 'ชอบ', 'chɔ̂ɔp\n', '2023-03-03 10:33:12', 1, NULL, NULL),
(70, 'Can you read Thai?', 'คณอ่านภาษาไทยได็ไหม', 'khun aan oaa-saa tai daai-mai\n', NULL, 0, NULL, NULL),
(71, 'You speak English very well', 'ครพูดถาษาอักฤษเก่งมาก', 'khun puut angrit geng maak\n', NULL, 1, NULL, NULL),
(72, 'Where do you work?', 'คุณทํางานที่ไหน', 'kun tam-ngaan ti-nai\n', NULL, 1, NULL, NULL),
(73, 'Can you speak English', 'คุณพูดภาษาอังกฤษได้มั้ย?', 'khoun phoud pha sa ungrit dai mai?\n', NULL, 1, NULL, NULL),
(74, 'Where are you from?', 'คุณมาจากที่ไหน', 'khoun ma dzak ti nai?\r\n', NULL, 1, NULL, '2023-03-08 11:21:14'),
(75, 'What about you? You?', 'คุณละ', NULL, NULL, 0, NULL, NULL),
(76, 'Where do you live?', 'คุณอยู่ที่ไหน', 'kun yùu tîi-nai\n', NULL, 1, NULL, '2023-03-08 17:38:38'),
(77, 'How old are you?', 'คุณอายุเท่าไหร่', 'khun aa-yú thâo-rài\r\n', NULL, 1, NULL, '2023-03-08 17:24:01'),
(78, 'See you tomorrow', 'เจอกันพรุ่งนี้', NULL, NULL, 1, NULL, NULL),
(79, 'See you', 'เจอกันใหม่', NULL, NULL, 0, NULL, NULL),
(80, 'I like you', 'ผมขอบคุณ', NULL, '2023-03-08 17:24:26', 1, NULL, '2023-03-08 17:24:24'),
(81, 'I can\'t speak Thai', 'คุณพูดภาษาไทยไม่ได้', 'chan phoud phasa thai mi dai\r\n', NULL, 0, NULL, NULL),
(82, 'I\'m from Kenya', 'ผมมาจากเคนยา', 'pom ma chak kenia\r\n', NULL, 1, NULL, '2023-03-08 17:20:58'),
(83, 'I don’t understand', 'ผทไม่เข้าใจ', 'chan mai khao jai\n', NULL, 0, NULL, NULL),
(84, 'I didn\'t mean it, sorry.', 'ผมไม่ได้เจตนา ขอโทษ', 'chan may day ceettanaa khoo thood kh\r\n', NULL, 0, NULL, '2023-03-08 17:45:42'),
(85, 'What is your name?', 'ชื่อไร', NULL, NULL, 1, NULL, NULL),
(86, 'See you soon', 'เดี๋ยวเจอกัน', NULL, NULL, 1, NULL, NULL),
(87, 'I like you too', 'ผมชอบคุณเหมือนกัน', NULL, NULL, 0, NULL, '2023-03-08 17:44:48'),
(88, 'I\'m looking for sex right now', 'ผมกำลังหาเซ็กตอนนี้', NULL, NULL, 1, NULL, NULL),
(89, 'My name is Tom', 'ผมขื่อทม', NULL, NULL, 1, NULL, '2023-03-08 17:24:48'),
(90, 'Good night my love', 'ฝันดีนะครับที่รัก', NULL, NULL, 1, NULL, NULL),
(91, 'I\'m at home', 'พมอยู่ที่บ้านๅ', 'pom yùu tîi báan\n', NULL, 0, NULL, NULL),
(93, 'That is very expensive', 'แพงมาก', 'pɛɛng mâak\n', NULL, 0, NULL, NULL),
(94, 'No', 'ไม่', 'mai\n', NULL, 0, NULL, NULL),
(95, 'You are welcome', 'ไม่เป็นไร', 'mai bpenrai\n', NULL, 0, NULL, NULL),
(96, 'Good night', 'ราตรีสวัสดิ์', 'raatrii sawat\n', NULL, 0, NULL, NULL),
(97, 'What is your Line ID?', 'ไลน์ไอดีของคุณคืออะไร?', NULL, NULL, 0, NULL, NULL),
(98, 'How are you?', 'สบายดีไหม', 'sa bai dee mai?\n', NULL, 1, NULL, '2023-03-08 17:27:04'),
(99, 'Hello', 'สวัสดี', NULL, '2023-03-06 15:47:32', 1, NULL, '2023-03-06 15:47:29'),
(100, 'Good afternoon', 'สวัสดีตอนบ่าย', 'sawàt dii tɔɔn bàay\n', NULL, 0, NULL, NULL),
(101, 'Good morning', 'สวัสดีตอนเ', NULL, NULL, 0, NULL, NULL),
(102, 'How are things going?', 'หมู่นี้เป็นอย่างไรบ้าง', 'muu nii pen yaan ray baan\n', NULL, 0, NULL, NULL),
(104, 'How much is this one?', 'อันนี้เท่าไหร่', 'an níi tâo-rài\n', NULL, 0, NULL, NULL),
(105, 'Nice to meet you', 'ยินดีที่ได้รู้จัก', 'yin-dii thîi dâai rúu-jàk', NULL, 1, NULL, '2023-03-08 17:29:41'),
(107, 'So sorry', 'ขอไทษจริงๆ', 'khoo thoot cin cin\n', NULL, 0, NULL, NULL),
(108, 'Thank you', 'ขอบคุณ', 'khob khun\n', NULL, 1, NULL, NULL),
(109, 'Thank you very much', 'ขอบคุณมาก', 'khoop khun maak\n', NULL, 1, NULL, NULL),
(112, 'And you?', 'คูณล่ะ', 'kun lâ\n', NULL, 0, NULL, NULL),
(113, 'Yes', 'ใช่', 'chai\n', NULL, 0, NULL, NULL),
(114, 'Good night, sweetheart ', 'ฝันดีนะคับที่รัก', NULL, NULL, 0, NULL, NULL),
(115, 'Long time no see', 'ไม่เจอกันนาน', NULL, NULL, 0, NULL, NULL),
(116, 'Don’t mention it', 'ไม่ต้งเกรงใจ', 'may ton kreen cay\n', NULL, 0, NULL, NULL),
(117, 'Bye', 'ลาก่อน', 'laa koon\n', NULL, 0, NULL, NULL),
(118, 'Hello everyone ', 'สวัสดีทุกคน', 'swasdi thuk khun\n', NULL, 0, NULL, NULL),
(119, 'Do you understand?', 'เข้าใจไหม', 'kao-jai mai\n', NULL, 0, NULL, NULL),
(120, 'You are very funny', 'คุณเป็นคนตลกมาก', NULL, NULL, 0, NULL, NULL),
(121, 'What nationality are you?', 'คูณเป้นคนอะไร', 'kun bpen kon a rai\n', NULL, 0, NULL, NULL),
(122, 'I like to drink beer', 'พมชอบกินเบียร์', 'pon choop gin bia\n', NULL, 0, NULL, NULL),
(123, 'The store is closing', 'ร้านค้าใกล้จะปิดแล้ว', 'raan khaa klay ca pit leew\n', NULL, 0, NULL, NULL),
(124, 'Where did you learn English?', 'คณเรีอนถาษาไทยทื่ไหน', 'khun rian paa-saa angrit ti nai', NULL, 0, NULL, NULL),
(126, 'That', 'ที่', 'thîi', NULL, 0, 'preposition, pronoun, noun', NULL),
(128, 'Welcome, pleasure', 'ยินดี', 'yin-dii', NULL, 1, NULL, NULL),
(129, 'To know someone', 'รู้จัก', 'rúu-jàk', NULL, 0, NULL, NULL),
(130, 'To get', 'ได้', 'dâai', NULL, 0, 'verb, auxiliary verb', NULL),
(131, 'Now', 'ตอนนี้', NULL, NULL, 1, NULL, '2023-03-08 17:30:42'),
(132, 'Every day', 'ทุกวัน', NULL, NULL, 0, NULL, NULL),
(133, 'от, из', 'จาก', NULL, NULL, 0, NULL, NULL),
(134, 'You', 'คุณ', 'khun', '2023-03-08 17:38:51', 1, NULL, '2023-03-08 17:38:49'),
(135, 'Age', 'อายุ', NULL, NULL, 1, NULL, '2023-03-08 11:18:47'),
(136, 'Why', 'ทําไม', NULL, NULL, 0, NULL, NULL),
(137, 'Who is the person wearing a brown outfit?', 'คนที่ใส่ชุดสีนํ้าตาลคือใคร', 'khon thîi sài chút sǐi-nám-dtaan khuue khrai khráp\n', NULL, 0, NULL, NULL),
(138, '(laughing) Oh...he\'s a police officer', '(หัวเราะ)อ้อ...เขาเป็ นตํารวจน่ะ', '(laughing) âaw...khǎo bpen dtam-rùuat nâ khráp\n', NULL, 0, NULL, NULL),
(139, 'And that boy wearing orange cloth is a monk, right?', 'แล้ วเด็กผู้ชายคนนันที่ใส่ผ้าสีส้มเป็นพระสงฆ์ใช่ไหม', 'láaeo dèk phûu-chaai khon nán thîi sài phâa sǐi-sôm bpen phrá-sǒng châi mǎi khráp\n', NULL, 0, NULL, NULL),
(140, 'No. That\'s a novice', 'ไม่ใช่ นั่นเณร', 'mâi châi khráp. nân neen khráp\n', NULL, 0, NULL, NULL),
(141, 'We\'re home', 'ถึงบ้านแล้ว', 'thǔeng bâan láaeo', NULL, 0, NULL, NULL),
(142, 'Which house is it?', 'หลังไหน', 'lǎng nǎi khráp\n', NULL, 0, NULL, NULL),
(143, 'It\'s the house with the bamboo', 'บ้านที่มีต้นไผ่', 'bâan thîi mii dtôn-phài', NULL, 0, NULL, NULL),
(144, 'Home, house', 'บ้าน', 'bâan', NULL, 0, 'Noun\n', NULL),
(145, 'Novice monk', 'เณร', 'neen', NULL, 0, 'noun\n', NULL),
(146, 'Buddhist monk', 'พระสงฆ์', 'phrá-sǒng', NULL, 0, 'noun\n', NULL),
(147, 'Orange', 'สีส้ม', 'sǐi-sôm', '2023-03-09 18:18:44', 0, 'noun, adjective\n', NULL),
(148, 'Boy', 'เด็กผู้ชาย', 'dèk-phûu-chaai', NULL, 0, 'Noun\n', NULL),
(149, 'Police, Policeman', 'ตํารวจ', 'dtam-rùuat', NULL, 0, 'Noun\n', NULL),
(150, 'Brown', 'สีนํ้าตาล', 'sǐi-nám-dtaan', NULL, 0, 'noun, adjective\n', NULL),
(151, 'To put in, to wear', 'ใส่', 'sài', NULL, 0, 'verb\n', NULL),
(152, 'Bamboo', 'ต้นไผ่', 'dtôn-phài', NULL, 0, 'noun', NULL),
(153, 'Hello(informal)', 'หวัดดี', 'wat-dii', NULL, 0, NULL, NULL),
(154, 'It\'s no problem', 'ไม่เป็นไร', 'mâi-bpen-rai', NULL, 0, NULL, NULL),
(155, 'Appointment', 'นัด', 'nát', NULL, 0, NULL, NULL),
(156, 'Do you speak English?', 'คุณพูดภาษาอังกฤษได้ไหม', 'khun phûut phaa-sǎa-ang-grìt dâai mǎi', NULL, 1, NULL, NULL),
(157, 'I am 18 years old', 'ผมอายุ18ปี', 'phǒm aa-yú sìp paed bpii', NULL, 1, NULL, '2023-03-09 11:30:28'),
(158, 'I am American', 'ผมเป็นคนอเมริกนั', 'phǒm bpen khon-à-mee-rí-gan', NULL, 0, NULL, NULL),
(159, 'How much does this cost?', 'อันนี้ราคาเท่าไหร่', 'an-níi raa-khaa thâo-rài', NULL, 0, NULL, NULL),
(160, 'OK, I\'ll take this one', 'โอเค ผมเอาอันนี้แห', 'OK. phǒm ao an-níi làe', NULL, 0, NULL, NULL),
(161, 'It\'s a little too expensive', 'มันแพงไปหน่อย', 'man phaaeng bpai nàwy', NULL, 0, NULL, NULL),
(162, 'Price', 'ราคา', 'raa-khaa', NULL, 0, 'noun, verb', NULL),
(163, 'What is this called?', 'อันนี่เรียกว่าอะไร', 'an-níi rîiak wâa à-rai', NULL, 0, NULL, NULL),
(164, 'One', 'หนึ่ง', 'nùeng', NULL, 0, 'numbers', NULL),
(165, 'What are you doing?', 'คุณกําลังทําอะไร', 'khun gam-lang tham à-rai', NULL, 1, NULL, NULL),
(166, 'I am studying', 'ผมกําลังเรียนอยู่', 'khun gam-lang riian yùu khâ', NULL, 0, NULL, NULL),
(167, 'Being', 'กําลัง', 'gam-lang', NULL, 0, 'verb, auxiliary verb', NULL),
(168, '..is doing..', 'กําลัง...อยู่', 'gam-lang...yùu', NULL, 0, 'auxiliary verb', NULL),
(169, 'I don\'t know what to do', 'ผมไม่รู้จะทําอย่างไรดี', 'khun mâi rúu jà tham yàang-rai dii', NULL, 0, NULL, NULL),
(170, 'Long time no see', 'ไม่ได้เจอกันตั้งนาน', 'ไม่ได้ เจอกันตังนาน', NULL, 0, NULL, NULL),
(171, 'Have a safe trip', 'เดินทางปลอดภัยนะ', NULL, NULL, 0, NULL, NULL),
(172, 'Delicious', 'อร่อย', 'à-ràwy', NULL, 0, 'Adjective', NULL),
(173, 'Could you please get me a glass of cold water?', 'ขอนํ้าเย็นหนึ่งแก้ว', 'khǎaw náam yen nùeng gâaeo', NULL, 0, NULL, NULL),
(174, 'What time do you eat dinner?', 'คุณกินข้าวเย็นกี่โมง', 'kun gin kâao-yen gìi moong', NULL, 0, NULL, NULL),
(175, 'Weekend', 'เสาร์อาทิตย์', 'sǎo-aa-tít', NULL, 0, NULL, NULL),
(176, 'I will go to Thailand in September', 'ผมจะไปเมืองไทยเดือนกัมยา', 'pǒm jà bpai mʉanɡ tai dʉan ɡan yaa', NULL, 0, NULL, NULL),
(177, 'Month', 'เดือน', 'dʉan', NULL, 0, NULL, NULL),
(178, 'Every', 'ทุก', 'tùk', NULL, 0, NULL, NULL),
(179, 'Tomorrow ', 'พรุ่งนี้', 'prûng níi', NULL, 0, NULL, NULL),
(180, 'Today', 'วันนี้', 'wanníi', NULL, 0, NULL, NULL),
(181, 'Yesterday ', 'เมื่อวานนี้', 'mʉ̂a waanníi', NULL, 0, NULL, NULL),
(182, 'Year', 'ปี', 'bpii', NULL, 0, NULL, NULL),
(183, 'This year', 'ปีนี้', 'bpii níi', NULL, 0, NULL, NULL),
(184, 'Every week', 'ทุกอาทิตย์', 'túk aa tít', NULL, 0, NULL, NULL),
(185, 'Last year', 'ปีที่แล้ว', 'bpii tîi lɛ́ɛo', NULL, 0, NULL, NULL),
(186, 'Next year', 'ปีหน้า', 'bpii nâa', NULL, 0, NULL, NULL),
(187, 'Morning', 'เข้า', 'cháao', NULL, 0, NULL, NULL),
(188, 'Evening', 'เย็น', 'yen', NULL, 0, NULL, NULL),
(189, 'This evening', 'เย็นนี้', 'yen níi', NULL, 0, NULL, NULL),
(190, 'Night', 'คืน', 'kʉʉn', NULL, 0, NULL, NULL),
(191, 'Tonight', 'คืนน้ี', 'kʉʉn níi', NULL, 0, NULL, NULL),
(192, 'Last night', 'เมื่อคืนนี้', 'mʉ̂a kʉʉn níi', NULL, 0, NULL, NULL),
(193, 'Friend', 'เพื่อน', 'pʉ̂an', NULL, 0, NULL, NULL),
(194, 'Must', 'ต้อง', 'dtông', NULL, 0, NULL, NULL),
(195, 'I don\'t know', 'ผมไม่รู้', NULL, NULL, 0, NULL, NULL),
(196, 'Name', 'ชื่อ', 'chʉʉ', NULL, 0, NULL, NULL),
(197, 'I', 'ผม', NULL, NULL, 0, NULL, NULL),
(198, 'Tom speaking', 'ทมพูด', 'tom pûut', NULL, 0, NULL, NULL),
(199, 'Are you free tomorrow night?', 'คืนพรุ่งนี้ว่างไหม', 'kʉʉn prûnɡ nii wâanɡ mái', NULL, 0, NULL, NULL),
(200, 'Do you want to go with me?', 'ไปด้วยกันไหม', 'bpai dûai gan mái', NULL, 0, NULL, NULL),
(201, 'What day is today?', 'วันนี้วันอะไร', 'wan níi wan àrai', NULL, 0, NULL, NULL),
(202, 'What did you do last night?', 'เมื่อคืนนี้คุณทําอะไร', 'mʉa kʉʉn níi kun tam árai', NULL, 0, NULL, NULL),
(203, 'Not so …', 'ไม่ค่อย …', 'mâi kôoi', NULL, 0, NULL, NULL),
(204, 'To run', 'วิ่ง', 'wîng', NULL, 0, NULL, NULL),
(205, 'To buy', 'ซื้อ', 'sʉ́ʉ', NULL, 0, NULL, NULL),
(206, 'To sell', 'ขาย', 'kǎai', NULL, 0, NULL, NULL),
(207, 'To walk', 'เดิน', 'dəən', NULL, 0, NULL, NULL),
(208, 'To listen', 'ฟัง', 'fang', NULL, 0, NULL, NULL),
(209, 'Good', 'ดี', 'dii', NULL, 0, NULL, NULL),
(210, 'To drive', 'ขับ', 'kàp', NULL, 0, NULL, NULL),
(211, 'May I speak with Tom?', 'ขอสายกับคุณทม', 'kɔ̌ɔ sǎai ɡàp kun tom', NULL, 0, NULL, NULL),
(212, 'I’m going to eat', 'กําลังจะทานข้าว', NULL, NULL, 0, NULL, NULL),
(213, 'What do you want to do?', 'คุณอยากทัาอะไร', 'kun yàak tam àrai', NULL, 0, NULL, NULL),
(214, 'This one is not very good', 'อันนี้ไม่ค่อยดี', 'an níi mâi kɔ̂i dii', NULL, 0, NULL, NULL),
(215, 'What did you buy?', 'ซื้ออะไรมา', 'sʉ́ʉ àrai maa', NULL, 0, NULL, NULL),
(216, 'I want to go to see you', 'ผมอยากไปหาคุณ', 'pǒm yàak bpai hǎa kun', NULL, 0, NULL, NULL);

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
(4, 74, 37),
(2, 74, 52),
(3, 74, 133),
(1, 74, 134),
(12, 76, 56),
(11, 77, 16),
(10, 77, 134),
(5, 77, 135),
(8, 105, 5),
(7, 105, 128),
(6, 105, 129),
(9, 105, 130),
(14, 157, 135),
(13, 157, 182),
(15, 157, 197);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `dialogs`
--
ALTER TABLE `dialogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dialog_persons`
--
ALTER TABLE `dialog_persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dialog_words`
--
ALTER TABLE `dialog_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `words_composition`
--
ALTER TABLE `words_composition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
