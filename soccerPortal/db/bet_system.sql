-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Jan 2014 um 01:39
-- Server Version: 5.5.32
-- PHP-Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `bet_system`
--
CREATE DATABASE IF NOT EXISTS `bet_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bet_system`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bet`
--

CREATE TABLE IF NOT EXISTS `bet` (
  `betID` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_userID` int(11) NOT NULL,
  `Game_gameID` int(11) NOT NULL,
  `tipp` tinyint(4) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `quote` decimal(5,2) NOT NULL,
  `result` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`betID`),
  KEY `fk_Bet_User1_idx` (`User_userID`),
  KEY `fk_Bet_Game1_idx` (`Game_gameID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Daten für Tabelle `bet`
--

INSERT INTO `bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES
(1, 2, 2, 1, 200, '5.00', 1),
(2, 3, 3, 2, 300, '4.00', 0),
(3, 4, 4, 0, 100, '2.00', 0),
(4, 5, 5, 1, 200, '6.00', 1),
(5, 6, 6, 2, 300, '2.00', 1),
(6, 7, 7, 0, 100, '2.00', 1),
(7, 8, 8, 1, 200, '3.00', 0),
(8, 9, 9, 2, 300, '2.50', 0),
(9, 10, 10, 0, 100, '2.00', 0),
(10, 11, 11, 1, 200, '1.20', 0),
(11, 12, 12, 2, 300, '3.00', 1),
(12, 13, 1, 0, 100, '1.33', 0),
(13, 14, 2, 1, 200, '5.00', 1),
(14, 15, 3, 2, 300, '4.00', 0),
(15, 16, 4, 0, 100, '2.00', 0),
(16, 17, 5, 1, 200, '6.00', 1),
(17, 18, 6, 2, 300, '2.00', 1),
(18, 19, 7, 0, 100, '2.00', 1),
(19, 20, 8, 1, 200, '3.00', 0),
(20, 21, 9, 2, 300, '2.50', 0),
(21, 22, 10, 0, 100, '2.00', 0),
(22, 23, 11, 1, 200, '1.20', 0),
(23, 24, 12, 2, 300, '3.00', 1),
(24, 25, 1, 0, 100, '1.33', 0),
(25, 26, 2, 1, 200, '5.00', 1),
(26, 27, 3, 2, 300, '4.00', 0),
(27, 28, 4, 0, 100, '2.00', 0),
(28, 29, 5, 1, 200, '6.00', 1),
(29, 30, 6, 2, 300, '2.00', 1),
(30, 1, 7, 0, 100, '2.00', 1),
(31, 2, 8, 1, 200, '3.00', 0),
(32, 3, 9, 2, 300, '2.50', 0),
(33, 4, 10, 0, 100, '2.00', 0),
(34, 5, 11, 1, 200, '1.20', 0),
(35, 6, 12, 2, 300, '3.00', 1),
(36, 7, 1, 0, 100, '1.33', 0),
(37, 8, 2, 1, 200, '5.00', 1),
(38, 9, 3, 2, 300, '4.00', 0),
(39, 10, 4, 0, 100, '2.00', 0),
(40, 11, 5, 1, 200, '6.00', 1),
(41, 12, 6, 2, 300, '2.00', 1),
(42, 13, 7, 0, 100, '2.00', 1),
(43, 14, 8, 1, 200, '3.00', 0),
(44, 15, 9, 2, 300, '2.50', 0),
(45, 16, 10, 0, 100, '2.00', 0),
(46, 17, 11, 1, 200, '1.20', 0),
(47, 18, 12, 2, 300, '3.00', 1),
(48, 19, 1, 0, 100, '1.33', 0),
(49, 20, 2, 1, 200, '5.00', 1),
(50, 21, 3, 2, 300, '4.00', 0),
(51, 22, 4, 0, 100, '2.00', 0),
(52, 23, 5, 1, 200, '6.00', 1),
(53, 24, 6, 2, 300, '2.00', 1),
(54, 25, 7, 0, 100, '2.00', 1),
(55, 26, 8, 1, 200, '3.00', 0),
(56, 27, 9, 2, 300, '2.50', 0),
(57, 28, 10, 0, 100, '2.00', 0),
(58, 29, 11, 1, 200, '1.20', 0),
(59, 30, 12, 2, 300, '3.00', 1),
(60, 1, 1, 0, 100, '1.33', 0),
(61, 2, 2, 1, 200, '5.00', 1),
(62, 3, 3, 2, 300, '4.00', 0),
(63, 4, 4, 0, 100, '2.00', 0),
(64, 5, 5, 1, 200, '6.00', 1),
(65, 6, 6, 2, 300, '2.00', 1),
(66, 7, 7, 0, 100, '2.00', 1),
(67, 8, 8, 1, 200, '3.00', 0),
(68, 9, 9, 2, 300, '2.50', 0),
(69, 10, 10, 0, 100, '2.00', 0),
(70, 11, 11, 1, 200, '1.20', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bet_statistic`
--

CREATE TABLE IF NOT EXISTS `bet_statistic` (
  `user_userID` int(11) NOT NULL,
  `betcount` int(11) NOT NULL DEFAULT '0',
  `singlebetwin` int(11) NOT NULL DEFAULT '0',
  `combibetwin` int(11) NOT NULL DEFAULT '0',
  `betwin` int(11) NOT NULL DEFAULT '0',
  `betloose` int(11) NOT NULL DEFAULT '0',
  `win_betamount` int(11) NOT NULL DEFAULT '0',
  `bet_statisticcol` varchar(45) DEFAULT '0',
  PRIMARY KEY (`user_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blocked`
--

CREATE TABLE IF NOT EXISTS `blocked` (
  `User_userId` int(11) NOT NULL,
  `free_date` datetime NOT NULL,
  `block_date` datetime NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`User_userId`),
  KEY `fk_Blocked_User1_idx` (`User_userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `blocked`
--

INSERT INTO `blocked` (`User_userId`, `free_date`, `block_date`, `description`) VALUES
(2, '2019-03-20 13:00:00', '2003-06-20 14:00:00', 'troll'),
(6, '2019-11-20 13:00:00', '2011-11-20 14:00:00', 'test'),
(8, '2011-11-20 12:00:00', '2011-11-20 14:00:00', 'test2'),
(13, '2011-11-20 10:00:00', '2011-11-20 15:00:00', 'test3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `combibet`
--

CREATE TABLE IF NOT EXISTS `combibet` (
  `combibetID` int(11) NOT NULL AUTO_INCREMENT,
  `User_userID` int(11) NOT NULL,
  PRIMARY KEY (`combibetID`),
  KEY `fk_Combibet_User1_idx` (`User_userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `combibet`
--

INSERT INTO `combibet` (`combibetID`, `User_userID`) VALUES
(4, 1),
(13, 1),
(5, 2),
(14, 4),
(16, 4),
(1, 5),
(3, 5),
(8, 5),
(6, 7),
(7, 11),
(9, 13),
(10, 15),
(11, 20),
(12, 22),
(2, 28),
(15, 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `complaintID` int(11) NOT NULL AUTO_INCREMENT,
  `User_userID1` int(11) NOT NULL,
  `User_userID2` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`complaintID`),
  KEY `fk_Complaint_User1_idx` (`User_userID1`),
  KEY `fk_Complaint_User2_idx` (`User_userID2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `complaint`
--

INSERT INTO `complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES
(1, 13, 16, 0, 'beschwerde1'),
(2, 12, 13, 1, 'beschwerde2'),
(3, 2, 4, 0, 'beschwerde3'),
(4, 5, 12, 0, 'beschwerde4'),
(5, 12, 3, 1, 'beschwerde5'),
(6, 12, 7, 0, 'beschwerde 6'),
(7, 14, 5, 1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.'),
(8, 5, 18, 0, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contest`
--

CREATE TABLE IF NOT EXISTS `contest` (
  `contestID` int(11) NOT NULL,
  `sport_sportID` int(11) NOT NULL,
  `titel` varchar(45) NOT NULL,
  `description` text,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`contestID`,`sport_sportID`),
  KEY `fk_contest_sport1_idx` (`sport_sportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `contest`
--

INSERT INTO `contest` (`contestID`, `sport_sportID`, `titel`, `description`, `begin_date`, `end_date`) VALUES
(1, 1, 'WM 2013', 'Weltmeisterschaft des Jahres 2013', '2001-01-20 13:00:00', '2031-12-20 13:00:00'),
(2, 1, 'WM 2014', 'Weltmeisterschaft des Jahres 2014', '2001-01-20 14:00:00', '2031-12-20 14:00:00'),
(3, 1, 'WM 2015', 'Weltmeisterschaft des Jahres 2015', '2001-01-20 15:00:00', '2031-12-20 15:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contest_has_team`
--

CREATE TABLE IF NOT EXISTS `contest_has_team` (
  `Contest_contestID` int(11) NOT NULL,
  `Team_teamID` int(11) NOT NULL,
  `section_SectionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Contest_contestID`,`Team_teamID`),
  KEY `fk_contest_has_Team_Team1_idx` (`Team_teamID`),
  KEY `fk_contest_has_Team_contest1_idx` (`Contest_contestID`),
  KEY `section_SectionID` (`section_SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `contest_has_team`
--

INSERT INTO `contest_has_team` (`Contest_contestID`, `Team_teamID`, `section_SectionID`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 6, NULL),
(1, 7, NULL),
(1, 8, NULL),
(2, 1, NULL),
(2, 3, NULL),
(2, 4, NULL),
(2, 5, NULL),
(2, 8, NULL),
(3, 1, NULL),
(3, 5, NULL),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 12, 1),
(2, 13, 2),
(2, 14, 2),
(2, 15, 2),
(2, 16, 2),
(2, 17, 3),
(2, 18, 3),
(2, 19, 3),
(2, 20, 3),
(2, 21, 4),
(2, 22, 4),
(2, 23, 4),
(2, 24, 4),
(2, 25, 5),
(2, 26, 5),
(2, 27, 5),
(2, 28, 5),
(2, 29, 6),
(2, 30, 6),
(2, 31, 6),
(2, 32, 6),
(2, 33, 7),
(2, 34, 7),
(2, 35, 7),
(2, 36, 7),
(2, 37, 8),
(2, 38, 8),
(2, 39, 8),
(2, 40, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cupons`
--

CREATE TABLE IF NOT EXISTS `cupons` (
  `cuponsID` int(11) NOT NULL AUTO_INCREMENT,
  `User_userID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `code` varchar(8) NOT NULL,
  PRIMARY KEY (`cuponsID`),
  KEY `fk_Cupons_User1_idx` (`User_userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Daten für Tabelle `cupons`
--

INSERT INTO `cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES
(1, 1, 1000, 'abcdef01'),
(2, 2, 1000, 'abcdef02'),
(3, 3, 1000, 'abcdef03'),
(4, 4, 1000, 'abcdef04'),
(5, 5, 1000, 'abcdef05'),
(6, 6, 1000, 'abcdef06'),
(7, 7, 1000, 'abcdef07'),
(8, 8, 1000, 'abcdef08'),
(9, 9, 1000, 'abcdef09'),
(10, 10, 1000, 'abcdef10'),
(11, 11, 1000, 'abcdef11'),
(12, 12, 1000, 'abcdef12'),
(13, 13, 1000, 'abcdef13'),
(14, 14, 1000, 'abcdef14'),
(15, 15, 1000, 'abcdef15'),
(16, 16, 1000, 'abcdef16'),
(17, 17, 1000, 'abcdef17'),
(18, 18, 1000, 'abcdef18');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `User_userID1` int(11) NOT NULL,
  `User_userID2` int(11) NOT NULL,
  `isonline` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`User_userID1`,`User_userID2`),
  KEY `fk_User_has_User_User2_idx` (`User_userID2`),
  KEY `fk_User_has_User_User1_idx` (`User_userID1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `friend`
--

INSERT INTO `friend` (`User_userID1`, `User_userID2`, `isonline`) VALUES
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(2, 5, 0),
(2, 6, 0),
(2, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 0),
(4, 11, 0),
(4, 12, 0),
(4, 13, 0),
(4, 14, 0),
(5, 1, 0),
(5, 2, 0),
(5, 3, 0),
(5, 4, 0),
(5, 5, 0),
(5, 6, 0),
(5, 7, 0),
(5, 8, 0),
(5, 9, 0),
(5, 10, 0),
(5, 11, 0),
(5, 12, 0),
(5, 13, 0),
(5, 14, 0),
(5, 15, 0),
(5, 16, 0),
(5, 17, 0),
(5, 18, 0),
(5, 19, 0),
(5, 20, 0),
(5, 21, 0),
(5, 22, 0),
(5, 23, 0),
(5, 24, 0),
(5, 25, 0),
(5, 26, 0),
(5, 27, 0),
(5, 28, 0),
(5, 29, 0),
(5, 30, 0),
(6, 16, 0),
(7, 17, 0),
(8, 18, 0),
(9, 19, 0),
(10, 20, 0),
(11, 21, 0),
(12, 22, 0),
(12, 23, 0),
(12, 24, 0),
(13, 25, 0),
(13, 26, 0),
(13, 27, 0),
(14, 28, 0),
(14, 29, 0),
(14, 30, 0),
(15, 1, 0),
(15, 2, 0),
(15, 3, 0),
(16, 4, 0),
(16, 5, 0),
(16, 6, 0),
(17, 7, 0),
(17, 8, 0),
(17, 9, 0),
(18, 10, 0),
(18, 11, 0),
(18, 12, 0),
(19, 13, 0),
(19, 14, 0),
(19, 15, 0),
(20, 16, 0),
(20, 17, 0),
(20, 18, 0),
(21, 19, 0),
(21, 20, 0),
(21, 21, 0),
(22, 22, 0),
(22, 23, 0),
(22, 24, 0),
(23, 25, 0),
(23, 26, 0),
(23, 27, 0),
(24, 28, 0),
(24, 29, 0),
(24, 30, 0),
(25, 1, 0),
(25, 2, 0),
(25, 3, 0),
(26, 4, 0),
(26, 5, 0),
(26, 6, 0),
(27, 7, 0),
(27, 8, 0),
(27, 9, 0),
(28, 10, 0),
(28, 11, 0),
(28, 12, 0),
(29, 13, 0),
(29, 14, 0),
(29, 15, 0),
(30, 16, 0),
(30, 17, 0),
(30, 18, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `Team_home` int(11) NOT NULL,
  `Team_guest` int(11) NOT NULL,
  `Season_seasonID` int(11) NOT NULL,
  `quote_home` decimal(5,2) NOT NULL,
  `quote_guest` decimal(5,2) NOT NULL,
  `quote_draw` decimal(5,2) NOT NULL,
  `date` datetime NOT NULL,
  `iscombiebet` tinyint(1) NOT NULL,
  `resHome` tinyint(4) DEFAULT NULL,
  `resGuest` tinyint(4) DEFAULT NULL,
  `result` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`gameID`),
  KEY `fk_Partie_Team_home_idx` (`Team_home`),
  KEY `fk_Partie_Team_guest_idx` (`Team_guest`),
  KEY `fk_Game_Season1_idx` (`Season_seasonID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Daten für Tabelle `game`
--

INSERT INTO `game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES
(1, 1, 2, 1, '4.00', '2.50', '1.33', '2010-10-20 13:00:00', 1, 3, 2, 1),
(2, 3, 4, 1, '5.00', '3.00', '2.00', '2010-10-20 13:00:00', 1, 5, 1, 1),
(3, 5, 6, 2, '1.20', '4.00', '1.30', '2010-10-20 14:00:00', 1, 1, 1, 0),
(4, 7, 8, 2, '2.00', '3.00', '2.00', '2010-10-20 14:00:00', 1, 1, 2, 2),
(5, 2, 1, 1, '6.00', '1.50', '1.33', '2020-10-20 13:00:00', 0, 3, 2, 1),
(6, 4, 3, 1, '4.00', '2.00', '1.50', '2020-10-20 13:00:00', 0, 1, 5, 2),
(7, 6, 5, 2, '1.80', '3.00', '2.00', '2020-10-20 14:00:00', 0, 1, 1, 0),
(8, 8, 7, 2, '3.00', '1.20', '1.10', '2010-10-20 14:00:00', 1, 2, 2, 0),
(9, 1, 2, 3, '4.00', '2.50', '1.33', '2010-10-20 15:00:00', 1, 3, 2, 1),
(10, 3, 4, 3, '5.00', '3.00', '2.00', '2010-10-20 15:00:00', 1, 5, 1, 1),
(11, 5, 6, 3, '1.20', '4.00', '1.30', '2010-10-20 15:00:00', 1, 1, 1, 0),
(12, 7, 8, 3, '2.00', '3.00', '2.00', '2010-10-20 15:00:00', 0, 1, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  `imgdata` blob NOT NULL,
  `imgtype` varchar(20) NOT NULL,
  PRIMARY KEY (`imageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `image`
--

INSERT INTO `image` (`imageID`, `name`, `description`, `imgdata`, `imgtype`) VALUES
(1, 'keins', 'kein Bild', 0x89504e470d0a1a0a0000000d4948445200000046000000460806000000712ee2840000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000036469545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e302d633036302036312e3133343737372c20323031302f30322f31322d31373a33323a30302020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d704d4d3a4f726967696e616c446f63756d656e7449443d22786d702e6469643a32433246343232413243353545333131393043303839453944453832393344412220786d704d4d3a446f63756d656e7449443d22786d702e6469643a34363833324538463541423631314533414635354231303541343531444636412220786d704d4d3a496e7374616e636549443d22786d702e6969643a34363833324538453541423631314533414635354231303541343531444636412220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204353352057696e646f7773223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4334414232344235394435414533313142373839424142434132393236464432222073745265663a646f63756d656e7449443d22786d702e6469643a3243324634323241324335354533313139304330383945394445383239334441222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8953e80a00001f084944415478dadc5c797c14e5ddffceec994db2b90890031210210412624140b922b4400b28b6d4e20de201a216b515b5ad4dadaf62a1120ba256fb822f02221e140a2a5648384441240720204202841039721f7bccecfb7b9e99d97d76b281d0d7bfdeddcf2fbfb9779eeffceee73791028100fe0f1f89c8b8804ca476b0addd47511417fd76362da611ef6edc07e3440a5109d15997cb75da7c6e7d7dbd711c4ce7452455552fb93fd231d27f008ca493aa0f1cc2724027d9bc9f7e6724235a1e457c3051b748838a30481f6dda477c27d10e9d5fbcdc40af1408f3f6ce02631e6840e07207e7c411dda183318578542781b8a404e8fbca89de23da44b4ef87941463dbe5803103d2d1310101ac094463e8bab31938e681761688cba987407b8856a6ffa4fb52284c47e93c55e39c68f9bb1d159d9694cba9922819d265ec8b71ec54a29f11cdbc1c18ecd3e269c1e1ca6f70e642156a6a6be842017610bfa22ccb18909983e4b8ae48494ce92c40cc26adce9890b6d00cd0b79f1defb4a45c0a18b3ba481d4888b1fd6aa2fb89e6750406fb7c7d741fb6971661c781ed283bbe1f357504861ce05791e81b90f463a57045b559edc8cd1c84a1570fc3f07ed7e3dabe431113157b2980980d5a7ad5cf32d67270888e7efcdd6581b89c8d1155461cbcdc01780f10bd481415098c83270e60ddb6b5585bbc1a672e56f1b33800920e00ad4b92b64dd210222badb6b362fc72aab6ecb43a3136e7c7b8f9ba691833f006582dd68e06bb84e8d17e93af52bed9f06da7a4e4723646be846a19cb6c582b88a6479292ed254558f8ce02ec3ab41312038324834b0707460d5e41a5af244b9a1a09b2c9c111cdbb000ce31c3ba26eb1dd317be25cfcfcfa6988b2bb220df010f18789b65e0a8c48eb223072076e59dcc7d687102d21bac62c2565c74af1c4ab8fe1ebeff641b20880b0653612e22a01139298800682d45e6183e0e8141080811a6e43e29cf19837f9714c1f7d7b4786f519e27fee2c3806305207764404c758bf9d682151822825f5cdf578f61fcf606dd11a7df00ae7b01259e8072d0128b2a2490c8d4a913475613760fc02573184a497ef13801141092821700c3bc278564a360aa6ff19037ae644026719f1b99702c3ec953a521d1114c6e73250cc52f2d5a1bdf8f5cb7351555b05890341073bc862d8e8c72c9a94280c2899430295b8c2466161e76b37a3f835105431480e0852a30a52a386dcb0010827bfb62eab16cc9df030ee1d3f3b9254bc43fcd6ce488d088c283922288cee247acd6c4bfeb1f10d2c5af3229708c900c449a4ab906255b94d61eaa3487e2e490ca480a4498df655b80156153ad6072e3541f526a630c989a4468a4962fcfab25f5b1e7ed5f55834f365386d4ef3e09713bfe77252d31130564172c6d331a423701a37aca80afe6bf99ff1ced655b0d82c906d12ac51560d14a64ab2ca2542a13b642a14a0751ffc1c203f2da9b2c2a58601e40f689c7df94d7935900cf509aad4a5d4c8040ae704729fe4abb1f89ea5e81ad7ad43b5ea486a0c6064936d31b625e9f9498621254cbc7ffbf263d8baffdfb03aacb039adb0ba08149ba6469c981ac99aa4f87549f1c2c381f2b3bf12c14477cfa527a068d2c301d26e4e6953b581d25752a590d498d54804c450275f3838c9d15df1eafd6f223531cd3cf83944af752435918031c842fbd6114d3040619f82bf3f83cd5f6c849500b13becb0c510380e1bb72fb25de6b684a9918f0061cbde808703c124c647cb6c89a9150388edd39489ad69e070c951e9063d011d002dc6e15264b62ba294281a102228064f77f7c0927b5f4717771733007944a51d016311d448d2d548a6ed4f113d2dc639afbcbb046f7ff2161c510e92141becd17644c546c16a93215b640247e2f686ab08a90b07814142c0b405da68c94b5ffaabb6e9fb3470184c5c99021a4cece6f80db6696a2591e354d540505ac254c81f02270c149f204144bd93fa60d9fd6f046d8e0ec0ee9123475e6f8c6fdbb66d41602c050505062016435268673ef157838688ac63d1574558fcce22b8a25d70baa2388f898b86d31185a82817919382ac285a27d04892ac562b1c761b64abcced8ec56ad1833cba1e6d0b90c75248dd0c9b24f15fa79bb26ac7c804b22a690f85012ec9e1be52d20902d78367ed1c293c9fa96dba88eaf3d518d57f8c084c8f8a8a0a7f6666e60e76ccf1e3c7c324c66a5221aba228eb74a3cb2f7abae634663e7b170d4c81333a8a83104da0c4c6c490f1b5c2e97468005014cb06e521b9f06bcac3bfad6a33da686b5ba085965b68c943bc95ab9637a01f475c61768644c2affaf5a49284a3455321455725b30a891263488721357cd92b4810d143e3e7e1a6a13f37db9551e3c68ddbf9e9a79f06b75bcdf10b81f200ed181f0c27e8a0856fbdc045dce974728a8e8e46823b11510488c3e1e45262210961e0b047e4251d602ad3a236c14383974915981195742fa3dd101ba866cc03dcc2c83c2952685da663d956665fe0d4062d2b125f372ca2966385248627767a5e2589318f35dcd5bfb9f5755cd76f0492dd5d5915d1006616eddd1954615d9544d72cd38ec5acd4c8d4871df0f1e71fe1fd6def91fa38b9fa44bb5c888f4b803b2616eee838c4c52450b61bc3975d4e17ec361b6c3607e756521f99887927d92271f5e1168dc538328dd6aa0581cc9df3e8588f98258bc4cf615cd2dd02974693ea485278fe1291eb6edfe07e9f1f5517aa909f3d560426efd8b163fb69f9885962b8f6fafdfed9cc521b21b9c7ebc16beb5ee15ec7e1707062f6c445e024c42422c64580c4b83920369b9ddfa89764d743c6b5c9d7048b6225b240b1f8b874f829fe616aa2a83e245813d133360389ce64748feace0d71adf7223e3fbf1d65f5fbb9d470ef240742551f1a1d33f2aa4f0d562782558a407b896199077f10aa6e4175fec5779fe3c0c932f4ed9e25da9b9b8936445225e689c2b2e50f3f7b1ff52df570c5b081db101d150d1701e38e7223d6158b447712126313394876bb83ab478bbf190dde0658bd76c83e32b2fe00dc16857b9721c9c33030311759f103e0b246e358e35134f8eb71a8b10c431286232b76001e2f9f83b2160d1845d5226aeea675c31b50d4a04804c1314a13624e650d016100c40492733a66f9f637f1c22d8b20a8cf0ca25769794f18303e9f8f15ab071bc0787d5eacd9b21a168b8583c2bc8cd5c63c8d83d4c64d2a148f9484540225015d6293e120f561c6b3c9db045b8b4df32a6de48e250fbabbfb6262e664382c4e6c39b309ffaafe005fd4ee424b808c72a015bfcb7a8e83f241f51aac3bfbb676aeaa0d40566428366dc522d3b2202d30ea5a11a424c82dba6b9775a9d1970f5695a3bcb214fdd30688867892088cac833156cc838af716e17ced3972c931bcd4c8c0b1596d70dac9d8925b8e71c670c9e91e978258a79b03c852059bc5a6a91419df3652a954f7208c4c1b83bde77663c3a9f770ce578306b5811798c802e12f59af6074d258acaf7917f3bf7d9822682934efc02545e54f9a5d54a564939dc34cb50148580e25aa8d08860090561fd27e6253c94664a5660781213e8df81f0d60b8e0d1ca143149dc50bc9e1b3ff694985e3bb8e7b170001867815234195d97239a03c6a253b68f7d9cb636b86c51e81a3d103ddd3db1b97203caeaf621c61e8349193763e3d9f771b0a914f37b17705016553c87e56796f1e8994b09af62593417cd0668d30cad4ca3e2c52dc396a88294a8c2e02d11a4c5440cd83d2776a3b1b59124d9610093cd663588efe4d879bddedeb492650053d750873de55f86c7c37aad84490f8b3118b7c8567eb312dabb871eee0c64b833b1f5f4169c68fa0e4e6b147eddff492439ba700f7363ea348c4f9e8c870fcf4471c316c43adcfcc97297cf9e2ad9258b4d7b30466d47b208f9982009a1d054581641902317529823d87d7467d0cee8c480d10e61018e9861eefc7a07b7171a1c81b08bb2ed2aa98c4fa138c543718abf4d0fcc02fc69fa697bac9d0cb333097b6a76e39ce77b9e1cc6d9dd38d356c5aff9f3d45fa197ab0f9a95262ceafb1a36e66ec75bd91f904ac67217ce12521eed3217cf0646a0f48cc90c03270c2461f092593ac4a8586e0fe0bee37bccc0dcc8380f7f68e13ad1be7c59fe8596cce95f168479fdde6092d7e66b43435b039abdcda86fade73f6a97ed1c2056468877c6f36b79550f0fd852a253393055ada770d65b857f9e5b87a64003c6b64ec423e9f3f9b169f674aceaf72ffcead844d4fa2fc22dc5635ac2edb82e7a0c46c48dc1aeda62dcbeefa6901d89a01e6120180160847d4c0803fa64f2a13387b86d64a1812e18d7111e562bf77681c0085162f61edca3db3f959fc410f42b7e78152fdabcad68f1b5a08100a969aca11f91b88bb65bec5c327a25f40e6a557eda8f51dd5285ead62a2e4199d1576159c55f79d2c8ca11b352e6068f7da1fa193cd8ed716ceef7390eb69662bc7b324e7b2af1d1c50d7cff294f054675b9418b86f534a0beb50e6535251a081d002546c8413512eaffece19ea8398e9e4919628a30d84af6c54e0bbd45377deaec29385c764db498b410207ed5018fcfc325a7d5db82da965ac8369987f3511e16f1daf90f5f957875588ef1d1a90ddc95ff22fe56bc7dea4deca9ff5c2f332888b6c484d9a629c747e2a1e4f970cb6e8c3f3214654dfb916dcfc57d290fe3fef447381d682c45bdb70e71d678f4746562d227f9282770da8170a99aa41a2e41d5b567909ed0430cf6fa3160fa8b6a74acf25bf8fd3e9e9b5829726540d8141b07c5e6b7a189ec8aa5cdc22b77a40f94fc7911a3b849626c5ccc0f9c2bc3c0e45c2df96c3e4936a6069448e0c5237f4295b7522b3c485e44514cc30b51fa9d8f734fc4dac61578f6dc1350fc0a27b6eb406b0906efbb0a279b2ab8bb0e268a44ab86adc7826b0b31e95ff91db71e449aef08844fa556d756892e5b0386490b2f1feac09ca83a1e541f6e3348857c0414931a2f8163f111286d3237841e9e1d7bd0e86f4494238a0766fbcfb60681293ef36fd4fbea50ed3b43d93565d6f4f550c0e7937cb8a5fb9d747d3facbcf4078c8d9d8854b23315bee39a75d3a75898d7636a1490da4f25b36bd7b7d5857b4fe9d27d1a9211e308c79dad3b6b06a60f4b031244fb52575fa781428050eea4814280b479db38b57a5ad0e2d56c4c33494f1de9f9c5960ba86e3c830bc47bc56b36a6a2e1384a2f7c8d66b23f6d4a0b79a0666e8c19d9641beeeef600debfb03aecbeff90fc226202eee01cb63153c08ceffc8c02ae3ec66764723e6ecdbc1b2f9415b49f66e9e86311000984ea36cd6dcdfa981583c73189891155a9b1a55193184afe98bdb1f829c023927c12d91659abd0914bd5b2617ae2aa95ab1a4b34558a3d86a40ce3d7eae64a41823311c79abfa5b4a08d248540955a388d4b9ac88f79fee41f30ca3d8e4b0afbfc247612decbdc827b4e4c23c939c16f7249afe5f855f25d5a6c64cfc083253390e3cec3aae1eb31f7cb9938d95811198480a959057ad4ab84d68dddcccb8a250786099318bb8816d91c9ef069eaa47070288fe29976ab8794c1475e89106e6a6be22ebba9ad118d9e46ee2106260fe2811cfb44b1806ee09398983a9917b31b7d8de4bd5ad046714fb2ad1bbe6af882ec96174baa5e0c1b4fb63317bf8cbf931b4856c339d97622b86f53cd7adc9636031baf2fc253a5f3b0faf88af079a74004400211ec0cc2258cd94f532c13c3ea2f2da22ab1f09e81c2d48819406663d889864a3170984a351330ac95a3c9d3ccc16174e4dc37618374595df865afdbf1c6f0559895f920c526091ce083f565e8e7ca2697ab622d258ddfb494879d37206a102f2db0cc7cd3b97fe2f3ba62dc597a336e4d9d81a5b9cbf15499064a40354dfa9bc9d807ddb64450b780de2820a811e3f54c959ac41cc9e570718961c4c090c83ba95e9547a42c6761cb6c5e88726d38243b640a202c9498c8aa8c2f4f7d8e97762fc063d73d1936d0686b0ca6f5bc8dd3198a691a943ac45a2901b5a6e284f73bfca27c02165ffd3a26244ee1c70f24607879927ef220b9e7a78fcec3ca9cf588b3c5e3a1fd33b1ba6245874004e7bac504530a979280c926d92c76b3f16d6201de591198c4f8242da0238961f514f2acfc44ae6294e93a60e795362b3d0256fdd7809139802c0bfee0d0bb283f5f824786fe06d7741bd24ef553a3d2908a34bc7f660de550c7b5f92756c1139e62ba2343f31c01cd83b028b84754060765d58915ed6622c50e8880192ca30cea133aad444e146d8b3603738e15be0f8baa94999a199cc361c44a81cc35b37a0c8f384962ac943c3260ac94c4f014926c019318497f42a5d5fb316bf3edb8266d306eecf30b8ced311eb1b6d8e0c0df3fbd068f963dc0cb9ad1b4fdfddc2d18109b1bdccf326ffe5baa367db2f35c11765d28c6ecdef3b0ead88af07925c53458255c82b8c13526e4021188b6274577311bdf6356a7d359d9d2d212442bb55b1a2c9285eb1a9b3363a0c874735e0f057a04884a89067bc27e5666a0e358a19b81c238bf199b56c466a5809d95c5d851b58d7bb1ace46cf44bcce6f595b5a756f26bc4cab1f860480894838d6578f15801765d2cd602b94068b00fee9d811de34af0426e219edc332f0c94302e4ecac91dd81e9384254627b503c6b260c102b5bebe7eaad86bbb65d727b8d0704133587a1f8bd1c2c1022dadc70530a6e5fd7a88af7dfddaf42b2b2749fa3c23a5f7d5ad67505ebb9fa854fb71fa767574c3ef063c179414b63e2e7922af0f1fa0e358ea610c920572dfb79ec51f07bd402eba1265df9704a768e18f40c6dcaa38b5a208532bc6b40b998a1f678f87cbee12812960b3043201934d2b430d753a595d89fd87bf0e961c9838f2160d596bfc9174501848bca543d22640540d0e1ed1f2259e6dfbb552059f690cb57eb09ba8f35c44bc230183938605c171c84e8c48cac7cc8cd964cf9c28bf50429eac8d0fa2fc5c0932a27be1c9bc3fe2544325cacf96844fe41bdc70cfa6594af84c40d27a3c058d3f1938510485f510ff46d62604d45da29d19927dad9686331df73343ac15b37d646f8cf5c7a7ccc77f3ff03662c870f948cdfc5e8a92bd3eae728a4fe1ebcc60331bc5d6996d62a4705234774c37f6d4de47f1fad1bfb533d26e5b1ce667ff1165932bb0ecda15989432153d1d9998bf731e0e9c2fc5b21b9663644a7efbc1d367ed5debf1f4388a94edf1e1aa66eac462e76524669a63984f82ad66c78f1f4f247ec10086c52a63ee1ac16bb63c952192793390843b7e7a17e2e3e33179d88d283f558a91d96330e6f961bc1584972089f834abeede998d0a5855bdbb4a8b9879eb99ac86aa6d74eac0c44178e1dac518d16d4ca7dad31b3cf5f8d99a7c945695049fbed1f4d9333613afff72057a2664e2feff9e81ed078a288ad3d5c9e0acdda419f8d5b5b7a37f6ab6e8911e64b3055c137bf7ee7d9136ee3350b35bed1837ec275a04acc7342a055b4c5ad8fe91d9a3f1f6d6ff41654d05ea9a6bd123ae27498b9f4b82cfa3717ebc4f930e76233cfef10534b7e935b83e854a74e0fb524cd93416933fba019b2bff797950560ba0285ab981bb655aae6bacc36fdf9b8757fe5d8877e7aec7bb8fac87db191f262daa4f8bcefb74bbda2c313b99e39185a9d80f0dd4184dc9bfc9d4c1a4799b951fbdc5d17df19e4518d83317d317fe0217ea2f903b7693da682aa2e88030b50910187e022b088e01100385b57a78b527c8da3e148f8a1d9545b875f354e4bcdd0b4fed7a143bab8ad1e0ad0f82b2f354710814dd8806e798e83e73bbe661f7e325f8e491224c1e34153f7e6e346f5ee455457f78a7c480941cee59055098709487756d1e3e7cb81f2d1f167b44ee7ce2367c73fa90ae12e482ed92a65aa4166306d3cd9d2cc19b8f2e474eaf41fc693db1e6316c3eb001aaae3abc67c6a67536c01ab9806d1875496aff3e4bc0d4c6da2eb0137b81751bb37b5e09ee7f6b06fe7ee70ac4b90890a878f47d3013f5b575c15a0e5908ca1c81d9f90f2329264954a32788f33ec3a0c4646565b179dbbf8b11e0dd5367ea464aeb6c82d0c554fc751132923291933908fde7f4c6f0f983f1f48dcf209dd40a423149f5eabd75be500702930c462a1174550a44200814dc66b85a84de81f9686611ee1834838332fcf93c4cc9998aeddf14a1aca2044b3615a2bebe2ee4b5f46bf4ebda9f8322484b3dd15a633dac6393367c2a063a63aecdc755697d3830cc66b00b1bb683815376b404f54d94f738e2505b7f916ea414a3fa8cd180f087b75f70bb220eae0330029e4b80e4d32506da5c92119f949d2ec16bd39763e96785fcb8517df3313a2b1f75746fcfad290873d3ec78c92f6354bf7cb36d61d3b3272302939393f31e6d7c4f3c61fe3d4ff17c8881a3e880b041337018487f5ef927ec79693fd6fef6434c19721386f41a86334b2fe2d0f3c73169e04dba5d09e8a4494944a9f0844b88b8ce8ff50bd356aab6ceb6ff655221b61f29c22bdb5ec64337cc23371f4f36ef3c566f7f1bf7bd3c23d42fe3d70c2e5b1f9a391c5d62ba9833ea0fc5f5763dbe22304c6ab27af7c78d63a68672135f20080e036bc3f6f5183a270f4b3e28c4b4e7a762fca089183a3f0f3f7d6e2cee187e377252f2b8b4e0522ad281947052f4528aae3686379bd2772a0e3d55c1eddcc6afd6e38955f3b8fa542fabc5e9f3a751f8c1a21028cc0be960c75a6371fdd523cdd24209c0823de23673e3107ef4a31fadddbb77ef08bd079f1f34fb9607b1efd0573875fe64d02d729ba7cf50d6d6d561fbfe220cea9bc75d78e5990a6e5cef5d3603eb7eb31e19c964fc5ac885be3b0f3b8e1585a64d85172ddad56a8d295684a425ce118fbf4c2d4406c527a5a43e5a3742a8dfeeb72be6e1376fce0bc535a2a478c02b0093074fe549b0d01b53457ca1d1fa628c39e20b5ab463916e8cf841acc3e1d9079f4394252a7233a0aebba5474a505c5a842f17956034e9f0ef7f5ec0f5bcdf2399b865f1545e4f993c602a9e9e5880df4d2840060562ccbd8ad211d07b61e2c89bf4746772a33aaa673e1fd8c70f1461e3fef598f0d77c64c46762dba1cfb0707a21bfaee1f683f6cb2780d2a66d1fd5271f6909e9eda465e1c285170d600c7562b9523b60d2d3d3eb4f9e3c79d198e86707ba63e290969c8e9d5f6fd7722849ef523275306d2f2bc2a75f7f8c8cae99888b8ee7790e5baf6bae43df942c2cbabd10af7c5cc855a0f8e92f909b4e5e84e28da1bd86e3d36f3e0e763a5cf84b2b7253aee1c6fda1fc7970520ec58ebbff1f33f8a0fb76cb424373036a6acfe2c8c9c3a8397f36243d4ab8a430a0fa771f801bb2c799eb2eef2c5ab468be3186cd9b3777ee9dc81d3b76bc41fbef151bf93edab10985ab5f0ac625465c037d8e596b80d6d420de1d8f45b30b91db3b0fcfad2dc0a0abf2307a403e9f5918949187789756f51ffe2ca9e0c5f0a276f3eb0144dfaf35d7312ff3bb1b0b5079be82c725195d3251f97d0557d5fa86bab0770920aa8feec97a25f6c14d836fd65e180b81c202b9bcc58b17075f60983b776ea7df89445151d1663af0a76283f0faad1fe28df5af6980e8200481b2a25d30171f478349c9e405f3dfdf52a04dad56962037330f7327fc1aae1952bb77e9be7cb6042b77ace0c7dd316a06ca4e9460e94785dc0d17b3dc47155cb058a4f209a0d0be1e0919b879f03458648b595a461228bbc4b1ce993327b8df7ab9648d0e9aa9bfb5916f9c3465cc8d48884dc04b6f2fe4b518b1101f908cbeb55095ac8e8c737d4309972ae64247e7e423b7571ebe38bc1bb93df234713701c36cd36892149621affc6c859608d2b58a4b8ac2cb994224ac2a82b7a3e5ec9481189f3351eb2c0f2f44cd292c2cdc1561ac9d97185eb8dab2a52f7b539568a878f2816fcbb178cd4ba86dbe10cca445e96140c8117a56245968b98ed46e49b7f4eefcf5d8b8673d566e5d11aae40522d4740d409450640d8ad287f7be1ed75d3dc22c258c3ff9f2cb2fbf18699cf7dd77df950123c74ad8f4eee61fe9cd7b43c51f624d46cbd62dc5fe6ff705558bab901cb23dbc21481680904d1ce15ddd107aec822baa893340d47040186831b6584cca9b82d4843433208cff894029e8689cb366cdbab217d2e568890f62c39a8ddde8c45574ce38f393d8b97f07dedbba0edfd79d0d4a4f102093c4c8e6be157430e76c0646eb990eb32f868d6185f96b7a0cc6d03ec379d944bc3f22f62f11e6fced6f7f7be352e39c3973e61502e394824ffe83951fb2d9cb557481e9e627c26280e27ddbf0cfed1ff23691762d611d34f984812299e69fcd557d7f78a66da16f4e7a2e86f71d81285b54242939c66cca92254bfe7db971de7df7dd57060c2f370883529b0258b76edd7c3a7741041de63397c55f6dc3e6ddff42635b63a8bd4b50274936bd6d697e5d554558f766d0d8ea12c30cea80b41c5cd7ef7ade351a0110e355bf7b0894d6ce5405efb8e38e2bfba717ac174eec6f535bb573de79e71dd6c8f7a4de1fdbeee6d854ef8163e5f8f2d0173878a21c1ebfa76389317521848123484c7a620f64a5f547dfd42cfeb68bf9778d309f45b404c8d22bf96f1eb7dd76db95195f4992c23c0a7fc94af8ac5cb972167b5141ef5febe8e9a1b2ba02df9e3e8aaaf35538575783ea8bd51cbc8876867e22c9dd850781ec5f19f4e8d2136949e9bc8fb8a3eb136769cc4bec4d7d02e5e295fe9b93e9d3a7ff07c0c094f845e8797be3af6f3ea4b79e0fbe1440667eaeee7bb479dab44648b2ae5de3bb9aa3d4cb712f9310e2ff7865d592935ced04833debd67b3b3cbfa36b5e19300877b361fdb30240cb16bcfa185d779ad10d7a25205d213fc2fe5d0af19504c8113320866b9f79db3d9dbee6150143b6a4d3489b789e6e7fd87b0a6389db7f0040588ec3fe6fcc4e9d5ff1a03b738cb533ba670aa7afe447d9bf2e2911d699048dd201eb473c87b8ed12d73e4afc04abdcb3b779d9d406fb6f433f94c45d6adf0f064c27f96ee2bb236ccf325ade04a9f0fcd083bd9263a5ffe33feffa7ffbf95f010600c34a6d56545f39780000000049454e44ae426082, 'png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `partbet`
--

CREATE TABLE IF NOT EXISTS `partbet` (
  `partbetID` int(11) NOT NULL AUTO_INCREMENT,
  `Combibet_combibetID` int(11) NOT NULL,
  `Game_gameID` int(11) NOT NULL,
  `tipp` tinyint(4) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `quote` decimal(5,2) NOT NULL,
  `result` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`partbetID`),
  KEY `fk_Partbet_Combibet1_idx` (`Combibet_combibetID`),
  KEY `fk_Partbet_Game1_idx` (`Game_gameID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Daten für Tabelle `partbet`
--

INSERT INTO `partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES
(1, 1, 2, 1, 200, '5.00', 1),
(2, 1, 8, 1, 200, '3.00', 0),
(3, 1, 2, 1, 200, '5.00', 1),
(4, 2, 3, 2, 300, '4.00', 0),
(5, 2, 9, 2, 300, '2.50', 0),
(6, 2, 3, 2, 300, '4.00', 0),
(7, 3, 4, 0, 100, '2.00', 0),
(8, 3, 10, 0, 100, '2.00', 0),
(9, 3, 4, 0, 100, '2.00', 0),
(10, 4, 8, 1, 200, '3.00', 0),
(11, 4, 2, 1, 200, '5.00', 1),
(12, 4, 8, 1, 200, '3.00', 0),
(13, 5, 9, 2, 300, '2.50', 0),
(14, 5, 3, 2, 300, '4.00', 0),
(15, 5, 9, 2, 300, '2.50', 0),
(16, 6, 10, 0, 100, '2.00', 0),
(17, 6, 4, 0, 100, '2.00', 0),
(18, 6, 10, 0, 100, '2.00', 0),
(19, 7, 11, 1, 200, '1.20', 0),
(20, 7, 11, 1, 200, '1.20', 0),
(21, 8, 2, 1, 200, '5.00', 1),
(22, 8, 8, 1, 200, '3.00', 0),
(23, 9, 3, 2, 300, '4.00', 0),
(24, 9, 9, 2, 300, '2.50', 0),
(25, 10, 4, 0, 100, '2.00', 0),
(26, 10, 10, 0, 100, '2.00', 0),
(27, 11, 8, 1, 200, '3.00', 0),
(28, 11, 2, 1, 200, '5.00', 1),
(29, 12, 9, 2, 300, '2.50', 0),
(30, 12, 3, 2, 300, '4.00', 0),
(31, 13, 10, 0, 100, '2.00', 0),
(32, 13, 4, 0, 100, '2.00', 0),
(33, 14, 2, 1, 200, '5.00', 1),
(34, 14, 8, 1, 200, '3.00', 0),
(35, 15, 3, 2, 300, '4.00', 0),
(36, 15, 9, 2, 300, '2.50', 0),
(37, 16, 4, 0, 100, '2.00', 0),
(38, 16, 10, 0, 100, '2.00', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `privatemessage`
--

CREATE TABLE IF NOT EXISTS `privatemessage` (
  `privateMessagesId` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_sender` int(11) NOT NULL,
  `User_reseiver` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(45) DEFAULT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`privateMessagesId`),
  KEY `fk_PrivateMessages_User1_idx` (`User_sender`),
  KEY `fk_PrivateMessages_User2_idx` (`User_reseiver`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `privatemessage`
--

INSERT INTO `privatemessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES
(1, 12, 14, '2012-12-20 10:00:00', 'test1', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'),
(2, 4, 7, '2001-03-20 11:00:00', 'test2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'),
(3, 5, 2, '2011-11-20 11:00:00', 'test3', 'Lorem ipsum dolor sit amet, consetetur sadipscing'),
(4, 8, 11, '2012-12-20 10:00:00', 'test4', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.'),
(5, 5, 15, '2001-03-20 11:00:00', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'),
(6, 15, 4, '2011-11-20 11:00:00', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua'),
(7, 4, 3, '2011-11-20 11:00:00', 'test7', 'test ewq dsdsaD'),
(8, 1, 7, '2012-12-20 10:00:00', 'test8', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.'),
(9, 7, 18, '2011-11-20 11:00:00', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing'),
(10, 5, 14, '2001-03-20 11:00:00', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing'),
(11, 16, 3, '2012-12-20 10:00:00', 'test11', 'test ewq dsdsaD'),
(12, 4, 7, '2001-03-20 11:00:00', 'test12', 'Lorem ipsum dolor sit amet, consetetur sadipscing'),
(13, 7, 4, '2001-03-20 11:00:00', 'test13', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.'),
(14, 4, 7, '2004-12-20 11:00:00', 'test14', 'wer'),
(15, 4, 7, '2004-12-20 11:00:00', NULL, 'was'),
(16, 4, 7, '2004-12-20 11:00:00', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `seasonID` int(11) NOT NULL AUTO_INCREMENT,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`seasonID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `season`
--

INSERT INTO `season` (`seasonID`, `begin_date`, `end_date`) VALUES
(1, '2011-11-20 12:00:00', '2011-11-20 13:00:00'),
(2, '2011-11-20 13:00:00', '2011-11-20 14:00:00'),
(3, '2011-11-20 14:00:00', '2011-11-20 15:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `sectionID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sectionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `section`
--

INSERT INTO `section` (`sectionID`, `name`) VALUES
(1, 'Gruppe A'),
(2, 'Gruppe B'),
(3, 'Gruppe C'),
(4, 'Gruppe D'),
(5, 'Gruppe E'),
(6, 'Gruppe F'),
(7, 'Gruppe G'),
(8, 'Gruppe H');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shout`
--

CREATE TABLE IF NOT EXISTS `shout` (
  `shoutID` bigint(20) NOT NULL AUTO_INCREMENT,
  `User_userID` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  PRIMARY KEY (`shoutID`),
  KEY `fk_Shout_User1_idx` (`User_userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Daten für Tabelle `shout`
--

INSERT INTO `shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES
(1, 1, '0000-00-00 00:00:00', 'test1test1test1test1test1test1test1test1test1'),
(2, 2, '0000-00-00 00:00:00', 'test2'),
(3, 3, '0000-00-00 00:00:00', 'test3test3test3test3test3test3'),
(4, 4, '0000-00-00 00:00:00', 'test4test4test4test4test4test4test4'),
(5, 5, '0000-00-00 00:00:00', 'test5test5'),
(6, 6, '0000-00-00 00:00:00', 'test6test6test6test6'),
(7, 7, '0000-00-00 00:00:00', 'test7test7test7test7test7test7test7'),
(8, 8, '0000-00-00 00:00:00', 'test8test8test8test8'),
(9, 9, '0000-00-00 00:00:00', 'test9test9'),
(10, 10, '0000-00-00 00:00:00', 'test10test10test10test10test10test10test10test10test10'),
(11, 11, '0000-00-00 00:00:00', 'test11test11test11test11test11test11test11test11test11test11'),
(12, 12, '0000-00-00 00:00:00', 'test12test12test12'),
(13, 13, '0000-00-00 00:00:00', 'test13test13'),
(14, 14, '0000-00-00 00:00:00', 'test14test14test14test14test14test14test14test14'),
(15, 15, '0000-00-00 00:00:00', 'test15test15test15test15test15test15test15'),
(16, 16, '0000-00-00 00:00:00', 'test16test16test16'),
(17, 17, '0000-00-00 00:00:00', 'test17test17test17test17test17test17test17test17'),
(18, 18, '0000-00-00 00:00:00', 'test18test18test18test18test18test18test18test18'),
(19, 19, '0000-00-00 00:00:00', 'test19test19'),
(20, 20, '0000-00-00 00:00:00', 'test20test20test20test20test20test20test20test20test20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sport`
--

CREATE TABLE IF NOT EXISTS `sport` (
  `sportID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`sportID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `sport`
--

INSERT INTO `sport` (`sportID`, `title`, `description`) VALUES
(1, 'Fußball', 'Fußball ist eine Ballsportart, bei der zwei Mannschaften mit dem Ziel gegeneinander antreten, mehr Tore als der Gegner zu erzielen und so das Spiel zu gewinnen. Die Spielzeit ist üblicherweise zweimal 45 Minuten (exklusive Nachspielzeit und eventuell Verlängerung), jedoch gibt es auch Varianten mit kürzerer Spielzeit. Eine Mannschaft besteht in der Regel aus elf Spielern, wovon einer der Torwart ist. Der Ball darf mit dem Fuß und anderen Körperteilen gespielt werden, mit Ausnahme der Hände und Arme. Nur der Torwart darf den Ball innerhalb des eigenen Strafraums auch mit diesen Körperteilen berühren.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statistic`
--

CREATE TABLE IF NOT EXISTS `statistic` (
  `Team_teamID` int(11) NOT NULL,
  `Season_seasonID` int(11) NOT NULL,
  `won` int(11) DEFAULT NULL,
  `lost` int(11) DEFAULT NULL,
  `draw` int(11) DEFAULT NULL,
  PRIMARY KEY (`Team_teamID`,`Season_seasonID`),
  KEY `fk_Statistic_Team1_idx` (`Team_teamID`),
  KEY `fk_Statistic_Season1_idx` (`Season_seasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `statistic`
--

INSERT INTO `statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES
(1, 1, 1, 1, 0),
(1, 3, 1, 0, 0),
(2, 1, 1, 1, 0),
(2, 3, 0, 1, 0),
(3, 1, 2, 0, 0),
(3, 3, 1, 0, 0),
(4, 1, 0, 2, 0),
(4, 3, 0, 1, 0),
(5, 2, 0, 0, 2),
(5, 3, 0, 0, 1),
(6, 2, 0, 0, 2),
(6, 3, 0, 0, 1),
(7, 2, 0, 1, 1),
(7, 3, 0, 1, 0),
(8, 2, 1, 0, 1),
(8, 3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `teamID` int(11) NOT NULL AUTO_INCREMENT,
  `Sport_sportID` int(11) NOT NULL,
  `Image_imageID` int(11) DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`teamID`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `fk_Team_Sport1_idx` (`Sport_sportID`),
  KEY `fk_Team_Image1_idx` (`Image_imageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Daten für Tabelle `team`
--

INSERT INTO `team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES
(1, 1, 1, 'Mannschaft1'),
(2, 1, 1, 'Mannschaft2'),
(3, 1, 1, 'Mannschaft3'),
(4, 1, 1, 'Mannschaft4'),
(5, 1, 1, 'Mannschaft5'),
(6, 1, 1, 'Mannschaft6'),
(7, 1, 1, 'Mannschaft7'),
(8, 1, 1, 'Mannschaft8'),
(9, 1, NULL, 'Brasilien'),
(10, 1, NULL, 'Kroatien'),
(11, 1, NULL, 'Mexiko'),
(12, 1, NULL, 'Kamerun'),
(13, 1, NULL, 'Spanien'),
(14, 1, NULL, 'Niederlande'),
(15, 1, NULL, 'Chile'),
(16, 1, NULL, 'Australien'),
(17, 1, NULL, 'Kolumbien'),
(18, 1, NULL, 'Grichenland'),
(19, 1, NULL, 'Elfenbeinküste'),
(20, 1, NULL, 'Japan'),
(21, 1, NULL, 'Uruguay'),
(22, 1, NULL, 'Costa Rica'),
(23, 1, NULL, 'England'),
(24, 1, NULL, 'Italien'),
(25, 1, NULL, 'Schweiz'),
(26, 1, NULL, 'Ecuador'),
(27, 1, NULL, 'Frankreich'),
(28, 1, NULL, 'Honduras'),
(29, 1, NULL, 'Argentinien'),
(30, 1, NULL, 'Bosnien-Herzegowina'),
(31, 1, NULL, 'Iran'),
(32, 1, NULL, 'Nigeria'),
(33, 1, NULL, 'Deutschland'),
(34, 1, NULL, 'Portugal'),
(35, 1, NULL, 'Ghana'),
(36, 1, NULL, 'USA'),
(37, 1, NULL, 'Belgien'),
(38, 1, NULL, 'Algerien'),
(39, 1, NULL, 'Russland'),
(40, 1, NULL, 'Südkorea');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `salt` varchar(45) NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `balance` int(11) NOT NULL,
  `set_online` tinyint(1) NOT NULL,
  `set_shoutbox` tinyint(1) NOT NULL,
  `set_message` tinyint(1) NOT NULL,
  `set_newsletter` tinyint(1) NOT NULL,
  `signin_date` date NOT NULL,
  `image_imageID` int(11) NOT NULL,
  `description` text,
  `name` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_image1_idx` (`image_imageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`userID`, `email`, `username`, `password`, `salt`, `isadmin`, `balance`, `set_online`, `set_shoutbox`, `set_message`, `set_newsletter`, `signin_date`, `image_imageID`, `description`, `name`, `firstname`, `city`) VALUES
(1, 'hans@wurst.de', 'hanswurst', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, 'Ich bin der Hans Wurst ein absoluter Pro Gamer!!!', 'Hans', 'Wurst', 'Frankfurt'),
(2, 'günther@hermann', 'ghermann', 'x', 'x', 0, 100, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(3, 'kevin.rompf@mni.thm.de', 'kevin', 'x', 'x', 1, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(4, 'selcukbakkal@hotmail.de', 'selcuk', 'x', 'x', 1, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(5, 'lars.becker@mni.thm.de', 'lars', 'x', 'x', 1, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(6, 'julian.naumann@mni.thm.de', 'julian', 'x', 'x', 1, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(7, 'peter.janauschek@mni.thm.de', 'peter', 'x', 'x', 1, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(8, 'benjamin.schlosser@mni.thm.de', 'benjamin', 'x', 'x', 1, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(9, 'test9@email.de', 'nutzer9', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(10, 'test10@email.de', 'nutzer10', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(11, 'test11@email.de', 'nutzer11', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(12, 'test12@email.de', 'nutzer12', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(13, 'test13@email.de', 'nutzer13', 'x', 'x', 0, 100, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(14, 'test14@email.de', 'nutzer14', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(15, 'test15@email.de', 'nutzer15', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(16, 'test16@email.de', 'nutzer16', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(17, 'test17@email.de', 'nutzer17', 'x', 'x', 0, 100, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(18, 'test18@email.de', 'nutzer18', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(19, 'test19@email.de', 'nutzer19', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(20, 'test20@email.de', 'nutzer20', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(21, 'test21@email.de', 'nutzer21', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(22, 'test22@email.de', 'nutzer22', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(23, 'test23@email.de', 'nutzer23', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(24, 'test24@email.de', 'nutzer24', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(25, 'test25@email.de', 'nutzer25', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(26, 'test26@email.de', 'nutzer26', 'x', 'x', 0, 100, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(27, 'test27@email.de', 'nutzer27', 'x', 'x', 0, 0, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(28, 'test28@email.de', 'nutzer28', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(29, 'test29@email.de', 'nutzer29', 'x', 'x', 0, 200, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL),
(30, 'test30@email.de', 'nutzer30', 'x', 'x', 0, 100, 0, 1, 1, 1, '2014-01-01', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_has_team`
--

CREATE TABLE IF NOT EXISTS `user_has_team` (
  `user_userID` int(11) NOT NULL,
  `team_teamID` int(11) NOT NULL,
  `right_wintip` int(11) DEFAULT NULL,
  `false_wintip` int(11) DEFAULT NULL,
  `right_drawtip` int(11) DEFAULT NULL,
  `false_drawtip` int(11) DEFAULT NULL,
  `right_loosetip` int(11) DEFAULT NULL,
  `false_loosetip` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_userID`,`team_teamID`),
  KEY `fk_user_has_team_team1_idx` (`team_teamID`),
  KEY `fk_user_has_team_user1_idx` (`user_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `fk_Bet_User1` FOREIGN KEY (`User_userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Bet_Game1` FOREIGN KEY (`Game_gameID`) REFERENCES `game` (`gameID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `bet_statistic`
--
ALTER TABLE `bet_statistic`
  ADD CONSTRAINT `fk_bet_statistic_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `blocked`
--
ALTER TABLE `blocked`
  ADD CONSTRAINT `fk_Blocked_User1` FOREIGN KEY (`User_userId`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `combibet`
--
ALTER TABLE `combibet`
  ADD CONSTRAINT `fk_Combibet_User1` FOREIGN KEY (`User_userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_Complaint_User1` FOREIGN KEY (`User_userID1`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Complaint_User2` FOREIGN KEY (`User_userID2`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `contest`
--
ALTER TABLE `contest`
  ADD CONSTRAINT `fk_contest_sport1` FOREIGN KEY (`sport_sportID`) REFERENCES `sport` (`sportID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `contest_has_team`
--
ALTER TABLE `contest_has_team`
  ADD CONSTRAINT `contest_has_team_ibfk_1` FOREIGN KEY (`section_SectionID`) REFERENCES `section` (`sectionID`),
  ADD CONSTRAINT `fk_contest_has_Team_contest1` FOREIGN KEY (`Contest_contestID`) REFERENCES `contest` (`contestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contest_has_Team_Team1` FOREIGN KEY (`Team_teamID`) REFERENCES `team` (`teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `cupons`
--
ALTER TABLE `cupons`
  ADD CONSTRAINT `fk_Cupons_User1` FOREIGN KEY (`User_userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `fk_User_has_User_User1` FOREIGN KEY (`User_userID1`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_has_User_User2` FOREIGN KEY (`User_userID2`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_Game_Team_home` FOREIGN KEY (`Team_home`) REFERENCES `team` (`teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Game_Team_guest` FOREIGN KEY (`Team_guest`) REFERENCES `team` (`teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Game_Season1` FOREIGN KEY (`Season_seasonID`) REFERENCES `season` (`seasonID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `partbet`
--
ALTER TABLE `partbet`
  ADD CONSTRAINT `fk_Partbet_Combibet1` FOREIGN KEY (`Combibet_combibetID`) REFERENCES `combibet` (`combibetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Partbet_Game1` FOREIGN KEY (`Game_gameID`) REFERENCES `game` (`gameID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `privatemessage`
--
ALTER TABLE `privatemessage`
  ADD CONSTRAINT `fk_PrivateMessages_User1` FOREIGN KEY (`User_sender`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PrivateMessages_User2` FOREIGN KEY (`User_reseiver`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `shout`
--
ALTER TABLE `shout`
  ADD CONSTRAINT `fk_Shout_User1` FOREIGN KEY (`User_userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `statistic`
--
ALTER TABLE `statistic`
  ADD CONSTRAINT `fk_Statistic_Team1` FOREIGN KEY (`Team_teamID`) REFERENCES `team` (`teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Statistic_Season1` FOREIGN KEY (`Season_seasonID`) REFERENCES `season` (`seasonID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_Team_Sport1` FOREIGN KEY (`Sport_sportID`) REFERENCES `sport` (`sportID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Team_Image1` FOREIGN KEY (`Image_imageID`) REFERENCES `image` (`imageID`) ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_image1` FOREIGN KEY (`image_imageID`) REFERENCES `image` (`imageID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `user_has_team`
--
ALTER TABLE `user_has_team`
  ADD CONSTRAINT `fk_user_has_team_user1` FOREIGN KEY (`user_userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_team_team1` FOREIGN KEY (`team_teamID`) REFERENCES `team` (`teamID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
