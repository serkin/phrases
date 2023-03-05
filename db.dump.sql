-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 05, 2023 at 06:43 PM
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
(1, 'Tom meets Phan on Hornet app');

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
(2, 'Phan', 'Young Thai boy looking for money and fun');

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
(2, 1, 2, 99);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int NOT NULL,
  `word_id` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('fail','success') NOT NULL DEFAULT 'fail',
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `base`, `th`, `spelling`, `hidden_at`, `is_active`, `comment`) VALUES
(1, 'a little', 'นิดหน่อย', 'nítnòi\n', NULL, 0, NULL),
(2, 'also', 'ก็', 'goo\n', NULL, 0, NULL),
(3, 'I\'m also fine', 'ผมก็สบายดี', NULL, NULL, 0, NULL),
(4, 'and, with', 'กับ', 'gàp\n', NULL, 0, NULL),
(5, 'at', 'ที่', NULL, NULL, 1, NULL),
(6, 'between', 'ระหว่าง', 'rá-wàang\n', NULL, 0, NULL),
(7, 'but', 'แต่', 'dtɛ̀ɛ\n', NULL, 0, NULL),
(8, 'can', 'ได้', 'dâai\n', NULL, 0, NULL),
(9, 'cheap', 'ถก', 'tùuk\n', NULL, 0, NULL),
(10, 'difficult', 'ยาก', 'yàak\n', NULL, 0, NULL),
(11, 'easy', 'ง่าย', 'ngâai\n', NULL, 0, NULL),
(12, 'expensive', 'เเพง', 'pɛɛng\n', NULL, 0, NULL),
(13, 'he, she, him, her', 'เขา', 'káo\n', NULL, 1, NULL),
(14, 'here', 'ที่นี่', 'tîi-nîi\n', NULL, 0, NULL),
(15, 'how many', 'กี่', 'gìi\n', NULL, 0, NULL),
(16, 'how much', 'เท่าไหร่', 'tâo-rài\n', NULL, 0, NULL),
(17, 'in', 'ใน', 'nai\n', NULL, 0, NULL),
(18, 'it', '', 'man\n', NULL, 0, NULL),
(19, 'on', 'บน', 'bon\n', NULL, 0, NULL),
(20, 'one more time', 'อีกที', 'ìik-tii\n', NULL, 0, NULL),
(21, 'or', 'หรือ', 'rʉʉ\n', NULL, 0, NULL),
(22, 'over there', 'ที่โน่น', 'tîi-nôon\n', NULL, 0, NULL),
(23, 'person', 'คน', 'kon\n', NULL, 0, NULL),
(24, 'quick', 'เร็ว', 'reo\n', NULL, 0, NULL),
(25, 'Same here', 'เช่นกัน', 'chen-gan\n', NULL, 0, NULL),
(26, 'slow', 'ช้า', 'cháa\n', NULL, 0, NULL),
(27, 'that', 'นั่น', 'nan\n', NULL, 0, NULL),
(28, 'there', 'ที่นั่น', 'tîi-nân\n', NULL, 0, NULL),
(29, 'they, them', 'พวกเขา', 'pûal káo\n', NULL, 0, NULL),
(30, 'this', 'นี่', 'nii\n', NULL, 0, NULL),
(31, 'under', 'ใต้', 'dtâai\n', NULL, 0, NULL),
(32, 'very difficult', 'ยากมาก', 'yâak mâak\n', NULL, 0, NULL),
(33, 'very, many', 'มาก', 'มาก\n', NULL, 1, NULL),
(34, 'we, us', 'เรา', 'rao\r\n', NULL, 1, NULL),
(35, 'week', 'สัปดาห์', 'sapdaah\n', NULL, 0, NULL),
(36, 'what', 'อะไร', 'a-rai\n', NULL, 1, NULL),
(37, 'where', 'ที่ไหน', 'tîi-nai\n', '2023-03-03 10:33:01', 1, NULL),
(38, 'will', 'จะ', 'yà\n', NULL, 0, NULL),
(39, 'time', 'เวลา', 'wee-laa\n', NULL, 0, NULL),
(40, 'hour', 'ชั่วโมง', 'chûa-moonɡ\n', NULL, 0, NULL),
(41, 'minute', 'นาที', 'naa-tii\n', NULL, 0, NULL),
(42, 'second', 'วินาที', 'wí-naa-tii\n', NULL, 0, NULL),
(43, 'exactly', 'ตรง', 'dtronɡ\n', NULL, 0, NULL),
(44, 'half', 'ครึ่ง', 'krʉ̂nɡ\n', NULL, 0, NULL),
(45, 'almost', 'เกือบ', 'ɡʉ̀ap\n', NULL, 0, NULL),
(46, 'past', 'กว่า', 'ɡwàa\n', NULL, 0, NULL),
(47, 'already', 'แล้ว', 'lɛ́ɛo\n', NULL, 0, NULL),
(48, 'fast', 'เร้ว', 'reo\n', NULL, 0, NULL),
(49, 'late', 'สาย', 'sǎai\n', NULL, 0, NULL),
(50, 'before', 'ก่อน', 'ɡɔ̀ɔn\n', NULL, 0, NULL),
(51, 'after', 'หลัง', 'lǎnɡ\n', NULL, 0, NULL),
(52, 'to come', 'มา', 'maa\n', NULL, 0, NULL),
(53, 'to do', 'ทํา', 'tam\n', NULL, 1, NULL),
(54, 'to be something', 'เป็น', 'bpen\n', NULL, 1, NULL),
(55, 'to have', 'มี', 'mii\n', NULL, 0, NULL),
(56, 'to be somewhere(live, stay)', 'อยู่', 'yùu\n', NULL, 1, NULL),
(57, 'to get, want, take', 'เอา', 'ao\n', NULL, 0, NULL),
(58, 'to go', 'ไป', 'bpai\n', NULL, 1, NULL),
(59, 'to eat', 'กิน', 'gin\r\n', NULL, 1, NULL),
(60, 'to drink', 'ดื่ม', 'dʉ̀ʉm\n', NULL, 0, NULL),
(61, 'to watch', 'ดู', 'duu\n', NULL, 1, NULL),
(62, 'to speak', 'พูด', 'pûut\n', NULL, 1, NULL),
(63, 'to read', 'อ่าน', 'àan\n', NULL, 0, NULL),
(64, 'to write', 'เขียน', 'kǐan\n', NULL, 0, NULL),
(65, 'to study', 'เรียน', 'rian\n', NULL, 0, NULL),
(66, 'to teach', 'สอน', 'sɔ̌ɔn\n', NULL, 0, NULL),
(67, 'to work', 'ทํางาน', 'tam-ngaam\n', NULL, 0, NULL),
(68, 'to wake up', 'ตื่นนอน', 'dtʉ̀ʉn nɔɔn\n', NULL, 0, NULL),
(69, 'to like', 'ชอบ', 'chɔ̂ɔp\n', '2023-03-03 10:33:12', 1, NULL),
(70, 'Can you read Thai?', 'คณอ่านภาษาไทยได็ไหม', 'khun aan oaa-saa tai daai-mai\n', NULL, 0, NULL),
(71, 'You speak English very well', 'ครพูดถาษาอักฤษเก่งมาก', 'khun puut angrit geng maak\n', NULL, 0, NULL),
(72, 'Where do you work?', 'คุณทํางานที่ไหน', 'kun tam-ngaan ti-nai\n', NULL, 0, NULL),
(73, 'Can you speak English', 'คุณพูดภาษาอังกฤษได้มั้ย?', 'khoun phoud pha sa ungrit dai mai?\n', NULL, 0, NULL),
(74, 'Where are you from?', 'คุณมาจากที่ไหน', 'khoun ma dzak ti nai?\n', NULL, 1, NULL),
(75, 'What about you? You?', 'คุณละ', NULL, NULL, 0, NULL),
(76, 'Where do you live?', 'คุณอยู่ที่ไหน', 'kun yùu tîi-nai\n', NULL, 0, NULL),
(77, 'How old are you?', 'คุณอายุเท่าไร?', 'khoun ah you thao rai?\n', NULL, 1, NULL),
(78, 'See you tomorrow', 'เจอกันพรุ่งนี้', NULL, NULL, 0, NULL),
(79, 'See you', 'เจอกันใหม่', NULL, NULL, 0, NULL),
(80, 'I like you', 'ฉนชอบคุณ', NULL, NULL, 1, NULL),
(81, 'I can\'t speak Thai', 'ฉันพูดภาษาไทยไม่ได้', 'chan phoud phasa thai mi dai\n', NULL, 0, NULL),
(82, 'I\'m from Kenya', 'ฉันมาจากเคนยา', 'Пхом Ма Чак Патхед\n', NULL, 0, NULL),
(83, 'I don’t understand', 'ฉันไม่เข้าใจ', 'chan mai khao jai\n', NULL, 0, NULL),
(84, 'I\'m sorry', 'ฉันไม่ได้เจตนา ขอโทษค่ะ', 'chan may day ceettanaa khoo thood kh\n', NULL, 0, NULL),
(85, 'What is your name?', 'ชื่อไร', NULL, NULL, 0, NULL),
(86, 'See you soon', 'เดี๋ยวเจอกัน', NULL, NULL, 0, NULL),
(87, 'I like you too', 'ผมก็ชอบคุณเหมือนกัน', NULL, NULL, 0, NULL),
(88, 'I\'m looking for sex right now', 'ผมกำลังหาเซ็กตอนนี้', NULL, NULL, 0, NULL),
(89, 'My name is Tom', 'ผมชื่อทม', NULL, NULL, 1, NULL),
(90, 'good night my love', 'ฝันดีนะครับที่รัก', NULL, NULL, 0, NULL),
(91, 'I\'m at home', 'พมอยู่ที่บ้านๅ', 'pom yùu tîi báan\n', NULL, 0, NULL),
(93, 'That is very expensive', 'แพงมาก', 'pɛɛng mâak\n', NULL, 0, NULL),
(94, 'No', 'ไม่', 'mai\n', NULL, 0, NULL),
(95, 'You are welcome', 'ไม่เป็นไร', 'mai bpenrai\n', NULL, 0, NULL),
(96, 'Good night', 'ราตรีสวัสดิ์', 'raatrii sawat\n', NULL, 0, NULL),
(97, 'What is your Line ID?', 'ไลน์ไอดีของคุณคืออะไร?', NULL, NULL, 0, NULL),
(98, 'How are you?', 'สบายดีไหม', 'sa bai dee mai?\n', NULL, 1, NULL),
(99, 'Hello', 'สวัสดี', NULL, NULL, 1, NULL),
(100, 'Good afternoon', 'สวัสดีตอนบ่าย', 'sawàt dii tɔɔn bàay\n', NULL, 0, NULL),
(101, 'Good morning', 'สวัสดีตอนเ', NULL, NULL, 0, NULL),
(102, 'How are things going?', 'หมู่นี้เป็นอย่างไรบ้าง', 'muu nii pen yaan ray baan\n', NULL, 0, NULL),
(104, 'How much is this one?', 'อันนี้เท่าไหร่', 'an níi tâo-rài\n', NULL, 0, NULL),
(105, 'Nice to meet you', 'อินดีที่ได้รู้จัก', 'yin-dii thîi dâai rúu-jàk', NULL, 1, NULL),
(107, 'So sorry', 'ขอไทษจริงๆ', 'khoo thoot cin cin\n', NULL, 0, NULL),
(108, 'Thank you', 'ขอบคุณ', 'khob khun\n', NULL, 0, NULL),
(109, 'Thank you very much', 'ขอบคุณมาก', 'khoop khun maak\n', NULL, 0, NULL),
(112, 'And you?', 'คูณล่ะ', 'kun lâ\n', NULL, 0, NULL),
(113, 'Yes', 'ใช่', 'chai\n', NULL, 0, NULL),
(114, 'Good night, sweetheart ', 'ฝันดีนะคับที่รัก', NULL, NULL, 0, NULL),
(115, 'Long time no see', 'ไม่เจอกันนาน', NULL, NULL, 0, NULL),
(116, 'Don’t mention it', 'ไม่ต้งเกรงใจ', 'may ton kreen cay\n', NULL, 0, NULL),
(117, 'Bye', 'ลาก่อน', 'laa koon\n', NULL, 0, NULL),
(118, 'Hello everyone ', 'สวัสดีทุกคน', 'swasdi thuk khun\n', NULL, 0, NULL),
(119, 'Do you understand?', 'เข้าใจไหม', 'kao-jai mai\n', NULL, 0, NULL),
(120, 'You are very funny', 'คุณเป็นคนตลกมาก', NULL, NULL, 0, NULL),
(121, 'What nationality are you?', 'คูณเป้นคนอะไร', 'kun bpen kon a rai\n', NULL, 0, NULL),
(122, 'I like to drink beer', 'พมชอบกินเบียร์', 'pon choop gin bia\n', NULL, 0, NULL),
(123, 'The store is closing', 'ร้านค้าใกล้จะปิดแล้ว', 'raan khaa klay ca pit leew\n', NULL, 0, NULL),
(124, 'Where did you learn English?', 'คณเรีอนถาษาไทยทื่ไหน', 'khun rian paa-saa angrit ti nai', NULL, 0, NULL),
(126, 'that', 'ที่', 'thîi', NULL, 0, 'preposition, pronoun, noun'),
(128, 'welcome, pleasure', 'ยินดี', 'yin-dii', NULL, 0, NULL),
(129, 'to know someone', 'รู้จัก', 'rúu-jàk', NULL, 0, NULL),
(130, 'to get', 'ได้', 'dâai', NULL, 0, 'verb, auxiliary verb'),
(131, 'now', 'ตอนนี้', NULL, NULL, 1, NULL),
(132, 'every day', 'ทุกวัน', NULL, NULL, 0, NULL),
(133, 'от, из', 'จาก', '', NULL, 0, ''),
(134, 'You', 'คุณ', 'khun', NULL, 0, '');

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
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `word_id` (`word_id`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dialog_persons`
--
ALTER TABLE `dialog_persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dialog_words`
--
ALTER TABLE `dialog_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `words_composition`
--
ALTER TABLE `words_composition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`word_id`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

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
