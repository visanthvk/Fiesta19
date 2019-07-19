-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 19, 2019 at 09:23 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fiesta19`
--

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
CREATE TABLE IF NOT EXISTS `colleges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
CREATE TABLE IF NOT EXISTS `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `config` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `config`, `value`, `created_at`, `updated_at`) VALUES
(1, 'registration_open', 1, NULL, '2019-01-02 12:18:28'),
(2, 'offline_link', 0, NULL, '2018-02-26 04:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `confirmations`
--

DROP TABLE IF EXISTS `confirmations`;
CREATE TABLE IF NOT EXISTS `confirmations` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ack','nack') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `confirmations`
--

INSERT INTO `confirmations` (`id`, `message`, `file_name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(658, NULL, NULL, NULL, 1216, '2019-01-03 22:51:39', '2019-01-03 22:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CIVIL', '2018-02-19 11:05:34', '2018-02-19 11:05:35'),
(2, 'EEE', '2018-02-19 11:05:53', '2018-02-19 11:05:54'),
(3, 'ECE', '2018-02-19 11:06:04', '2018-02-19 11:06:02'),
(4, 'CSE', '2018-02-19 11:06:18', '2018-02-19 11:06:07'),
(5, 'MECH', '2018-02-19 11:06:26', '2018-02-19 11:06:28'),
(6, 'IT', '2018-02-19 11:06:36', '2018-02-19 11:06:37'),
(7, 'BIO-TECH', '2018-02-19 11:06:46', '2018-02-19 11:06:46'),
(8, 'MBA', '2018-02-19 11:06:55', '2018-02-19 11:06:56'),
(9, 'MCA', '2018-02-19 11:07:07', '2018-02-19 11:07:05'),
(10, 'ME COMMUNICATION SYSTEM', '2018-02-19 11:10:08', '2018-02-19 11:10:08'),
(11, 'ME CSE', '2018-02-19 11:10:44', '2018-02-19 11:10:45'),
(12, 'ME SE', '2018-02-19 11:10:59', '2018-02-19 11:11:00'),
(13, 'ME ISE', '2018-02-19 11:11:10', '2018-02-19 11:11:10'),
(14, 'ME PED', '2018-02-19 11:11:23', '2018-02-19 11:11:25'),
(15, 'ME BIO-TECH', '2018-02-19 11:11:40', '2018-02-19 11:11:42'),
(16, 'ME VLSI', '2018-02-19 11:11:52', '2018-02-19 11:11:52'),
(17, 'MTECH IT', '2018-02-19 11:12:21', '2018-02-19 11:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_incharge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `min_members` int(11) NOT NULL,
  `max_members` int(11) NOT NULL,
  `max_limit` int(11) NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_gender_mixing` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_prize` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `image_name`, `rules`, `venue`, `staff_incharge`, `event_date`, `start_time`, `end_time`, `min_members`, `max_members`, `max_limit`, `contact_email`, `allow_gender_mixing`, `created_at`, `updated_at`, `show_prize`) VALUES
(1, 'DIVIDE & CONQUER', 'LITERARY-TEAM EVENT', 'dc.jpg', 'Team members:5!\r\nRegistration based on first come first serve basis.!\r\nOnly 20 teams can register.!   \r\nNo change of Team members is permitted once the registration is closed.!\r\nMaximum of 10 teams will be selected from prelims.!\r\nMultiple tasks will be given for participants in each team separately.!\r\nJury decision is final.!\r\n\r\nSubmit registration forms to Mr.R.Naganathan. Assistant Professor,English Department.', 'AJ 20 & AJ 21 (Main block – II Floor class room)', 'Mr.R.Naganathan.,AP(English  dept.)', '2019-02-02', '13:30:00', '15:30:00', 1, 5, 100, 'readers.mepco@gmail.com', 0, '2018-02-19 03:14:26', '2019-01-10 02:58:11', 0),
(2, 'YOGA', 'Yoga', 'yoga.jpg', 'Maximum time of 10 minutes per Participant.!\r\nEach candidate is to perform one bending ,one stretching followed  by one twisting and extra two \r\nasanas of their own.! \r\nAspects such as Rhythm, Posture, Complication, Flexibility is taken under consideration.!\r\nJury decision is final.!\r\n\r\nSubmit registrations forms to Mrs.A.M.K.Saliha Banu , Physical directress.', 'Civil seminar Hall', 'Mrs.A.M.K.Saliha Banu , Physical directress.', '2019-02-02', '09:00:00', '10:30:00', 1, 1, 30, 'shyam@root.com', 0, '2018-02-19 03:35:39', '2019-01-10 02:59:58', 0),
(3, 'TAMIL POTPOURI', 'Tamil Literary Event', 'kavithidal.jpg', 'Each team should have 5 participants.!\r\nMultiple events like extempore dumb-c, creative writing, debate will be conducted.! \r\nPrelims will be conducted for each team.!\r\nJury decision is final.!\r\nSubmit your forms to Mr.G.Manoj Kumar, Assistant Professor,Department of Mechanical Engineering', 'AJ 11, AJ 18, AJ 19 (Main block Class rooms) – I Floor', 'Mr.G.Manoj Kumar, AP/Mech', '2019-02-02', '13:30:00', '15:30:00', 1, 5, 30, 'shyam@root.com', 1, '2018-02-19 03:41:20', '2019-01-10 03:09:19', 0),
(4, 'RADIO MIRCHI', 'Are you a Radio Jockey?', 'radio.jpg', 'Time Duration: Maximum of 6 minutes.! \r\nNo recorded voice should be used.!\r\nActions or acting on stage is not acceptable.!   \r\nMaximum of 6 members per Team.!\r\nOnly voice of participants will be considered.!\r\nJury decision is final.!\r\nSubmit registration forms to Mr.G.Suresh,Assistant Professor,English Department', 'ECE Seminar Hall', 'Mr.G.Suresh AP/English', '2019-02-02', '09:00:00', '12:00:00', 1, 6, 60, 'shyam@root.com', 0, '2018-02-19 03:46:07', '2019-01-10 03:11:49', 0),
(5, 'Quizzard of Oz', 'Quizzers Ahoy!!', 'quiz.jpg', 'Only two members per team are allowed.!\r\nQuizmaster\'s decision will be the final.!\r\nGeneral quiz covering all genres.! \r\n40 questions for prelims.!\r\n6 teams qualify for finals.!\r\nThe final thrill to unfold in 4 rounds.!\r\n\r\nSubmit your forms to Dr.M.Usha,Senior Assistant Professor,Department of Mathematics.', 'AJ 21 (Main block – II Floor class room) AJ 11 (Main block – I Floor class room)', 'Dr.M.Usha Sr.AP/Maths', '2019-02-02', '09:00:00', '12:00:00', 1, 2, 50, 'shyam@root.com', 0, '2018-02-19 03:50:42', '2019-01-10 03:13:25', 0),
(7, 'Pencil Sketching', 'Sharpen your pencils and your imagination!!', 'pencil.jpg', 'Time limit 1 hour.!\r\nParticipants should bring their own materials.!\r\nTopics will be given on the spot. !\r\n\r\nSubmit registration forms to Mr.C.Utharanarayan,Assistant Professor,Department of Mechanical Engineering.', 'AJ 10 (Main block – I Floor class room)', 'Mr.C.Utharanarayan, AP/Mech', '2019-02-02', '14:00:00', '15:00:00', 1, 1, 35, 'shyam@root.com', 0, '2018-02-19 03:53:41', '2019-01-10 03:14:49', 0),
(8, 'TREASURE HUNT', 'Unlock the clue and find the treasure', 'th.jpg', 'Team members:5.!\r\nRegistration based on first come first serve basis.!\r\nOnly 30 teams can register.! \r\nBoys -15 teams (maximum), Girls-15 teams (maximum).!\r\nNo change of Team members is permitted once the registration is closed.!\r\n15 teams will be selected from prelims.!\r\nJudgment based on the timing taken for finding the treasure (total 2.30 hrs).!\r\nPrelims score will be considered finally if it ends in a Tie.!\r\nParticipants should report to the venue 30 minutes prior to the scheduled time to collect their prelims sheet.!\r\nJury decision is final.!\r\n\r\nSubmit registration forms to Mr.J.Senthil Kumar,Assistant Professor,Department of Electronics and Communication Engineering.', 'Prelims – AJ28, AJ29 (Main Block – II Floor) & Finals - In front of AJ Block.', 'Mr.J.Senthil Kumar., AP ECE Dept.', '2019-02-02', '09:15:00', '12:00:00', 5, 5, 150, 'clubofinnovaters@gmail.com', 1, '2018-02-19 03:57:22', '2019-01-10 03:16:37', 0),
(9, 'MONSTER’S MUSS', 'Fun with Words', 'monster.jpg', 'Each team should have two students.!\r\nPrelims may be conducted if the number of teams exceeds EIGHT.! \r\nIndiscipline in any form will lead to the disqualification of the team.! \r\nStationary items like pen and pencil has to be brought by the participants.!\r\nElectrical/ External sources should not be used during the event.!\r\nJury’s verdict is final.!\r\n\r\nSubmit registration forms to Ms.K.R.Athista,Assistant Professor,English Department.', 'Civil seminar Hall', 'Ms.K.R.Athista-AP/English', '2019-02-02', '13:30:00', '15:30:00', 1, 2, 16, 'shyam@root.com', 0, '2018-02-19 03:57:25', '2019-01-10 03:18:36', 0),
(10, 'ENGLISH POTPURI', 'War wih Words!!', 'dumpc.jpg', 'Each team should have 4-5 participants.!\r\n	The events include multiple tasks which have to be performed by the teams within 2 hours.!  \r\n	Teams can divide themselves for various tasks.!\r\n	1st task will be dumb-c. The clues will be !\r\na) English movies\r\nb) English novels\r\nc) Products (any commercial product)!\r\nThe participants have to find all the 3. The clues shouldn’t involve splitting a single word into halves. If this is done- that answer will not be considered.!\r\nThose who find all the 3 words in minimum time and using minimum clues will be awarded with high score.!\r\nThe remaining members of the team will have to attend the written event.!\r\nThis includes!	\r\na) Rearrange the jumbled word (words from dictionary)\r\n      b) Sudoku\r\n       c) Cross word\r\n       d) Minimalist posters of films\r\n        e) Find the words from the given suffix (words from the dictionary)!\r\n	In this written task the best scores will be considered.\r\n\r\nSubmit registration forms to Mrs.M.Sarparajee, Assistant Professor,English Department.', 'AJ 18, AJ 19 (Main block Class rooms) – I Floor', 'Mrs.M.Sarparajee, AP/ENG', '2019-02-02', '09:00:00', '12:00:00', 4, 5, 50, 'shyam@root.com', 0, '2018-02-19 04:01:28', '2019-01-10 03:20:24', 0),
(11, 'BEST MANAGER', 'Be diplomatic and tackle the situations', 'bm.jpg', 'Prelims:!\r\n1.Individual event. !  \r\n2.This event comprises of 2 rounds (written test, mock interview).!\r\n3.Language for communication is strictly English.!\r\n4.Selected participants will get to the next round.!\r\n\r\nFinal Round (On stage):!\r\n1.Total of 3 rounds (individual task, multitasking, situation handling).!\r\n2.Language for communication is strictly English.!\r\n3.Each round participant\'s gets filtered based on their performance.!\r\n4.Jury decision is final.\r\n\r\nSubmit registration forms to Dr.P.Vallinayagam,Professor,Chemistry Department.', 'AJ 10', 'Dr.P.Vallinayagam/Chem', '2019-02-02', '09:00:00', '10:30:00', 1, 1, 20, 'ccmepco@gmail.com', 0, '2018-02-19 04:02:51', '2019-01-10 03:23:47', 0),
(12, 'DRAMATIX', 'Prove your acting skills in this purest form of Art', 'dramatics.jpg', 'Time duration: 8 minutes.!   \r\n	Team should consist of maximum 10 participants.!  \r\n	Participants can use either audio track in MP3 format or Oral delivery.!	 \r\n        Reporting time 1 PM.!\r\n	No participation of boys and girls together.!\r\n	Whistle, Teasing, Vulgarity in Songs, Dialogues, Costumes or any sorts will lead to disqualification.!\r\n	Judgement will be based on Acting, Concept, Stage presence, Audio,Costume ,etc.!\r\n        Participants must bring their own materials.!\r\n	Jury decision is final.!\r\n	Maximum of 20 teams who complete registration, corrected audio track submission on or before 28.01.19 by 5 pm based on first come first serve basis.! \r\n\r\nSubmit Registration forms to  Mr.M.Jawahar,Assistant Professor,Department of Electrical and Electronics Engineering.!	\r\nSubmit tracks to the mail !\r\nE-Mail: skitmime.fiesta19@gmail.com', 'MCC (Main Auditorium)', 'Mr.M.Jawahar AP/EEE', '2019-02-02', '13:00:00', '15:30:00', 6, 10, 200, 'shyam@root.com', 0, '2018-02-19 04:06:03', '2019-01-10 04:46:50', 0),
(13, 'SOLO SINGING', 'Become the VOICE of MEPCO', 'ss.jpg', 'Time duration: 3 minutes.!\r\nOnly Karaoke is allowed.! \r\nVulgarity in any sorts is strictly prohibited.! \r\nReporting time 8.45 AM.!\r\nJudgement will be based on Shruthi, Voice Clarity, Song selection and Tempo.!\r\nJury decision is final.!\r\n\r\nSubmit  registration forms to Mr.A.Haamidh Assistant Professor,Department of Civil Engineering.!\r\nSubmit your tracks to the student organiser !\r\nBoys - Mr.R.Hariharan IV Mech A !\r\nGirls - Ms.U.Pooja III CSE B', 'Mechanical Seminar Hall', 'Mr.A.Haamidh Asst. Professor/Civil', '2019-02-02', '09:00:00', '10:30:00', 1, 1, 40, 'shyam@root.com', 0, '2018-02-19 04:07:22', '2019-01-10 04:47:55', 0),
(14, 'GROUP DANCE', 'Cultural Group Event', 'solodance.jpg', 'No of members: Minimum 6 to Maximum 12.!     \r\n	Time Duration: 5minutes.!      \r\n	Concepts or themes can be used without affecting the dance portion.! \r\n	Whistle, Vulgarity in Songs, Moves, Costumes or any sorts will lead to disqualification.!\r\n	Reporting time 9:45 AM.!\r\n	Using of dangerous properties is prohibited.!\r\n	No participation of boys and girls together.!\r\n	Audio track must be in mp3 format.!\r\n	Jury decision is final.!\r\n	Last Date for Track submission in MP3 format is 28-01-2019.!\r\n        Maximum of 20 teams who complete registration, corrected audio track submission on or before 28.01.19 by 5 pm based on first come first served basis.!\r\n        If necessary PRELIMS  will be conducted!\r\n\r\nSubmit Registration forms to\r\nMs.J.Monish Privthy Jeba,Assistant Professor,Department of Computer Science Engineering.!\r\nSubmit tracks to the mail !\r\nE-Mail: groupdance.fiesta19@gmail.com', 'MCC (Main Auditorium)', 'Ms.J.Monisha Privthy Jeba, AP/CSE', '2019-02-02', '10:30:00', '12:00:00', 6, 12, 240, 'shyam@root.com', 0, '2018-02-19 04:10:43', '2019-01-10 04:58:57', 0),
(15, 'SOLO INSTRUMENTAL', 'Twiddle the rythms', 'si.jpg', 'Time duration: 3 minutes.!\r\nAny kind of Instruments(Percussion & Non Percussion) can be played! \r\nReporting time  10:00 AM! \r\nJury decision is final.!\r\n\r\nSubmit registration forms to Mr.F.Winfred Sashikanth,Senior Professor,Department of Physics.', 'Mechanical Seminar Hall', 'Mr.F.Winfred Sashikanth,Sr.Professor/Physics.', '2019-02-02', '10:30:00', '12:00:00', 1, 1, 30, 'shyam@root.com', 0, '2018-02-19 04:12:10', '2019-01-10 03:41:09', 0),
(16, 'SOLO DANCE', 'Foot Loose!!', 'vibe.jpg', 'Time Duration: 3 minutes.! \r\n	Audio track must be in mp3 format.!     \r\n        Whistle, Vulgarity in Songs, Moves, Costumes or any sorts will lead to disqualification.\r\n	Reporting time 8:45 AM.!\r\n	Any kind of dance may be performed like classical, Free style or Folk.!\r\n	Jury decision is final.!\r\n        Last Date for Track submission in MP3 format is 28-01-2019.!\r\n	Maximum of 20 participants who complete registration, corrected audio track submission on or before 28.01.19 by 5 pm based on first come first basis.!\r\n        Prelims wll be conducted if necessary.!\r\n\r\n\r\nSubmit Registration forms to Mr.B.Venkatraman Assistant Professor,Department of Mechanical Engineering.!\r\nSubmit tracks to the mail!\r\nE-Mail: solodance.fiesta19@gmail.com', 'MCC (Main Auditorium)', 'Mr.B.Venkatraman,AP/MECH', '2019-02-02', '09:00:00', '10:30:00', 1, 1, 20, 'shyam@root.com', 0, '2018-02-19 04:14:46', '2019-01-10 04:09:20', 0),
(17, 'Pixie', 'Calling all Shutterbugs!!\r\nTheme-Low Light Photography', 'pixie.jpg', 'THEME – Low Light Photography.! \r\nStick to the theme.! \r\nPhotos downloaded from internet or edited photos, will be disqualified.!\r\nColour correction is allowed but avoid surrealism.!\r\nBest Photos will be short-listed from the entries and will be displayed on the pixie board.!\r\nVoting will be undertaken.!\r\n\r\nSubmit your photos through mail to      \r\nphotoclub4u@gmail.com before January 31.', 'In front of MCC', 'Mr.F.Winfred Shashikanth., Sr.AP Physics dept.', '2019-02-02', '08:30:00', '15:30:00', 1, 1, 100, 'shyam@root.com', 1, '2018-02-20 04:43:38', '2019-01-10 03:46:14', 0),
(18, 'As You Like  It (Open Mic)', 'Individual Event to show your talents', 'open mic.jpg', 'Individual Event. ! \r\nCan exhibit any talent like Mono Act, Mimicry, \r\n   Juggling, Martial Art, Beat Box, Etc.,  !\r\nSinging and Dancing - NOT ALLOWED !\r\nTime Duration: 3 minutes !\r\nParticipants should bring the necessary items.!\r\nAudio track should be in MP3 format. !\r\nVulgarity in any form is strictly prohibited.!\r\nJury decision is final.!\r\nPrelims will be conducted if necessary.!\r\n\r\nSubmit registration forms to Dr.C.Gangalakshmi,Senior Assistant Professor,English Department.', 'Mechanical Seminar Hall', 'Dr.C.Gangalakshmi, Sr. AP/ENGL', '2019-02-02', '14:30:00', '15:30:00', 1, 1, 20, 'shyam@root.com', 0, '2019-01-09 22:20:25', '2019-01-10 04:07:29', 0),
(19, 'Lyrical Hunt', 'Test your skills with MUSIC', 'lyrical magic.jpg', 'It is the game of lyrics in Tamil cinema.!\r\nA team should contain 3 persons.!\r\nThere will be a prelims followed by the main round.!\r\nThe lyrics of a Tamil movie song will be displayed, the participants should find what movie and what song it is.!\r\nEach question contains a time limit of 1 min.!\r\n\r\nSubmit registration forms to Dr.K.Sasirekha ,Assistant Professor,English Department.', 'Mechanical Seminar Hall', 'Dr.K.Sasirekha AP/English', '2019-02-02', '15:30:00', '16:30:00', 1, 3, 60, 'shyam@root.com', 1, '2019-01-10 01:18:36', '2019-01-10 03:51:24', 0),
(20, 'Poster Making', 'Design your Thoughts', 'poster making.jpg', 'Two per team.!\r\n\"ON SPOT TOPIC \"!\r\nYou will get 90 mins to work on your poster.!\r\nBoth paper based and digital graphics are allowed.!\r\nPoster should be made in A3 size.!\r\nFor paper based participants should bring A3 sheets and all other necessary items.!\r\nFor digital graphics participants must bring their laptops with necessary software installed.!\r\nJury decision is final.!\r\n\r\nSubmit registration forms to Mr.F.Winfred Shashikanth ,Assistant Professor (Sr.Grade),Department of Physics.', 'AJ 10', 'Mr. F. Winfred Shashikanth ,Assistant Professor (Sr.Grade)', '2019-02-02', '10:30:00', '12:30:00', 1, 2, 40, 'shyam@root.com', 0, '2019-01-10 04:36:03', '2019-01-10 04:37:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_07_13_110635_create_events_table', 1),
(2, '2017_07_13_160324_create_users_table', 1),
(3, '2017_07_16_144412_create_teams_table', 1),
(4, '2017_07_16_144423_create_team_members_table', 1),
(5, '2017_07_16_163143_create_registrations_table', 1),
(6, '2017_07_19_115848_create_colleges_table', 1),
(7, '2017_07_20_034144_create_confirmations_table', 1),
(8, '2017_07_27_033109_create_roles_table', 1),
(9, '2017_07_27_033321_create_role_user_table', 1),
(10, '2017_08_03_170137_create_rejections_table', 1),
(11, '2017_08_07_070113_create_configs_table', 1),
(12, '2017_08_10_054620_add_gender_mixing_to_events', 1),
(13, '2017_08_30_112856_create_organizings_table', 1),
(14, '2017_09_06_053610_create_prizes_table', 1),
(15, '2017_09_07_081440_add_present_to_users', 1),
(16, '2017_09_07_102005_add_show_prizes_to_events', 1),
(17, '2018_02_18_062557_create_Departments_table', 1),
(18, '2018_02_18_063226_create_sections_table', 1),
(19, '2018_02_18_063253_create_years_table', 1),
(20, '2018_02_22_095857_create_password_resets_table', 2),
(21, '2018_03_01_091122_create_votes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `organizings`
--

DROP TABLE IF EXISTS `organizings`;
CREATE TABLE IF NOT EXISTS `organizings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizings`
--

INSERT INTO `organizings` (`id`, `event_id`, `user_id`) VALUES
(70, 6, 1),
(155, 1, 1),
(156, 2, 1),
(159, 3, 1),
(161, 4, 1),
(162, 5, 1),
(163, 7, 1),
(164, 8, 1),
(165, 9, 1),
(166, 10, 1),
(167, 11, 1),
(172, 15, 1),
(174, 17, 1),
(176, 19, 1),
(181, 18, 1),
(182, 16, 1),
(184, 20, 1),
(185, 12, 1),
(186, 13, 1),
(187, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('visanth26@gmail.com', '$2y$10$G2Il9rIKy5tKtReBhySJAuFuF2I47L9ifjM3jz4DeSh4fsO8RNjVC', '2019-07-19 02:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
CREATE TABLE IF NOT EXISTS `prizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `prize` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE IF NOT EXISTS `registrations` (
  `event_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `registration_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`event_id`, `registration_id`, `registration_type`) VALUES
(11, 1214, 'App\\User'),
(1, 260, 'App\\Team'),
(2, 1216, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `rejections`
--

DROP TABLE IF EXISTS `rejections`;
CREATE TABLE IF NOT EXISTS `rejections` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'root'),
(2, 'hospitality'),
(3, 'developer'),
(4, 'organizer'),
(5, 'registration'),
(6, 'pixie');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(1, 1217);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'A', '2018-02-19 11:13:20', '2018-02-19 11:13:40'),
(2, 'B', '2018-02-19 11:13:42', '2018-02-19 11:13:42'),
(3, 'C', '2018-02-19 11:13:43', '2018-02-19 11:13:43'),
(4, 'D', '2018-02-19 11:13:45', '2018-02-19 11:13:45'),
(5, 'E', '2018-02-19 11:13:46', '2018-02-19 11:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `roll_no` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `department` varchar(10) NOT NULL,
  `year` int(11) NOT NULL,
  `section` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`roll_no`, `name`, `email`, `gender`, `department`, `year`, `section`) VALUES
('16bcs068', 'Hari', 'harivenkat@gmail.com', 'Male', 'CSE', 4, 'B'),
('16bcs068', 'Hari', 'harivenkat@gmail.com', 'Male', 'CSE', 4, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(260, 'Rangerss', 1216, '2019-01-03 22:49:50', '2019-01-03 22:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
CREATE TABLE IF NOT EXISTS `team_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `user_id`, `created_at`, `updated_at`) VALUES
(864, 260, 1214, '2019-01-03 22:49:50', '2019-01-03 22:49:50'),
(865, 260, 1215, '2019-01-03 22:49:50', '2019-01-03 22:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `type` enum('student','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `present` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `roll_no`, `email`, `password`, `gender`, `department_id`, `year_id`, `section_id`, `type`, `remember_token`, `created_at`, `updated_at`, `present`) VALUES
(1, 'Root User', 'admin', 'Shyam@root.com', '$2y$10$jFAC75Lr2vlxifQYzxpyqO41T7UxBN8VJnOGeLNazGgTBCVVNcvEi', NULL, NULL, NULL, NULL, 'admin', 'dFGVHBdHN2zCOLHVE4uXKPiRkgx1daF5mwKjKxWXAknAKnPrq1HtMDwGz17k', NULL, NULL, 0),
(1214, 'shyam', '12462', 'shyamoffical@gmail.com', '$2y$10$vUev.Vv5wqWwYkB45W6YSOLW.agGcTffGskx63a/eC1zgCagWGr4.', 'male', 4, 4, 1, 'student', 'EagnIlQ2h1c8mBs49rlatnKerIvS0ieHIk5Ns2nYAo0EShiO3mcIt9lJR4V8', '2019-01-02 12:28:58', '2019-01-02 12:28:58', 0),
(1215, 'bala', '12465', 'shyampersonnel@gmail.com', '$2y$10$SJ918CHBE.JNR5sLoapqaOG0Wb.6xCpzLXlX3MtUuX.syVe8SMrM6', 'male', 4, 4, 2, 'student', 'KaXEBZIdR7pVku3aN87jrdsucfWTotd7GW55HjdQPTjxh7pQhqzDTFHeW4PP', '2019-01-02 12:29:39', '2019-01-02 12:29:39', 0),
(1216, 'arunbalabharathy', '12469', 'arunbala@gmail.com', '$2y$10$zUoKmLOpFD78r/59Iz4LJ.bquvoo6Lyeq51WQX7/YAgp5BQhd0Zr.', 'male', 1, 3, 3, 'student', '6ta8dc1jZGrLqoVrBqeNrdtVyYR8hX166wsb4TYdEXr8s5O9SVeHzgZyp7lK', '2019-01-03 22:48:39', '2019-01-03 22:48:39', 0),
(1217, 'Hari', NULL, 'hari@root.com', '$2y$10$Fjq5P6tgiQ0y1qywv16oPeyLaUo7/Aqyipwyms8c7JgCdJnrGChqy', NULL, NULL, NULL, NULL, 'admin', 'L0Yt7s6kNGgHO4UfU1xGLsoXmkHIl6BqgAbakXQCKccxn85d58IPF9wRi0XB', '2019-01-09 19:23:05', '2019-01-09 19:23:05', 0),
(1218, 'Hariharan R', '15bme018', 'rkvs.hari97@gmail.com', '$2y$10$MDsm1TqXQl6o81SFOkXmfOHa2o1zzEQcMB1E2g2el.FpbL0jcWnxu', 'male', 5, 4, 1, 'student', 'L7tezHKZNXRgvmA5lPAdbFwpZi0aBYkyWNtAKDmZOocMVwGDDHxKv5MoKNW3', '2019-01-10 02:36:09', '2019-01-10 02:36:09', 0),
(1219, 'arun', '1615468', 'arun@gmail.com', '$2y$10$hGjRnYjpiziz3Ek8pHn6T.kGnp03jkyD9CjMZwaSZ00o9x4e0OV66', 'male', 1, 1, 1, 'student', 'OLabzcxo2Yqf6zCe6ZjrWBHzyEf4CSbBiG5dcL7BuLXHz9NEwgYqY1Cxnmvr', '2019-01-10 02:38:58', '2019-01-10 02:38:58', 0),
(1220, 'aravind', '12478', 'aravind@gmail.com', '$2y$10$XSMHiwcZfKVGTMKKUzeJjuomffsIBWkh..xLTwZLZWQ0cB3Sfogwe', 'male', 1, 1, 1, 'student', NULL, '2019-01-10 02:39:36', '2019-01-10 02:39:36', 0),
(1221, 'shri ram', '16bcs121', 'shri@gmail.com', '$2y$10$sWdj8k.RhfNTCpNh8mgoS.EAK/6YYIIqQ1JKdAD7vZpXv45T0VBo.', 'male', 1, 1, 1, 'student', NULL, '2019-07-17 00:28:01', '2019-07-17 00:28:01', 0),
(1222, 'Visanth', '16bcs081', 'visanth26@gmail.com', '$2y$10$.FGnsObUki2b7AFbZtcRxe66hSPu1WaWF220cuuXS.YzEMnQrnjTq', 'male', 1, 1, 1, 'student', 'hyoAu9n7sefToauOTKWBUG0Csct7eqeBRREtTYcYO8GjyEGNfUI42NKPvzfi', '2019-07-17 00:32:23', '2019-07-17 00:32:23', 0),
(1223, '12345', '12345', '14bcsa@gmail.com', '$2y$10$5pVI.fSglUHrpDW9MehJaucmgzbN1V3Ctbe.Lt4yksqZOs81trFqG', 'male', 1, 2, 1, 'student', NULL, '2019-07-19 00:51:21', '2019-07-19 00:51:21', 0),
(1224, '12345', '123456', '14bca@gmail.com', '$2y$10$unVX2DGV3uStmrWMcbjtIOx9lxj6U1P27/4epfNcYIWrU7wJwhd32', 'male', 1, 2, 1, 'student', NULL, '2019-07-19 00:54:37', '2019-07-19 00:54:37', 0),
(1225, 'dfasdf', 'asdasd', '14cs@gmail.com', '$2y$10$weO55iWyQGSwggvcn1VH8OgPS3nyCi8MfLqC9Mh9awzOR4bib.3fW', 'male', 1, 2, 1, 'student', '34QB5LOR5YF2AeUjWXnHYU0SxHOU3sW0BhotCLDV9hyF2eutcisbGpEC4jds', '2019-07-19 02:33:31', '2019-07-19 02:33:31', 0),
(1226, 'Visanth', '16bcs81', 'asdas@ASd.com', '$2y$10$6CN05AsWOT7gBRuuLMvRveHyzk11SST2Uh/Ewiopi5EC5eqDcdq42', 'male', 4, 3, 3, 'student', NULL, '2019-07-19 03:19:27', '2019-07-19 03:19:27', 0),
(1227, 'Hari', '16bcs068', 'harivenkat@gmail.com', '$2y$10$8mK2/VUSjgLcoSYZCWvE/eONcfFQLXufeupWlunMA.NJLjfKjOKNW', 'male', 4, 4, 2, 'student', 'uZ8YtQTGvH1ZCAYmuoXHpBjlfpvF4bSE4SRSbCc2HbKxiE8BmzbO30WdDrkW', '2019-07-19 03:51:05', '2019-07-19 03:51:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `roll_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`roll_no`, `photo_id`, `created_at`, `updated_at`) VALUES
('08phyes001', '19', '2018-03-03 00:30:42', '2018-03-03 00:30:42'),
('1', '1', '2018-03-02 05:08:29', '2018-03-02 05:08:29'),
('11297', '13', '2018-03-03 00:21:21', '2018-03-03 00:21:21'),
('11450', '8', '2018-03-03 01:44:50', '2018-03-03 01:44:50'),
('11451', '2', '2018-03-02 23:34:14', '2018-03-02 23:34:14'),
('11452', '2', '2018-03-02 23:13:41', '2018-03-02 23:13:41'),
('11454', '12', '2018-03-02 22:44:52', '2018-03-02 22:44:52'),
('11455', '12', '2018-03-02 23:43:17', '2018-03-02 23:43:17'),
('11457', '19', '2018-03-03 02:06:33', '2018-03-03 02:06:33'),
('11460', '17', '2018-03-03 01:11:08', '2018-03-03 01:11:08'),
('11476', '8', '2018-03-03 01:58:39', '2018-03-03 01:58:39'),
('11480', '8', '2018-03-03 01:58:16', '2018-03-03 01:58:16'),
('11482', '17', '2018-03-03 01:13:56', '2018-03-03 01:13:56'),
('11484', '12', '2018-03-03 02:07:36', '2018-03-03 02:07:36'),
('11491', '2', '2018-03-03 01:42:41', '2018-03-03 01:42:41'),
('11499', '19', '2018-03-03 02:07:47', '2018-03-03 02:07:47'),
('11501', '17', '2018-03-03 01:10:37', '2018-03-03 01:10:37'),
('11502', '2', '2018-03-03 01:36:44', '2018-03-03 01:36:44'),
('11507', '13', '2018-03-03 00:18:32', '2018-03-03 00:18:32'),
('11510', '13', '2018-03-03 00:18:26', '2018-03-03 00:18:26'),
('11515', '2', '2018-03-03 01:59:01', '2018-03-03 01:59:01'),
('11518', '13', '2018-03-03 01:31:50', '2018-03-03 01:31:50'),
('11520', '13', '2018-03-03 01:30:40', '2018-03-03 01:30:40'),
('11522', '8', '2018-03-03 00:32:18', '2018-03-03 00:32:18'),
('11523', '17', '2018-03-03 01:13:07', '2018-03-03 01:13:07'),
('11527', '13', '2018-03-03 01:21:35', '2018-03-03 01:21:35'),
('11532', '5', '2018-03-03 01:10:36', '2018-03-03 01:10:36'),
('11537', '2', '2018-03-03 01:48:12', '2018-03-03 01:48:12'),
('11546', '2', '2018-03-03 01:48:18', '2018-03-03 01:48:18'),
('11552', '12', '2018-03-03 01:37:01', '2018-03-03 01:37:01'),
('11553', '2', '2018-03-02 23:37:20', '2018-03-02 23:37:20'),
('11556', '8', '2018-03-03 01:44:30', '2018-03-03 01:44:30'),
('11558', '7', '2018-03-03 01:52:50', '2018-03-03 01:52:50'),
('11567', '1', '2018-03-03 02:00:51', '2018-03-03 02:00:51'),
('11569', '13', '2018-03-03 01:33:44', '2018-03-03 01:33:44'),
('11570', '8', '2018-03-02 23:13:00', '2018-03-02 23:13:00'),
('11574', '2', '2018-03-03 01:58:56', '2018-03-03 01:58:56'),
('11575', '8', '2018-03-03 01:57:33', '2018-03-03 01:57:33'),
('11577', '13', '2018-03-03 01:26:57', '2018-03-03 01:26:57'),
('11581', '8', '2018-03-03 01:43:33', '2018-03-03 01:43:33'),
('11583', '13', '2018-03-03 01:34:00', '2018-03-03 01:34:00'),
('11584', '19', '2018-03-03 02:07:53', '2018-03-03 02:07:53'),
('11589', '8', '2018-03-03 01:46:26', '2018-03-03 01:46:26'),
('11597', '19', '2018-03-03 02:09:28', '2018-03-03 02:09:28'),
('11599', '13', '2018-03-03 01:32:16', '2018-03-03 01:32:16'),
('116\\', '20', '2018-03-02 23:18:08', '2018-03-02 23:18:08'),
('11607', '12', '2018-03-03 01:59:18', '2018-03-03 01:59:18'),
('11608', '13', '2018-03-03 01:39:48', '2018-03-03 01:39:48'),
('11610', '6', '2018-03-02 23:14:01', '2018-03-02 23:14:01'),
('11616', '1', '2018-03-03 02:00:14', '2018-03-03 02:00:14'),
('11618', '8', '2018-03-03 01:45:21', '2018-03-03 01:45:21'),
('11624', '13', '2018-03-03 00:19:56', '2018-03-03 00:19:56'),
('11626', '13', '2018-03-02 23:38:48', '2018-03-02 23:38:48'),
('11627', '13', '2018-03-03 00:18:38', '2018-03-03 00:18:38'),
('11632', '16', '2018-03-03 01:51:18', '2018-03-03 01:51:18'),
('11636', '12', '2018-03-03 01:44:38', '2018-03-03 01:44:38'),
('11639', '7', '2018-03-03 01:37:32', '2018-03-03 01:37:32'),
('11640', '8', '2018-03-03 01:57:39', '2018-03-03 01:57:39'),
('11641', '2', '2018-03-03 02:04:39', '2018-03-03 02:04:39'),
('11648', '5', '2018-03-02 23:12:14', '2018-03-02 23:12:14'),
('11650', '12', '2018-03-03 00:31:55', '2018-03-03 00:31:55'),
('11652', '2', '2018-03-03 01:35:54', '2018-03-03 01:35:54'),
('11660', '8', '2018-03-03 01:58:10', '2018-03-03 01:58:10'),
('11661', '13', '2018-03-03 01:32:53', '2018-03-03 01:32:53'),
('11671', '2', '2018-03-03 01:48:36', '2018-03-03 01:48:36'),
('11674', '12', '2018-03-02 23:18:25', '2018-03-02 23:18:25'),
('11680', '8', '2018-03-03 01:44:44', '2018-03-03 01:44:44'),
('11684', '8', '2018-03-03 01:58:05', '2018-03-03 01:58:05'),
('11690', '13', '2018-03-03 01:34:12', '2018-03-03 01:34:12'),
('11694', '16', '2018-03-03 01:52:59', '2018-03-03 01:52:59'),
('11695', '11', '2018-03-03 01:40:18', '2018-03-03 01:40:18'),
('11697', '13', '2018-03-03 01:32:10', '2018-03-03 01:32:10'),
('11704', '13', '2018-03-03 01:08:13', '2018-03-03 01:08:13'),
('11707', '17', '2018-03-03 01:11:38', '2018-03-03 01:11:38'),
('11708', '2', '2018-03-03 01:39:41', '2018-03-03 01:39:41'),
('11720', '13', '2018-03-03 01:33:30', '2018-03-03 01:33:30'),
('11721', '13', '2018-03-03 01:33:35', '2018-03-03 01:33:35'),
('11722', '13', '2018-03-03 01:33:39', '2018-03-03 01:33:39'),
('1173', '10', '2018-03-03 01:27:45', '2018-03-03 01:27:45'),
('11731', '13', '2018-03-02 23:35:34', '2018-03-02 23:35:34'),
('11732', '13', '2018-03-02 23:32:20', '2018-03-02 23:32:20'),
('11734', '5', '2018-03-02 23:21:47', '2018-03-02 23:21:47'),
('11736', '8', '2018-03-02 23:15:53', '2018-03-02 23:15:53'),
('11737', '13', '2018-03-03 01:08:01', '2018-03-03 01:08:01'),
('11740', '13', '2018-03-02 23:16:21', '2018-03-02 23:16:21'),
('11744', '2', '2018-03-02 23:32:45', '2018-03-02 23:32:45'),
('11747', '13', '2018-03-02 22:56:57', '2018-03-02 22:56:57'),
('11749', '12', '2018-03-03 01:42:23', '2018-03-03 01:42:23'),
('11751', '8', '2018-03-02 23:10:36', '2018-03-02 23:10:36'),
('11754', '17', '2018-03-03 01:24:03', '2018-03-03 01:24:03'),
('11756', '8', '2018-03-03 01:58:23', '2018-03-03 01:58:23'),
('11760', '2', '2018-03-03 01:49:16', '2018-03-03 01:49:16'),
('11761', '8', '2018-03-03 01:44:18', '2018-03-03 01:44:18'),
('11762', '11', '2018-03-03 01:44:01', '2018-03-03 01:44:01'),
('11764', '2', '2018-03-03 01:37:13', '2018-03-03 01:37:13'),
('11772', '13', '2018-03-03 01:32:28', '2018-03-03 01:32:28'),
('11775', '20', '2018-03-03 01:44:39', '2018-03-03 01:44:39'),
('11779', '9', '2018-03-03 02:10:21', '2018-03-03 02:10:21'),
('11786', '2', '2018-03-03 01:27:23', '2018-03-03 01:27:23'),
('11787', '8', '2018-03-03 01:45:15', '2018-03-03 01:45:15'),
('1179', '2', '2018-03-03 01:49:53', '2018-03-03 01:49:53'),
('11793', '2', '2018-03-03 01:48:23', '2018-03-03 01:48:23'),
('11798', '2', '2018-03-03 01:39:07', '2018-03-03 01:39:07'),
('11805', '2', '2018-03-03 01:39:00', '2018-03-03 01:39:00'),
('11808', '13', '2018-03-03 01:39:55', '2018-03-03 01:39:55'),
('11812', '12', '2018-03-03 02:06:00', '2018-03-03 02:06:00'),
('11820', '8', '2018-03-03 01:44:23', '2018-03-03 01:44:23'),
('11826', '12', '2018-03-03 01:23:50', '2018-03-03 01:23:50'),
('11830', '8', '2018-03-03 01:43:55', '2018-03-03 01:43:55'),
('11834', '13', '2018-03-03 01:31:42', '2018-03-03 01:31:42'),
('11836', '2', '2018-03-02 23:57:29', '2018-03-02 23:57:29'),
('11837', '13', '2018-03-02 23:16:37', '2018-03-02 23:16:37'),
('11838', '13', '2018-03-02 23:37:09', '2018-03-02 23:37:09'),
('11843', '9', '2018-03-02 23:15:30', '2018-03-02 23:15:30'),
('11857', '5', '2018-03-02 23:58:34', '2018-03-02 23:58:34'),
('11858', '20', '2018-03-02 23:58:16', '2018-03-02 23:58:16'),
('11864', '8', '2018-03-03 01:58:33', '2018-03-03 01:58:33'),
('11865', '8', '2018-03-03 01:57:26', '2018-03-03 01:57:26'),
('11867', '11', '2018-03-03 01:47:16', '2018-03-03 01:47:16'),
('11873', '8', '2018-03-03 01:27:07', '2018-03-03 01:27:07'),
('11875', '2', '2018-03-03 01:58:48', '2018-03-03 01:58:48'),
('11879', '12', '2018-03-02 23:27:22', '2018-03-02 23:27:22'),
('11880', '7', '2018-03-02 23:15:02', '2018-03-02 23:15:02'),
('11882', '13', '2018-03-03 01:31:30', '2018-03-03 01:31:30'),
('11904', '2', '2018-03-02 22:51:12', '2018-03-02 22:51:12'),
('11905', '2', '2018-03-03 01:26:37', '2018-03-03 01:26:37'),
('11906', '13', '2018-03-03 00:20:17', '2018-03-03 00:20:17'),
('11909', '13', '2018-03-03 01:30:45', '2018-03-03 01:30:45'),
('11916', '6', '2018-03-02 23:15:21', '2018-03-02 23:15:21'),
('11917', '13', '2018-03-03 01:33:13', '2018-03-03 01:33:13'),
('11919', '17', '2018-03-03 01:11:15', '2018-03-03 01:11:15'),
('11921', '2', '2018-03-03 02:04:44', '2018-03-03 02:04:44'),
('11924', '13', '2018-03-03 00:12:39', '2018-03-03 00:12:39'),
('11926', '17', '2018-03-03 01:10:52', '2018-03-03 01:10:52'),
('11927', '2', '2018-03-03 01:47:03', '2018-03-03 01:47:03'),
('11934', '13', '2018-03-03 01:33:52', '2018-03-03 01:33:52'),
('11935', '13', '2018-03-03 01:33:07', '2018-03-03 01:33:07'),
('11939', '7', '2018-03-03 01:54:02', '2018-03-03 01:54:02'),
('1194', '2', '2018-03-03 01:49:58', '2018-03-03 01:49:58'),
('11941', '05', '2018-03-03 01:18:20', '2018-03-03 01:18:20'),
('11948', '13', '2018-03-03 01:32:23', '2018-03-03 01:32:23'),
('11959', '10', '2018-03-03 01:20:36', '2018-03-03 01:20:36'),
('11961', '2', '2018-03-02 23:46:01', '2018-03-02 23:46:01'),
('11963', '8', '2018-03-03 01:25:13', '2018-03-03 01:25:13'),
('11965', '9', '2018-03-02 23:35:16', '2018-03-02 23:35:16'),
('11975', '13', '2018-03-02 23:37:02', '2018-03-02 23:37:02'),
('11978', '13', '2018-03-03 01:32:58', '2018-03-03 01:32:58'),
('11985', '5', '2018-03-03 01:10:28', '2018-03-03 01:10:28'),
('11986', '2', '2018-03-02 23:33:56', '2018-03-02 23:33:56'),
('11987', '13', '2018-03-03 01:31:55', '2018-03-03 01:31:55'),
('1199', '2', '2018-03-03 01:49:41', '2018-03-03 01:49:41'),
('11990', '2', '2018-03-02 23:37:32', '2018-03-02 23:37:32'),
('11992', '2', '2018-03-02 23:34:09', '2018-03-02 23:34:09'),
('11995', '2', '2018-03-03 01:26:47', '2018-03-03 01:26:47'),
('11996', '9', '2018-03-02 23:34:37', '2018-03-02 23:34:37'),
('12005', '10', '2018-03-03 01:55:03', '2018-03-03 01:55:03'),
('12006', '13', '2018-03-03 01:34:04', '2018-03-03 01:34:04'),
('12007', '13', '2018-03-03 01:34:08', '2018-03-03 01:34:08'),
('12008', '17', '2018-03-02 23:59:12', '2018-03-02 23:59:12'),
('12009', '19', '2018-03-03 02:06:22', '2018-03-03 02:06:22'),
('12019', '2', '2018-03-03 01:37:09', '2018-03-03 01:37:09'),
('12025', '13', '2018-03-03 01:32:49', '2018-03-03 01:32:49'),
('12029', '13', '2018-03-03 01:32:04', '2018-03-03 01:32:04'),
('1203', '2', '2018-03-03 02:07:07', '2018-03-03 02:07:07'),
('12038', '12', '2018-03-02 23:57:47', '2018-03-02 23:57:47'),
('12041', '13', '2018-03-03 00:18:44', '2018-03-03 00:18:44'),
('12042', '13', '2018-03-03 00:20:44', '2018-03-03 00:20:44'),
('12044', '13', '2018-03-03 01:28:02', '2018-03-03 01:28:02'),
('12050', '7', '2018-03-03 01:08:19', '2018-03-03 01:08:19'),
('12052', '13', '2018-03-03 00:19:27', '2018-03-03 00:19:27'),
('12055', '13', '2018-03-03 01:26:50', '2018-03-03 01:26:50'),
('12057', '17', '2018-03-03 01:12:21', '2018-03-03 01:12:21'),
('12059', '8', '2018-03-03 01:20:17', '2018-03-03 01:20:17'),
('12063', '5', '2018-03-02 23:21:38', '2018-03-02 23:21:38'),
('12064', '12', '2018-03-02 23:44:32', '2018-03-02 23:44:32'),
('12065', '13', '2018-03-03 01:33:02', '2018-03-03 01:33:02'),
('12067', '9', '2018-03-02 23:12:42', '2018-03-02 23:12:42'),
('12071', '13', '2018-03-03 00:18:49', '2018-03-03 00:18:49'),
('12075', '2', '2018-03-02 23:46:26', '2018-03-02 23:46:26'),
('12083', '5', '2018-03-02 23:57:40', '2018-03-02 23:57:40'),
('12092', '13', '2018-03-03 00:20:02', '2018-03-03 00:20:02'),
('12095', '8', '2018-03-03 01:42:31', '2018-03-03 01:42:31'),
('12103', '11', '2018-03-03 01:40:08', '2018-03-03 01:40:08'),
('12110', '8', '2018-03-03 01:25:19', '2018-03-03 01:25:19'),
('12111', '10', '2018-03-03 01:55:11', '2018-03-03 01:55:11'),
('12112', '13', '2018-03-03 01:30:32', '2018-03-03 01:30:32'),
('12117', '2', '2018-03-02 22:50:57', '2018-03-02 22:50:57'),
('12121', '13', '2018-03-03 01:33:26', '2018-03-03 01:33:26'),
('12124', '2', '2018-03-03 02:04:30', '2018-03-03 02:04:30'),
('12125', '2', '2018-03-03 01:49:35', '2018-03-03 01:49:35'),
('12126', '13', '2018-03-03 01:33:22', '2018-03-03 01:33:22'),
('12135', '13', '2018-03-03 01:33:48', '2018-03-03 01:33:48'),
('12139', '6', '2018-03-02 23:09:39', '2018-03-02 23:09:39'),
('12141', '8', '2018-03-03 01:43:18', '2018-03-03 01:43:18'),
('12144', '8', '2018-03-03 01:55:31', '2018-03-03 01:55:31'),
('12154', '2', '2018-03-03 01:50:04', '2018-03-03 01:50:04'),
('12155', '2', '2018-03-02 23:36:39', '2018-03-02 23:36:39'),
('12156', '13', '2018-03-03 01:30:53', '2018-03-03 01:30:53'),
('12158', '2', '2018-03-02 23:45:46', '2018-03-02 23:45:46'),
('12159', '2', '2018-03-03 01:17:41', '2018-03-03 01:17:41'),
('1216', '2', '2018-03-03 01:49:23', '2018-03-03 01:49:23'),
('12161', '13', '2018-03-03 01:31:36', '2018-03-03 01:31:36'),
('12164', '20', '2018-03-03 01:45:11', '2018-03-03 01:45:11'),
('1217', '7', '2018-03-03 01:27:36', '2018-03-03 01:27:36'),
('12174', '2', '2018-03-02 23:34:44', '2018-03-02 23:34:44'),
('12176', '2', '2018-03-02 23:45:01', '2018-03-02 23:45:01'),
('12182', '17', '2018-03-02 22:51:25', '2018-03-02 22:51:25'),
('12185', '17', '2018-03-03 01:11:39', '2018-03-03 01:11:39'),
('12188', '2', '2018-03-03 01:48:31', '2018-03-03 01:48:31'),
('12189', '12', '2018-03-03 01:53:54', '2018-03-03 01:53:54'),
('12191', '2', '2018-03-02 23:36:52', '2018-03-02 23:36:52'),
('12192', '2', '2018-03-02 23:36:22', '2018-03-02 23:36:22'),
('12197', '13', '2018-03-03 01:32:44', '2018-03-03 01:32:44'),
('12198', '17', '2018-03-03 01:09:46', '2018-03-03 01:09:46'),
('12201', '8', '2018-03-03 01:57:58', '2018-03-03 01:57:58'),
('12208', '12', '2018-03-03 01:11:55', '2018-03-03 01:11:55'),
('12209', '17', '2018-03-03 01:12:08', '2018-03-03 01:12:08'),
('12212', '17', '2018-03-02 22:51:59', '2018-03-02 22:51:59'),
('12217', '4', '2018-03-03 01:24:10', '2018-03-03 01:24:10'),
('12232', '2', '2018-03-03 01:09:02', '2018-03-03 01:09:02'),
('12245', '4', '2018-03-03 00:48:52', '2018-03-03 00:48:52'),
('12248', '12', '2018-03-03 02:04:22', '2018-03-03 02:04:22'),
('12251', '2', '2018-03-03 02:04:52', '2018-03-03 02:04:52'),
('12259', '18', '2018-03-03 01:57:45', '2018-03-03 01:57:45'),
('12265', '5', '2018-03-03 01:17:53', '2018-03-03 01:17:53'),
('12267', '5', '2018-03-02 23:29:23', '2018-03-02 23:29:23'),
('12270', '7', '2018-03-03 01:18:40', '2018-03-03 01:18:40'),
('12271', '12', '2018-03-03 01:09:17', '2018-03-03 01:09:17'),
('12273', '7', '2018-03-03 01:49:00', '2018-03-03 01:49:00'),
('12277', '19', '2018-03-03 01:57:00', '2018-03-03 01:57:00'),
('12279', '5', '2018-03-02 23:23:11', '2018-03-02 23:23:11'),
('1228', '10', '2018-03-03 01:27:26', '2018-03-03 01:27:26'),
('12280', '12', '2018-03-02 23:00:42', '2018-03-02 23:00:42'),
('12289', '4', '2018-03-03 01:07:54', '2018-03-03 01:07:54'),
('12291', '5', '2018-03-03 01:11:43', '2018-03-03 01:11:43'),
('12299', '12', '2018-03-03 01:08:32', '2018-03-03 01:08:32'),
('12300', '4', '2018-03-03 01:00:57', '2018-03-03 01:00:57'),
('12301', '5', '2018-03-03 01:22:25', '2018-03-03 01:22:25'),
('12304', '4', '2018-03-03 02:05:15', '2018-03-03 02:05:15'),
('12311', '5', '2018-03-03 01:56:53', '2018-03-03 01:56:53'),
('12315', '16', '2018-03-03 01:47:29', '2018-03-03 01:47:29'),
('12317', '5', '2018-03-03 01:13:22', '2018-03-03 01:13:22'),
('12318', '6', '2018-03-03 01:47:43', '2018-03-03 01:47:43'),
('12326', '4', '2018-03-03 01:01:58', '2018-03-03 01:01:58'),
('12327', '4', '2018-03-03 01:02:04', '2018-03-03 01:02:04'),
('12329', '4', '2018-03-03 02:05:40', '2018-03-03 02:05:40'),
('12331', '7', '2018-03-02 23:12:48', '2018-03-02 23:12:48'),
('12344', '4', '2018-03-03 02:05:31', '2018-03-03 02:05:31'),
('12346', '9', '2018-03-03 01:38:16', '2018-03-03 01:38:16'),
('12347', '4', '2018-03-03 01:01:45', '2018-03-03 01:01:45'),
('12363', '6', '2018-03-03 01:35:13', '2018-03-03 01:35:13'),
('12364', '5', '2018-03-03 01:17:03', '2018-03-03 01:17:03'),
('12366', '12', '2018-03-03 02:04:28', '2018-03-03 02:04:28'),
('12367', '5', '2018-03-03 00:44:12', '2018-03-03 00:44:12'),
('12368', '5', '2018-03-03 00:57:47', '2018-03-03 00:57:47'),
('12373', '12', '2018-03-03 01:59:43', '2018-03-03 01:59:43'),
('12381', '5', '2018-03-03 01:56:17', '2018-03-03 01:56:17'),
('12385', '13', '2018-03-03 00:31:11', '2018-03-03 00:31:11'),
('12388', '6', '2018-03-03 00:22:28', '2018-03-03 00:22:28'),
('1239', '4', '2018-03-02 23:57:52', '2018-03-02 23:57:52'),
('12393', '6', '2018-03-03 00:23:42', '2018-03-03 00:23:42'),
('12395', '4', '2018-03-03 00:30:58', '2018-03-03 00:30:58'),
('12410', '12', '2018-03-02 23:25:39', '2018-03-02 23:25:39'),
('12411', '5', '2018-03-03 00:56:02', '2018-03-03 00:56:02'),
('12416', '2', '2018-03-03 01:15:54', '2018-03-03 01:15:54'),
('12424', '12', '2018-03-03 01:11:03', '2018-03-03 01:11:03'),
('12425', '12', '2018-03-02 23:23:20', '2018-03-02 23:23:20'),
('12427', '8', '2018-03-03 01:55:33', '2018-03-03 01:55:33'),
('12431', '3', '2018-03-03 01:46:10', '2018-03-03 01:46:10'),
('12432', '12', '2018-03-03 01:24:44', '2018-03-03 01:24:44'),
('12447', '20', '2018-03-03 01:08:49', '2018-03-03 01:08:49'),
('12450', '5', '2018-03-02 23:23:19', '2018-03-02 23:23:19'),
('12452', '5', '2018-03-03 00:21:40', '2018-03-03 00:21:40'),
('12455', '6', '2018-03-02 22:55:19', '2018-03-02 22:55:19'),
('12457', '5', '2018-03-03 01:56:24', '2018-03-03 01:56:24'),
('12459', '5', '2018-03-03 01:17:12', '2018-03-03 01:17:12'),
('12462', '4', '2018-03-02 22:44:28', '2018-03-02 22:44:28'),
('12466', '4', '2018-03-03 01:07:04', '2018-03-03 01:07:04'),
('12468', '1', '2018-03-02 23:12:38', '2018-03-02 23:12:38'),
('12474', '3', '2018-03-03 01:02:19', '2018-03-03 01:02:19'),
('12475', '1', '2018-03-02 23:07:43', '2018-03-02 23:07:43'),
('12476', '5', '2018-03-02 23:58:54', '2018-03-02 23:58:54'),
('12480', '5', '2018-03-02 23:25:47', '2018-03-02 23:25:47'),
('12483', '10', '2018-03-03 00:42:52', '2018-03-03 00:42:52'),
('12485', '4', '2018-03-03 01:02:10', '2018-03-03 01:02:10'),
('12486', '1', '2018-03-03 02:00:10', '2018-03-03 02:00:10'),
('12488', '4', '2018-03-02 23:57:42', '2018-03-02 23:57:42'),
('12490', '5', '2018-03-03 00:54:04', '2018-03-03 00:54:04'),
('12492', '3', '2018-03-03 00:57:28', '2018-03-03 00:57:28'),
('12495', '4', '2018-03-02 22:50:32', '2018-03-02 22:50:32'),
('12498', '6', '2018-03-03 01:12:58', '2018-03-03 01:12:58'),
('12499', '4', '2018-03-03 01:07:20', '2018-03-03 01:07:20'),
('12500', '1', '2018-03-02 23:04:25', '2018-03-02 23:04:25'),
('12502', '7', '2018-03-03 01:11:26', '2018-03-03 01:11:26'),
('12507', '12', '2018-03-03 01:18:48', '2018-03-03 01:18:48'),
('12516', '12', '2018-03-02 23:25:32', '2018-03-02 23:25:32'),
('12519', '1', '2018-03-03 02:00:00', '2018-03-03 02:00:00'),
('1252', '16', '2018-03-02 23:34:55', '2018-03-02 23:34:55'),
('12520', '5', '2018-03-02 23:08:09', '2018-03-02 23:08:09'),
('12521', '12', '2018-03-03 01:08:08', '2018-03-03 01:08:08'),
('12524', '10', '2018-03-03 00:42:25', '2018-03-03 00:42:25'),
('12526', '5', '2018-03-02 23:29:36', '2018-03-02 23:29:36'),
('12528', '6', '2018-03-03 00:23:05', '2018-03-03 00:23:05'),
('12529', '18', '2018-03-03 01:57:56', '2018-03-03 01:57:56'),
('12531', '1', '2018-03-02 23:13:48', '2018-03-02 23:13:48'),
('12535', '12', '2018-03-03 00:30:15', '2018-03-03 00:30:15'),
('12541', '4', '2018-03-03 02:05:06', '2018-03-03 02:05:06'),
('12543', '4', '2018-03-03 02:05:23', '2018-03-03 02:05:23'),
('12546', '1', '2018-03-03 00:54:49', '2018-03-03 00:54:49'),
('12547', '5', '2018-03-03 01:48:25', '2018-03-03 01:48:25'),
('12548', '12', '2018-03-03 01:58:58', '2018-03-03 01:58:58'),
('12549', '7', '2018-03-03 00:55:31', '2018-03-03 00:55:31'),
('12552', '12', '2018-03-03 01:24:50', '2018-03-03 01:24:50'),
('12561', '5', '2018-03-03 01:18:07', '2018-03-03 01:18:07'),
('12562', '5', '2018-03-03 00:30:47', '2018-03-03 00:30:47'),
('12573', '4', '2018-03-03 01:01:04', '2018-03-03 01:01:04'),
('12574', '18', '2018-03-03 01:47:31', '2018-03-03 01:47:31'),
('12577', '6', '2018-03-03 00:23:17', '2018-03-03 00:23:17'),
('12581', '12', '2018-03-03 01:08:01', '2018-03-03 01:08:01'),
('12584', '6', '2018-03-03 00:29:47', '2018-03-03 00:29:47'),
('12592', '2', '2018-03-03 02:06:51', '2018-03-03 02:06:51'),
('12598', '7', '2018-03-03 01:18:32', '2018-03-03 01:18:32'),
('12599', '10', '2018-03-03 00:41:59', '2018-03-03 00:41:59'),
('12603', '5', '2018-03-02 23:08:35', '2018-03-02 23:08:35'),
('12606', '16', '2018-03-03 01:08:40', '2018-03-03 01:08:40'),
('12611', '5', '2018-03-02 23:56:44', '2018-03-02 23:56:44'),
('12613', '12', '2018-03-03 01:42:52', '2018-03-03 01:42:52'),
('12617', '2', '2018-03-03 01:09:22', '2018-03-03 01:09:22'),
('12626', '5', '2018-03-03 01:17:58', '2018-03-03 01:17:58'),
('12640', '5', '2018-03-02 23:48:26', '2018-03-02 23:48:26'),
('12646', '5', '2018-03-03 00:43:50', '2018-03-03 00:43:50'),
('12659', '4', '2018-03-02 22:50:45', '2018-03-02 22:50:45'),
('12670', '6', '2018-03-03 00:22:50', '2018-03-03 00:22:50'),
('12671', '20', '2018-03-03 01:41:14', '2018-03-03 01:41:14'),
('12685', '4', '2018-03-03 00:48:45', '2018-03-03 00:48:45'),
('12695', '4', '2018-03-03 01:01:39', '2018-03-03 01:01:39'),
('12696', '12', '2018-03-03 01:01:24', '2018-03-03 01:01:24'),
('12697', '12', '2018-03-03 01:09:11', '2018-03-03 01:09:11'),
('12705', '6', '2018-03-03 01:18:59', '2018-03-03 01:18:59'),
('12709', '16', '2018-03-03 01:53:11', '2018-03-03 01:53:11'),
('12712', '12', '2018-03-02 23:24:29', '2018-03-02 23:24:29'),
('12713', '19', '2018-03-02 23:22:43', '2018-03-02 23:22:43'),
('12714', '5', '2018-03-02 23:48:19', '2018-03-02 23:48:19'),
('12716', '12', '2018-03-03 01:07:53', '2018-03-03 01:07:53'),
('12718', '5', '2018-03-02 23:29:44', '2018-03-02 23:29:44'),
('12719', '5', '2018-03-03 01:16:49', '2018-03-03 01:16:49'),
('12725', '12', '2018-03-03 01:13:22', '2018-03-03 01:13:22'),
('12728', '6', '2018-03-03 00:22:38', '2018-03-03 00:22:38'),
('12733', '5', '2018-03-02 23:34:33', '2018-03-02 23:34:33'),
('12734', '10', '2018-03-03 00:42:41', '2018-03-03 00:42:41'),
('12737', '5', '2018-03-02 23:44:00', '2018-03-02 23:44:00'),
('12738', '10', '2018-03-03 00:42:46', '2018-03-03 00:42:46'),
('12739', '3', '2018-03-03 01:45:56', '2018-03-03 01:45:56'),
('12740', '5', '2018-03-03 01:15:25', '2018-03-03 01:15:25'),
('12753', '16', '2018-03-03 01:47:41', '2018-03-03 01:47:41'),
('12755', '3', '2018-03-03 01:10:29', '2018-03-03 01:10:29'),
('12761', '6', '2018-03-03 00:30:24', '2018-03-03 00:30:24'),
('12762', '12', '2018-03-02 23:00:53', '2018-03-02 23:00:53'),
('12764', '19', '2018-03-03 01:56:45', '2018-03-03 01:56:45'),
('12766', '20', '2018-03-02 23:21:15', '2018-03-02 23:21:15'),
('12768', '5', '2018-03-02 23:33:17', '2018-03-02 23:33:17'),
('1277', '2', '2018-03-03 01:25:04', '2018-03-03 01:25:04'),
('12770', '18', '2018-03-03 01:47:12', '2018-03-03 01:47:12'),
('12772', '2', '2018-03-03 01:36:31', '2018-03-03 01:36:31'),
('12773', '5', '2018-03-03 01:18:21', '2018-03-03 01:18:21'),
('12782', '5', '2018-03-02 23:12:57', '2018-03-02 23:12:57'),
('12783', '1', '2018-03-02 23:27:00', '2018-03-02 23:27:00'),
('12784', '5', '2018-03-02 23:32:28', '2018-03-02 23:32:28'),
('12786', '2', '2018-03-03 00:42:19', '2018-03-03 00:42:19'),
('12788', '5', '2018-03-03 01:02:37', '2018-03-03 01:02:37'),
('12790', '5', '2018-03-02 23:42:48', '2018-03-02 23:42:48'),
('12792', '12', '2018-03-03 01:11:15', '2018-03-03 01:11:15'),
('12808', '8', '2018-03-02 23:24:10', '2018-03-02 23:24:10'),
('12809', '2', '2018-03-03 02:05:51', '2018-03-03 02:05:51'),
('12810', '2', '2018-03-02 23:24:56', '2018-03-02 23:24:56'),
('12824', '5', '2018-03-02 23:43:51', '2018-03-02 23:43:51'),
('12827', '9', '2018-03-03 00:42:06', '2018-03-03 00:42:06'),
('12832', '4', '2018-03-03 00:31:20', '2018-03-03 00:31:20'),
('12834', '7', '2018-03-03 01:17:06', '2018-03-03 01:17:06'),
('12836', '5', '2018-03-03 01:02:55', '2018-03-03 01:02:55'),
('12845', '5', '2018-03-03 01:10:01', '2018-03-03 01:10:01'),
('12846', '5', '2018-03-03 01:17:13', '2018-03-03 01:17:13'),
('12851', '10', '2018-03-03 00:42:36', '2018-03-03 00:42:36'),
('12853', '18', '2018-03-03 01:58:02', '2018-03-03 01:58:02'),
('12860', '12', '2018-03-03 01:13:33', '2018-03-03 01:13:33'),
('12864', '6', '2018-03-03 00:30:04', '2018-03-03 00:30:04'),
('12869', '12', '2018-03-02 23:23:01', '2018-03-02 23:23:01'),
('12871', '4', '2018-03-03 01:07:10', '2018-03-03 01:07:10'),
('12873', '5', '2018-03-03 01:16:39', '2018-03-03 01:16:39'),
('12877', '5', '2018-03-02 23:24:50', '2018-03-02 23:24:50'),
('12882', '5', '2018-03-03 01:17:13', '2018-03-03 01:17:13'),
('12889', '12', '2018-03-03 01:13:14', '2018-03-03 01:13:14'),
('12893', '8', '2018-03-03 01:55:23', '2018-03-03 01:55:23'),
('12896', '5', '2018-03-03 00:55:09', '2018-03-03 00:55:09'),
('12901', '5', '2018-03-03 01:56:11', '2018-03-03 01:56:11'),
('12902', '5', '2018-03-03 01:35:19', '2018-03-03 01:35:19'),
('12905', '5', '2018-03-02 23:29:52', '2018-03-02 23:29:52'),
('12908', '18', '2018-03-03 01:47:58', '2018-03-03 01:47:58'),
('12909', '5', '2018-03-02 23:13:14', '2018-03-02 23:13:14'),
('12910', '12', '2018-03-03 01:00:21', '2018-03-03 01:00:21'),
('12912', '4', '2018-03-03 01:07:39', '2018-03-03 01:07:39'),
('12925', '2', '2018-03-02 23:23:57', '2018-03-02 23:23:57'),
('12926', '5', '2018-03-02 23:24:42', '2018-03-02 23:24:42'),
('12931', '1', '2018-03-02 23:03:49', '2018-03-02 23:03:49'),
('12935', '5', '2018-03-03 01:18:13', '2018-03-03 01:18:13'),
('12940', '5', '2018-03-02 23:13:06', '2018-03-02 23:13:06'),
('12944', '5', '2018-03-03 01:18:28', '2018-03-03 01:18:28'),
('12946', '5', '2018-03-02 23:59:54', '2018-03-02 23:59:54'),
('12950', '4', '2018-03-02 22:52:42', '2018-03-02 22:52:42'),
('12955', '5', '2018-03-02 23:08:21', '2018-03-02 23:08:21'),
('12975', '4', '2018-03-03 01:03:49', '2018-03-03 01:03:49'),
('12977', '5', '2018-03-03 00:56:28', '2018-03-03 00:56:28'),
('12978', '5', '2018-03-02 23:56:57', '2018-03-02 23:56:57'),
('12979', '12', '2018-03-02 23:22:14', '2018-03-02 23:22:14'),
('12980', '12', '2018-03-02 23:21:50', '2018-03-02 23:21:50'),
('12982', '5', '2018-03-03 01:59:06', '2018-03-03 01:59:06'),
('12983', '6', '2018-03-03 01:14:51', '2018-03-03 01:14:51'),
('12987', '5', '2018-03-02 23:25:01', '2018-03-02 23:25:01'),
('12988', '7', '2018-03-03 01:10:49', '2018-03-03 01:10:49'),
('12992', '4', '2018-03-03 01:07:27', '2018-03-03 01:07:27'),
('12994', '20', '2018-03-03 01:19:43', '2018-03-03 01:19:43'),
('13007', '20', '2018-03-02 23:23:39', '2018-03-02 23:23:39'),
('13011', '16', '2018-03-03 01:37:30', '2018-03-03 01:37:30'),
('13013', '20', '2018-03-03 01:15:39', '2018-03-03 01:15:39'),
('13019', '12', '2018-03-03 01:54:55', '2018-03-03 01:54:55'),
('13036', '20', '2018-03-03 01:01:49', '2018-03-03 01:01:49'),
('13038', '20', '2018-03-03 01:15:11', '2018-03-03 01:15:11'),
('13040', '12', '2018-03-03 01:24:52', '2018-03-03 01:24:52'),
('13045', '20', '2018-03-03 01:48:47', '2018-03-03 01:48:47'),
('13053', '20', '2018-03-03 01:02:32', '2018-03-03 01:02:32'),
('13056', '5', '2018-03-03 02:03:00', '2018-03-03 02:03:00'),
('13057', '5', '2018-03-03 02:03:06', '2018-03-03 02:03:06'),
('13059', '13', '2018-03-03 01:44:11', '2018-03-03 01:44:11'),
('13070', '20', '2018-03-03 01:15:19', '2018-03-03 01:15:19'),
('13071', '20', '2018-03-03 01:33:09', '2018-03-03 01:33:09'),
('13073', '19', '2018-03-03 01:36:56', '2018-03-03 01:36:56'),
('13078', '20', '2018-03-03 01:15:45', '2018-03-03 01:15:45'),
('13085', '19', '2018-03-03 02:00:18', '2018-03-03 02:00:18'),
('13089', '20', '2018-03-03 02:08:25', '2018-03-03 02:08:25'),
('13099', '6', '2018-03-03 02:10:09', '2018-03-03 02:10:09'),
('13109', '4', '2018-03-02 23:40:33', '2018-03-02 23:40:33'),
('13113', '2', '2018-03-03 01:22:34', '2018-03-03 01:22:34'),
('13115', '20', '2018-03-03 02:03:15', '2018-03-03 02:03:15'),
('13119', '1', '2018-03-03 01:23:40', '2018-03-03 01:23:40'),
('13123', '20', '2018-03-02 23:17:14', '2018-03-02 23:17:14'),
('13134', '7', '2018-03-03 01:21:08', '2018-03-03 01:21:08'),
('13135', '14', '2018-03-02 23:40:42', '2018-03-02 23:40:42'),
('13140', '5', '2018-03-02 23:53:27', '2018-03-02 23:53:27'),
('13142', '19', '2018-03-02 23:28:38', '2018-03-02 23:28:38'),
('13145', '20', '2018-03-03 00:48:20', '2018-03-03 00:48:20'),
('13148', '5', '2018-03-03 00:02:23', '2018-03-03 00:02:23'),
('13153', '12', '2018-03-03 01:59:44', '2018-03-03 01:59:44'),
('13158', '20', '2018-03-03 02:03:50', '2018-03-03 02:03:50'),
('13168', '20', '2018-03-03 02:04:12', '2018-03-03 02:04:12'),
('13173', '20', '2018-03-03 02:08:20', '2018-03-03 02:08:20'),
('13178', '20', '2018-03-03 01:33:26', '2018-03-03 01:33:26'),
('13189', '16', '2018-03-03 01:38:21', '2018-03-03 01:38:21'),
('13206', '20', '2018-03-03 01:02:42', '2018-03-03 01:02:42'),
('13210', '19', '2018-03-03 01:20:39', '2018-03-03 01:20:39'),
('13212', '5', '2018-03-02 23:53:04', '2018-03-02 23:53:04'),
('13214', '20', '2018-03-03 01:00:14', '2018-03-03 01:00:14'),
('13215', '20', '2018-03-02 23:22:53', '2018-03-02 23:22:53'),
('13216', '12', '2018-03-03 01:03:16', '2018-03-03 01:03:16'),
('13217', '19', '2018-03-03 01:20:21', '2018-03-03 01:20:21'),
('13222', '19', '2018-03-03 01:20:07', '2018-03-03 01:20:07'),
('13223', '4', '2018-03-03 01:06:54', '2018-03-03 01:06:54'),
('13226', '20', '2018-03-03 01:00:22', '2018-03-03 01:00:22'),
('13227', '1', '2018-03-03 02:01:03', '2018-03-03 02:01:03'),
('13234', '12', '2018-03-02 23:28:12', '2018-03-02 23:28:12'),
('13236', '12', '2018-03-03 01:55:52', '2018-03-03 01:55:52'),
('13237', '20', '2018-03-03 00:59:57', '2018-03-03 00:59:57'),
('13238', '13', '2018-03-02 23:39:52', '2018-03-02 23:39:52'),
('13248', '6', '2018-03-03 01:23:28', '2018-03-03 01:23:28'),
('13252', '20', '2018-03-03 01:16:31', '2018-03-03 01:16:31'),
('13255', '20', '2018-03-02 23:31:40', '2018-03-02 23:31:40'),
('13256', '12', '2018-03-03 01:46:51', '2018-03-03 01:46:51'),
('13261', '12', '2018-03-03 01:02:44', '2018-03-03 01:02:44'),
('13262', '19', '2018-03-03 00:58:51', '2018-03-03 00:58:51'),
('13263', '19', '2018-03-02 23:28:46', '2018-03-02 23:28:46'),
('13266', '10', '2018-03-03 02:00:25', '2018-03-03 02:00:25'),
('13271', '12', '2018-03-03 01:47:06', '2018-03-03 01:47:06'),
('13276', '20', '2018-03-03 01:01:39', '2018-03-03 01:01:39'),
('13278', '20', '2018-03-03 01:16:45', '2018-03-03 01:16:45'),
('13293', '12', '2018-03-03 01:02:29', '2018-03-03 01:02:29'),
('13302', '19', '2018-03-02 23:40:14', '2018-03-02 23:40:14'),
('13312', '20', '2018-03-03 01:33:02', '2018-03-03 01:33:02'),
('13318', '19', '2018-03-03 01:20:00', '2018-03-03 01:20:00'),
('13324', '20', '2018-03-03 01:30:54', '2018-03-03 01:30:54'),
('13330', '12', '2018-03-03 01:46:33', '2018-03-03 01:46:33'),
('13333', '12', '2018-03-03 01:48:15', '2018-03-03 01:48:15'),
('13335', '19', '2018-03-03 02:03:24', '2018-03-03 02:03:24'),
('13339', '19', '2018-03-03 00:59:19', '2018-03-03 00:59:19'),
('13340', '20', '2018-03-03 01:17:20', '2018-03-03 01:17:20'),
('13341', '7', '2018-03-03 00:48:09', '2018-03-03 00:48:09'),
('13344', '16', '2018-03-03 01:37:44', '2018-03-03 01:37:44'),
('13348', '12', '2018-03-03 01:55:22', '2018-03-03 01:55:22'),
('13353', '19', '2018-03-03 01:56:58', '2018-03-03 01:56:58'),
('13360', '5', '2018-03-03 01:24:35', '2018-03-03 01:24:35'),
('13368', '19', '2018-03-03 01:03:55', '2018-03-03 01:03:55'),
('13373', '18', '2018-03-03 02:03:42', '2018-03-03 02:03:42'),
('13374', '20', '2018-03-02 23:23:31', '2018-03-02 23:23:31'),
('13376', '20', '2018-03-03 01:38:27', '2018-03-03 01:38:27'),
('13378', '7', '2018-03-03 02:03:33', '2018-03-03 02:03:33'),
('13381', '17', '2018-03-03 01:56:37', '2018-03-03 01:56:37'),
('13396', '12', '2018-03-03 01:02:49', '2018-03-03 01:02:49'),
('13404', '19', '2018-03-03 01:04:09', '2018-03-03 01:04:09'),
('13408', '20', '2018-03-03 01:34:35', '2018-03-03 01:34:35'),
('13409', '20', '2018-03-03 01:34:13', '2018-03-03 01:34:13'),
('13411', '20', '2018-03-03 01:14:30', '2018-03-03 01:14:30'),
('13414', '19', '2018-03-03 01:26:31', '2018-03-03 01:26:31'),
('13422', '20', '2018-03-03 01:33:55', '2018-03-03 01:33:55'),
('13424', '12', '2018-03-03 01:48:34', '2018-03-03 01:48:34'),
('13426', '20', '2018-03-03 01:48:54', '2018-03-03 01:48:54'),
('13427', '16', '2018-03-03 01:37:54', '2018-03-03 01:37:54'),
('13433', '20', '2018-03-03 01:37:43', '2018-03-03 01:37:43'),
('13458', '5', '2018-03-02 23:37:48', '2018-03-02 23:37:48'),
('13461', '20', '2018-03-03 01:13:24', '2018-03-03 01:13:24'),
('13462', '20', '2018-03-03 01:32:56', '2018-03-03 01:32:56'),
('13466', '19', '2018-03-03 01:56:50', '2018-03-03 01:56:50'),
('13469', '19', '2018-03-03 01:21:51', '2018-03-03 01:21:51'),
('13470', '20', '2018-03-03 01:37:48', '2018-03-03 01:37:48'),
('13471', '20', '2018-03-03 01:14:13', '2018-03-03 01:14:13'),
('13473', '12', '2018-03-03 01:14:22', '2018-03-03 01:14:22'),
('13482', '8', '2018-03-03 00:55:04', '2018-03-03 00:55:04'),
('13498', '5', '2018-03-02 23:38:02', '2018-03-02 23:38:02'),
('13507', '19', '2018-03-03 01:57:04', '2018-03-03 01:57:04'),
('13511', '5', '2018-03-03 01:46:40', '2018-03-03 01:46:40'),
('13514', '20', '2018-03-03 00:55:21', '2018-03-03 00:55:21'),
('13516', '20', '2018-03-03 00:55:15', '2018-03-03 00:55:15'),
('13517', '13', '2018-03-03 02:00:01', '2018-03-03 02:00:01'),
('13528', '19', '2018-03-03 01:58:31', '2018-03-03 01:58:31'),
('13534', '20', '2018-03-03 01:16:39', '2018-03-03 01:16:39'),
('13541', '5', '2018-03-03 01:57:11', '2018-03-03 01:57:11'),
('13544', '20', '2018-03-03 01:20:28', '2018-03-03 01:20:28'),
('13548', '5', '2018-03-03 00:02:12', '2018-03-03 00:02:12'),
('13555', '5', '2018-03-03 00:48:00', '2018-03-03 00:48:00'),
('13566', '20', '2018-03-03 01:15:26', '2018-03-03 01:15:26'),
('13570', '20', '2018-03-03 02:08:15', '2018-03-03 02:08:15'),
('13574', '12', '2018-03-03 01:48:45', '2018-03-03 01:48:45'),
('1358', '11', '2018-03-03 01:55:46', '2018-03-03 01:55:46'),
('13588', '8', '2018-03-03 00:55:47', '2018-03-03 00:55:47'),
('1359', '11', '2018-03-03 01:55:52', '2018-03-03 01:55:52'),
('1360', '11', '2018-03-03 01:55:57', '2018-03-03 01:55:57'),
('13600', '13', '2018-03-03 00:54:55', '2018-03-03 00:54:55'),
('13601', '12', '2018-03-02 23:19:31', '2018-03-02 23:19:31'),
('13610', '16', '2018-03-03 01:37:22', '2018-03-03 01:37:22'),
('13611', '20', '2018-03-03 00:55:28', '2018-03-03 00:55:28'),
('13614', '12', '2018-03-03 01:21:28', '2018-03-03 01:21:28'),
('13632', '20', '2018-03-03 01:21:35', '2018-03-03 01:21:35'),
('13633', '20', '2018-03-03 01:13:41', '2018-03-03 01:13:41'),
('13634', '5', '2018-03-03 00:02:31', '2018-03-03 00:02:31'),
('13654', '20', '2018-03-03 01:34:29', '2018-03-03 01:34:29'),
('13659', '20', '2018-03-03 01:33:33', '2018-03-03 01:33:33'),
('13666', '5', '2018-03-03 01:59:36', '2018-03-03 01:59:36'),
('13671', '20', '2018-03-02 23:31:26', '2018-03-02 23:31:26'),
('13672', '5', '2018-03-02 23:53:21', '2018-03-02 23:53:21'),
('13683', '20', '2018-03-02 23:14:38', '2018-03-02 23:14:38'),
('13685', '20', '2018-03-03 01:33:40', '2018-03-03 01:33:40'),
('13686', '12', '2018-03-02 23:58:25', '2018-03-02 23:58:25'),
('13688', '15', '2018-03-03 01:35:25', '2018-03-03 01:35:25'),
('13692', '20', '2018-03-03 01:20:59', '2018-03-03 01:20:59'),
('13699', '5', '2018-03-03 02:02:49', '2018-03-03 02:02:49'),
('13702', '5', '2018-03-03 01:35:31', '2018-03-03 01:35:31'),
('13708', '20', '2018-03-03 01:28:13', '2018-03-03 01:28:13'),
('13714', '19', '2018-03-03 01:04:03', '2018-03-03 01:04:03'),
('13715', '20', '2018-03-03 01:14:40', '2018-03-03 01:14:40'),
('13721', '5', '2018-03-03 02:03:33', '2018-03-03 02:03:33'),
('13722', '5', '2018-03-02 23:52:57', '2018-03-02 23:52:57'),
('13723', '20', '2018-03-03 01:12:35', '2018-03-03 01:12:35'),
('13724', '5', '2018-03-02 23:33:08', '2018-03-02 23:33:08'),
('13726', '10', '2018-03-03 01:22:13', '2018-03-03 01:22:13'),
('13729', '19', '2018-03-03 01:12:32', '2018-03-03 01:12:32'),
('13733', '20', '2018-03-03 02:04:05', '2018-03-03 02:04:05'),
('13736', '20', '2018-03-03 01:15:32', '2018-03-03 01:15:32'),
('13744', '20', '2018-03-02 23:17:02', '2018-03-02 23:17:02'),
('13749', '20', '2018-03-03 01:36:39', '2018-03-03 01:36:39'),
('13750', '20', '2018-03-03 01:13:49', '2018-03-03 01:13:49'),
('13754', '5', '2018-03-03 00:02:17', '2018-03-03 00:02:17'),
('13760', '20', '2018-03-03 01:16:04', '2018-03-03 01:16:04'),
('13761', '12', '2018-03-03 01:56:02', '2018-03-03 01:56:02'),
('13764', '5', '2018-03-03 00:01:38', '2018-03-03 00:01:38'),
('13765', '7', '2018-03-03 01:57:32', '2018-03-03 01:57:32'),
('13772', '20', '2018-03-03 01:01:56', '2018-03-03 01:01:56'),
('13783', '20', '2018-03-03 01:16:11', '2018-03-03 01:16:11'),
('13785', '20', '2018-03-03 01:16:19', '2018-03-03 01:16:19'),
('13786', '19', '2018-03-03 01:19:54', '2018-03-03 01:19:54'),
('13788', '19', '2018-03-03 01:00:08', '2018-03-03 01:00:08'),
('13793', '5', '2018-03-02 23:37:56', '2018-03-02 23:37:56'),
('13799', '14', '2018-03-03 01:14:43', '2018-03-03 01:14:43'),
('13806', '19', '2018-03-03 01:20:51', '2018-03-03 01:20:51'),
('13807', '5', '2018-03-02 23:53:45', '2018-03-02 23:53:45'),
('13814', '19', '2018-03-03 02:01:27', '2018-03-03 02:01:27'),
('13815', '16', '2018-03-03 01:15:00', '2018-03-03 01:15:00'),
('13818', '5', '2018-03-03 01:56:06', '2018-03-03 01:56:06'),
('13822', '19', '2018-03-03 01:21:46', '2018-03-03 01:21:46'),
('13830', '12', '2018-03-03 01:55:38', '2018-03-03 01:55:38'),
('13831', '6', '2018-03-03 01:22:50', '2018-03-03 01:22:50'),
('13833', '20', '2018-03-03 01:14:06', '2018-03-03 01:14:06'),
('13834', '13', '2018-03-03 00:54:40', '2018-03-03 00:54:40'),
('13838', '19', '2018-03-03 01:20:08', '2018-03-03 01:20:08'),
('13844', '16', '2018-03-03 01:47:46', '2018-03-03 01:47:46'),
('13849', '13', '2018-03-03 01:43:48', '2018-03-03 01:43:48'),
('13853', '12', '2018-03-03 01:55:46', '2018-03-03 01:55:46'),
('13861', '20', '2018-03-03 01:00:07', '2018-03-03 01:00:07'),
('13865', '16', '2018-03-03 01:47:56', '2018-03-03 01:47:56'),
('13869', '6', '2018-03-03 01:24:31', '2018-03-03 01:24:31'),
('13870', '16', '2018-03-03 02:02:19', '2018-03-03 02:02:19'),
('13877', '19', '2018-03-03 01:17:36', '2018-03-03 01:17:36'),
('13892', '16', '2018-03-03 01:48:02', '2018-03-03 01:48:02'),
('13899', '16', '2018-03-03 02:09:39', '2018-03-03 02:09:39'),
('13900', '14', '2018-03-03 01:14:24', '2018-03-03 01:14:24'),
('13901', '19', '2018-03-03 00:13:47', '2018-03-03 00:13:47'),
('13902', '19', '2018-03-02 22:48:23', '2018-03-02 22:48:23'),
('13936', '19', '2018-03-03 01:57:09', '2018-03-03 01:57:09'),
('13940', '12', '2018-03-03 01:22:24', '2018-03-03 01:22:24'),
('13943', '16', '2018-03-03 00:47:20', '2018-03-03 00:47:20'),
('13947', '19', '2018-03-03 01:21:23', '2018-03-03 01:21:23'),
('13958', '19', '2018-03-03 01:38:06', '2018-03-03 01:38:06'),
('13964', '16', '2018-03-03 00:49:50', '2018-03-03 00:49:50'),
('13965', '19', '2018-03-03 01:41:33', '2018-03-03 01:41:33'),
('13971', '19', '2018-03-03 01:03:31', '2018-03-03 01:03:31'),
('13978', '19', '2018-03-03 01:19:53', '2018-03-03 01:19:53'),
('13984', '19', '2018-03-03 01:21:02', '2018-03-03 01:21:02'),
('13985', '19', '2018-03-03 01:25:40', '2018-03-03 01:25:40'),
('13986', '14', '2018-03-03 01:01:32', '2018-03-03 01:01:32'),
('13991', '19', '2018-03-03 01:20:16', '2018-03-03 01:20:16'),
('13995', '19', '2018-03-03 00:40:21', '2018-03-03 00:40:21'),
('14000', '19', '2018-03-03 00:21:47', '2018-03-03 00:21:47'),
('14010', '19', '2018-03-03 01:27:07', '2018-03-03 01:27:07'),
('14011', '2', '2018-03-03 01:52:23', '2018-03-03 01:52:23'),
('14020', '19', '2018-03-03 01:38:13', '2018-03-03 01:38:13'),
('14031', '16', '2018-03-03 01:54:37', '2018-03-03 01:54:37'),
('14034', '19', '2018-03-03 01:21:11', '2018-03-03 01:21:11'),
('14036', '19', '2018-03-03 01:04:55', '2018-03-03 01:04:55'),
('14037', '19', '2018-03-03 00:59:09', '2018-03-03 00:59:09'),
('14053', '12', '2018-03-03 01:36:50', '2018-03-03 01:36:50'),
('14055', '2', '2018-03-03 01:33:48', '2018-03-03 01:33:48'),
('14060', '2', '2018-03-03 01:51:54', '2018-03-03 01:51:54'),
('14074', '6', '2018-03-02 23:46:59', '2018-03-02 23:46:59'),
('14077', '19', '2018-03-03 00:15:42', '2018-03-03 00:15:42'),
('14079', '20', '2018-03-03 01:20:45', '2018-03-03 01:20:45'),
('14081', '4', '2018-03-03 01:01:12', '2018-03-03 01:01:12'),
('14085', '16', '2018-03-03 00:49:04', '2018-03-03 00:49:04'),
('14087', '7', '2018-03-03 01:54:27', '2018-03-03 01:54:27'),
('14091', '19', '2018-03-03 01:17:47', '2018-03-03 01:17:47'),
('14094', '7', '2018-03-03 01:21:20', '2018-03-03 01:21:20'),
('14096', '19', '2018-03-03 01:57:23', '2018-03-03 01:57:23'),
('14105', '19', '2018-03-03 01:21:59', '2018-03-03 01:21:59'),
('14112', '14', '2018-03-03 01:01:52', '2018-03-03 01:01:52'),
('14115', '19', '2018-03-03 01:27:01', '2018-03-03 01:27:01'),
('14138', '19', '2018-03-03 01:41:56', '2018-03-03 01:41:56'),
('14139', '19', '2018-03-03 01:04:16', '2018-03-03 01:04:16'),
('14144', '2', '2018-03-03 01:52:04', '2018-03-03 01:52:04'),
('14150', '14', '2018-03-03 01:12:49', '2018-03-03 01:12:49'),
('14155', '14', '2018-03-03 01:12:57', '2018-03-03 01:12:57'),
('14166', '12', '2018-03-03 01:22:02', '2018-03-03 01:22:02'),
('14173', '16', '2018-03-03 02:01:58', '2018-03-03 02:01:58'),
('14181', '19', '2018-03-03 01:25:30', '2018-03-03 01:25:30'),
('14194', '19', '2018-03-03 01:20:00', '2018-03-03 01:20:00'),
('14198', '2', '2018-03-03 01:52:39', '2018-03-03 01:52:39'),
('14200', '2', '2018-03-03 01:52:15', '2018-03-03 01:52:15'),
('14204', '19', '2018-03-03 00:40:27', '2018-03-03 00:40:27'),
('14205', '5', '2018-03-02 23:35:51', '2018-03-02 23:35:51'),
('14206', '5', '2018-03-02 23:35:43', '2018-03-02 23:35:43'),
('14207', '2', '2018-03-03 01:51:59', '2018-03-03 01:51:59'),
('14211', '14', '2018-03-03 01:24:25', '2018-03-03 01:24:25'),
('14223', '19', '2018-03-03 00:11:51', '2018-03-03 00:11:51'),
('14227', '19', '2018-03-03 01:22:43', '2018-03-03 01:22:43'),
('14234', '19', '2018-03-03 01:22:15', '2018-03-03 01:22:15'),
('14236', '19', '2018-03-03 01:04:49', '2018-03-03 01:04:49'),
('14237', '2', '2018-03-03 01:19:22', '2018-03-03 01:19:22'),
('14238', '2', '2018-03-03 01:19:15', '2018-03-03 01:19:15'),
('14250', '19', '2018-03-03 01:34:44', '2018-03-03 01:34:44'),
('14254', '19', '2018-03-03 01:04:31', '2018-03-03 01:04:31'),
('14257', '19', '2018-03-03 00:22:02', '2018-03-03 00:22:02'),
('14259', '2', '2018-03-03 01:51:38', '2018-03-03 01:51:38'),
('14267', '19', '2018-03-03 01:22:55', '2018-03-03 01:22:55'),
('14269', '19', '2018-03-03 00:15:35', '2018-03-03 00:15:35'),
('14273', '12', '2018-03-02 23:28:01', '2018-03-02 23:28:01'),
('14283', '19', '2018-03-03 01:42:03', '2018-03-03 01:42:03'),
('14286', '19', '2018-03-03 01:19:45', '2018-03-03 01:19:45'),
('14290', '19', '2018-03-03 00:12:17', '2018-03-03 00:12:17'),
('14294', '19', '2018-03-03 01:21:54', '2018-03-03 01:21:54'),
('14301', '19', '2018-03-02 23:39:00', '2018-03-02 23:39:00'),
('14302', '19', '2018-03-03 01:19:23', '2018-03-03 01:19:23'),
('14303', '19', '2018-03-03 01:22:49', '2018-03-03 01:22:49'),
('14308', '11', '2018-03-03 00:50:13', '2018-03-03 00:50:13'),
('14314', '19', '2018-03-03 01:18:36', '2018-03-03 01:18:36'),
('14324', '19', '2018-03-03 01:25:35', '2018-03-03 01:25:35'),
('14328', '16', '2018-03-03 02:02:11', '2018-03-03 02:02:11'),
('14329', '19', '2018-03-03 01:22:06', '2018-03-03 01:22:06'),
('14332', '2', '2018-03-03 01:50:14', '2018-03-03 01:50:14'),
('14343', '19', '2018-03-03 00:13:21', '2018-03-03 00:13:21'),
('14349', '19', '2018-03-02 23:26:11', '2018-03-02 23:26:11'),
('14350', '19', '2018-03-03 01:38:29', '2018-03-03 01:38:29'),
('14358', '2', '2018-03-03 01:33:18', '2018-03-03 01:33:18'),
('14359', '20', '2018-03-03 01:12:18', '2018-03-03 01:12:18'),
('14367', '5', '2018-03-02 23:38:37', '2018-03-02 23:38:37'),
('14369', '19', '2018-03-03 01:34:28', '2018-03-03 01:34:28'),
('14373', '14', '2018-03-03 01:19:30', '2018-03-03 01:19:30'),
('14377', '16', '2018-03-03 01:54:16', '2018-03-03 01:54:16'),
('14378', '2', '2018-03-03 01:19:09', '2018-03-03 01:19:09'),
('14380', '19', '2018-03-03 01:58:23', '2018-03-03 01:58:23'),
('14384', '19', '2018-03-03 01:21:50', '2018-03-03 01:21:50'),
('14393', '19', '2018-03-03 01:04:22', '2018-03-03 01:04:22'),
('14395', '2', '2018-03-03 01:50:21', '2018-03-03 01:50:21'),
('14396', '19', '2018-03-03 01:04:39', '2018-03-03 01:04:39'),
('14397', '19', '2018-03-03 00:15:25', '2018-03-03 00:15:25'),
('14404', '19', '2018-03-03 01:03:23', '2018-03-03 01:03:23'),
('14406', '19', '2018-03-03 01:34:40', '2018-03-03 01:34:40'),
('14410', '19', '2018-03-03 01:19:39', '2018-03-03 01:19:39'),
('14411', '19', '2018-03-02 23:27:11', '2018-03-02 23:27:11'),
('14412', '19', '2018-03-03 01:20:31', '2018-03-03 01:20:31'),
('14418', '19', '2018-03-03 01:21:16', '2018-03-03 01:21:16'),
('14420', '16', '2018-03-03 02:09:49', '2018-03-03 02:09:49'),
('14423', '5', '2018-03-03 01:26:09', '2018-03-03 01:26:09'),
('14424', '19', '2018-03-02 23:55:32', '2018-03-02 23:55:32'),
('14428', '5', '2018-03-03 01:26:01', '2018-03-03 01:26:01'),
('14431', '16', '2018-03-03 00:47:43', '2018-03-03 00:47:43'),
('14434', '16', '2018-03-03 00:47:50', '2018-03-03 00:47:50'),
('14442', '14', '2018-03-02 23:25:59', '2018-03-02 23:25:59'),
('14445', '19', '2018-03-03 01:41:28', '2018-03-03 01:41:28'),
('14464', '2', '2018-03-03 01:51:43', '2018-03-03 01:51:43'),
('14481', '19', '2018-03-03 00:13:34', '2018-03-03 00:13:34'),
('14487', '16', '2018-03-03 01:48:08', '2018-03-03 01:48:08'),
('14494', '19', '2018-03-03 00:13:29', '2018-03-03 00:13:29'),
('14498', '2', '2018-03-03 01:09:36', '2018-03-03 01:09:36'),
('14499', '19', '2018-03-03 01:17:43', '2018-03-03 01:17:43'),
('14500', '19', '2018-03-03 01:34:35', '2018-03-03 01:34:35'),
('14502', '19', '2018-03-03 01:17:20', '2018-03-03 01:17:20'),
('14511', '2', '2018-03-03 01:52:10', '2018-03-03 01:52:10'),
('14514', '19', '2018-03-03 01:20:44', '2018-03-03 01:20:44'),
('14521', '19', '2018-03-03 01:19:34', '2018-03-03 01:19:34'),
('14530', '2', '2018-03-03 01:51:49', '2018-03-03 01:51:49'),
('14532', '19', '2018-03-03 01:34:48', '2018-03-03 01:34:48'),
('14536', '19', '2018-03-02 23:26:50', '2018-03-02 23:26:50'),
('14547', '12', '2018-03-02 23:28:29', '2018-03-02 23:28:29'),
('14548', '5', '2018-03-02 23:59:41', '2018-03-02 23:59:41'),
('14550', '13', '2018-03-03 01:40:03', '2018-03-03 01:40:03'),
('14553', '19', '2018-03-03 01:25:45', '2018-03-03 01:25:45'),
('14561', '5', '2018-03-03 01:25:45', '2018-03-03 01:25:45'),
('14562', '19', '2018-03-03 01:05:01', '2018-03-03 01:05:01'),
('14564', '16', '2018-03-03 00:47:36', '2018-03-03 00:47:36'),
('14568', '19', '2018-03-03 01:34:56', '2018-03-03 01:34:56'),
('14584', '16', '2018-03-03 00:59:30', '2018-03-03 00:59:30'),
('14587', '2', '2018-03-03 01:12:27', '2018-03-03 01:12:27'),
('14588', '12', '2018-03-02 23:28:20', '2018-03-02 23:28:20'),
('14592', '5', '2018-03-03 01:25:37', '2018-03-03 01:25:37'),
('14596', '5', '2018-03-03 01:25:52', '2018-03-03 01:25:52'),
('14597', '19', '2018-03-02 23:26:36', '2018-03-02 23:26:36'),
('14598', '19', '2018-03-02 23:26:43', '2018-03-02 23:26:43'),
('14605', '16', '2018-03-03 02:03:04', '2018-03-03 02:03:04'),
('14610', '2', '2018-03-03 01:52:34', '2018-03-03 01:52:34'),
('14620', '19', '2018-03-02 23:39:12', '2018-03-02 23:39:12'),
('14623', '19', '2018-03-02 23:26:30', '2018-03-02 23:26:30'),
('14636', '15', '2018-03-03 01:57:19', '2018-03-03 01:57:19'),
('14643', '2', '2018-03-03 01:09:27', '2018-03-03 01:09:27'),
('14645', '16', '2018-03-03 00:58:42', '2018-03-03 00:58:42'),
('14651', '19', '2018-03-03 01:40:51', '2018-03-03 01:40:51'),
('14653', '2', '2018-03-03 01:09:57', '2018-03-03 01:09:57'),
('14669', '19', '2018-03-03 01:19:29', '2018-03-03 01:19:29'),
('14689', '12', '2018-03-03 01:13:07', '2018-03-03 01:13:07'),
('14690', '16', '2018-03-03 00:59:01', '2018-03-03 00:59:01'),
('14691', '19', '2018-03-02 23:26:18', '2018-03-02 23:26:18'),
('14698', '19', '2018-03-03 00:12:10', '2018-03-03 00:12:10'),
('14707', '19', '2018-03-03 00:11:43', '2018-03-03 00:11:43'),
('14709', '13', '2018-03-03 01:40:13', '2018-03-03 01:40:13'),
('14713', '16', '2018-03-03 01:47:50', '2018-03-03 01:47:50'),
('14715', '19', '2018-03-03 00:13:40', '2018-03-03 00:13:40'),
('16mects013', '19', '2018-03-03 01:25:15', '2018-03-03 01:25:15'),
('17mects011', '12', '2018-03-03 00:14:17', '2018-03-03 00:14:17'),
('17mects013', '12', '2018-03-03 00:14:32', '2018-03-03 00:14:32'),
('2', '1', '2018-03-02 05:08:56', '2018-03-02 05:08:56'),
('2409', '20', '2018-03-03 01:34:43', '2018-03-03 01:34:43'),
('2498', '7', '2018-03-03 01:23:16', '2018-03-03 01:23:16'),
('2531', '2', '2018-03-03 01:24:15', '2018-03-03 01:24:15'),
('3', '2', '2018-03-02 05:09:18', '2018-03-02 05:09:18'),
('31279', '19', '2018-03-03 01:12:46', '2018-03-03 01:12:46'),
('31421', '13', '2018-03-03 02:01:01', '2018-03-03 02:01:01'),
('31425', '8', '2018-03-03 02:00:47', '2018-03-03 02:00:47'),
('34101', '11', '2018-03-03 01:39:27', '2018-03-03 01:39:27'),
('34104', '11', '2018-03-03 01:39:38', '2018-03-03 01:39:38'),
('34106', '11', '2018-03-03 01:34:52', '2018-03-03 01:34:52'),
('36275', '15', '2018-03-03 01:58:15', '2018-03-03 01:58:15'),
('40885', '11', '2018-03-03 01:34:04', '2018-03-03 01:34:04'),
('40903', '11', '2018-03-03 01:32:42', '2018-03-03 01:32:42'),
('47499', '20', '2018-03-03 02:02:37', '2018-03-03 02:02:37'),
('47537', '19', '2018-03-03 02:02:47', '2018-03-03 02:02:47'),
('47553', '20', '2018-03-03 02:02:55', '2018-03-03 02:02:55'),
('55302', '3', '2018-03-03 01:30:23', '2018-03-03 01:30:23'),
('57104', '5', '2018-03-03 01:31:29', '2018-03-03 01:31:29'),
('58019', '15', '2018-03-03 01:39:16', '2018-03-03 01:39:16'),
('88002', '16', '2018-03-03 01:35:50', '2018-03-03 01:35:50'),
('886', '11', '2018-03-03 01:31:55', '2018-03-03 01:31:55'),
('897', '11', '2018-03-03 01:32:20', '2018-03-03 01:32:20'),
('93002', '6', '2018-03-03 01:35:20', '2018-03-03 01:35:20'),
('les1191', '2', '2018-03-03 01:42:58', '2018-03-03 01:42:58'),
('LES1196', '12', '2018-03-03 01:36:31', '2018-03-03 01:36:31'),
('les1197', '8', '2018-03-03 01:58:46', '2018-03-03 01:58:46'),
('LES1199', '2', '2018-03-02 23:45:14', '2018-03-02 23:45:14'),
('les1206', '13', '2018-03-03 00:18:58', '2018-03-03 00:18:58'),
('LES1207', '2', '2018-03-02 23:34:59', '2018-03-02 23:34:59'),
('LES1213', '10', '2018-03-02 23:10:14', '2018-03-02 23:10:14'),
('les1217', '11', '2018-03-03 01:43:26', '2018-03-03 01:43:26'),
('les1220', '13', '2018-03-03 01:31:17', '2018-03-03 01:31:17'),
('LES1221', '5', '2018-03-02 23:30:06', '2018-03-02 23:30:06'),
('LES1225', '5', '2018-03-02 23:29:59', '2018-03-02 23:29:59'),
('les1226', '13', '2018-03-03 01:31:24', '2018-03-03 01:31:24'),
('les1227', '13', '2018-03-03 01:31:10', '2018-03-03 01:31:10'),
('les1229', '13', '2018-03-03 00:21:02', '2018-03-03 00:21:02'),
('les1232', '8', '2018-03-03 01:56:34', '2018-03-03 01:56:34'),
('LES1233', '18', '2018-03-02 23:58:46', '2018-03-02 23:58:46'),
('LES1234', '13', '2018-03-02 23:35:16', '2018-03-02 23:35:16'),
('les1238', '2', '2018-03-03 01:59:14', '2018-03-03 01:59:14'),
('les1241', '1', '2018-03-03 02:00:31', '2018-03-03 02:00:31'),
('LES1243', '16', '2018-03-02 23:59:30', '2018-03-02 23:59:30'),
('les1246', '17', '2018-03-03 01:12:39', '2018-03-03 01:12:39'),
('les1248', '2', '2018-03-03 01:41:01', '2018-03-03 01:41:01'),
('les1250', '11', '2018-03-03 01:41:12', '2018-03-03 01:41:12'),
('les1256', '8', '2018-03-03 01:45:26', '2018-03-03 01:45:26'),
('LES1258', '2', '2018-03-02 23:34:51', '2018-03-02 23:34:51'),
('les1260', '8', '2018-03-03 01:45:32', '2018-03-03 01:45:32'),
('les1264', '11', '2018-03-03 01:41:08', '2018-03-03 01:41:08');
INSERT INTO `votes` (`roll_no`, `photo_id`, `created_at`, `updated_at`) VALUES
('les1267', '2', '2018-03-03 01:36:10', '2018-03-03 01:36:10'),
('les1268', '8', '2018-03-03 01:45:46', '2018-03-03 01:45:46'),
('les1271', '11', '2018-03-03 01:42:18', '2018-03-03 01:42:18'),
('les1272', '8', '2018-03-03 01:43:08', '2018-03-03 01:43:08'),
('les1275', '13', '2018-03-03 00:20:29', '2018-03-03 00:20:29'),
('les1284', '13', '2018-03-03 01:40:26', '2018-03-03 01:40:26'),
('LES1287', '13', '2018-03-02 23:45:29', '2018-03-02 23:45:29'),
('les1288', '17', '2018-03-03 01:12:09', '2018-03-03 01:12:09'),
('les1291', '11', '2018-03-03 01:42:27', '2018-03-03 01:42:27'),
('les1296', '13', '2018-03-03 01:31:04', '2018-03-03 01:31:04'),
('LES1302', '5', '2018-03-02 23:24:17', '2018-03-02 23:24:17'),
('LES1305', '5', '2018-03-02 23:29:03', '2018-03-02 23:29:03'),
('LES1306', '5', '2018-03-02 23:24:08', '2018-03-02 23:24:08'),
('LES1315', '4', '2018-03-03 01:03:01', '2018-03-03 01:03:01'),
('LES1320', '12', '2018-03-02 23:30:15', '2018-03-02 23:30:15'),
('les1321', '5', '2018-03-03 01:08:24', '2018-03-03 01:08:24'),
('LES1327', '5', '2018-03-02 23:33:00', '2018-03-02 23:33:00'),
('les1336', '5', '2018-03-03 01:17:28', '2018-03-03 01:17:28'),
('les1353', '5', '2018-03-03 01:46:04', '2018-03-03 01:46:04'),
('les1355', '1', '2018-03-03 01:48:53', '2018-03-03 01:48:53'),
('les13557', '11', '2018-03-03 01:50:00', '2018-03-03 01:50:00'),
('les1356', '1', '2018-03-03 01:49:48', '2018-03-03 01:49:48'),
('les1358', '4', '2018-03-03 01:35:04', '2018-03-03 01:35:04'),
('LES1360', '4', '2018-03-03 01:03:09', '2018-03-03 01:03:09'),
('LES1365', '5', '2018-03-02 23:56:20', '2018-03-02 23:56:20'),
('LES1367', '5', '2018-03-02 23:54:59', '2018-03-02 23:54:59'),
('LES1384', '5', '2018-03-03 00:56:16', '2018-03-03 00:56:16'),
('les1401', '16', '2018-03-03 01:39:14', '2018-03-03 01:39:14'),
('LES1410', '5', '2018-03-02 23:53:13', '2018-03-02 23:53:13'),
('LES1413', '5', '2018-03-03 00:01:48', '2018-03-03 00:01:48'),
('LES1415', '5', '2018-03-03 00:02:00', '2018-03-03 00:02:00'),
('les1416', '5', '2018-03-03 01:44:57', '2018-03-03 01:44:57'),
('LES1428', '5', '2018-03-03 00:02:43', '2018-03-03 00:02:43'),
('LES1446', '5', '2018-03-03 00:02:06', '2018-03-03 00:02:06'),
('LES1476', '5', '2018-03-02 23:55:16', '2018-03-02 23:55:16'),
('LES1477', '11', '2018-03-02 23:36:05', '2018-03-02 23:36:05'),
('les1486', '12', '2018-03-03 01:24:17', '2018-03-03 01:24:17'),
('lmc105', '11', '2018-03-03 01:09:04', '2018-03-03 01:09:04'),
('lmc107', '11', '2018-03-03 00:29:56', '2018-03-03 00:29:56'),
('lmc109', '11', '2018-03-03 01:12:31', '2018-03-03 01:12:31'),
('lmc111', '11', '2018-03-03 01:39:27', '2018-03-03 01:39:27'),
('lmc114', '11', '2018-03-03 01:13:39', '2018-03-03 01:13:39'),
('lmc118', '11', '2018-03-03 01:08:32', '2018-03-03 01:08:32'),
('lmc120', '11', '2018-03-03 01:38:45', '2018-03-03 01:38:45'),
('lmc121', '11', '2018-03-03 01:12:33', '2018-03-03 01:12:33'),
('lmc124', '11', '2018-03-03 00:30:02', '2018-03-03 00:30:02'),
('lmc125', '11', '2018-03-03 01:38:54', '2018-03-03 01:38:54'),
('lmc128', '11', '2018-03-03 00:29:43', '2018-03-03 00:29:43'),
('lmc129', '11', '2018-03-03 01:11:23', '2018-03-03 01:11:23'),
('lmc130', '11', '2018-03-03 01:11:07', '2018-03-03 01:11:07'),
('mca892', '11', '2018-03-03 01:39:21', '2018-03-03 01:39:21'),
('mca895', '11', '2018-03-03 01:39:34', '2018-03-03 01:39:34'),
('mca899', '11', '2018-03-03 01:11:31', '2018-03-03 01:11:31'),
('mca900', '11', '2018-03-03 01:13:58', '2018-03-03 01:13:58'),
('mca907', '16', '2018-03-03 00:29:22', '2018-03-03 00:29:22'),
('mca910', '16', '2018-03-03 00:53:56', '2018-03-03 00:53:56'),
('mca911', '16', '2018-03-03 00:31:38', '2018-03-03 00:31:38'),
('mca912', '16', '2018-03-03 00:31:32', '2018-03-03 00:31:32'),
('mca913', '16', '2018-03-03 00:54:28', '2018-03-03 00:54:28'),
('mca914', '16', '2018-03-03 00:54:12', '2018-03-03 00:54:12'),
('mca915', '16', '2018-03-03 01:41:47', '2018-03-03 01:41:47'),
('mca919', '16', '2018-03-03 00:54:19', '2018-03-03 00:54:19'),
('me2336', '5', '2018-03-03 01:23:29', '2018-03-03 01:23:29'),
('me2370', '14', '2018-03-03 01:23:40', '2018-03-03 01:23:40'),
('me2387', '6', '2018-03-03 01:23:17', '2018-03-03 01:23:17'),
('me2431', '5', '2018-03-03 01:23:52', '2018-03-03 01:23:52'),
('ms1236', '16', '2018-03-03 00:58:15', '2018-03-03 00:58:15'),
('ms1252', '16', '2018-03-03 00:58:09', '2018-03-03 00:58:09'),
('ms1262', '16', '2018-03-03 00:58:01', '2018-03-03 00:58:01'),
('ms1265', '16', '2018-03-03 01:50:30', '2018-03-03 01:50:30'),
('ms1266', '16', '2018-03-03 00:54:57', '2018-03-03 00:54:57'),
('ms1268', '16', '2018-03-03 01:50:17', '2018-03-03 01:50:17'),
('ms1278', '16', '2018-03-03 01:50:24', '2018-03-03 01:50:24'),
('ms1279', '16', '2018-03-03 01:50:12', '2018-03-03 01:50:12'),
('ms1280', '16', '2018-03-03 00:39:57', '2018-03-03 00:39:57'),
('ms1283', '16', '2018-03-03 00:39:37', '2018-03-03 00:39:37'),
('ms1293', '16', '2018-03-03 00:40:04', '2018-03-03 00:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE IF NOT EXISTS `years` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'II', '2018-02-19 11:12:54', '2018-02-19 11:12:55'),
(3, 'III', '2018-02-19 11:12:59', '2018-02-19 11:13:03'),
(4, 'IV', '2018-02-19 11:13:09', '2018-02-19 11:13:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
