-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 07, 2023 at 08:54 AM
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
  `base` varchar(255) NOT NULL,
  `th` varchar(255) DEFAULT NULL,
  `spelling` varchar(255) DEFAULT NULL,
  `hidden_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `answered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `base`, `th`, `spelling`, `hidden_at`, `is_active`, `comment`, `answered_at`) VALUES
(1, 'a little', 'นิดหน่อย', 'nítnòi\n', NULL, 0, NULL, NULL),
(2, 'also', 'ก็', 'goo\n', NULL, 0, NULL, NULL),
(3, 'I\'m also fine', 'ผมก็สบายดี', NULL, NULL, 0, NULL, NULL),
(4, 'and, with', 'กับ', 'gàp\n', NULL, 0, NULL, NULL),
(5, 'at', 'ที่', NULL, NULL, 1, NULL, '2023-03-06 15:49:58'),
(6, 'between', 'ระหว่าง', 'rá-wàang\n', NULL, 0, NULL, NULL),
(7, 'but', 'แต่', 'dtɛ̀ɛ\n', NULL, 0, NULL, NULL),
(8, 'can', 'ได้', 'dâai\n', NULL, 0, NULL, NULL),
(9, 'cheap', 'ถก', 'tùuk\n', NULL, 0, NULL, NULL),
(10, 'difficult', 'ยาก', 'yàak\n', NULL, 0, NULL, NULL),
(11, 'easy', 'ง่าย', 'ngâai\n', NULL, 0, NULL, NULL),
(12, 'expensive', 'เเพง', 'pɛɛng\n', NULL, 0, NULL, NULL),
(13, 'he, she, him, her', 'เขา', 'káo\n', '2023-03-06 15:51:02', 1, NULL, '2023-03-06 15:51:00'),
(14, 'here', 'ที่นี่', 'tîi-nîi\n', NULL, 0, NULL, NULL),
(15, 'how many', 'กี่', 'gìi\n', NULL, 0, NULL, NULL),
(16, 'how much', 'เท่าไหร่', 'tâo-rài\n', NULL, 0, NULL, NULL),
(17, 'in', 'ใน', 'nai\n', NULL, 0, NULL, NULL),
(18, 'it', '', 'man\n', NULL, 0, NULL, NULL),
(19, 'on', 'บน', 'bon\n', NULL, 0, NULL, NULL),
(20, 'one more time', 'อีกที', 'ìik-tii\n', NULL, 0, NULL, NULL),
(21, 'or', 'หรือ', 'rʉʉ\n', NULL, 0, NULL, NULL),
(22, 'over there', 'ที่โน่น', 'tîi-nôon\n', NULL, 0, NULL, NULL),
(23, 'person', 'คน', 'kon\n', NULL, 0, NULL, NULL),
(24, 'quick', 'เร็ว', 'reo\n', NULL, 0, NULL, NULL),
(25, 'Same here', 'เช่นกัน', 'chen-gan\n', NULL, 0, NULL, NULL),
(26, 'slow', 'ช้า', 'cháa\n', NULL, 0, NULL, NULL),
(27, 'that', 'นั่น', 'nan\n', NULL, 0, NULL, NULL),
(28, 'there', 'ที่นั่น', 'tîi-nân\n', NULL, 0, NULL, NULL),
(29, 'they, them', 'พวกเขา', 'pûal káo\n', NULL, 0, NULL, NULL),
(30, 'this', 'นี่', 'nii\n', NULL, 0, NULL, NULL),
(31, 'under', 'ใต้', 'dtâai\n', NULL, 0, NULL, NULL),
(32, 'very difficult', 'ยากมาก', 'yâak mâak\n', NULL, 0, NULL, NULL),
(33, 'very, many', 'มาก', 'มาก\n', '2023-03-06 14:49:53', 1, NULL, '2023-03-06 14:49:50'),
(34, 'we, us', 'เรา', 'rao\r\n', '2023-03-06 14:50:09', 1, NULL, '2023-03-06 14:50:07'),
(35, 'week', 'สัปดาห์', 'sapdaah\n', NULL, 0, NULL, NULL),
(36, 'what', 'อะไร', 'a-rai\n', '2023-03-06 09:02:56', 1, NULL, NULL),
(37, 'where', 'ที่ไหน', 'tîi-nai\n', '2023-03-03 10:33:01', 1, NULL, NULL),
(38, 'will', 'จะ', 'yà\n', NULL, 0, NULL, NULL),
(39, 'time', 'เวลา', 'wee-laa\n', NULL, 0, NULL, NULL),
(40, 'hour', 'ชั่วโมง', 'chûa-moonɡ\n', NULL, 0, NULL, NULL),
(41, 'minute', 'นาที', 'naa-tii\n', NULL, 0, NULL, NULL),
(42, 'second', 'วินาที', 'wí-naa-tii\n', NULL, 0, NULL, NULL),
(43, 'exactly', 'ตรง', 'dtronɡ\n', NULL, 0, NULL, NULL),
(44, 'half', 'ครึ่ง', 'krʉ̂nɡ\n', NULL, 0, NULL, NULL),
(45, 'almost', 'เกือบ', 'ɡʉ̀ap\n', NULL, 0, NULL, NULL),
(46, 'past', 'กว่า', 'ɡwàa\n', NULL, 0, NULL, NULL),
(47, 'already', 'แล้ว', 'lɛ́ɛo\n', NULL, 0, NULL, NULL),
(48, 'fast', 'เร้ว', 'reo\n', NULL, 0, NULL, NULL),
(49, 'late', 'สาย', 'sǎai\n', NULL, 0, NULL, NULL),
(50, 'before', 'ก่อน', 'ɡɔ̀ɔn\n', NULL, 0, NULL, NULL),
(51, 'after', 'หลัง', 'lǎnɡ\n', NULL, 0, NULL, NULL),
(52, 'to come', 'มา', 'maa\n', NULL, 0, NULL, NULL),
(53, 'to do', 'ทํา', 'tam\n', '2023-03-06 14:50:26', 1, NULL, '2023-03-06 14:50:23'),
(54, 'to be something', 'เป็น', 'bpen\n', '2023-03-06 14:50:45', 1, NULL, '2023-03-06 14:50:42'),
(55, 'to have', 'มี', 'mii\n', NULL, 0, NULL, NULL),
(56, 'to be somewhere(live, stay)', 'อยู่', 'yùu\n', NULL, 1, NULL, '2023-03-06 15:51:17'),
(57, 'to get, want, take', 'เอา', 'ao\n', NULL, 0, NULL, NULL),
(58, 'to go', 'ไป', 'bpai\n', '2023-03-06 14:52:04', 1, NULL, '2023-03-06 14:52:01'),
(59, 'to eat', 'กิน', 'gin\r\n', NULL, 1, NULL, '2023-03-06 14:52:26'),
(60, 'to drink', 'ดื่ม', 'dʉ̀ʉm\n', NULL, 0, NULL, NULL),
(61, 'to watch', 'ดู', 'duu\n', NULL, 1, NULL, '2023-03-06 14:52:38'),
(62, 'to speak', 'พูด', 'pûut\n', NULL, 1, NULL, '2023-03-06 14:53:03'),
(63, 'to read', 'อ่าน', 'àan\n', NULL, 0, NULL, NULL),
(64, 'to write', 'เขียน', 'kǐan\n', NULL, 0, NULL, NULL),
(65, 'to study', 'เรียน', 'rian\n', NULL, 0, NULL, NULL),
(66, 'to teach', 'สอน', 'sɔ̌ɔn\n', NULL, 0, NULL, NULL),
(67, 'to work', 'ทํางาน', 'tam-ngaam\n', NULL, 0, NULL, NULL),
(68, 'to wake up', 'ตื่นนอน', 'dtʉ̀ʉn nɔɔn\n', NULL, 0, NULL, NULL),
(69, 'to like', 'ชอบ', 'chɔ̂ɔp\n', '2023-03-03 10:33:12', 1, NULL, NULL),
(70, 'Can you read Thai?', 'คณอ่านภาษาไทยได็ไหม', 'khun aan oaa-saa tai daai-mai\n', NULL, 0, NULL, NULL),
(71, 'You speak English very well', 'ครพูดถาษาอักฤษเก่งมาก', 'khun puut angrit geng maak\n', NULL, 0, NULL, NULL),
(72, 'Where do you work?', 'คุณทํางานที่ไหน', 'kun tam-ngaan ti-nai\n', NULL, 0, NULL, NULL),
(73, 'Can you speak English', 'คุณพูดภาษาอังกฤษได้มั้ย?', 'khoun phoud pha sa ungrit dai mai?\n', NULL, 0, NULL, NULL),
(74, 'Where are you from?', 'คุณมาจากที่ไหน', 'khoun ma dzak ti nai?\r\n', NULL, 1, NULL, '2023-03-06 14:53:52'),
(75, 'What about you? You?', 'คุณละ', NULL, NULL, 0, NULL, NULL),
(76, 'Where do you live?', 'คุณอยู่ที่ไหน', 'kun yùu tîi-nai\n', NULL, 0, NULL, NULL),
(77, 'How old are you?', 'คุณอายุเท่าไหร่', 'khoun ah you thao rai\r\n', NULL, 1, NULL, '2023-03-06 14:55:01'),
(78, 'See you tomorrow', 'เจอกันพรุ่งนี้', NULL, NULL, 0, NULL, NULL),
(79, 'See you', 'เจอกันใหม่', NULL, NULL, 0, NULL, NULL),
(80, 'I like you', 'ผมขอบคุณ', NULL, NULL, 1, NULL, '2023-03-06 15:45:10'),
(81, 'I can\'t speak Thai', 'ฉันพูดภาษาไทยไม่ได้', 'chan phoud phasa thai mi dai\n', NULL, 0, NULL, NULL),
(82, 'I\'m from Kenya', 'ฉันมาจากเคนยา', 'Пхом Ма Чак Патхед\n', NULL, 0, NULL, NULL),
(83, 'I don’t understand', 'ฉันไม่เข้าใจ', 'chan mai khao jai\n', NULL, 0, NULL, NULL),
(84, 'I\'m sorry', 'ฉันไม่ได้เจตนา ขอโทษค่ะ', 'chan may day ceettanaa khoo thood kh\n', NULL, 0, NULL, NULL),
(85, 'What is your name?', 'ชื่อไร', NULL, NULL, 0, NULL, NULL),
(86, 'See you soon', 'เดี๋ยวเจอกัน', NULL, NULL, 0, NULL, NULL),
(87, 'I like you too', 'ผมก็ชอบคุณเหมือนกัน', NULL, NULL, 0, NULL, NULL),
(88, 'I\'m looking for sex right now', 'ผมกำลังหาเซ็กตอนนี้', NULL, NULL, 0, NULL, NULL),
(89, 'My name is Tom', 'ผมขื่ทม', NULL, NULL, 1, NULL, '2023-03-06 15:46:14'),
(90, 'good night my love', 'ฝันดีนะครับที่รัก', NULL, NULL, 0, NULL, NULL),
(91, 'I\'m at home', 'พมอยู่ที่บ้านๅ', 'pom yùu tîi báan\n', NULL, 0, NULL, NULL),
(93, 'That is very expensive', 'แพงมาก', 'pɛɛng mâak\n', NULL, 0, NULL, NULL),
(94, 'No', 'ไม่', 'mai\n', NULL, 0, NULL, NULL),
(95, 'You are welcome', 'ไม่เป็นไร', 'mai bpenrai\n', NULL, 0, NULL, NULL),
(96, 'Good night', 'ราตรีสวัสดิ์', 'raatrii sawat\n', NULL, 0, NULL, NULL),
(97, 'What is your Line ID?', 'ไลน์ไอดีของคุณคืออะไร?', NULL, NULL, 0, NULL, NULL),
(98, 'How are you?', 'สบายดีไหม', 'sa bai dee mai?\n', NULL, 1, NULL, '2023-03-06 15:47:16'),
(99, 'Hello', 'สวัสดี', NULL, '2023-03-06 15:47:32', 1, NULL, '2023-03-06 15:47:29'),
(100, 'Good afternoon', 'สวัสดีตอนบ่าย', 'sawàt dii tɔɔn bàay\n', NULL, 0, NULL, NULL),
(101, 'Good morning', 'สวัสดีตอนเ', NULL, NULL, 0, NULL, NULL),
(102, 'How are things going?', 'หมู่นี้เป็นอย่างไรบ้าง', 'muu nii pen yaan ray baan\n', NULL, 0, NULL, NULL),
(104, 'How much is this one?', 'อันนี้เท่าไหร่', 'an níi tâo-rài\n', NULL, 0, NULL, NULL),
(105, 'Nice to meet you', 'ยินดีที่ได้รู้จัก', 'yin-dii thîi dâai rúu-jàk', NULL, 1, NULL, '2023-03-06 15:49:46'),
(107, 'So sorry', 'ขอไทษจริงๆ', 'khoo thoot cin cin\n', NULL, 0, NULL, NULL),
(108, 'Thank you', 'ขอบคุณ', 'khob khun\n', NULL, 0, NULL, NULL),
(109, 'Thank you very much', 'ขอบคุณมาก', 'khoop khun maak\n', NULL, 0, NULL, NULL),
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
(126, 'that', 'ที่', 'thîi', NULL, 0, 'preposition, pronoun, noun', NULL),
(128, 'welcome, pleasure', 'ยินดี', 'yin-dii', NULL, 0, NULL, NULL),
(129, 'to know someone', 'รู้จัก', 'rúu-jàk', NULL, 0, NULL, NULL),
(130, 'to get', 'ได้', 'dâai', NULL, 0, 'verb, auxiliary verb', NULL),
(131, 'now', 'ตอนนี้', NULL, NULL, 1, NULL, '2023-03-06 15:50:47'),
(132, 'every day', 'ทุกวัน', NULL, NULL, 0, NULL, NULL),
(133, 'от, из', 'จาก', NULL, NULL, 0, NULL, NULL),
(134, 'You', NULL, 'khun', NULL, 0, NULL, NULL),
(135, 'age', 'อายุ', NULL, NULL, 0, NULL, NULL),
(136, 'Why', 'ทําไม', NULL, NULL, 0, NULL, NULL),
(137, 'คนที่ใส่ชุดสีนํ้าตาลคือใครครับ', 'Who is the person wearing a brown outfit?', 'khon thîi sài chút sǐi-nám-dtaan khuue khrai khráp\n', NULL, 0, NULL, NULL),
(138, '(หัวเราะ)อ้อ...เขาเป็ นตํารวจน่ะครับ', '(laughing) Oh...he\'s a police officer', '(laughing) âaw...khǎo bpen dtam-rùuat nâ khráp\n', NULL, 0, NULL, NULL),
(139, 'แล้ วเด็กผู้ชายคนนันที่ใส่ผ้าสีส้มเป็นพระสงฆ์ใช่ไหมครับ', 'And that boy wearing orange cloth is a monk, right?', 'láaeo dèk phûu-chaai khon nán thîi sài phâa sǐi-sôm bpen phrá-sǒng châi mǎi khráp\n', NULL, 0, NULL, NULL),
(140, 'ไม่ใช่ครับนั่นเณรครับ', 'No. That\'s a novice monk', 'mâi châi khráp. nân neen khráp\n', NULL, 0, NULL, NULL),
(141, 'ถึงบ้านแล้วค่ะ', 'We\'re home', 'thǔeng bâan láaeo khâ\n', NULL, 0, NULL, NULL),
(142, 'หลังไหนครับ', 'Which house is it?', 'lǎng nǎi khráp\n', NULL, 0, NULL, NULL),
(143, 'บ้านที่มีต้นไผ่ค่ะ', 'It\'s the house with the bamboo', 'bâan thîi mii dtôn-phài khâ', NULL, 0, NULL, NULL),
(144, 'home, house', 'บ้าน', 'bâan', NULL, 0, 'Noun\n', NULL),
(145, 'novice monk', 'เณร', 'neen', NULL, 0, 'noun\n', NULL),
(146, 'Buddhist monk', 'พระสงฆ์', 'phrá-sǒng', NULL, 0, 'noun\n', NULL),
(147, 'orange (color)', 'สีส้ม', 'sǐi-sôm', NULL, 0, 'noun, adjective\n', NULL),
(148, 'boy', 'เด็กผู้ชาย', 'dèk-phûu-chaai', NULL, 0, 'Noun\n', NULL),
(149, 'police, policeman', 'ตํารวจ', 'dtam-rùuat', NULL, 0, 'Noun\n', NULL),
(150, 'brown', 'สีนํ้าตาล', 'sǐi-nám-dtaan', NULL, 0, 'noun, adjective\n', NULL),
(151, 'to put in, to wear', 'ใส่', 'sài', NULL, 0, 'verb\n', NULL),
(152, 'bamboo', 'ต้นไผ่', 'dtôn-phài', NULL, 0, 'noun', NULL);

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
(5, 77, 135),
(8, 105, 5),
(7, 105, 128),
(6, 105, 129),
(9, 105, 130);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `words_composition`
--
ALTER TABLE `words_composition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
