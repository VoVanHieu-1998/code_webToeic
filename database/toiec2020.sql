-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2020 at 03:29 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dacnpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `MENU_ID` int(11) NOT NULL,
  `PERMISSION` int(1) NOT NULL DEFAULT 1,
  `ACTIVE_FLAG` int(1) NOT NULL DEFAULT 1,
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATE_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`ID`, `ROLE_ID`, `MENU_ID`, `PERMISSION`, `ACTIVE_FLAG`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
(1, 1, 1, 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(2, 1, 3, 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(3, 1, 4, 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(4, 1, 4, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(5, 1, 5, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(6, 1, 6, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(7, 1, 7, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(8, 1, 9, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(9, 1, 10, 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(12, 2, 13, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(13, 2, 14, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(14, 2, 16, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(15, 2, 17, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(16, 2, 18, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(17, 2, 19, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(18, 2, 15, 1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(19, 1, 21, 1, 1, '2020-08-11 16:56:19', '2020-08-11 16:56:19'),
(20, 1, 22, 1, 1, '2020-08-11 16:56:19', '2020-08-11 16:56:19'),
(21, 1, 23, 1, 1, '2020-08-11 16:56:32', '2020-08-11 16:56:32'),
(22, 1, 24, 1, 1, '2020-08-11 16:56:32', '2020-08-11 16:56:32'),
(23, 1, 25, 1, 1, '2020-08-11 16:56:38', '2020-08-11 16:56:38'),
(24, 1, 20, 1, 1, '2020-08-11 16:58:53', '2020-08-11 16:58:53'),
(26, 1, 27, 1, 1, '2020-08-12 12:54:01', '2020-08-12 12:54:01'),
(27, 1, 28, 1, 1, '2020-08-12 12:54:19', '2020-08-12 12:54:19'),
(28, 1, 29, 1, 1, '2020-08-12 12:54:19', '2020-08-12 12:54:19'),
(29, 1, 30, 1, 1, '2020-08-12 12:54:43', '2020-08-12 12:54:43'),
(30, 1, 31, 1, 1, '2020-08-12 12:54:43', '2020-08-12 12:54:43'),
(31, 1, 26, 1, 1, '2020-08-12 13:06:50', '2020-08-12 13:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `cmt_grammar`
--

CREATE TABLE `cmt_grammar` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `grammar_guideline_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cmt_grammar`
--

INSERT INTO `cmt_grammar` (`id`, `content`, `grammar_guideline_id`, `user_id`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'too co dung dau cau dc ko?', 4, 2, 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00'),
(2, 'hihihi', 4, 3, 1, '2020-06-15 21:13:36', '2020-06-15 21:13:36'),
(3, 'hahahaha', 4, 3, 1, '2020-06-15 21:17:11', '2020-06-15 21:17:11'),
(4, 'sdsfgdsfgsfdffdgfdff', 4, 2, 1, '2020-06-26 05:56:26', '2020-06-26 05:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `cmt_reply_grammar`
--

CREATE TABLE `cmt_reply_grammar` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `cmtGrammar_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cmt_reply_grammar`
--

INSERT INTO `cmt_reply_grammar` (`id`, `content`, `cmtGrammar_id`, `user_id`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'Tat nhien la ko.', 1, 3, 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `activeFlag` int(1) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `examination`
--

INSERT INTO `examination` (`id`, `img`, `tittle`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, '/img/exam1.jpg', 'Exam 1(2020)', 1, '2020-06-24 12:00:00', '2020-08-11 17:06:07'),
(2, '/upload/1597165503768_732.jpg', 'Exam 1(2018)', 1, '2020-08-11 17:05:03', '2020-08-11 17:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `grammar_guideline`
--

CREATE TABLE `grammar_guideline` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grammar_guideline`
--

INSERT INTO `grammar_guideline` (`id`, `name`, `image`, `content`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'fsdfsd', 'fsdfsfsd', 'sdfsdfsdfs', 0, '2020-06-12 12:00:00', '2020-06-12 04:41:40'),
(2, 'Câu điều kiện loại 4', '/upload/1591937251389_laodai1.jpg', '<ul>\r\n	<li>A. Ho&agrave;ng ngu</li>\r\n	<li>B. Hiáº¿u card</li>\r\n	<li>C. Kh&aacute;nh Sky</li>\r\n</ul>\r\n', 0, '2020-06-11 18:18:07', '2020-06-26 05:58:18'),
(3, 'Cáº¥u trÃºc cÃ¢u Äiá»u kiá»n loáº¡i 3', '/upload/1594966523654_ngoctrinh.jpg', '<p>&nbsp; &nbsp; &nbsp;How to pass toeic 850</p>\r\n\r\n<p>&nbsp; &nbsp; WTF&nbsp;</p>\r\n', 1, '2020-06-12 04:39:53', '2020-07-17 06:15:23'),
(4, 'Cách sử dụng Also và Too trong tiếng Anh', '/upload/1592151534892_seok.png', '<p>&nbsp;Cả&nbsp;<strong>also</strong>&nbsp;v&agrave;&nbsp;<strong>too</strong>&nbsp;Đều có nghĩa là &nbsp;<strong>cũng</strong>. Nói chung có thể sử dụng từ nào cũng được nhưng vị trí có khác nhau.&nbsp;<strong>Too</strong>&nbsp;thường được dùng hơn n&nbsp;<strong>also</strong>.</p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; -<em><u>also</u></em></strong><em><u>&nbsp;thường đi theo động từ, đặt trước các động từ thường và sau trợ động từ.</u></em></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;VD:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>&nbsp;He is also an intelligent man(Hắn cũng là một kẻ thông minh.)</p>\r\n	</li>\r\n	<li>\r\n	<p>They also work hard on Sunday(Họ cũng làm việc vất vả vào chủ nhật.)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; -<em><u> too</u></em></strong><em><u>&nbsp;thường được đặt ở cuối câu.</u></em></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;VD:</p>\r\n\r\n<ul>\r\n	<li>He is an intelligent man, too.</li>\r\n	<li>They work hard on Sunday, too.</li>\r\n</ul>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n', 1, '2020-06-14 16:18:54', '2020-06-14 16:18:54'),
(5, 'dfdslfjsdlfkjsdlfkjsdlkfjsdlklfjsdlkl', '/upload/1593751543579_laodai2.jpg', '<p>W: Hi, Michael, can I have a word?</p>\r\n\r\n<p>M: Certainly, Megan. Come in. How is the preparation for the conference going?</p>\r\n\r\n<p>W: Well, that&#39;s what I wanted to speak to you about.</p>\r\n\r\n<p>M: No problems I hope...</p>\r\n\r\n<p>W: No; no real problems. But I&#39;ve just finished writing my presentation, and really I have no idea if it&#39;s at the right level for the audience. I was wondering, since you&#39;ve been to a lot of these conferences, if you could listen to my presentation and tell me what you think.</p>\r\n\r\n<p>M: Yes, of course. However, I have a deadline on Thursday, and my schedule&#39;s pretty full... When&#39;s your conference?</p>\r\n\r\n<p>W: The 10th.</p>\r\n\r\n<p>M: Oh, okay! You have a bit of time then. How about Friday the 5th, in the morning?</p>\r\n\r\n<p>W: That would be great, thanks.&nbsp;</p>\r\n', 1, '2020-07-03 04:45:43', '2020-07-03 04:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_Id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_Index` int(1) NOT NULL DEFAULT 0,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_Id`, `url`, `name`, `order_Index`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 0, '/examination', 'Exam management', 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(3, 10, '/admin/grammar/list', 'List grammar', 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(4, 10, '/admin/grammar/add', 'Add', -1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(5, 0, '/admin/home', 'Home', -1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(6, 10, 'admin/grammar/edit', 'Edit', -1, 1, '2020-06-12 12:00:00', '2020-06-12 12:00:00'),
(7, 10, 'admin/grammar/delete', 'Delete', -1, 1, '2020-06-12 12:00:00', '2020-06-12 12:00:00'),
(9, 1, 'practice/grammar/view', 'View', -1, 1, '2020-06-12 12:00:00', '2020-06-12 12:00:00'),
(10, 0, '/manage', 'Practice management', 2, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(13, 0, '/exam', 'Exam', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(14, 0, '/exam/part-1-intro', 'Intro part1', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(15, 0, 'exam/part-1', 'Exam part1', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(16, 0, '/exam/part1/submit', 'Submit form part1', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(17, 0, '/exam/part-2-intro', 'Intro part2', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(18, 0, '/exam/part-2', 'Exam part2', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(19, 0, '/exam/part2/submit', 'Submit form part2', -1, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(20, 0, '/manager/exam', 'Manager examination', 3, 1, '2020-08-11 16:01:54', '2020-08-11 16:01:54'),
(21, 20, '/admin/exam/add', 'Add', -1, 1, '2020-08-11 16:02:38', '2020-08-11 16:02:38'),
(22, 20, '/admin/exam/list', 'Exam List', 1, 1, '2020-08-11 16:03:47', '2020-08-11 16:03:47'),
(23, 20, '/admin/exam/view', 'View', -1, 1, '2020-08-11 16:04:22', '2020-08-11 16:04:22'),
(24, 20, '/admin/exam/edit', 'Edit', -1, 1, '2020-08-11 16:04:56', '2020-08-11 16:04:56'),
(25, 20, '/admin/exam/delete', 'Delete', -1, 1, '2020-08-11 16:05:30', '2020-08-11 16:05:30'),
(26, 10, '/admin/vocabulary/list', 'List Vocabulary', 2, 1, '2020-08-12 12:50:32', '2020-08-12 12:50:32'),
(27, 10, '/vocabulary/add', 'Add vocabulary', -1, 1, '2020-08-12 12:50:32', '2020-08-12 12:50:32'),
(28, 26, '/vocabulary/edit', 'Edit vocabulary', -1, 1, '2020-08-12 12:52:16', '2020-08-12 12:52:16'),
(29, 26, '/vocabulary/delete', 'Delete vocabulary', -1, 1, '2020-08-12 12:52:16', '2020-08-12 12:52:16'),
(30, 26, '/vocabulary/view', 'View vocabulary', -1, 1, '2020-08-12 12:53:01', '2020-08-12 12:53:01'),
(31, 10, '/vocabularycontent', 'List vocabularycontent', -1, 1, '2020-08-12 12:53:01', '2020-08-12 12:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `part1_listening`
--

CREATE TABLE `part1_listening` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `mp3` varchar(255) NOT NULL,
  `type` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part1_listening`
--

INSERT INTO `part1_listening` (`id`, `exam_id`, `mp3`, `type`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, '/upload/part1_de1.mp3', 1, 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `part1_listening_result`
--

CREATE TABLE `part1_listening_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) NOT NULL,
  `id_part1_question` int(11) NOT NULL,
  `result_ques` int(4) NOT NULL,
  `activeFlag` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `part1_question`
--

CREATE TABLE `part1_question` (
  `id` int(11) NOT NULL,
  `id_part1_listening` int(11) NOT NULL,
  `indexQ` int(3) NOT NULL,
  `img` varchar(255) NOT NULL,
  `op1` text NOT NULL,
  `op2` text NOT NULL,
  `op3` text NOT NULL,
  `op4` text NOT NULL,
  `op_true` text NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part1_question`
--

INSERT INTO `part1_question` (`id`, `id_part1_listening`, `indexQ`, `img`, `op1`, `op2`, `op3`, `op4`, `op_true`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, 1, '/upload/part1_de1_c1.png', 'The blonde woman is writing a lab report', 'The blonde woman is wearing a watch', 'The blonde woman is teaching biology', 'The blonde woman is wearing protective goggles', 'The blonde woman is wearing a watch', 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(2, 1, 2, '/upload/part1_de1_c2.png', 'The weather is warm', 'They are fighting in a war', 'They are promoting peace ', 'They are in the middle of the street', 'They are promoting peace ', 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00'),
(3, 1, 3, '/upload/part1_de1_c3.png', 'There are two water bottles', 'The man is writing in green marker', 'They are at separate tables', 'The woman is asking a question', 'There are two water bottles', 1, '2020-06-24 12:00:00', '2020-06-24 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `part2_listening`
--

CREATE TABLE `part2_listening` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mp3` varchar(255) NOT NULL,
  `type` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part2_listening`
--

INSERT INTO `part2_listening` (`id`, `exam_id`, `mp3`, `type`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, '/upload/part2big.mp3', 1, 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `part2_listening_result`
--

CREATE TABLE `part2_listening_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) NOT NULL,
  `id_part2_question` int(11) NOT NULL,
  `result_ques` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `part2_question`
--

CREATE TABLE `part2_question` (
  `id` int(11) NOT NULL,
  `id_part2_listening` int(11) NOT NULL,
  `content` text NOT NULL,
  `indexQ` int(3) NOT NULL,
  `mp3` varchar(255) NOT NULL,
  `op1` text NOT NULL,
  `op2` text NOT NULL,
  `op3` text NOT NULL,
  `op_true` text NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part2_question`
--

INSERT INTO `part2_question` (`id`, `id_part2_listening`, `content`, `indexQ`, `mp3`, `op1`, `op2`, `op3`, `op_true`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, 'What time is your flight?', 11, '/upload/part2small_1.mp3', 'Next week', 'Four in the morning ', 'I\'m usually on time', 'Four in the morning ', 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00'),
(2, 1, 'Where are you going?', 12, '/upload/part2small_2.mp3', 'In about ten minutes', 'With John and Sally', 'To the shops', 'To the shops', 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00'),
(3, 1, 'Who lives in that house?', 13, '/upload/part2small_3.mp3', 'Yes, I do', 'It has three bedrooms', 'My brother, Billy', 'My brother, Billy', 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00'),
(5, 1, 'What\'s wrong with the telephone?', 14, '/upload/part2small_4.mp3', 'It doesn\'t seem to be working', 'There\'s a message for you', 'I\'ll call you later', 'It doesn\'t seem to be working', 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00'),
(6, 1, 'Did you enjoy the film?', 15, '/upload/part2small_5.mp3', 'I\'m sure we will', 'Sometimes I do', 'Very much', 'Very much', 1, '2020-06-25 12:00:00', '2020-06-25 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `part3_explantation`
--

CREATE TABLE `part3_explantation` (
  `id` int(11) NOT NULL,
  `id_part3_listening` int(11) NOT NULL,
  `content_eng` text DEFAULT NULL,
  `content_vie` text DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `part3_listening`
--

CREATE TABLE `part3_listening` (
  `id` int(11) NOT NULL,
  `id_exam` int(11) DEFAULT NULL,
  `id_translate` int(11) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `oderIndex` int(11) NOT NULL,
  `mp3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part3_listening`
--

INSERT INTO `part3_listening` (`id`, `id_exam`, `id_translate`, `type`, `oderIndex`, `mp3`, `activeFlag`, `createDate`, `updateDate`) VALUES
(6, 1, 3, 1, 1, '/upload/part3_de1_c1.mp3', 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(7, 1, 4, 1, 2, '/upload/part3_de1_c2.mp3', 1, '2020-07-16 17:42:31', '2020-07-16 17:42:31'),
(8, 1, 5, 1, 3, '/upload/part3_de1_c3.mp3', 1, '2020-07-16 18:49:08', '2020-07-16 18:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `part3_listening_question_result`
--

CREATE TABLE `part3_listening_question_result` (
  `id` int(11) NOT NULL,
  `id_part3_listening_result` int(11) NOT NULL,
  `id_part3_listening_question` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part3_listening_question_result`
--

INSERT INTO `part3_listening_question_result` (`id`, `id_part3_listening_result`, `id_part3_listening_question`, `result`, `activeFlag`, `createDate`, `updateDate`) VALUES
(22, 21, 8, 5, 1, '2020-07-17 16:35:32', '2020-07-17 16:35:32'),
(23, 21, 10, 5, 1, '2020-07-17 16:35:32', '2020-07-17 16:35:32'),
(24, 21, 9, 5, 1, '2020-07-17 16:35:32', '2020-07-17 16:35:32'),
(26, 55, 8, 5, 1, '2020-08-11 18:25:42', '2020-08-11 18:25:42'),
(27, 55, 9, 5, 1, '2020-08-11 18:25:42', '2020-08-11 18:25:42'),
(28, 55, 10, 0, 1, '2020-08-11 18:25:43', '2020-08-11 18:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `part3_listening_ques_explantation`
--

CREATE TABLE `part3_listening_ques_explantation` (
  `Id` int(11) NOT NULL,
  `id_part3_listening_questions` int(11) NOT NULL,
  `mean_content` text NOT NULL,
  `mean_op1` varchar(255) NOT NULL,
  `mean_op2` varchar(255) NOT NULL,
  `mean_op3` varchar(255) NOT NULL,
  `mean_op4` varchar(255) NOT NULL,
  `explantation` text DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part3_listening_ques_explantation`
--

INSERT INTO `part3_listening_ques_explantation` (`Id`, `id_part3_listening_questions`, `mean_content`, `mean_op1`, `mean_op2`, `mean_op3`, `mean_op4`, `explantation`, `activeFlag`, `createDate`, `updateDate`) VALUES
(4, 8, 'Megan cảm thấy thế nào về bài thuyết trình mà cô ấy sẽ đưa ra?', 'tự tin', 'không chắc chắn', 'kinh hoàng', 'tự hào', NULL, 1, '2020-07-17 03:16:28', '2020-07-17 03:16:28'),
(5, 9, 'Điều gì đúng về Megan?', 'Cô ấy đang khuyên Michael', 'Cô ấy đang chuẩn bị vào phút cuối', 'Cô ấy đang lên kế hoạch trước', 'Cô đã tham dự rất nhiều hội nghị', NULL, 1, '2020-07-17 03:18:49', '2020-07-17 03:18:49'),
(6, 10, 'Điều gì sẽ xảy ra vào thứ Sáu ngày 5?', 'Michael sẽ giúp Megan', 'Megan sẽ thuyết trình', 'Michael có thời hạn', 'Có một hội nghị', NULL, 1, '2020-07-17 03:21:13', '2020-07-17 03:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `part3_listening_result`
--

CREATE TABLE `part3_listening_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) NOT NULL,
  `id_part3_listening` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part3_listening_result`
--

INSERT INTO `part3_listening_result` (`id`, `id_result`, `id_part3_listening`, `activeFlag`, `createDate`, `updateDate`) VALUES
(21, 74, 6, 1, '2020-07-17 16:35:31', '2020-07-17 16:35:31'),
(22, 75, 6, 1, '2020-07-31 03:07:49', '2020-07-31 03:07:49'),
(23, 75, 6, 1, '2020-07-31 03:15:58', '2020-07-31 03:15:58'),
(24, 76, 6, 1, '2020-07-31 03:30:25', '2020-07-31 03:30:25'),
(25, 76, 6, 1, '2020-07-31 03:30:31', '2020-07-31 03:30:31'),
(26, 77, 6, 1, '2020-07-31 03:33:05', '2020-07-31 03:33:05'),
(27, 78, 6, 1, '2020-07-31 03:47:12', '2020-07-31 03:47:12'),
(28, 78, 6, 1, '2020-07-31 03:47:23', '2020-07-31 03:47:23'),
(29, 78, 7, 1, '2020-07-31 03:47:33', '2020-07-31 03:47:33'),
(30, 78, 8, 1, '2020-07-31 03:47:46', '2020-07-31 03:47:46'),
(31, 79, 6, 1, '2020-07-31 03:53:11', '2020-07-31 03:53:11'),
(32, 79, 7, 1, '2020-07-31 03:53:17', '2020-07-31 03:53:17'),
(33, 79, 8, 1, '2020-07-31 03:53:25', '2020-07-31 03:53:25'),
(34, 82, 6, 1, '2020-07-31 05:17:56', '2020-07-31 05:17:56'),
(35, 82, 7, 1, '2020-07-31 05:18:07', '2020-07-31 05:18:07'),
(36, 83, 6, 1, '2020-07-31 06:53:57', '2020-07-31 06:53:57'),
(37, 83, 6, 1, '2020-07-31 06:56:23', '2020-07-31 06:56:23'),
(38, 83, 7, 1, '2020-07-31 06:56:35', '2020-07-31 06:56:35'),
(39, 83, 8, 1, '2020-07-31 06:56:56', '2020-07-31 06:56:56'),
(40, 83, 6, 1, '2020-07-31 06:58:44', '2020-07-31 06:58:44'),
(41, 83, 7, 1, '2020-07-31 06:58:57', '2020-07-31 06:58:57'),
(42, 84, 6, 1, '2020-08-03 19:55:47', '2020-08-03 19:55:47'),
(43, 84, 7, 1, '2020-08-03 19:56:09', '2020-08-03 19:56:09'),
(44, 84, 8, 1, '2020-08-03 19:57:09', '2020-08-03 19:57:09'),
(45, 85, 6, 1, '2020-08-03 20:21:15', '2020-08-03 20:21:15'),
(46, 85, 7, 1, '2020-08-03 20:21:29', '2020-08-03 20:21:29'),
(47, 85, 8, 1, '2020-08-03 20:21:46', '2020-08-03 20:21:46'),
(48, 86, 6, 1, '2020-08-03 20:38:59', '2020-08-03 20:38:59'),
(49, 86, 7, 1, '2020-08-03 20:39:18', '2020-08-03 20:39:18'),
(50, 86, 8, 1, '2020-08-03 20:39:37', '2020-08-03 20:39:37'),
(51, 87, 6, 1, '2020-08-03 20:51:54', '2020-08-03 20:51:54'),
(52, 87, 7, 1, '2020-08-03 20:52:12', '2020-08-03 20:52:12'),
(53, 87, 8, 1, '2020-08-03 20:52:31', '2020-08-03 20:52:31'),
(55, 210, 6, 1, '2020-08-11 18:25:42', '2020-08-11 18:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `part3_questions`
--

CREATE TABLE `part3_questions` (
  `id` int(11) NOT NULL,
  `id_part3_listening` int(11) NOT NULL,
  `content` text COLLATE utf8_bin DEFAULT NULL,
  `op1` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op3` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op4` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op_true` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part3_questions`
--

INSERT INTO `part3_questions` (`id`, `id_part3_listening`, `content`, `op1`, `op2`, `op3`, `op4`, `op_true`, `order`, `activeFlag`, `createDate`, `updateDate`) VALUES
(8, 6, ' How does Megan feel about the presentation she will give?', 'confident', 'unsure', 'terrified', 'proud', 'unsure', 41, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(9, 6, 'What is true about Megan?', 'She is advising Michael', 'She is preparing at the last minute', 'She is planning ahead', 'She has been to a lot of conferences', 'She is planning ahead', 42, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(10, 6, 'What will happen on Friday the 5th?', 'Michael will help Megan', 'Megan will give a presentation', 'Michael has a deadline', 'There is a conference', 'Michael will help Megan', 43, 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(17, 7, 'What is the woman trying to do?', 'find a summer employment', 'get help for a disabled child', 'offer her assistance', 'meet Anna', 'offer her assistance', 44, 1, '2020-07-31 03:40:55', '2020-07-31 03:40:55'),
(18, 7, ' What does the woman need to do next?', 'come back in a few hours', 'come back some morning', 'try to find another place to volunteer', 'give the man her CV', 'come back some morning', 45, 1, '2020-07-31 03:40:55', '2020-07-31 03:40:55'),
(19, 7, 'How could the man be best described?', 'helpful', 'unhelpful', 'afraid', 'annoyed', 'helpful', 46, 1, '2020-07-31 03:41:43', '2020-07-31 03:41:43'),
(20, 8, 'How does the woman feel?', 'absolutely furious', 'impatient', 'grateful', 'annoyed', 'annoyed', 47, 1, '2020-07-31 03:43:51', '2020-07-31 03:43:51'),
(21, 8, 'Why did the man make a mistake?', 'he was careless', 'he did not have information', 'to provoke the woman', 'because the job was complex', 'he did not have information', 48, 1, '2020-07-31 03:43:51', '2020-07-31 03:43:51'),
(22, 8, 'Why couldn\'t the woman go on Thursday evening?', 'Elsie told her that she must not', 'She will miss the meeting', 'She has to work', 'She just doesn\'t want to', 'She has to work', 49, 1, '2020-07-31 03:44:39', '2020-07-31 03:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `part4_explantation`
--

CREATE TABLE `part4_explantation` (
  `id` int(11) NOT NULL,
  `id_part4_listening` int(11) NOT NULL,
  `content_eng` text DEFAULT NULL,
  `content_vie` text DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `part4_listening`
--

CREATE TABLE `part4_listening` (
  `id` int(11) NOT NULL,
  `id_exam` int(11) DEFAULT NULL,
  `id_translate` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `oderIndex` int(11) NOT NULL,
  `mp3` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part4_listening`
--

INSERT INTO `part4_listening` (`id`, `id_exam`, `id_translate`, `type`, `oderIndex`, `mp3`, `activeFlag`, `createDate`, `updateDate`) VALUES
(4, 1, 6, 1, 1, '/part4_de1_c1.mp3', 1, '2020-08-03 18:44:21', '2020-08-03 18:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `part4_listening_questions`
--

CREATE TABLE `part4_listening_questions` (
  `id` int(11) NOT NULL,
  `id_part4_listening` int(11) NOT NULL,
  `content` text COLLATE utf8_bin DEFAULT NULL,
  `op1` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op3` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op4` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `op_true` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part4_listening_questions`
--

INSERT INTO `part4_listening_questions` (`id`, `id_part4_listening`, `content`, `op1`, `op2`, `op3`, `op4`, `op_true`, `order`, `activeFlag`, `createDate`, `updateDate`) VALUES
(4, 4, 'Who is Charles Bradford?', 'Alan\'s great grandfather', 'someone who will open the building', 'an artist', 'a classical music player', 'Alan\'s great grandfather', 71, 1, '2020-08-03 18:45:28', '2020-08-03 18:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `part4_listening_question_result`
--

CREATE TABLE `part4_listening_question_result` (
  `id` int(11) NOT NULL,
  `id_part4_listening_result` int(11) NOT NULL,
  `id_part4_listening_question` int(11) NOT NULL,
  `result` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part4_listening_question_result`
--

INSERT INTO `part4_listening_question_result` (`id`, `id_part4_listening_result`, `id_part4_listening_question`, `result`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 2, 4, 5, 1, '2020-08-03 21:09:42', '2020-08-03 21:09:42'),
(2, 3, 4, 0, 1, '2020-08-05 15:29:05', '2020-08-05 15:29:05'),
(3, 4, 4, 0, 1, '2020-08-06 10:33:03', '2020-08-06 10:33:03'),
(4, 5, 4, 0, 1, '2020-08-06 14:57:34', '2020-08-06 14:57:34'),
(5, 6, 4, 0, 1, '2020-08-06 15:08:46', '2020-08-06 15:08:46'),
(6, 7, 4, 0, 1, '2020-08-06 15:09:21', '2020-08-06 15:09:21'),
(7, 8, 4, 0, 1, '2020-08-06 15:12:00', '2020-08-06 15:12:00'),
(8, 9, 4, 0, 1, '2020-08-06 15:15:20', '2020-08-06 15:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `part4_listening_ques_explantation`
--

CREATE TABLE `part4_listening_ques_explantation` (
  `id` int(11) NOT NULL,
  `id_part4_listening_questions` int(11) NOT NULL,
  `mean_content` varchar(255) DEFAULT NULL,
  `mean_op1` varchar(255) NOT NULL,
  `mean_op2` varchar(255) NOT NULL,
  `mean_op3` varchar(255) NOT NULL,
  `mean_op4` varchar(255) NOT NULL,
  `explantation` text DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part4_listening_ques_explantation`
--

INSERT INTO `part4_listening_ques_explantation` (`id`, `id_part4_listening_questions`, `mean_content`, `mean_op1`, `mean_op2`, `mean_op3`, `mean_op4`, `explantation`, `activeFlag`, `createDate`, `updateDate`) VALUES
(2, 4, 'Charles Bradford là ai?', 'Ông cố của Alan', 'ai đó sẽ mở tòa nhà', '1 nghệ sĩ', 'một máy nghe nhạc cổ điển', NULL, 1, '2020-08-03 18:47:06', '2020-08-03 18:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `part4_listening_result`
--

CREATE TABLE `part4_listening_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) NOT NULL,
  `id_part4_listening` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `part4_listening_result`
--

INSERT INTO `part4_listening_result` (`id`, `id_result`, `id_part4_listening`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 87, 4, 1, '2020-08-03 20:53:40', '2020-08-03 20:53:40'),
(2, 88, 4, 1, '2020-08-03 21:09:42', '2020-08-03 21:09:42'),
(3, 93, 4, 1, '2020-08-05 15:29:04', '2020-08-05 15:29:04'),
(4, 94, 4, 1, '2020-08-06 10:33:02', '2020-08-06 10:33:02'),
(5, 95, 4, 1, '2020-08-06 14:57:34', '2020-08-06 14:57:34'),
(6, 95, 4, 1, '2020-08-06 15:08:46', '2020-08-06 15:08:46'),
(7, 96, 4, 1, '2020-08-06 15:09:21', '2020-08-06 15:09:21'),
(8, 97, 4, 1, '2020-08-06 15:12:00', '2020-08-06 15:12:00'),
(9, 98, 4, 1, '2020-08-06 15:15:20', '2020-08-06 15:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `part5_lessons`
--

CREATE TABLE `part5_lessons` (
  `id` int(11) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `imgUrl` varchar(255) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part5_lessons`
--

INSERT INTO `part5_lessons` (`id`, `tittle`, `imgUrl`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'lesson 1', '', 1, '2020-08-04 17:11:56', '2020-08-04 17:11:56'),
(2, 'lesson 2', '', 1, '2020-08-04 17:12:14', '2020-08-04 17:12:14'),
(3, 'lesson 3', '', 1, '2020-08-04 17:12:14', '2020-08-04 17:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `part5_reading_question`
--

CREATE TABLE `part5_reading_question` (
  `id` int(11) NOT NULL,
  `id_exam` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `op_true` varchar(255) NOT NULL,
  `id_part5_lesson` int(11) DEFAULT NULL,
  `order` int(3) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `activeFlag` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part5_reading_question`
--

INSERT INTO `part5_reading_question` (`id`, `id_exam`, `content`, `op1`, `op2`, `op3`, `op4`, `op_true`, `id_part5_lesson`, `order`, `type`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, NULL, 'Would you like to --- your meal with an after-dinner drink?', 'complete', 'completed', 'completely', 'completion', 'complete', 1, 1, 0, 1, '2020-08-04 17:14:33', '2020-08-04 17:14:33'),
(2, NULL, 'When he got home, his wife ... ... ... dinner.', 'fix', 'fixes', 'fixing', 'was fixing', 'was fixing', 1, 2, 0, 1, '2020-08-04 17:16:40', '2020-08-04 17:16:40'),
(3, NULL, 'Due to the store\'s success, the owner began to plan an ... ... ... into a larger location.', 'expansion', 'expand', 'expanse', 'expanded', 'expansion', 1, 3, 0, 1, '2020-08-05 15:51:30', '2020-08-05 15:51:30'),
(6, NULL, 'Hard work and ... ... ... will help you move up the corporate ladder.', 'dedicated', 'dedicates', ' dedication', 'dedicating', 'dedication', 1, 4, 0, 1, '2020-08-05 15:58:16', '2020-08-05 15:58:16'),
(7, NULL, 'We will ... ... ... all of our outdated software with the newest versions.', 'replacement', 'replaced', 'replaceable', 'replace', 'replace', 1, 5, 0, 1, '2020-08-05 16:02:31', '2020-08-05 16:02:31'),
(8, NULL, 'Because you are a valued and dedicated employee, we are ... ... ... you to director of the department.', 'promoting', 'promote', 'promotion', 'promoter', 'promoting', 1, 6, 0, 1, '2020-08-05 16:06:28', '2020-08-05 16:06:28'),
(9, NULL, 'The ... ... ... of the company\'s financial officer has left a vacancy that the CEO is trying to quickly fill.', 'resigned', 'resignedly', 'resignation', 'resign', 'resignation', 1, 7, 0, 1, '2020-08-05 16:10:10', '2020-08-05 16:10:10'),
(10, NULL, 'The artist, whose paintings are currently on exhibit at the Parkinson Art Center, gets his ... ... ... from the worksH of Monet and Degas.', ' inspire', 'inspiring', 'inspired', 'inspiration', 'inspiration', 1, 8, 0, 1, '2020-08-05 16:14:10', '2020-08-05 16:14:10'),
(11, NULL, 'Although negotiating a new contract was complicated, both parties came to an ... ... ... that satisfied them.', 'agree', 'agreeable', 'agreement', 'agreeably', 'agreement', 1, 9, 0, 1, '2020-08-05 16:30:17', '2020-08-05 16:30:17'),
(12, NULL, 'Sometimes people don\'t bother about guarantees because the ... ... ... of the manufacturer is enough for them.', 'repute', 'reputed', 'reputedly', 'reputation', 'reputation', 1, 10, 0, 1, '2020-08-05 16:34:31', '2020-08-05 16:34:31'),
(14, 1, '____ John found Maria hard to get along with, he did the best he couldv', 'However difficult', 'Because of', 'Nevertheless', 'Although', 'Although', 1, 101, 1, 1, '2020-08-06 15:03:44', '2020-08-06 15:03:44'),
(15, 1, 'He was forced to declare ____ two years after purchasing the property because he couldn\'t make payments', 'eligibility', ' candidacy', 'bankruptcy', 'bail', 'bankruptcy', 1, 102, 1, 1, '2020-08-06 15:05:20', '2020-08-06 15:05:20'),
(16, 1, 'Although his new job had long hours, Mike was pleased with his higher ____', 'dues', 'salary', 'fees', 'earns', 'salary', 1, 103, 1, 1, '2020-08-06 15:06:14', '2020-08-06 15:06:14'),
(17, 1, 'Be sure to submit your application form by the 20th of March ____ you wish to be considered for the post', 'unless that', 'whether', 'if', 'in case of', 'if', 1, 104, 1, 1, '2020-08-06 15:08:18', '2020-08-06 15:08:18'),
(18, 1, 'I ____ the report now; I\'ll be with you in a second', 'finish', 'finished', 'would finish', 'am finishing', 'am finishing', 1, 105, 1, 1, '2020-08-06 15:08:18', '2020-08-06 15:08:18'),
(23, 1, 'The day of the meeting has been changed; it has been ____ for Thursday', 'reserved', 'cancelled', 'rectified', 'rescheduled', 'rescheduled', NULL, 106, 1, 1, '2020-08-11 02:54:29', '2020-08-11 02:54:29'),
(24, 1, 'On one hand we\'ve had a bit of a setback, but on ____ hand it\'s a chance to show that we\'re determined', 'the other', 'another', 'the second', 'that', 'the other', NULL, 107, 1, 1, '2020-08-11 02:55:21', '2020-08-11 02:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `part5_reading_ques_explantation`
--

CREATE TABLE `part5_reading_ques_explantation` (
  `id` int(11) NOT NULL,
  `id_part5_reading_questions` int(11) NOT NULL,
  `mean_content` varchar(255) NOT NULL,
  `mean_op1` varchar(255) NOT NULL,
  `mean_op2` varchar(255) NOT NULL,
  `mean_op3` varchar(255) NOT NULL,
  `mean_op4` varchar(255) NOT NULL,
  `explantation` text NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part5_reading_ques_explantation`
--

INSERT INTO `part5_reading_ques_explantation` (`id`, `id_part5_reading_questions`, `mean_content`, `mean_op1`, `mean_op2`, `mean_op3`, `mean_op4`, `explantation`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 2, 'Khi anh ấy về nhà, vợ anh ta đang chuẩn bị bữa tối.', 'chuẩn bị (động từ nguyên mẫu dạng bare inf)', 'chuẩn bị (động từ chia theo ngôi thứ ba số ít ở thì hiện tại đơn)', 'chuẩn bị (động từ dạng V_ing)', 'chuẩn bị (thì quá khứ tiếp diễn)', 'Đây là câu diễn tả một hành động cắt ngang (chia ở thì quá khứ đơn) một hành động khác đang diễn ra (chia thì quá khứ tiếp diễn) trong quá khứ.\r\nHành động anh ấy về nhà cắt ngang hàng động vợ anh ấy ĐANG chuẩn bị bữa tối\r\n--> D', 1, '2020-08-04 17:18:47', '2020-08-04 17:18:47'),
(2, 3, 'Nhờ vào thành công của cửa hàng, những người chủ bắt đầu lên kế hoạch mở rộng thành một địa điểm lớn hơn.', 'sự mở rộng (danh từ)', 'mở rộng (động từ nguyên mẫu)', 'khu vực rộng lớn (danh từ)', 'mở rộng (động từ thêm -ed)', '<p>Sau mạo từ \"an\" ta dùng một danh từ.</p>\r\n<br/><p>Ta dịch câu để chọn danh từ phù hợp.</p>', 1, '2020-08-05 15:53:23', '2020-08-05 15:53:23'),
(3, 6, 'Làm việc chăm chỉ và sự tận tụy sẽ giúp bạn thăng tiến trong nấc thang sự nghiệp.', 'tận tụy (tính từ)', 'cống hiến (động từ chia ở hiện tại đơn ngôi thứ 3 số ít)', 'sự tận tụy (danh từ)', 'cống hiến (động từ thêm -ing)', '<p>Sau \"and\" ta dùng cấu trúc song song.</p><br/><p>\"Hard work\" là danh từ nên sau đó ta cũng phải dùng danh từ.</p>', 1, '2020-08-05 16:00:17', '2020-08-05 16:00:17'),
(4, 7, 'Chúng ta sẽ thay thế tất cả phần mềm lỗi thời với những phiên bản mới nhất.', 'sự thay thế (danh từ)', 'thay thế (động từ thêm -ed)', 'có thể thay thế được (tính từ)', 'thay thế (động từ nguyên mẫu)', '<p>Sau modal verb \"will\" ta dùng động từ nguyên mẫu.</p>', 1, '2020-08-05 16:03:57', '2020-08-05 16:03:57'),
(5, 8, 'Vì bạn là một nhân viên có giá trị và tận tụy, chúng tôi sẽ thăng chức bạn thành trưởng phòng.', 'promoting', 'promote', 'promotion', 'promoter', '<p>Ta dịch câu sẽ loại được \"promotion\" và \"promoter\".</p><br/><p>Ta chọn \"promoting\" để tạo thành thì hiện tại tiếp diễn.</p>', 1, '2020-08-05 16:07:58', '2020-08-05 16:07:58'),
(6, 9, 'Việc từ chức của cán bộ tài chính của công ty đã để lại một vị trí trống mà giám đốc điều hành đang cố gắng nhanh chóng lấp đầy.', 'thôi việc (động từ dạng V_ed)', 'một cách cam chịu (trạng từ)', 'sự thôi việc (danh từ)', '(động từ nguyên mẫu BARE INF)', '<p>Sau mạo từ THE ta cần một (cụm) danh từ -> chọn C.</p>', 1, '2020-08-05 16:11:17', '2020-08-05 16:11:17'),
(7, 10, 'Người họa sĩ có bức tranh hiện đang được trưng bày tại Trung tâm Nghệ thuật Parkinson lấy cảm hứng từ các tác phẩm của Monet và Degas.', 'truyền cảm hứng (động từ nguyên mẫu BARE INF)', '(động từ dạng V_ing)', '(động từ dạng V_ed)', 'cảm hứng (danh từ)', '<p>Sau tính từ sở hữu HIS ta cần một danh từ -> chọn D.</p>', 1, '2020-08-05 16:16:01', '2020-08-05 16:16:01'),
(8, 11, '\r\nMặc dù đàm phán hợp đồng mới khá phức tạp, cả hai bên đã đi đến một thỏa thuận làm hài lòng họ.', 'đồng ý (động từ nguyên mẫu BARE INF)', 'dễ chịu (tính từ)', 'sự đồng ý, thỏa thuận (danh từ)', '(trạng từ)', '<p>Sau mạo từ AN ta cần một (cụm) danh từ -> chọn C.</p>', 1, '2020-08-05 16:32:08', '2020-08-05 16:32:08'),
(9, 12, 'Đôi khi người ta không bận tâm về bảo hành vì danh tiếng của nhà sản xuất đã là đủ với họ.', 'tiếng tăm (danh từ)', 'có tiếng (tính từ)', 'có tiếng (trạng từ)', 'danh tiếng (danh từ)', '<p>Sau mạo từ THE ta cần một (cụm) danh từ.</p><br/>\r\n<p>-> loại B và C.</p><br/>\r\n<p>REPUTE nói nhiều về suy nghĩ của người dùng về một công ty hay một loại hình sản phẩm, trong khi REPUTATION nói đến danh tiếng mà một người hay công ty đạt được thông qua sản phẩm và dịch vụ của mình -> REPUTATION là thích hợp cho câu này.</p>', 1, '2020-08-05 16:37:34', '2020-08-05 16:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `part5_reading_result`
--

CREATE TABLE `part5_reading_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) DEFAULT NULL,
  `id_part5_question` int(11) NOT NULL,
  `result_ques` int(1) NOT NULL,
  `activeFlag` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part5_reading_result`
--

INSERT INTO `part5_reading_result` (`id`, `id_result`, `id_part5_question`, `result_ques`, `activeFlag`, `createDate`, `updateDate`) VALUES
(39, 119, 14, 0, 1, '2020-08-06 17:29:56', '2020-08-06 17:29:56'),
(40, 119, 15, 0, 1, '2020-08-06 17:29:56', '2020-08-06 17:29:56'),
(41, 119, 16, 5, 1, '2020-08-06 17:29:56', '2020-08-06 17:29:56'),
(42, 119, 17, 5, 1, '2020-08-06 17:29:56', '2020-08-06 17:29:56'),
(43, 119, 18, 0, 1, '2020-08-06 17:29:57', '2020-08-06 17:29:57'),
(44, 173, 16, 0, 1, '2020-08-10 16:28:23', '2020-08-10 16:28:23'),
(45, 173, 17, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(46, 173, 14, 5, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(47, 173, 18, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(48, 173, 15, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(49, 173, 16, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(50, 173, 17, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(51, 173, 14, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(52, 173, 18, 0, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(53, 173, 15, 5, 1, '2020-08-10 16:28:24', '2020-08-10 16:28:24'),
(54, 173, 16, 5, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(55, 173, 17, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(56, 173, 14, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(57, 173, 18, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(58, 173, 15, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(59, 173, 16, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(60, 173, 17, 5, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(61, 173, 14, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(62, 173, 18, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(63, 173, 15, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(64, 173, 16, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(65, 173, 17, 0, 1, '2020-08-10 16:28:25', '2020-08-10 16:28:25'),
(66, 173, 14, 0, 1, '2020-08-10 16:28:26', '2020-08-10 16:28:26'),
(67, 173, 18, 5, 1, '2020-08-10 16:28:26', '2020-08-10 16:28:26'),
(68, 173, 15, 0, 1, '2020-08-10 16:28:26', '2020-08-10 16:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `part7_lessons`
--

CREATE TABLE `part7_lessons` (
  `id` int(11) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_lessons`
--

INSERT INTO `part7_lessons` (`id`, `tittle`, `imgUrl`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'lesson 1', NULL, 1, '2020-08-10 17:58:22', '2020-08-10 17:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `part7_questions`
--

CREATE TABLE `part7_questions` (
  `id` int(11) NOT NULL,
  `id_part7_reading` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `op_true` varchar(255) NOT NULL,
  `order` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_questions`
--

INSERT INTO `part7_questions` (`id`, `id_part7_reading`, `content`, `op1`, `op2`, `op3`, `op4`, `op_true`, `order`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, 'What is the purpose of the leaflet?', 'to educate people', 'to promote something', 'it is an invitation', 'it is a coupon', 'to promote something', 153, 1, '2020-08-10 18:03:39', '2020-08-10 18:03:39'),
(2, 1, 'What is true of the letter?', 'It was unsolicited', 'It answers an enquiry', 'It follows a purchase', 'It requests a service', 'It answers an enquiry', 154, 1, '2020-08-10 18:03:39', '2020-08-10 18:03:39'),
(3, 1, 'What has been decided for sure by Ms Fisher?', 'She will work with Tourism Victoria', 'She will have a conference in the city of Victoria', 'She will hold the conference at the Victoria Conference Center', 'She will arrange an eco-adventure', 'She will have a conference in the city of Victoria', 155, 1, '2020-08-10 18:06:28', '2020-08-10 18:06:28'),
(4, 1, 'Where is the Victoria Conference Center located?', 'in the downtown area', 'near the downtown area', 'by the sea, outside town', '900 meters from the town', 'in the downtown area', 156, 1, '2020-08-10 18:06:28', '2020-08-10 18:06:28'),
(5, 1, 'Where is Ms. Fisher from?', 'England', 'Canada', 'United States', 'Australiav', 'England', 157, 1, '2020-08-10 18:07:34', '2020-08-10 18:07:34'),
(6, 2, 'What kind of a place is SkyCity?', 'a restaurant', 'a ship', 'a museum', 'a theme park', 'a restaurant', 160, 1, '2020-08-11 02:43:01', '2020-08-11 02:43:01'),
(7, 2, 'When could you go with a party of 12 people?', 'February 2nd, without needing a reservation', 'June 24th, with a reservation', 'May 3rd, with a reservation', 'You cannot go with a group of 12 people', 'May 3rd, with a reservation', 161, 1, '2020-08-11 02:43:01', '2020-08-11 02:43:01'),
(8, 2, 'What time on Friday can you NOT reserve a table?', '10am', '2pm', '9pm', '10pm', '10am', 162, 1, '2020-08-11 02:43:45', '2020-08-11 02:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `part7_reading`
--

CREATE TABLE `part7_reading` (
  `id` int(11) NOT NULL,
  `id_exam` int(11) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `order` int(11) NOT NULL,
  `content1` text NOT NULL,
  `content2` text DEFAULT NULL,
  `id_part7_lesson` int(11) DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_reading`
--

INSERT INTO `part7_reading` (`id`, `id_exam`, `type`, `order`, `content1`, `content2`, `id_part7_lesson`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, 1, 1, '<tr>\r\n			<td>\r\n			<p style=\"text-align:center\"><strong>Victoria Conference Centre</strong></p>\r\n\r\n			<p style=\"text-align:center\"><strong>SHARE IDEAS, BE INSPIRED</strong></p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">In the heart of downtown Victoria, British Columbia, by the spectacular Inner Harbour is the Victoria Conference Centre; a bright modern and technically advanced meeting place that is most inviting&nbsp;</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">The average size of the conferences we host is 450-1,000 delegates. However, we have hosted groups as large as 2,500 delegates. Since conferences have distinct design and function space requirements, defining a \"maximum\"&nbsp;size is truly dependent on the event. We work to make the space fit your conference program. We are creative thinkers and enjoy working closely with clients to fashion the perfect venue.&nbsp;</p>\r\n			</td>\r\n		</tr>', '<tr>\r\n			<td>\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\"><strong>May 18<br>\r\n			Mary Ann Fisher<br>\r\n			34 Victoria Street<br>\r\n			Bristol, UK&nbsp;</strong></p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Dear Mc Fisher,</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Thank you for your enquiry about our company, <em>Tourism Victoria</em>. I am&nbsp;delighted to hear you have chosen our city to host your conference. Let me tell you a little about what our company can offer you.</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">We con plan special events, entertainment and excursions such as eco-adventures, symphony concerts end tours, for your delegates. We\'ll be happy to provide you with information on how to arrange pre- end post-event activities to suit your needs.</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Tourism Victoria can also assist in promoting your organization\'s conference to stimulate delegate attendance with brochures and lure pieces. We\'II act as liaison between our 900-plus member businesses and your planning committee.</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">I have enclosed an information leaflet on the Victoria Conference Center, which I highly recommend as a venue for your conference.</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Please contact me If&nbsp;you have any questions.</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Sincerely,&nbsp;</p>\r\n\r\n			<p style=\"margin-left:10px; margin-right:10px; text-align:justify\">Bob Whitehall<br>\r\n			Marketing<br>\r\n			Tourism Victoria,&nbsp;Canada&nbsp;</p>\r\n			</td>\r\n		</tr>', 1, 1, '2020-08-10 17:59:30', '2020-08-10 17:59:30'),
(2, 1, 0, 2, ' <tr>    <td style=\"text-align:center\"><strong>RESERVATIONS </strong></td>\r\n\r\n<td style=\"text-align:justify\">To ensure a table at SkyCity, at the top of Seattle\'s <em>Space Needle</em>, reservations are recommended.<br>\r\nTo make a reservation call: 200-905-2100 or 800-9374582.<br>\r\nGroups are welcome but must be scheduled in advance and are limited to no more than 21 guests.<br>\r\nParties of 10 or more cannot be accommodated May 31 through September 3.<br>\r\nYour elevator ride and Observation Deck visit am complimentary with your reservation at SkyCity.</td>\r\n\r\n<td style=\"text-align:justify\"><em>Reservations are&nbsp;available for seating&nbsp;during the following hours: </em></td>\r\n\r\n<td style=\"text-align:justify\"><strong>Lunch</strong>: Monday - Friday: 11:00am - 3:00pm<br>\r\n<strong>Brunch</strong>:&nbsp;Saturday &amp; Sunday: 10:00am - 3:00pm<br>\r\n<strong>Dinner</strong>: Sunday - Thursday: 5:00pm -&nbsp;9:00pm, Friday &amp; Saturday: 5:00pm - 10:00pm&nbsp;</td></tr>', NULL, 1, 1, '2020-08-11 02:40:51', '2020-08-11 02:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `part7_reading_question_explantation`
--

CREATE TABLE `part7_reading_question_explantation` (
  `id` int(11) NOT NULL,
  `id_part7_reading_questions` int(11) NOT NULL,
  `mean_content` varchar(255) NOT NULL,
  `mean_op1` varchar(255) NOT NULL,
  `mean_op2` varchar(255) NOT NULL,
  `mean_op3` varchar(255) NOT NULL,
  `mean_op4` text NOT NULL,
  `explantation` varchar(255) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `part7_reading_question_result`
--

CREATE TABLE `part7_reading_question_result` (
  `id` int(11) NOT NULL,
  `id_part7_reading_result` int(11) NOT NULL,
  `id_part7_reading_question` int(11) NOT NULL,
  `result` int(1) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_reading_question_result`
--

INSERT INTO `part7_reading_question_result` (`id`, `id_part7_reading_result`, `id_part7_reading_question`, `result`, `activeFlag`, `createDate`, `updateDate`) VALUES
(3, 3, 1, 5, 1, '2020-08-10 19:47:35', '2020-08-10 19:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `part7_reading_question_translate`
--

CREATE TABLE `part7_reading_question_translate` (
  `id` int(11) NOT NULL,
  `id_part7_reading` int(11) NOT NULL,
  `content1` text NOT NULL,
  `content2` text NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_reading_question_translate`
--

INSERT INTO `part7_reading_question_translate` (`id`, `id_part7_reading`, `content1`, `content2`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 1, '', '', 1, '2020-08-10 18:09:40', '2020-08-10 06:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `part7_reading_result`
--

CREATE TABLE `part7_reading_result` (
  `id` int(11) NOT NULL,
  `id_result` int(11) NOT NULL,
  `id_part7_reading` int(11) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part7_reading_result`
--

INSERT INTO `part7_reading_result` (`id`, `id_result`, `id_part7_reading`, `activeFlag`, `createDate`, `updateDate`) VALUES
(3, 177, 1, 1, '2020-08-10 19:46:45', '2020-08-10 19:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `question_explantation`
--

CREATE TABLE `question_explantation` (
  `id` int(11) NOT NULL,
  `mean_content` text NOT NULL,
  `mean_op1` varchar(255) NOT NULL,
  `mean_op2` varchar(255) NOT NULL,
  `mean_op3` varchar(255) NOT NULL,
  `mean_op4` varchar(255) NOT NULL,
  `explantation` text DEFAULT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_explantation`
--

INSERT INTO `question_explantation` (`id`, `mean_content`, `mean_op1`, `mean_op2`, `mean_op3`, `mean_op4`, `explantation`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'Người đàn ông đang làm gì?', 'Gửi thư', 'Trả lời email', 'Trả lời điện thoại', 'Sửa máy tính', 'Ta thấy ý này trong câu \"I have lots of e-mail to answer.\"', 1, '2020-06-04 12:00:00', '2020-06-04 12:00:00'),
(2, 'Người phụ nữ muốn làm gì?', 'Ăn trưa', 'Uống cà phê', 'Đi ngủ', 'Ngồi xuống', 'Ta thấy ý này trong câu \"it’s lunchtime. Let’s go eat.\"', 1, '2020-06-04 12:00:00', '2020-06-04 12:00:00'),
(3, 'Khi nào thì người đàn ông sẽ gặp người phụ nữ?', 'Giữa trưa', 'Trong 10 phút nữa', 'Lúc 5h', 'Trong 15 phút nữa', 'Ta thấy ý này trong câu \"I’ll see you in the cafeteria in 15 minutes.\"', 1, '2020-06-04 12:00:00', '2020-06-04 12:00:00'),
(4, 'Khi nào bộ phim sẽ bắt đầu?', '15 phút nữa', '5 phút nữa', '10 phút nữa', '20 phút nữa', 'Ta thấy ý này trong câu \"The film doesn\'t start for another ten minutes\"', 1, '2020-06-05 12:00:00', '2020-06-05 12:00:00'),
(5, 'Người phụ nữ muốn ăn cái gì?', 'Bắp rang với muối và bơ', 'Bắp rang với bơ, nhưng không bỏ muối', 'Bắp rang với muối, nhưng không bỏ bơ', 'Bắp rang không bỏ bơ và muối', 'Ta thấy ý này trong câu \"I\'ll have some popcorn. No butter, please, but make sure they put on a lot of salt. \"', 1, '2020-06-05 12:00:00', '2020-06-05 12:00:00'),
(6, 'Người phụ nữ còn muốn gì nữa?', 'Nước ép cam', ' Một quả cam', 'Nước cola', 'Nước chanh', 'Ta thấy ý này trong câu \"I would like an orange juice, please. \"', 1, '2020-06-05 12:00:00', '2020-06-05 12:00:00'),
(7, 'Điều gì đúng về Megan?', 'Cô ấy đang khuyên Michael', 'Cô ấy đang chuẩn bị vào phút cuối', 'Cô ấy đang lên kế hoạch trước', 'Cô ấy đã đến rất nhiều hội nghị', NULL, 1, '2020-06-28 12:00:00', '2020-06-28 12:00:00'),
(8, 'Điều gì sẽ xảy ra vào thứ Sáu ngày 5?', 'Michael sẽ giúp Megan', 'Megan sẽ thuyết trình', 'Michael có thời hạn', 'Có một hội nghị', NULL, 1, '2020-06-28 12:00:00', '2020-06-28 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `question_translate`
--

CREATE TABLE `question_translate` (
  `id` int(11) NOT NULL,
  `content_eng` text NOT NULL,
  `content_vie` text NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_translate`
--

INSERT INTO `question_translate` (`id`, `content_eng`, `content_vie`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'Woman: You’ve been at your computer all morning.\r\nMan: I have lots of e-mail to answer.\r\nWoman: Well, it’s lunchtime. Let’s go eat.\r\nMan: You go ahead. I’ll see you in the cafeteria in 15 minutes.', 'Người phụ nữ (W): Anh ngồi trước máy tính cả buổi sáng rồi.\r\n Người đàn ông (M): Tôi phải trả lời rất nhiều email.\r\n W: A, đã đến giờ trưa rồi. Chúng ta đi ăn thôi.\r\n M: Cô cứ đi trước đi. Tôi sẽ gặp cô ở nhà ăn trong 15 phút nữa.', 1, '2020-06-04 12:00:00', '2020-06-04 12:00:00'),
(2, 'M: Do you want something to eat? The film doesn\'t start for another ten minutes and I\'m pretty hungry.\r\nW: Sure, I\'ll have some popcorn. No butter, please, but make sure they put on a lot of salt.\r\nM: All of that salt is not good for you, and it will make you thirsty. Do you want anything to drink with that?\r\nW: Yes, I would like an orange juice, please.', 'M: Cô có muốn ăn gì không? 10 phút nữa phim mới bắt đầu và tôi khá là đói.\r\nW: Được. Tôi sẽ ăn bắp rang. Không bơ, làm ơn, nhưng hãy chắc rằng họ cho nhiều muối.\r\nM: Muối nhiều không tốt cho cô đâu và nó sẽ làm cô khát nước. Cô có muốn uống gì không?\r\nW: Có, tôi muốn uống nước cam ép, làm ơn.', 1, '2020-06-05 12:00:00', '2020-06-05 12:00:00'),
(3, '<p>W: Hi, Michael, can I have a word?</p>\r\n\r\n<p>M: Certainly, Megan. Come in. How is the preparation for the conference going?</p>\r\n\r\n<p>W: Well, that&#39;s what I wanted to speak to you about.</p>\r\n\r\n<p>M: No problems I hope...</p>\r\n\r\n<p>W: No; no real problems. But I&#39;ve just finished writing my presentation, and really I have no idea if it&#39;s at the right level for the audience. I was wondering, since you&#39;ve been to a lot of these conferences, if you could listen to my presentation and tell me what you think.</p>\r\n\r\n<p>M: Yes, of course. However, I have a deadline on Thursday, and my schedule&#39;s pretty full... When&#39;s your conference?</p>\r\n\r\n<p>W: The 10th.</p>\r\n\r\n<p>M: Oh, okay! You have a bit of time then. How about Friday the 5th, in the morning?</p>\r\n\r\n<p>W: That would be great, thanks.&nbsp;</p>', '', 1, '2020-06-26 12:00:00', '2020-06-26 12:00:00'),
(4, 'M: Hello, can I help you?\r\n\r\nW: Yes, I\'m not sure if I\'m in the right place, but I\'m looking for some information on your organization. You see, I\'ve just graduated, and I\'d like to get involved doing some voluntary work with disabled children this summer. I have my CV. Am I in the right office?\r\n\r\nM: No, I\'m afraid you want to talk to Anna, in 261 B. She\'s not in this afternoon though. She only works from 9am to 1pm each day.\r\n\r\nW: Oh.\r\n\r\nM: But do come back tomorrow if you can; I know she\'s always looking for volunteers. ', '', 1, '2020-07-16 18:43:34', '2020-07-16 18:43:34'),
(5, 'W: Did you manage to book our flights?\r\n\r\nM: Yes, this morning. We\'ll leave at 18:45 on Thursday, and arrive at 22:10 in Berlin. Then we\'ll return... \r\n\r\nW: Wait a minute, didn\'t Elsie tell you that I\'m not available on Thursday evening? I have to work till 8pm! I said specifically that I need to go Friday morning. We don\'t have to be there till the afternoon, after all!\r\n\r\nM: Uh, no. I didn\'t hear anything about this.\r\n\r\nW: Great! What are we going to do now?\r\n\r\nM: Well, I just have to call back and change your ticket I guess.', '', 1, '2020-07-16 18:48:01', '2020-07-16 18:48:01'),
(6, 'It is with great pleasure that I welcome you to this special opening ceremony today. Today is the result of over five year\'s planning and hard work as we finally open this magnificent building. Of course, we must thank the Bradford family who have given their wonderful art collection to the city. You will see many fine examples of classical and modern art on the walls around you. The Bradford family made their fortune making and selling beautiful clothes but, luckily for us, they spent a lot of their money on works of art. And now, ladies and gentlemen, please welcome Alan Bradford, the great grandson of the late Charles Bradford who will officially open the building and make a little speech himself. ', '', 1, '2020-08-03 18:43:47', '2020-08-03 18:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `id_exam` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `score` int(4) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `id_exam`, `id_user`, `score`, `activeFlag`, `createDate`, `updateDate`) VALUES
(74, 1, 2, 0, 1, '2020-07-17 16:34:57', '2020-07-17 16:34:57'),
(75, 1, 2, 0, 1, '2020-07-31 03:07:22', '2020-07-31 03:07:22'),
(76, 1, 2, 0, 1, '2020-07-31 03:29:54', '2020-07-31 03:29:54'),
(77, 1, 2, 0, 1, '2020-07-31 03:32:49', '2020-07-31 03:32:49'),
(78, 1, 2, 0, 1, '2020-07-31 03:46:53', '2020-07-31 03:46:53'),
(79, 1, 2, 0, 1, '2020-07-31 03:52:53', '2020-07-31 03:52:53'),
(80, 1, 2, 0, 1, '2020-07-31 04:16:17', '2020-07-31 04:16:17'),
(81, 1, 2, 0, 1, '2020-07-31 05:02:43', '2020-07-31 05:02:43'),
(82, 1, 2, 0, 1, '2020-07-31 05:07:00', '2020-07-31 05:07:00'),
(83, 1, 2, 0, 1, '2020-07-31 06:53:21', '2020-07-31 06:53:21'),
(84, 1, 2, 0, 1, '2020-08-03 19:54:18', '2020-08-03 19:54:18'),
(85, 1, 2, 0, 1, '2020-08-03 20:20:28', '2020-08-03 20:20:28'),
(86, 1, 2, 0, 1, '2020-08-03 20:38:21', '2020-08-03 20:38:21'),
(87, 1, 2, 0, 1, '2020-08-03 20:51:05', '2020-08-03 20:51:05'),
(88, 1, 2, 0, 1, '2020-08-03 21:03:46', '2020-08-03 21:03:46'),
(89, 1, 2, 0, 1, '2020-08-04 08:31:26', '2020-08-04 08:31:26'),
(90, 1, 2, 0, 1, '2020-08-04 08:34:44', '2020-08-04 08:34:44'),
(91, 1, 2, 0, 1, '2020-08-04 08:36:23', '2020-08-04 08:36:23'),
(92, 1, 2, 0, 1, '2020-08-04 09:36:26', '2020-08-04 09:36:26'),
(93, 1, 2, 0, 1, '2020-08-05 15:28:34', '2020-08-05 15:28:34'),
(94, 1, 2, 0, 1, '2020-08-06 10:32:43', '2020-08-06 10:32:43'),
(95, 1, 2, 0, 1, '2020-08-06 14:57:05', '2020-08-06 14:57:05'),
(96, 1, 2, 0, 1, '2020-08-06 15:09:07', '2020-08-06 15:09:07'),
(97, 1, 2, 0, 1, '2020-08-06 15:11:47', '2020-08-06 15:11:47'),
(98, 1, 2, 0, 1, '2020-08-06 15:15:00', '2020-08-06 15:15:00'),
(99, 1, 2, 0, 1, '2020-08-06 15:21:49', '2020-08-06 15:21:49'),
(100, 1, 2, 0, 1, '2020-08-06 15:32:07', '2020-08-06 15:32:07'),
(101, 1, 2, 0, 1, '2020-08-06 15:39:23', '2020-08-06 15:39:23'),
(102, 1, 2, 0, 1, '2020-08-06 16:01:33', '2020-08-06 16:01:33'),
(103, 1, 2, 0, 1, '2020-08-06 16:04:56', '2020-08-06 16:04:56'),
(104, 1, 2, 0, 1, '2020-08-06 16:10:51', '2020-08-06 16:10:51'),
(105, 1, 2, 0, 1, '2020-08-06 16:14:29', '2020-08-06 16:14:29'),
(106, 1, 2, 0, 1, '2020-08-06 16:20:38', '2020-08-06 16:20:38'),
(107, 1, 2, 0, 1, '2020-08-06 16:24:35', '2020-08-06 16:24:35'),
(108, 1, 2, 0, 1, '2020-08-06 16:27:55', '2020-08-06 16:27:55'),
(109, 1, 2, 0, 1, '2020-08-06 16:31:46', '2020-08-06 16:31:46'),
(110, 1, 2, 0, 1, '2020-08-06 16:34:13', '2020-08-06 16:34:13'),
(111, 1, 2, 0, 1, '2020-08-06 16:51:15', '2020-08-06 16:51:15'),
(112, 1, 2, 0, 1, '2020-08-06 16:54:44', '2020-08-06 16:54:44'),
(113, 1, 2, 0, 1, '2020-08-06 16:59:16', '2020-08-06 16:59:16'),
(114, 1, 2, 0, 1, '2020-08-06 17:05:14', '2020-08-06 17:05:14'),
(115, 1, 2, 0, 1, '2020-08-06 17:07:06', '2020-08-06 17:07:06'),
(116, 1, 2, 0, 1, '2020-08-06 17:10:29', '2020-08-06 17:10:29'),
(117, 1, 2, 0, 1, '2020-08-06 17:17:52', '2020-08-06 17:17:52'),
(118, 1, 2, 0, 1, '2020-08-06 17:24:04', '2020-08-06 17:24:04'),
(119, 1, 2, 0, 1, '2020-08-06 17:27:35', '2020-08-06 17:27:35'),
(120, 1, 2, 0, 1, '2020-08-09 14:59:48', '2020-08-09 14:59:48'),
(121, 1, 2, 0, 1, '2020-08-09 15:57:05', '2020-08-09 15:57:05'),
(122, 1, 2, 0, 1, '2020-08-09 16:28:12', '2020-08-09 16:28:13'),
(123, 1, 2, 0, 1, '2020-08-09 16:56:23', '2020-08-09 16:56:24'),
(124, 1, 2, 0, 1, '2020-08-09 16:56:56', '2020-08-09 16:56:56'),
(125, 1, 2, 0, 1, '2020-08-09 16:57:44', '2020-08-09 16:57:45'),
(126, 1, 2, 0, 1, '2020-08-09 17:14:10', '2020-08-09 17:14:10'),
(127, 1, 2, 0, 1, '2020-08-09 17:15:05', '2020-08-09 17:15:06'),
(128, 1, 2, 0, 1, '2020-08-09 17:21:52', '2020-08-09 17:21:52'),
(129, 1, 2, 0, 1, '2020-08-09 17:22:29', '2020-08-09 17:22:30'),
(130, 1, 2, 0, 1, '2020-08-09 17:27:01', '2020-08-09 17:27:01'),
(131, 1, 2, 0, 1, '2020-08-09 17:27:43', '2020-08-09 17:27:43'),
(132, 1, 2, 0, 1, '2020-08-09 17:34:51', '2020-08-09 17:34:51'),
(133, 1, 2, 0, 1, '2020-08-09 17:35:22', '2020-08-09 17:35:22'),
(134, 1, 2, 0, 1, '2020-08-09 18:24:20', '2020-08-09 18:24:20'),
(135, 1, 2, 0, 1, '2020-08-09 18:25:55', '2020-08-09 18:25:55'),
(136, 1, 2, 0, 1, '2020-08-09 18:36:37', '2020-08-09 18:36:37'),
(137, 1, 2, 0, 1, '2020-08-09 18:37:18', '2020-08-09 18:37:18'),
(138, 1, 2, 0, 1, '2020-08-09 18:49:36', '2020-08-09 18:49:36'),
(139, 1, 2, 0, 1, '2020-08-09 18:50:08', '2020-08-09 18:50:09'),
(140, 1, 2, 0, 1, '2020-08-09 19:03:08', '2020-08-09 19:03:08'),
(141, 1, 2, 0, 1, '2020-08-09 19:03:32', '2020-08-09 19:03:32'),
(142, 1, 2, 0, 1, '2020-08-09 19:10:15', '2020-08-09 19:10:15'),
(143, 1, 2, 0, 1, '2020-08-09 19:10:42', '2020-08-09 19:10:42'),
(144, 1, 2, 0, 1, '2020-08-09 19:21:45', '2020-08-09 19:21:45'),
(145, 1, 2, 0, 1, '2020-08-09 19:24:30', '2020-08-09 19:24:31'),
(146, 1, 2, 0, 1, '2020-08-10 04:36:22', '2020-08-10 04:36:22'),
(147, 1, 2, 0, 1, '2020-08-10 05:09:42', '2020-08-10 05:09:42'),
(148, 1, 2, 0, 1, '2020-08-10 08:47:15', '2020-08-10 08:47:15'),
(149, 1, 2, 0, 1, '2020-08-10 09:13:17', '2020-08-10 09:13:17'),
(150, 1, 2, 0, 1, '2020-08-10 09:18:11', '2020-08-10 09:18:11'),
(151, 1, 2, 0, 1, '2020-08-10 09:31:05', '2020-08-10 09:31:05'),
(152, 1, 2, 0, 1, '2020-08-10 09:32:27', '2020-08-10 09:32:27'),
(153, 1, 2, 0, 1, '2020-08-10 09:52:41', '2020-08-10 09:52:41'),
(154, 1, 2, 0, 1, '2020-08-10 09:58:20', '2020-08-10 09:58:20'),
(155, 1, 2, 0, 1, '2020-08-10 10:11:59', '2020-08-10 10:11:59'),
(156, 1, 2, 0, 1, '2020-08-10 10:14:25', '2020-08-10 10:14:25'),
(157, 1, 2, 0, 1, '2020-08-10 10:20:06', '2020-08-10 10:20:06'),
(158, 1, 2, 0, 1, '2020-08-10 10:24:22', '2020-08-10 10:24:22'),
(159, 1, 2, 0, 1, '2020-08-10 10:27:52', '2020-08-10 10:27:52'),
(160, 1, 2, 0, 1, '2020-08-10 10:30:51', '2020-08-10 10:30:51'),
(161, 1, 2, 0, 1, '2020-08-10 10:38:05', '2020-08-10 10:38:05'),
(162, 1, 2, 0, 1, '2020-08-10 10:41:25', '2020-08-10 10:41:25'),
(163, 1, 2, 0, 1, '2020-08-10 10:49:24', '2020-08-10 10:49:24'),
(164, 1, 2, 0, 1, '2020-08-10 10:53:09', '2020-08-10 10:53:10'),
(165, 1, 2, 0, 1, '2020-08-10 10:59:00', '2020-08-10 10:59:00'),
(166, 1, 2, 0, 1, '2020-08-10 11:00:32', '2020-08-10 11:00:33'),
(167, 1, 2, 0, 1, '2020-08-10 14:35:36', '2020-08-10 14:35:36'),
(168, 1, 2, 0, 1, '2020-08-10 14:36:17', '2020-08-10 14:36:17'),
(169, 1, 2, 0, 1, '2020-08-10 14:48:52', '2020-08-10 14:48:52'),
(170, 1, 2, 0, 1, '2020-08-10 15:31:54', '2020-08-10 15:31:54'),
(171, 1, 2, 0, 1, '2020-08-10 15:32:37', '2020-08-10 15:32:38'),
(172, 1, 2, 0, 1, '2020-08-10 15:33:02', '2020-08-10 15:33:03'),
(173, 1, 2, 0, 1, '2020-08-10 16:27:45', '2020-08-10 16:27:45'),
(174, 1, 2, 0, 1, '2020-08-10 16:28:26', '2020-08-10 16:28:26'),
(175, 1, 2, 0, 1, '2020-08-10 19:19:58', '2020-08-10 19:19:58'),
(177, 1, 2, 0, 1, '2020-08-10 19:38:41', '2020-08-10 19:38:41'),
(208, 1, 2, 0, 1, '2020-08-11 18:02:20', '2020-08-11 18:02:20'),
(209, 1, 2, 0, 1, '2020-08-11 18:20:46', '2020-08-11 18:20:46'),
(210, 1, 2, 0, 1, '2020-08-11 18:25:32', '2020-08-11 18:25:32'),
(211, 1, 2, 0, 1, '2020-08-11 19:06:40', '2020-08-11 19:06:40'),
(212, 1, 2, 0, 1, '2020-08-11 19:45:46', '2020-08-11 19:45:46'),
(213, 1, 2, 0, 1, '2020-08-11 19:49:51', '2020-08-11 19:49:51'),
(214, 1, 2, 0, 1, '2020-08-11 19:50:36', '2020-08-11 19:50:36'),
(215, 1, 2, 0, 1, '2020-08-11 19:50:54', '2020-08-11 19:50:54'),
(216, 1, 2, 0, 1, '2020-08-11 19:51:02', '2020-08-11 19:51:02'),
(217, 1, 2, 0, 1, '2020-08-11 20:12:14', '2020-08-11 20:12:14'),
(218, 1, 2, 50, 1, '2020-08-11 20:12:40', '2020-08-11 20:12:40'),
(219, 1, 2, 50, 1, '2020-08-11 20:12:56', '2020-08-11 20:12:56'),
(220, 1, 2, 50, 1, '2020-08-11 20:13:36', '2020-08-11 20:13:36'),
(221, 1, 2, 50, 1, '2020-08-11 20:16:53', '2020-08-11 20:16:53'),
(222, 1, 2, 50, 1, '2020-08-11 20:19:23', '2020-08-11 20:19:23'),
(223, 1, 2, 0, 1, '2020-08-12 02:18:36', '2020-08-12 02:18:36'),
(224, 1, 2, 0, 1, '2020-08-12 05:28:48', '2020-08-12 05:28:48'),
(225, 1, 2, 10, 1, '2020-08-12 05:29:01', '2020-08-12 05:29:01'),
(226, 1, 2, 10, 1, '2020-08-12 05:29:10', '2020-08-12 05:29:10'),
(227, 1, 2, 10, 1, '2020-08-12 05:30:14', '2020-08-12 05:30:14'),
(228, 1, 2, 10, 1, '2020-08-12 05:30:47', '2020-08-12 05:30:47'),
(229, 1, 2, 0, 1, '2020-08-12 08:17:18', '2020-08-12 08:17:18'),
(230, 1, 2, 0, 1, '2020-08-12 08:41:22', '2020-08-12 08:41:22'),
(231, 1, 2, 0, 1, '2020-08-12 08:59:17', '2020-08-12 08:59:17'),
(232, 1, 2, 0, 1, '2020-08-12 09:05:26', '2020-08-12 09:05:26'),
(233, 1, 2, 0, 1, '2020-08-12 09:49:01', '2020-08-12 09:49:01'),
(234, 1, 2, 0, 1, '2020-08-12 09:53:56', '2020-08-12 09:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `roleName`, `description`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'ROLE_ADMIN', 'admin of system', 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(2, 'ROLE_CLIENT', 'client', 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roleuser`
--

CREATE TABLE `roleuser` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `ACTIVE_FLAG` int(1) NOT NULL DEFAULT 1,
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATE_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roleuser`
--

INSERT INTO `roleuser` (`ID`, `USER_ID`, `ROLE_ID`, `ACTIVE_FLAG`, `CREATE_DATE`, `UPDATE_DATE`) VALUES
(1, 1, 1, 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(2, 2, 2, 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00'),
(3, 3, 2, 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id_test` int(11) NOT NULL,
  `tittle` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `active_flag` int(1) NOT NULL DEFAULT 1,
  `create_date` timestamp NOT NULL DEFAULT curdate(),
  `update_date` timestamp NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id_test`, `tittle`, `img`, `active_flag`, `create_date`, `update_date`) VALUES
(3, 'Đề số 1', '', 1, '2020-06-03 12:00:00', '2020-06-03 15:21:18'),
(4, 'Đề số 2', 'part3/0ZFGN.mp3', 1, '2020-06-03 12:00:00', '2020-06-03 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `activeFlag` int(1) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 'congman1998', '11111111', 'congman@gmail.com', 'Truong Cong Man', 1, '2020-06-10 12:00:00', '2020-06-10 12:00:00'),
(2, 'man1', '11111111', 'man1@gmail.com', 'A Man', 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00'),
(3, 'vanhieu1998', '11111111', 'vanhieu1998@gmail.com', 'Vo Van Hieu', 1, '2020-06-16 12:00:00', '2020-06-16 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vocabularycontent`
--

CREATE TABLE `vocabularycontent` (
  `idvocabularycontent` int(11) NOT NULL,
  `namevocabularycontent` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `transcribe` text DEFAULT NULL,
  `imagevocabularycontent` text DEFAULT NULL,
  `audiomp3` text DEFAULT NULL,
  `audioogg` text DEFAULT NULL,
  `mean` text DEFAULT NULL,
  `question` varchar(200) DEFAULT NULL,
  `activeFlag` int(11) DEFAULT NULL,
  `idvocabulary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vocabularycontent`
--

INSERT INTO `vocabularycontent` (`idvocabularycontent`, `namevocabularycontent`, `transcribe`, `imagevocabularycontent`, `audiomp3`, `audioogg`, `mean`, `question`, `activeFlag`, `idvocabulary`) VALUES
(23, 'agreement', '/ə\'gri:mənt/', 'agreement.jpg', 'agreement.mp3', NULL, 'Từ loại: (n): hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau', 'Hợp đồng', 1, 1),
(24, 'abide by', '/ə\'baid/', 'abide_by.jpg', 'abide_by.mp3', NULL, 'Từ loại: (v): tôn trọng, tuân theo, giữ (lời)', 'Tôn trọng', 1, 1),
(25, 'assurance', '/ə\'ʃuərəns/', 'assurance.jpg', 'assurance.mp3', NULL, 'Từ loại: (n): sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin', 'Bảo đảm', 1, 1),
(26, 'admit', '/ə\'ʃuərəns/', 'admit.jpg', 'admit.mp3', NULL, 'Từ loại: (n): sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin', 'Sự cam đoan', 1, 2),
(27, 'cancellation', '/,kænse\'leiʃn/', 'cancellation.jpg', 'cancellation.mp3', NULL, 'Từ loại: (n): sự bãi bỏ, hủy bỏ', 'Hủy bỏ', 1, 3),
(28, 'determine', '/di\'tə:min/', 'determine.jpg', 'determine.mp3', NULL, 'Từ loại: (v): quyết định, xác định, định rõ; quyết tâm, kiên quyết', 'Quyết định', 1, 4),
(29, 'accommodate ', '/ə\'kɔmədeit/', 'accommodate.jpg ', 'determine.mp3', NULL, 'Từ loại: (v): điều tiết, điều chỉnh, thu xếp, làm cho phù hợp', 'Điều tiết', 1, 2),
(30, 'arrangement ', '/ə\'reindʤmənt/', 'arrangement.jpg', 'determine.mp3', NULL, 'Từ loại: (n): ‹sự› thu xếp, dàn xếp, sắp xếp, sắp đặt', 'Thu xếp', 1, 2),
(31, 'association ', '/ə,sousi\'eiʃn/', 'association.jpg', 'determine.mp3', NULL, 'Từ loại: (n): hội, hội liên hiệp, đoàn thể; ‹sự› kết hợp, liên kết, liên hợp', 'Kết hợp', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vocabularyline`
--

CREATE TABLE `vocabularyline` (
  `idvocabulary` int(11) NOT NULL,
  `namevocabulary` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `imagevocabulary` text DEFAULT NULL,
  `activeFlag` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vocabularyline`
--

INSERT INTO `vocabularyline` (`idvocabulary`, `namevocabulary`, `imagevocabulary`, `activeFlag`, `content`) VALUES
(1, 'Contracts', 'contracts.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(2, 'Conferences', 'conferences.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Conferences chứa những từ vựng liên quan đến Conferences giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(3, 'Electronics', 'electronics.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Electronics chứa những từ vựng liên quan đến Electronics giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(4, 'Eating_out', 'eating_out.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Eating_out chứa những từ vựng liên quan đến Eating_out giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(5, 'Health', 'health.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(6, 'General_travel', 'general_travel.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(7, 'Hopitals', 'hopitals.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(8, 'Pharmacy', 'pharmacy.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(9, 'Inventory', 'inventory.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(10, 'Marketing', 'marketing.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(11, 'Media', 'media.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(12, 'Music', 'music.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(13, 'Office_procedures', 'office_procedures.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(14, 'Office_technology', 'office_technology.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(15, 'Ordering_lunch', 'ordering_lunch.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(16, 'Pharmacy', 'pharmacy.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(17, 'Product_development', 'product_development.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(18, 'Promotion', 'promotion.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(19, 'Property_and_departments', 'property_and_departments.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(20, 'Quality_control', 'quality_control.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.'),
(21, 'Warranties', 'warranties.jpg', 1, 'Nội dung học từ vựng theo chủ đề.Chủ đề Contracts chứa những từ vựng liên quan đến Contracts giúp cho người ôn tập cãi thiện được nội dung ôn tập dễ dàng.');

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_question`
--

CREATE TABLE `vocabulary_question` (
  `id` int(11) NOT NULL,
  `idvocabularycontent` int(11) NOT NULL,
  `mean_content` text NOT NULL,
  `activeFlag` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vocabulary_question`
--

INSERT INTO `vocabulary_question` (`id`, `idvocabularycontent`, `mean_content`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 23, 'Hợp đồng', 1, '2020-08-03 22:53:26', '2020-08-03 22:53:26'),
(2, 23, 'Du lịch', 1, '2020-08-03 22:53:26', '2020-08-03 22:53:26'),
(3, 23, 'Xã hội', 1, '2020-08-03 22:53:26', '2020-08-03 22:53:26'),
(4, 23, 'Cuộc sống', 1, '2020-08-03 22:53:26', '2020-08-03 22:53:26'),
(5, 24, 'Tôn trọng', 1, '2020-08-11 22:12:07', '2020-08-11 22:12:07'),
(6, 24, 'Chừng mực', 1, '2020-08-11 22:12:07', '2020-08-11 22:12:07'),
(7, 24, 'Cuộc sống', 1, '2020-08-11 22:12:07', '2020-08-11 22:12:07'),
(8, 24, 'Cảnh cáo', 1, '2020-08-11 22:12:07', '2020-08-11 22:12:07'),
(9, 25, 'Chê trách', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(10, 25, 'Bảo đảm', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(11, 25, 'Trách nhiệm', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(12, 25, 'Hi sinh', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(13, 26, 'Chê trách', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(14, 26, 'Bảo đảm', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(15, 26, 'Trách nhiệm', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(16, 26, 'Sự cam đoan', 1, '2020-08-12 02:00:08', '2020-08-12 02:00:08'),
(17, 27, 'Xác nhận', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(18, 27, 'Mục đích', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(19, 27, 'Hủy bỏ', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(20, 27, 'Đồng ý', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(21, 28, 'Quyết định', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(22, 28, 'Hợp đồng', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(23, 28, 'Tình cảm', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(24, 28, 'Tố giác', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(25, 29, 'Điều tiết', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(26, 29, 'Niềm vui', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(27, 29, 'Hạnh phúc', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(28, 29, 'Cảm xúc', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(29, 30, 'Học hành', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(30, 30, 'Buồn tủi', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(31, 30, 'Nghỉ ngơi', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(32, 30, 'Thu xếp', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(33, 31, 'Kết hợp', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(34, 31, 'Thoát ra', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(35, 31, 'Hủy bỏ', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30'),
(36, 31, 'Tìm ra', 1, '2020-08-12 02:06:30', '2020-08-12 02:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_true`
--

CREATE TABLE `vocabulary_true` (
  `idvocabularytrue` int(11) NOT NULL,
  `idvocabularycontent` int(11) NOT NULL,
  `mean_content` text NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `activeFlag` int(11) NOT NULL DEFAULT 1,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `vocabulary_true`
--

INSERT INTO `vocabulary_true` (`idvocabularytrue`, `idvocabularycontent`, `mean_content`, `op1`, `op2`, `op3`, `op4`, `activeFlag`, `createDate`, `updateDate`) VALUES
(1, 23, 'Từ loại: (n): hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau', 'Hợp đồng', 'Du lịch', 'Liên hệ', 'Quảng cáo', 1, '2020-08-03 22:11:22', '2020-08-03 22:11:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `menuId_authId_fk` (`MENU_ID`),
  ADD KEY `roleId_authId_fk` (`ROLE_ID`);

--
-- Indexes for table `cmt_grammar`
--
ALTER TABLE `cmt_grammar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId_cmtGrammarId_fk` (`user_id`),
  ADD KEY `cmtGrammarId_grammarGuidelineId_fk` (`grammar_guideline_id`);

--
-- Indexes for table `cmt_reply_grammar`
--
ALTER TABLE `cmt_reply_grammar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId_cmtReplyGrammar_kf` (`user_id`),
  ADD KEY `cmtGrammarId_cmtReplyGrammar_kf` (`cmtGrammar_id`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grammar_guideline`
--
ALTER TABLE `grammar_guideline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `part1_listening`
--
ALTER TABLE `part1_listening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part1_exam_fk` (`exam_id`);

--
-- Indexes for table `part1_listening_result`
--
ALTER TABLE `part1_listening_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part1_result_fk` (`id_result`),
  ADD KEY `part1_lis_result_fk` (`id_part1_question`);

--
-- Indexes for table `part1_question`
--
ALTER TABLE `part1_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part1Ques_partLis_fk` (`id_part1_listening`);

--
-- Indexes for table `part2_listening`
--
ALTER TABLE `part2_listening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part2_exam_fk` (`exam_id`);

--
-- Indexes for table `part2_listening_result`
--
ALTER TABLE `part2_listening_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part2Result_result_fk` (`id_result`),
  ADD KEY `part2Result_part2Ques_fk` (`id_part2_question`);

--
-- Indexes for table `part2_question`
--
ALTER TABLE `part2_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part2Ques_part2Lis_fk` (`id_part2_listening`);

--
-- Indexes for table `part3_explantation`
--
ALTER TABLE `part3_explantation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part3_lis_foreign_key` (`id_part3_listening`);

--
-- Indexes for table `part3_listening`
--
ALTER TABLE `part3_listening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part3_exam_fk` (`id_exam`),
  ADD KEY `idpart3_idtranslate_foreign_key` (`id_translate`);

--
-- Indexes for table `part3_listening_question_result`
--
ALTER TABLE `part3_listening_question_result`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `part3LisQuesResult_part3Result_fk` (`id_part3_listening_result`),
  ADD KEY `part3LisQuesResult_part3Question_fk` (`id_part3_listening_question`);

--
-- Indexes for table `part3_listening_ques_explantation`
--
ALTER TABLE `part3_listening_ques_explantation`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `part3LisQuesExplan_part3Ques_fk` (`id_part3_listening_questions`);

--
-- Indexes for table `part3_listening_result`
--
ALTER TABLE `part3_listening_result`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `part3Result_result_fk` (`id_result`),
  ADD KEY `part3Result_part3Listening_fk` (`id_part3_listening`);

--
-- Indexes for table `part3_questions`
--
ALTER TABLE `part3_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_part3_foreign_key` (`id_part3_listening`);

--
-- Indexes for table `part4_listening`
--
ALTER TABLE `part4_listening`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `part4_exam_fk` (`id_exam`),
  ADD KEY `idpart4_idtranslate_fk` (`id_translate`);

--
-- Indexes for table `part4_listening_questions`
--
ALTER TABLE `part4_listening_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part4_part4Ques_fk` (`id_part4_listening`);

--
-- Indexes for table `part4_listening_question_result`
--
ALTER TABLE `part4_listening_question_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part4LisQuesResult_part4Question_fk` (`id_part4_listening_question`),
  ADD KEY `part4LisQuesResult_part4Result_fk` (`id_part4_listening_result`);

--
-- Indexes for table `part4_listening_ques_explantation`
--
ALTER TABLE `part4_listening_ques_explantation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part4LisQuesExplan_part4Ques_fk` (`id_part4_listening_questions`);

--
-- Indexes for table `part4_listening_result`
--
ALTER TABLE `part4_listening_result`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `part4Result_part4_fk` (`id_part4_listening`),
  ADD KEY `part4Result_result_fk` (`id_result`);

--
-- Indexes for table `part5_lessons`
--
ALTER TABLE `part5_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `part5_reading_question`
--
ALTER TABLE `part5_reading_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part5Question_exam_fk` (`id_exam`),
  ADD KEY `part5question_part5lesson` (`id_part5_lesson`);

--
-- Indexes for table `part5_reading_ques_explantation`
--
ALTER TABLE `part5_reading_ques_explantation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part5question_part5questionexplan_fk` (`id_part5_reading_questions`);

--
-- Indexes for table `part5_reading_result`
--
ALTER TABLE `part5_reading_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part5result_part5question` (`id_part5_question`),
  ADD KEY `part5result_result_fk` (`id_result`);

--
-- Indexes for table `part7_lessons`
--
ALTER TABLE `part7_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `part7_questions`
--
ALTER TABLE `part7_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7Question_part7_fk` (`id_part7_reading`);

--
-- Indexes for table `part7_reading`
--
ALTER TABLE `part7_reading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7_exam_fk` (`id_exam`),
  ADD KEY `part7Reading_part7Lesson_fk` (`id_part7_lesson`);

--
-- Indexes for table `part7_reading_question_explantation`
--
ALTER TABLE `part7_reading_question_explantation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7ReadingQuesExp_part7ReadingQuestion_fk` (`id_part7_reading_questions`);

--
-- Indexes for table `part7_reading_question_result`
--
ALTER TABLE `part7_reading_question_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7ReadingQuesResult_part7ReadingQuestion_fk` (`id_part7_reading_question`),
  ADD KEY `part7ReadingQuesResult_part7ReadingResult_fk` (`id_part7_reading_result`);

--
-- Indexes for table `part7_reading_question_translate`
--
ALTER TABLE `part7_reading_question_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7ReadingQuesTranslate_part7Reading_fk` (`id_part7_reading`);

--
-- Indexes for table `part7_reading_result`
--
ALTER TABLE `part7_reading_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part7ReadingResult_part7Reading_fk` (`id_part7_reading`),
  ADD KEY `part7_result_fk` (`id_result`);

--
-- Indexes for table `question_explantation`
--
ALTER TABLE `question_explantation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_translate`
--
ALTER TABLE `question_translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_result_fk` (`id_exam`),
  ADD KEY `user_result_fk` (`id_user`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roleuser`
--
ALTER TABLE `roleuser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `roleId_roleUserId_fk` (`ROLE_ID`),
  ADD KEY `userId__roleUserId_fk` (`USER_ID`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id_test`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vocabularycontent`
--
ALTER TABLE `vocabularycontent`
  ADD PRIMARY KEY (`idvocabularycontent`) USING BTREE,
  ADD KEY `vocaContent_vocaBulary_fk` (`idvocabulary`);

--
-- Indexes for table `vocabularyline`
--
ALTER TABLE `vocabularyline`
  ADD PRIMARY KEY (`idvocabulary`) USING BTREE;

--
-- Indexes for table `vocabulary_question`
--
ALTER TABLE `vocabulary_question`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vocaQues_vocaContent_fk` (`idvocabularycontent`);

--
-- Indexes for table `vocabulary_true`
--
ALTER TABLE `vocabulary_true`
  ADD PRIMARY KEY (`idvocabularytrue`) USING BTREE,
  ADD KEY `FK_VOCABULARY_True` (`idvocabularycontent`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `cmt_grammar`
--
ALTER TABLE `cmt_grammar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cmt_reply_grammar`
--
ALTER TABLE `cmt_reply_grammar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `examination`
--
ALTER TABLE `examination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grammar_guideline`
--
ALTER TABLE `grammar_guideline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `part1_listening`
--
ALTER TABLE `part1_listening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `part1_listening_result`
--
ALTER TABLE `part1_listening_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `part1_question`
--
ALTER TABLE `part1_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `part2_listening`
--
ALTER TABLE `part2_listening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `part2_listening_result`
--
ALTER TABLE `part2_listening_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `part2_question`
--
ALTER TABLE `part2_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `part3_explantation`
--
ALTER TABLE `part3_explantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `part3_listening`
--
ALTER TABLE `part3_listening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `part3_listening_question_result`
--
ALTER TABLE `part3_listening_question_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `part3_listening_ques_explantation`
--
ALTER TABLE `part3_listening_ques_explantation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `part3_listening_result`
--
ALTER TABLE `part3_listening_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `part3_questions`
--
ALTER TABLE `part3_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `part4_listening`
--
ALTER TABLE `part4_listening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `part4_listening_questions`
--
ALTER TABLE `part4_listening_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `part4_listening_question_result`
--
ALTER TABLE `part4_listening_question_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `part4_listening_ques_explantation`
--
ALTER TABLE `part4_listening_ques_explantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `part4_listening_result`
--
ALTER TABLE `part4_listening_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `part5_lessons`
--
ALTER TABLE `part5_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `part5_reading_question`
--
ALTER TABLE `part5_reading_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `part5_reading_ques_explantation`
--
ALTER TABLE `part5_reading_ques_explantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `part5_reading_result`
--
ALTER TABLE `part5_reading_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `part7_lessons`
--
ALTER TABLE `part7_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `part7_questions`
--
ALTER TABLE `part7_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `part7_reading`
--
ALTER TABLE `part7_reading`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `part7_reading_question_explantation`
--
ALTER TABLE `part7_reading_question_explantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `part7_reading_question_result`
--
ALTER TABLE `part7_reading_question_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `part7_reading_question_translate`
--
ALTER TABLE `part7_reading_question_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `part7_reading_result`
--
ALTER TABLE `part7_reading_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `question_explantation`
--
ALTER TABLE `question_explantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `question_translate`
--
ALTER TABLE `question_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roleuser`
--
ALTER TABLE `roleuser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vocabularycontent`
--
ALTER TABLE `vocabularycontent`
  MODIFY `idvocabularycontent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vocabularyline`
--
ALTER TABLE `vocabularyline`
  MODIFY `idvocabulary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `menuId_authId_fk` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roleId_authId_fk` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cmt_grammar`
--
ALTER TABLE `cmt_grammar`
  ADD CONSTRAINT `cmtGrammarId_grammarGuidelineId_fk` FOREIGN KEY (`grammar_guideline_id`) REFERENCES `grammar_guideline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userId_cmtGrammarId_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cmt_reply_grammar`
--
ALTER TABLE `cmt_reply_grammar`
  ADD CONSTRAINT `cmtGrammarId_cmtReplyGrammar_kf` FOREIGN KEY (`cmtGrammar_id`) REFERENCES `cmt_grammar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userId_cmtReplyGrammar_kf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part1_listening`
--
ALTER TABLE `part1_listening`
  ADD CONSTRAINT `part1_exam_fk` FOREIGN KEY (`exam_id`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part1_listening_result`
--
ALTER TABLE `part1_listening_result`
  ADD CONSTRAINT `part1_lis_result_fk` FOREIGN KEY (`id_part1_question`) REFERENCES `part1_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `part1_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part1_question`
--
ALTER TABLE `part1_question`
  ADD CONSTRAINT `part1Ques_partLis_fk` FOREIGN KEY (`id_part1_listening`) REFERENCES `part1_listening` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part2_listening`
--
ALTER TABLE `part2_listening`
  ADD CONSTRAINT `part2_exam_fk` FOREIGN KEY (`exam_id`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part2_listening_result`
--
ALTER TABLE `part2_listening_result`
  ADD CONSTRAINT `part2Result_part2Ques_fk` FOREIGN KEY (`id_part2_question`) REFERENCES `part2_question` (`id`),
  ADD CONSTRAINT `part2Result_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part2_question`
--
ALTER TABLE `part2_question`
  ADD CONSTRAINT `part2Ques_part2Lis_fk` FOREIGN KEY (`id_part2_listening`) REFERENCES `part2_listening` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part3_explantation`
--
ALTER TABLE `part3_explantation`
  ADD CONSTRAINT `part3_lis_foreign_key` FOREIGN KEY (`id_part3_listening`) REFERENCES `part3_listening` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `part3_listening`
--
ALTER TABLE `part3_listening`
  ADD CONSTRAINT `idpart3_idtranslate_foreign_key` FOREIGN KEY (`id_translate`) REFERENCES `question_translate` (`id`),
  ADD CONSTRAINT `part3_exam_fk` FOREIGN KEY (`id_exam`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part3_listening_question_result`
--
ALTER TABLE `part3_listening_question_result`
  ADD CONSTRAINT `part3LisQuesResult_part3Question_fk` FOREIGN KEY (`id_part3_listening_question`) REFERENCES `part3_questions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part3LisQuesResult_part3Result_fk` FOREIGN KEY (`id_part3_listening_result`) REFERENCES `part3_listening_result` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part3_listening_ques_explantation`
--
ALTER TABLE `part3_listening_ques_explantation`
  ADD CONSTRAINT `part3LisQuesExplan_part3Ques_fk` FOREIGN KEY (`id_part3_listening_questions`) REFERENCES `part3_questions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part3_listening_result`
--
ALTER TABLE `part3_listening_result`
  ADD CONSTRAINT `part3Result_part3Listening_fk` FOREIGN KEY (`id_part3_listening`) REFERENCES `part3_listening` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part3Result_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part3_questions`
--
ALTER TABLE `part3_questions`
  ADD CONSTRAINT `id_part3_foreign_key` FOREIGN KEY (`id_part3_listening`) REFERENCES `part3_listening` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part4_listening`
--
ALTER TABLE `part4_listening`
  ADD CONSTRAINT `idpart4_idtranslate_fk` FOREIGN KEY (`id_translate`) REFERENCES `question_translate` (`id`),
  ADD CONSTRAINT `part4_exam_fk` FOREIGN KEY (`id_exam`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part4_listening_questions`
--
ALTER TABLE `part4_listening_questions`
  ADD CONSTRAINT `part4_part4Ques_fk` FOREIGN KEY (`id_part4_listening`) REFERENCES `part4_listening` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part4_listening_question_result`
--
ALTER TABLE `part4_listening_question_result`
  ADD CONSTRAINT `part4LisQuesResult_part4Question_fk` FOREIGN KEY (`id_part4_listening_question`) REFERENCES `part4_listening_questions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part4LisQuesResult_part4Result_fk` FOREIGN KEY (`id_part4_listening_result`) REFERENCES `part4_listening_result` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part4_listening_ques_explantation`
--
ALTER TABLE `part4_listening_ques_explantation`
  ADD CONSTRAINT `part4LisQuesExplan_part4Ques_fk` FOREIGN KEY (`id_part4_listening_questions`) REFERENCES `part4_listening_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part4_listening_result`
--
ALTER TABLE `part4_listening_result`
  ADD CONSTRAINT `part4Result_part4_fk` FOREIGN KEY (`id_part4_listening`) REFERENCES `part4_listening` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part4Result_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part5_reading_question`
--
ALTER TABLE `part5_reading_question`
  ADD CONSTRAINT `part5Question_exam_fk` FOREIGN KEY (`id_exam`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `part5question_part5lesson` FOREIGN KEY (`id_part5_lesson`) REFERENCES `part5_lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part5_reading_ques_explantation`
--
ALTER TABLE `part5_reading_ques_explantation`
  ADD CONSTRAINT `part5question_part5questionexplan_fk` FOREIGN KEY (`id_part5_reading_questions`) REFERENCES `part5_reading_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part5_reading_result`
--
ALTER TABLE `part5_reading_result`
  ADD CONSTRAINT `part5result_part5question` FOREIGN KEY (`id_part5_question`) REFERENCES `part5_reading_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `part5result_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part7_questions`
--
ALTER TABLE `part7_questions`
  ADD CONSTRAINT `part7Question_part7_fk` FOREIGN KEY (`id_part7_reading`) REFERENCES `part7_reading` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part7_reading`
--
ALTER TABLE `part7_reading`
  ADD CONSTRAINT `part7Reading_part7Lesson_fk` FOREIGN KEY (`id_part7_lesson`) REFERENCES `part7_lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `part7_exam_fk` FOREIGN KEY (`id_exam`) REFERENCES `examination` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `part7_reading_question_explantation`
--
ALTER TABLE `part7_reading_question_explantation`
  ADD CONSTRAINT `part7ReadingQuesExp_part7ReadingQuestion_fk` FOREIGN KEY (`id_part7_reading_questions`) REFERENCES `part7_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part7_reading_question_result`
--
ALTER TABLE `part7_reading_question_result`
  ADD CONSTRAINT `part7ReadingQuesResult_part7ReadingQuestion_fk` FOREIGN KEY (`id_part7_reading_question`) REFERENCES `part7_questions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part7ReadingQuesResult_part7ReadingResult_fk` FOREIGN KEY (`id_part7_reading_result`) REFERENCES `part7_reading_result` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `part7_reading_question_translate`
--
ALTER TABLE `part7_reading_question_translate`
  ADD CONSTRAINT `part7ReadingQuesTranslate_part7Reading_fk` FOREIGN KEY (`id_part7_reading`) REFERENCES `part7_reading` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part7_reading_result`
--
ALTER TABLE `part7_reading_result`
  ADD CONSTRAINT `part7ReadingResult_part7Reading_fk` FOREIGN KEY (`id_part7_reading`) REFERENCES `part7_reading` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `part7_result_fk` FOREIGN KEY (`id_result`) REFERENCES `results` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `exam_result_fk` FOREIGN KEY (`id_exam`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_result_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roleuser`
--
ALTER TABLE `roleuser`
  ADD CONSTRAINT `roleId_roleUserId_fk` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userId__roleUserId_fk` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vocabularycontent`
--
ALTER TABLE `vocabularycontent`
  ADD CONSTRAINT `vocaContent_vocaBulary_fk` FOREIGN KEY (`idvocabulary`) REFERENCES `vocabularyline` (`idvocabulary`) ON UPDATE CASCADE;

--
-- Constraints for table `vocabulary_question`
--
ALTER TABLE `vocabulary_question`
  ADD CONSTRAINT `vocaQues_vocaContent_fk` FOREIGN KEY (`idvocabularycontent`) REFERENCES `vocabularycontent` (`idvocabularycontent`) ON UPDATE CASCADE;

--
-- Constraints for table `vocabulary_true`
--
ALTER TABLE `vocabulary_true`
  ADD CONSTRAINT `vocaContent_vocaTrue_fk` FOREIGN KEY (`idvocabularycontent`) REFERENCES `vocabularycontent` (`idvocabularycontent`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;