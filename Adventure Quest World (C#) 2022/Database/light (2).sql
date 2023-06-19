-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:9519
-- Generation Time: Apr 18, 2023 at 06:43 PM
-- Server version: 10.3.37-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `light`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` int(14) UNSIGNED NOT NULL,
  `Name` varchar(55) NOT NULL,
  `File` varchar(255) NOT NULL DEFAULT 'default.swf',
  `Image` varchar(255) NOT NULL DEFAULT 'Achievement.png',
  `Linkage` varchar(60) DEFAULT 'Achievement',
  `Shop` int(11) NOT NULL DEFAULT 0,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) UNSIGNED NOT NULL,
  `Author` varchar(255) DEFAULT 'Avatar',
  `Subject` varchar(50) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auras`
--

CREATE TABLE `auras` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Duration` smallint(3) NOT NULL DEFAULT 6,
  `Category` varchar(8) NOT NULL,
  `DamageIncrease` decimal(7,2) NOT NULL DEFAULT 0.00,
  `DamageTakenDecrease` decimal(7,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auras`
--

INSERT INTO `auras` (`id`, `Name`, `Duration`, `Category`, `DamageIncrease`, `DamageTakenDecrease`) VALUES
(3, 'Test Aura 1', 5, 'debuff', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `auras_effects`
--

CREATE TABLE `auras_effects` (
  `id` int(11) UNSIGNED NOT NULL,
  `AuraID` int(11) UNSIGNED NOT NULL,
  `Stat` char(3) NOT NULL,
  `Value` decimal(7,2) NOT NULL DEFAULT 0.00,
  `Type` char(1) NOT NULL DEFAULT '+'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auras_effects`
--

INSERT INTO `auras_effects` (`id`, `AuraID`, `Stat`, `Value`, `Type`) VALUES
(2, 3, 'tcr', '10.00', '+'),
(3, 3, 'ap', '10.00', '+');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `Category` char(2) NOT NULL,
  `Description` text NOT NULL,
  `ManaRegenerationMethods` text NOT NULL,
  `StatsDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `ItemID`, `Category`, `Description`, `ManaRegenerationMethods`, `StatsDescription`) VALUES
(1, 2, 'M1', 'Warlord are quintessential melee fighters. Simple, direct, and effective, they are masters of armed combat, and quite durable.', 'Warlords gain mana when they:,-Strike an enemy in combat (more effective on crits),-Are struck by an enemy in combat', 'Warlords are quintessential melee fighters. Simple, direct, and effective, they are masters of armed');

-- --------------------------------------------------------

--
-- Table structure for table `enhancements`
--

CREATE TABLE `enhancements` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `PatternID` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `Rarity` tinyint(3) UNSIGNED NOT NULL,
  `DPS` smallint(4) UNSIGNED NOT NULL,
  `Level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `enhancements`
--

INSERT INTO `enhancements` (`id`, `Name`, `PatternID`, `Rarity`, `DPS`, `Level`) VALUES
(1, 'Adventurer Enhancement', 1, 1, 50, 1),
(2, 'Fighter Enhancement', 2, 1, 50, 1),
(3, 'Lucky Enhacement', 3, 0, 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enhancements_patterns`
--

CREATE TABLE `enhancements_patterns` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Desc` varchar(4) NOT NULL,
  `Wisdom` tinyint(2) UNSIGNED NOT NULL,
  `Strength` tinyint(2) UNSIGNED NOT NULL,
  `Luck` tinyint(2) UNSIGNED NOT NULL,
  `Dexterity` tinyint(2) UNSIGNED NOT NULL,
  `Endurance` tinyint(2) UNSIGNED NOT NULL,
  `Intelligence` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `enhancements_patterns`
--

INSERT INTO `enhancements_patterns` (`id`, `Name`, `Desc`, `Wisdom`, `Strength`, `Luck`, `Dexterity`, `Endurance`, `Intelligence`) VALUES
(1, 'Adventurer', 'M1', 11, 20, 5, 3, 2, 10),
(2, 'Fighter', 'M2', 11, 20, 5, 3, 2, 10),
(3, 'Lucky', 'M1', 15, 15, 100, 15, 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`id`, `Name`) VALUES
(1, 'None'),
(2, 'Good'),
(3, 'Evil'),
(5, 'Undead'),
(6, 'Chaos'),
(7, 'Dragonkin');

-- --------------------------------------------------------

--
-- Table structure for table `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Color` varchar(64) NOT NULL DEFAULT '0xFFFFFF',
  `MessageOfTheDay` varchar(512) NOT NULL,
  `MaxMembers` tinyint(3) UNSIGNED NOT NULL DEFAULT 15,
  `Wins` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Loses` int(11) NOT NULL DEFAULT 0,
  `TotalKills` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Level` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `Exp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `guilds`
--

INSERT INTO `guilds` (`id`, `Name`, `Color`, `MessageOfTheDay`, `MaxMembers`, `Wins`, `Loses`, `TotalKills`, `Level`, `Exp`) VALUES
(1, 'Staff Team', '000000', 'Hello World!', 15, 0, 0, 0, 1, 0);

--
-- Triggers `guilds`
--
DELIMITER $$
CREATE TRIGGER `NewGuild` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
	INSERT INTO guilds_halls (GuildID, Linkage, Cell, X, Y, Interior) VALUES (NEW.id, 'fr1', 'Enter', '0', '0', '|||');
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hairs`
--

CREATE TABLE `hairs` (
  `id` int(11) UNSIGNED NOT NULL,
  `Gender` char(1) NOT NULL,
  `Name` varchar(16) NOT NULL,
  `File` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hairs`
--

INSERT INTO `hairs` (`id`, `Gender`, `Name`, `File`) VALUES
(4, 'M', 'Bald', 'hair/m/bald.swf'),
(5, 'F', 'Bald', 'hair/f/bald.swf'),
(6, 'F', 'Bangs1', 'hair/f/bangs1.swf'),
(7, 'F', 'Bangs2', 'hair/f/bangs2.swf'),
(8, 'F', 'Bangs3', 'hair/f/bangs3.swf'),
(9, 'F', 'Braid2Bangs', 'hair/f/braid2.swf'),
(10, 'F', 'Braid2Bangs1', 'hair/f/braid2bangs1.swf'),
(11, 'F', 'Braid3', 'hair/f/braid3.swf'),
(12, 'F', 'Braid3Bangs1', 'hair/f/braid3bangs1.swf'),
(13, 'F', 'Braid3Bangs2', 'hair/f/braid3bangs2.swf'),
(14, 'F', 'Pig1Bangs1', 'hair/f/pig1bangs1.swf'),
(15, 'F', 'Pig1Bangs2', 'hair/f/pig1bangs2.swf'),
(16, 'F', 'Pig2', 'hair/f/pig2.swf'),
(17, 'F', 'Pig2Bangs1', 'hair/f/pig2bangs1.swf'),
(18, 'F', 'Pig2Bangs2', 'hair/f/pig2bangs2.swf'),
(19, 'F', 'Pob', 'hair/f/pob.swf'),
(20, 'F', 'Pony1Bangs1', 'hair/f/pony1bangs1.swf'),
(21, 'F', 'Pony1Bangs2', 'hair/f/pony1bangs2.swf'),
(22, 'F', 'Pony1Bangs2Long', 'hair/f/pony1bangs2long.swf'),
(23, 'F', 'Pony1Long', 'hair/f/pony1long.swf'),
(24, 'F', 'Pony2', 'hair/f/pony2.swf'),
(25, 'F', 'Pony2Bangs1', 'hair/f/pony2bangs1.swf'),
(26, 'F', 'Pony2Bangs2', 'hair/f/pony2bangs2.swf'),
(27, 'F', 'Pony3', 'hair/f/pony3.swf'),
(28, 'F', 'Pony3Bangs1', 'hair/f/pony3bangs1.swf'),
(29, 'F', 'Pony3Bangs2', 'hair/f/pony3bangs2.swf'),
(30, 'F', 'Pony4', 'hair/f/pony4.swf'),
(31, 'F', 'Pony4Bangs1', 'hair/f/pony4bangs1.swf'),
(32, 'F', 'Pony4Bangs2', 'hair/f/pony4bangs2.swf'),
(34, 'F', 'Pony5', 'hair/f/pony5.swf'),
(35, 'F', 'Pony5Bangs2', 'hair/f/pony5bangs2.swf'),
(36, 'F', 'Spike1', 'hair/f/spike1.swf'),
(37, 'F', 'Spike2', 'hair/f/spike2.swf'),
(38, 'M', 'BaldBeard', 'hair/m/baldbeard.swf'),
(39, 'M', 'BaldStache', 'hair/m/baldstache.swf'),
(40, 'M', 'Bangs22', 'hair/m/bangs22.swf'),
(41, 'M', 'Bangs22Beard', 'hair/m/bangs22beard.swf'),
(42, 'M', 'Bangs22Stache', 'hair/m/bangs22stache.swf'),
(43, 'M', 'Bob', 'hair/m/bob.swf'),
(44, 'M', 'BobBeard', 'hair/m/bobbeard.swf'),
(45, 'M', 'BobStache', 'hair/m/bobstache.swf'),
(46, 'M', 'Braid1', 'hair/m/braid1.swf'),
(47, 'M', 'Braid1Beard', 'hair/m/braid1beard.swf'),
(48, 'M', 'Braid1Stache', 'hair/m/braid1stache.swf'),
(49, 'M', 'Curl', 'hair/m/curl.swf'),
(50, 'M', 'CurlBeard', 'hair/m/curlbeard.swf'),
(51, 'M', 'CurlStache', 'hair/m/curlstache.swf'),
(52, 'M', 'Default', 'hair/m/default.swf'),
(53, 'M', 'DefaultBeard', 'hair/m/defaultbeard.swf'),
(54, 'M', 'DefaultStache', 'hair/m/defaultstache.swf'),
(55, 'M', 'Goku1', 'hair/m/goku1.swf'),
(56, 'M', 'Goku1Beard', 'hair/m/goku1beard.swf'),
(57, 'M', 'Goku1Stache', 'hair/m/goku1stache.swf'),
(58, 'M', 'Goku2', 'hair/m/goku2.swf'),
(59, 'M', 'Goku2Beard', 'hair/m/goku2beard.swf'),
(60, 'M', 'Goku2Stache', 'hair/m/goku2stache.swf'),
(61, 'M', 'Normal', 'hair/m/normal.swf'),
(62, 'M', 'NormalBeard', 'hair/m/normalbeard.swf'),
(63, 'M', 'NormalStache', 'hair/m/normalstache.swf'),
(64, 'M', 'Normal2', 'hair/m/normal2.swf'),
(65, 'M', 'Normal2Beard', 'hair/m/normal2beard.swf'),
(66, 'M', 'Normal2Stache', 'hair/m/normal2stache.swf'),
(67, 'M', 'Pompadour', 'hair/m/pompadour.swf'),
(68, 'M', 'PompadourBeard', 'hair/m/pompadourbeard.swf'),
(69, 'M', 'PompadourStache', 'hair/m/pompadourstache.swf'),
(70, 'M', 'Spikedown', 'hair/m/spikedown.swf'),
(71, 'M', 'SpikedownBeard', 'hair/m/spikedownbeard.swf'),
(72, 'M', 'SpikedownStache', 'hair/m/spikedownstache.swf'),
(73, 'M', 'Tonsure', 'hair/m/tonsure.swf'),
(74, 'M', 'TonsureBeard', 'hair/m/tonsurebeard.swf'),
(75, 'M', 'TonsureStache', 'hair/m/tonsurestache.swf'),
(76, 'M', 'Wavy', 'hair/m/wavy.swf'),
(77, 'M', 'WavyBeard', 'hair/m/wavybeard.swf'),
(78, 'M', 'WavyStache', 'hair/m/wavystache.swf'),
(79, 'M', 'Zhoom', 'hair/m/zhoom.swf'),
(80, 'M', 'ZhoomBeard', 'hair/m/zhoombeard.swf'),
(81, 'M', 'ZhoomStache', 'hair/m/zhoomstache.swf'),
(82, 'F', 'Bangs1Long', 'hair/f/bangs1long.swf'),
(83, 'F', 'Bangs2Long', 'hair/f/bangs2long.swf'),
(84, 'F', 'Bangs3Long', 'hair/f/bangs3long.swf'),
(92, 'M', 'Ponytail8', 'hair/m/ponytail8.swf'),
(93, 'M', 'Ponytail7', 'hair/m/ponytail7.swf'),
(94, 'M', 'Ponytail6', 'hair/m/ponytail6.swf'),
(95, 'M', 'Ponytail5', 'hair/m/ponytail5.swf'),
(96, 'M', 'Ponytail4', 'hair/m/ponytail4.swf'),
(101, 'M', 'Slickback1', 'hair/m/slickback1.swf'),
(102, 'M', 'Mohawk1', 'hair/m/mohawk1.swf'),
(103, 'M', 'Mohawk2', 'hair/m/mohawk2.swf'),
(104, 'M', 'Mohawk3', 'hair/m/mohawk3.swf'),
(105, 'M', 'Conan1', 'hair/m/conan1.swf'),
(106, 'M', 'Ponytail3', 'hair/m/ponytail3.swf'),
(107, 'M', 'Conan2', 'hair/m/conan2.swf'),
(108, 'M', 'Conan3', 'hair/m/conan3.swf'),
(109, 'M', 'Ponytail', 'hair/m/ponytail.swf'),
(110, 'M', 'Slickback2', 'hair/m/slickback2.swf'),
(111, 'M', 'Feathered1', 'hair/m/feathered1.swf'),
(112, 'M', 'Feathered2', 'hair/m/feathered2.swf'),
(114, 'M', 'Halo1', 'hair/m/halo1.swf'),
(115, 'F', 'Ponytail1', 'hair/f/ponytail1.swf'),
(117, 'F', 'Halo1', 'hair/f/halo1.swf'),
(118, 'F', 'Halo2', 'hair/f/halo2.swf'),
(120, 'F', 'Halo3', 'hair/f/halo3.swf'),
(121, 'F', 'Ponytail2', 'hair/f/ponytail2.swf'),
(122, 'F', 'Ponytail3', 'hair/f/ponytail3.swf'),
(123, 'F', 'Ponytail4', 'hair/f/ponytail4.swf'),
(124, 'F', 'Braid1', 'hair/f/braid1.swf'),
(125, 'F', 'Ponytail5', 'hair/f/ponytail5.swf'),
(126, 'F', 'Ponytail6', 'hair/f/ponytail6.swf'),
(127, 'F', 'Ponytail7', 'hair/f/ponytail7.swf'),
(128, 'M', 'Fro1', 'hair/m/fro1.swf'),
(129, 'F', 'Fro1', 'hair/f/fro1.swf'),
(130, 'F', 'Fro2', 'hair/f/fro2.swf'),
(131, 'M', 'Fro2', 'hair/m/fro2.swf'),
(139, 'M', 'Mohawk4', 'hair/m/mohawk4.swf'),
(192, 'M', 'Glowingeyes1', 'hair/m/glowingeyes1.swf'),
(193, 'F', 'Glowingeyes1', 'hair/f/glowingeyes1.swf'),
(194, 'M', 'Glowingeyes2', 'hair/m/glowingeyes2.swf'),
(195, 'M', 'Miltonius', 'hair/m/miltonius.swf'),
(201, 'M', 'Ponytail9', 'hair/m/ponytail9.swf'),
(206, 'F', 'cat1', 'hair/f/cat1.swf'),
(210, 'F', 'Glowingeyes2', 'hair/f/glowingeyes2.swf'),
(211, 'F', 'Curls', 'hair/f/curls.swf'),
(212, 'F', 'Bang22', 'hair/f/bang22.swf'),
(221, 'M', 'Beard1', 'hair/m/beard2.swf'),
(222, 'M', 'Beard2', 'hair/m/beard2.swf'),
(223, 'M', 'Beard3', 'hair/m/beard3.swf'),
(232, 'F', 'Formal', 'hair/f/formal.swf'),
(233, 'M', 'Widowspeak1', 'hair/m/widowspeak1.swf'),
(234, 'F', 'Saf1', 'hair/f/saf1.swf'),
(235, 'F', 'Betty1', 'hair/f/betty1.swf'),
(236, 'F', 'Saf2', 'hair/f/saf2.swf'),
(237, 'M', 'Wildbeard1', 'hair/m/wildbeard2.swf'),
(238, 'M', 'Wildbeard2', 'hair/m/wildbeard2.swf'),
(239, 'F', 'Long1', 'hair/f/long1.swf'),
(240, 'M', 'Long1', 'hair/m/long1.swf'),
(241, 'F', 'Braided3', 'hair/f/braided3.swf'),
(242, 'F', 'Braided2', 'hair/f/braided2.swf'),
(243, 'F', 'Braided1', 'hair/f/braided1.swf'),
(244, 'M', 'Braided1', 'hair/m/braided1.swf'),
(245, 'M', 'Renhair1', 'hair/m/rennhair1.swf'),
(246, 'F', 'Rennhair1', 'hair/f/rennhair1.swf'),
(247, 'M', 'Ziohair1', 'hair/m/ziohair1.swf'),
(248, 'F', 'Ziohair1', 'hair/f/ziohair1.swf'),
(249, 'F', 'Cute1', 'hair/f/cute1.swf'),
(250, 'M', 'DageScene', 'hair/m/dagescene.swf'),
(251, 'F', 'Alina2', 'hair/f/alina2.swf'),
(252, 'F', 'SwoopTails', 'hair/f/SwoopTails.swf'),
(253, 'F', 'Pily', 'hair/f/Pily.swf'),
(254, 'M', 'AQDemonHunter1', 'hair/m/AQDemonHunter1.swf'),
(255, 'M', 'AQDemonHunter2', 'hair/m/AQDemonHunter2.swf'),
(256, 'M', 'AQSkypirate', 'hair/m/AQSkypirate.swf'),
(257, 'M', 'DFLongSides', 'hair/m/DFLongSides.swf'),
(258, 'M', 'DFSemiWavy', 'hair/m/DFSemiWavy.swf'),
(259, 'M', 'DFSimple', 'hair/m/DFSimple.swf'),
(260, 'M', 'DFSpiky', 'hair/m/DFSpiky.swf'),
(261, 'M', 'DFWarStyle', 'hair/m/DFWarStyle.swf'),
(262, 'M', 'MQAlienRash', 'hair/m/MQAlienRash.swf'),
(263, 'M', 'MQBandana', 'hair/m/MQBandana.swf'),
(264, 'M', 'MQCyborg', 'hair/m/MQCyborg.swf'),
(265, 'M', 'MQElegant', 'hair/m/MQElegant.swf'),
(266, 'M', 'MQGoogleDreads', 'hair/m/MQGoogleDreads.swf'),
(267, 'M', 'MQSwift', 'hair/m/MQSwift.swf'),
(268, 'F', 'OrcStyleFem3', 'hair/f/OrcStyleFem3.swf'),
(269, 'F', 'MQSuperEmo', 'hair/f/MQSuperEmo.swf'),
(270, 'F', 'MQSpaceBuns', 'hair/f/MQSpaceBuns.swf'),
(271, 'F', 'MQRibbon', 'hair/f/MQRibbon.swf'),
(272, 'F', 'MQGalaxyBuns', 'hair/f/MQGalaxyBuns.swf'),
(273, 'F', 'MQElegant', 'hair/f/MQElegant.swf'),
(274, 'F', 'DFGypsyWavy', 'hair/f/DFGypsyWavy.swf'),
(275, 'M', 'FauxHawk', 'hair/M/FauxHawk3.swf'),
(276, 'F', 'AQCasual', 'hair/f/AQCasual.swf'),
(277, 'F', 'Dragonhawk', 'hair/F/Dragonhawk.swf'),
(278, 'M', 'Llussion', 'hair/M/llussion.swf'),
(279, 'F', 'KathleenPetrarca', 'hair/F/KathleenPetrarcar8.swf'),
(280, 'F', 'Diabald', 'hair/F/Diabald.swf'),
(281, 'F', 'Miko', 'hair/F/Miko.swf'),
(282, 'F', 'ElvenLocks', 'hair/F/ElvenLocks.swf'),
(283, 'F', 'AlacFire', 'hair/F/AlacFire.html'),
(284, 'M', 'SandBoy', 'hair/M/SandBoy.swf'),
(285, 'F', 'SandHairGirl', 'hair/F/SandHairGirl.swf'),
(286, 'F', 'HPAsuna', 'hair/F/HPAsunar6.swf'),
(287, 'M', 'BlazinHair', 'hair/M/BlazinHair.swf'),
(288, 'F', 'Fae2', 'hair/F/Fae2.swf'),
(301, 'F', 'DFGloomy', 'hair/f/DFGloomy.swf'),
(324, 'M', 'Troll3Human', 'hair/M/Troll3Human.swf'),
(328, 'F', 'TrollFem1HumanFi', 'hair/F/TrollFem1HumanFix.swf'),
(330, 'F', 'TrollFem3Human', 'hair/F/TrollFem3Human.swf'),
(349, 'M', 'SuggestedHair', 'hair/M/SuggestedHair.swf'),
(375, 'F', 'AQCasual', 'hair/F/AQCasual.swf'),
(379, 'F', 'MQGalaxyBuns', 'hair/F/MQGalaxyBuns.swf'),
(380, 'F', 'MQRibbon', 'hair/F/MQRibbon.swf'),
(383, 'M', 'AQDemonHunter1', 'hair/M/AQDemonHunter1.swf'),
(390, 'M', 'DFWarStyle', 'hair/M/DFWarStyle.swf'),
(396, 'M', 'MQElegant', 'hair/M/MQElegant.swf'),
(398, 'M', 'MQSwift', 'hair/M/MQSwift.swf'),
(921, 'F', 'KathleenFrozen', 'hair/F/KathleenFrozen2.swf'),
(928, 'F', 'YorumiHair', 'hair/F/YorumiHair.swf'),
(929, 'F', 'HPMiku', 'hair/F/HPMikur16.swf'),
(930, 'M', 'MythsongJett', 'hair/M/MythsongJett.swf'),
(931, 'M', 'EmoHair1', 'hair/M/EmoHair1.swf'),
(932, 'M', 'MythsongJett2', 'hair/M/MythsongJett2.swf'),
(933, 'M', 'Beatlehair1', 'hair/M/Beatlehair1.swf'),
(934, 'M', 'Dragonhawk', 'hair/M/Dragonhawk.swf'),
(935, 'M', 'FauxHawk3', 'hair/M/FauxHawk3.swf'),
(936, 'M', 'Flock', 'hair/M/Flock.swf'),
(937, 'M', 'Rapper2', 'hair/M/Rapper2.swf'),
(938, 'M', 'DageScene', 'hair/M/DageScene.swf'),
(939, 'M', 'Flow', 'hair/M/Flow.swf'),
(940, 'M', 'AxleRose2', 'hair/M/AxleRose2.swf'),
(941, 'M', 'AxleRose1', 'hair/M/AxleRose1.swf'),
(942, 'F', 'EmoHair2', 'hair/F/EmoHair2.swf'),
(943, 'F', 'MythsongJett2', 'hair/F/MythsongJett2.swf'),
(944, 'F', 'Beatlehair1', 'hair/F/Beatlehair1.swf'),
(945, 'F', 'Dragonhawk', 'hair/F/Dragonhawk.swf'),
(946, 'F', 'AxleRose2', 'hair/F/AxleRose2.swf'),
(947, 'F', 'AxleRose1', 'hair/F/AxleRose1.swf'),
(948, 'F', 'Flow', 'hair/F/Flow.swf'),
(949, 'F', 'DageScene', 'hair/F/DageScene.swf'),
(950, 'F', 'Flock', 'hair/F/Flock.swf'),
(951, 'F', 'MythsongJett', 'hair/F/MythsongJett.swf'),
(952, 'F', 'ElsaHPK', 'hair/F/ElsaHPK-04.07.14-HPr2.html'),
(953, 'F', 'AnnaHPK', 'hair/F/AnnaHPK-04.07.14-HPr5.html'),
(954, 'F', 'AshkMHair', 'hair/m/Ashkun.swf'),
(955, 'F', 'Fae3', 'hair/F/Fae3.swf'),
(956, 'M', 'Fae3', 'hair/M/Fae3.swf'),
(957, 'F', 'Alina3', 'Hair/F/Alina3.swf');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Description` text NOT NULL,
  `Type` varchar(16) NOT NULL,
  `Element` varchar(16) NOT NULL DEFAULT 'None',
  `File` varchar(120) NOT NULL,
  `Link` varchar(64) NOT NULL,
  `Icon` varchar(16) NOT NULL,
  `Equipment` varchar(10) NOT NULL,
  `Level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `DPS` smallint(6) UNSIGNED NOT NULL DEFAULT 100,
  `Range` smallint(6) UNSIGNED NOT NULL DEFAULT 50,
  `Rarity` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `Quantity` smallint(4) UNSIGNED NOT NULL DEFAULT 1,
  `Stack` smallint(4) UNSIGNED NOT NULL DEFAULT 1,
  `Cost` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Coins` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sell` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `Temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Upgrade` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Staff` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnhID` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `FactionID` int(11) UNSIGNED DEFAULT NULL,
  `TitleID` int(11) UNSIGNED DEFAULT NULL,
  `ReqReputation` mediumint(6) UNSIGNED NOT NULL DEFAULT 0,
  `ReqClassID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ReqClassPoints` mediumint(6) UNSIGNED NOT NULL DEFAULT 0,
  `QuestStringIndex` tinyint(3) NOT NULL DEFAULT -1,
  `QuestStringValue` tinyint(3) NOT NULL DEFAULT 0,
  `Meta` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `Name`, `Description`, `Type`, `Element`, `File`, `Link`, `Icon`, `Equipment`, `Level`, `DPS`, `Range`, `Rarity`, `Quantity`, `Stack`, `Cost`, `Coins`, `Sell`, `Temporary`, `Upgrade`, `Staff`, `EnhID`, `FactionID`, `TitleID`, `ReqReputation`, `ReqClassID`, `ReqClassPoints`, `QuestStringIndex`, `QuestStringValue`, `Meta`) VALUES
(1, 'Unarmed', 'Default sword for every adventurers', 'Sword', 'None', 'items/maces/Blank-11Jun11.swf', 'Unarmed', 'iwmace', 'Weapon', 1, 100, 50, 10, 1, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(2, 'Novice', 'This clsas is for new adventurer.', 'Class', 'None', 'peasant2_skin.swf', 'Peasant2', 'iiclass', 'ar', 1, 100, 50, 1, 1, 1, 15000, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(3, 'Warlord', 'Warlords are master of war melee fighter with big ...', 'Armor', 'None', 'peasant2_skin.swf', 'Peasant2', 'iwarmor', 'co', 5, 100, 50, 1, 1, 1, 15000, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(4, 'Administrator Title', 'Admin', 'Title', 'None', '', 'title:1', 'iwdagger', 'ti', 1, 100, 50, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, NULL, 1, 0, 0, 0, -1, 0, NULL),
(7, 'Battle Wyvern Pet', '...', 'Pet', 'None', 'Items/Pets/BattleWyvern.swf', 'BattleWyvern', 'iipet', 'pe', 1, 100, 50, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(8, 'Air Ship House', '', 'Hpise', 'None', 'houses/house-Airship.swf', '', 'ihhouse', 'ho', 1, 100, 50, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(50, 'Xp Boost (1 hrs)', 'Using this item will DOUBLE all experience gained from killing monsters or completing quests for 1 hour.', 'ServerUse', 'None', 'icbxp', 'xpboost::60::false', 'icbxp', 'None', 1, 100, 50, 1, 1, 20, 5000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(51, 'Gold Boost (1 hrs)', 'Using this item will DOUBLE all Gold gained from killing monsters or completing quests for 1 hour of in-game play time.', 'ServerUse', 'None', 'icbgold', 'gboost::60::false', 'icbgold', 'None', 1, 100, 50, 1, 1, 20, 5000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(52, 'Coins Boost (1 hrs)', 'Using this item will DOUBLE all Coins gained from killing monsters or completing quests for 1 hour of in-game play time.', 'ServerUse', 'None', 'iicrystal', 'coinsboost::60::false', 'iicrystal', 'None', 1, 100, 50, 1, 1, 20, 5000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(53, 'Class Point Boost (1 hrs)', 'Using this item will DOUBLE all Class Point gained from completing quests and all other sources for 1 HOUR of in-game play time. Does not expire while logged out.', 'ServerUse', 'None', 'icbcp', 'cpboost::60::false', 'icbcp', 'None', 1, 100, 50, 1, 1, 20, 5000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(54, 'Reputation Boost (1 hrs)', 'Using this item will DOUBLE all Reputation gained from killing monsters or completing quests for 1 hour of in-game play time.', 'ServerUse', 'None', 'icbrep', 'repboost::60::false', 'icbrep', 'None', 1, 100, 50, 1, 1, 20, 5000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(665, 'Fortune Potion', 'Spin the Wheel, become stronger! Lots MORE Damage for a short time when you equip it.A potion that restores health based on your weapon damage.', 'Item', 'None', 'ich1', 'ich1', 'ich1', 'None', 1, 100, 50, 1, 1, 10, 0, 0, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, '9'),
(1165, 'Standard Destiny Ticket', 'A single stack of destiny ticket, this ticket is used to unlock awesome items in a wheel.', 'Item', 'None', '', '', 'iidesign', 'None', 1, 100, 50, 1, 1, 100, 1000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(1166, 'Stack of Destiny Ticket', 'A multiple stack of destiny ticket, this ticket is used to unlock awesome items in a wheel.', 'Item', 'None', '', '', 'iidesign', 'None', 1, 100, 50, 1, 10, 500, 1000, 1, 1, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, -1, 0, NULL),
(1169, 'Frogzard scales', '...', 'Item', 'None', 'bag', 'bag', 'iibag', 'None', 1, 100, 50, 12, 1, 500, 1, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 1, -1, 0, NULL),
(1170, 'Adventurer Achievement', '...', 'ServerUse', 'None', 'achievement', 'achievement::1', 'iibag', 'None', 1, 100, 50, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 1, -1, 0, NULL),
(1171, 'Administrator Title', '...', 'ServerUse', 'None', 'title', 'title::1', 'iibag', 'None', 1, 100, 50, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 1, -1, 0, NULL),
(1172, 'Server Boosts Bundle', '...', 'ServerUse', 'None', 'bundle', 'bundle::', 'iic2', 'None', 1, 100, 50, 13, 1, 1, 1, 0, 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 1, -1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_rarities`
--

CREATE TABLE `items_rarities` (
  `id` int(11) NOT NULL,
  `Name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `items_rarities`
--

INSERT INTO `items_rarities` (`id`, `Name`) VALUES
(1, 'Unknown'),
(10, 'Unknown'),
(11, 'Common'),
(12, 'Weird'),
(13, 'Awesome'),
(14, '1% Drop'),
(15, '5% Drop'),
(16, 'Boss Drop'),
(17, 'Secret'),
(18, 'Junk'),
(19, 'Impossible'),
(20, 'Artifact'),
(21, 'Limited Time Drop'),
(22, 'Dumb'),
(23, 'Crazy'),
(24, 'Expensive'),
(30, 'Rare'),
(35, 'Epic'),
(40, 'Import Item'),
(50, 'Seasonal Item'),
(55, 'Seasonal Rare'),
(60, 'Event Item'),
(65, 'Event Rare'),
(70, 'Limited Rare'),
(75, 'Collector\'s Rare'),
(80, 'Promotional Item'),
(90, 'Ultra Rare'),
(95, 'Super Mega Ultra Rare'),
(100, 'Legendary Item');

-- --------------------------------------------------------

--
-- Table structure for table `items_requirements`
--

CREATE TABLE `items_requirements` (
  `id` int(11) NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `ReqItemID` int(11) UNSIGNED NOT NULL,
  `Quantity` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items_requirements`
--

INSERT INTO `items_requirements` (`id`, `ItemID`, `ReqItemID`, `Quantity`) VALUES
(1, 1, 7, 50);

-- --------------------------------------------------------

--
-- Table structure for table `items_skills`
--

CREATE TABLE `items_skills` (
  `ItemID` int(11) UNSIGNED NOT NULL,
  `SkillID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `File` varchar(128) NOT NULL,
  `MaxPlayers` tinyint(3) UNSIGNED NOT NULL DEFAULT 6,
  `ReqLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `ReqParty` int(11) UNSIGNED NOT NULL,
  `Upgrade` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Staff` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `PvP` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Dungeon` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WorldBoss` tinyint(1) NOT NULL DEFAULT 0,
  `FirstJoin` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `Name`, `File`, `MaxPlayers`, `ReqLevel`, `ReqParty`, `Upgrade`, `Staff`, `PvP`, `Dungeon`, `WorldBoss`, `FirstJoin`) VALUES
(1, 'faroff', 'town-battleon-21jun17.swf', 10, 1, 0, 0, 0, 0, 0, 0, 1),
(2, 'newbie', 'town-newbie-6jan12.swf', 10, 1, 0, 0, 0, 0, 0, 1, 1),
(3, 'limbo', 'town-limbo.swf', 15, 1, 0, 0, 1, 0, 0, 0, 1),
(6, 'arena', '1VS1-duel-01.11.14-HP.A.swf', 2, 1, 0, 0, 0, 1, 0, 0, 0),
(7, 'guildwars', 'PvP/GVG-duel-12.15.13-HP.A.swf', 10, 1, 0, 0, 0, 1, 0, 0, 1),
(8, 'guildhall', 'GuildHall/guildHallTest.swf', 100, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'deadlock', '1VS1-duel-01.11.14-HP.A.swf', 2, 1, 0, 0, 0, 1, 0, 0, 0),
(10, 'malorfic', '1VS1-duel-01.11.14-HP.A.swf', 2, 1, 0, 0, 0, 1, 0, 0, 1),
(11, 'test', 'test_28.swf', 6, 1, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `maps_cells`
--

CREATE TABLE `maps_cells` (
  `id` int(11) UNSIGNED NOT NULL,
  `MapID` int(11) UNSIGNED NOT NULL,
  `Frame` varchar(16) NOT NULL,
  `Pad` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maps_items`
--

CREATE TABLE `maps_items` (
  `MapID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maps_monsters`
--

CREATE TABLE `maps_monsters` (
  `id` int(11) NOT NULL,
  `MapID` int(11) UNSIGNED NOT NULL,
  `MonsterID` int(11) UNSIGNED NOT NULL,
  `MonMapID` int(11) UNSIGNED NOT NULL,
  `Frame` varchar(16) NOT NULL,
  `Aggresive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `maps_monsters`
--

INSERT INTO `maps_monsters` (`id`, `MapID`, `MonsterID`, `MonMapID`, `Frame`, `Aggresive`) VALUES
(1, 2, 1, 1, 'r2', 0),
(2, 2, 1, 8, 'r2', 0),
(3, 11, 1, 1, 'Enter', 0),
(4, 11, 1, 2, 'Enter', 0),
(5, 11, 1, 3, 'Enter', 0),
(6, 11, 1, 4, 'Enter', 0),
(7, 11, 1, 5, 'Enter', 0);

-- --------------------------------------------------------

--
-- Table structure for table `maps_npcs`
--

CREATE TABLE `maps_npcs` (
  `id` int(11) NOT NULL,
  `NpcID` int(11) NOT NULL,
  `NpcIndex` int(11) NOT NULL DEFAULT 1,
  `Category` varchar(60) NOT NULL DEFAULT 'Boom Bitch!',
  `Description` text NOT NULL DEFAULT 'No Comment Please!',
  `Entry` enum('Left','Right') NOT NULL DEFAULT 'Left',
  `Scene` varchar(60) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maps_npcs`
--

INSERT INTO `maps_npcs` (`id`, `NpcID`, `NpcIndex`, `Category`, `Description`, `Entry`, `Scene`) VALUES
(1, 1, 1, 'Index 1', 'Lorem ipsum!', 'Left', 'None'),
(2, 1, 2, 'Index 2', 'Wooohhh', 'Right', 'None'),
(3, 1, 3, 'Index 3', 'Hello PO!', 'Left', 'None'),
(4, 2, 1, 'Boom Bitch!', 'Hello! :>', 'Left', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `maps_npcs_details`
--

CREATE TABLE `maps_npcs_details` (
  `id` int(11) NOT NULL,
  `MapNpcID` int(11) NOT NULL,
  `Text` varchar(60) NOT NULL,
  `Type` varchar(60) NOT NULL,
  `Value` varchar(60) NOT NULL,
  `Upgrade` tinyint(1) NOT NULL DEFAULT 0,
  `MinLevel` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `maps_npcs_details`
--

INSERT INTO `maps_npcs_details` (`id`, `MapNpcID`, `Text`, `Type`, `Value`, `Upgrade`, `MinLevel`) VALUES
(1, 1, 'Light Shop', 'Item Shop', '1', 0, 1),
(2, 1, 'Light Quest', 'Show Quests', '2', 1, 50),
(3, 2, 'Demo Shop', 'Item Shop', '500', 0, 1),
(4, 1, 'Next', 'Goto', '2', 0, 1),
(5, 2, 'Back', 'Goto', '1', 0, 1),
(6, 2, 'Next', 'Goto', '3', 0, 1),
(7, 3, 'Back', 'Goto', '2', 0, 1),
(8, 1, 'Newbie', '/Join', 'newbie,Enter,Spawn', 0, 1),
(9, 1, 'Faroff', '/Join', 'faroff,Enter,Spawn', 0, 1),
(10, 2, 'Auction', 'Auction', 'none', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `TitleID` int(11) UNSIGNED DEFAULT NULL,
  `RaceID` int(11) DEFAULT 1,
  `File` varchar(128) NOT NULL,
  `Linkage` varchar(32) NOT NULL,
  `Level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `Health` int(11) UNSIGNED NOT NULL DEFAULT 1000,
  `Mana` int(11) UNSIGNED NOT NULL DEFAULT 100,
  `Gold` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Coin` int(11) NOT NULL DEFAULT 0,
  `Experience` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ClassPoint` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Reputation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `DamageReduction` decimal(7,2) NOT NULL DEFAULT 0.00,
  `DPS` int(11) UNSIGNED NOT NULL DEFAULT 100,
  `Respawn` int(11) NOT NULL DEFAULT 6,
  `Speed` int(11) NOT NULL DEFAULT 1500,
  `Immune` int(11) NOT NULL DEFAULT 0,
  `TeamID` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`id`, `Name`, `TitleID`, `RaceID`, `File`, `Linkage`, `Level`, `Health`, `Mana`, `Gold`, `Coin`, `Experience`, `ClassPoint`, `Reputation`, `DamageReduction`, `DPS`, `Respawn`, `Speed`, `Immune`, `TeamID`) VALUES
(1, 'Frogzard', NULL, 1, 'Frogshitzard.swf', 'Frogzard1', 1, 350, 100, 100, 100, 200, 0, 100, '0.00', 15, 6, 2000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `monsters_drops`
--

CREATE TABLE `monsters_drops` (
  `id` int(11) NOT NULL,
  `MonsterID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `Chance` decimal(7,2) UNSIGNED NOT NULL DEFAULT 1.00,
  `Quantity` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `monsters_drops`
--

INSERT INTO `monsters_drops` (`id`, `MonsterID`, `ItemID`, `Chance`, `Quantity`) VALUES
(1, 1, 1169, '0.90', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monsters_skills`
--

CREATE TABLE `monsters_skills` (
  `MonsterID` int(11) UNSIGNED NOT NULL,
  `SkillID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monsters_titles`
--

CREATE TABLE `monsters_titles` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Color` varchar(60) NOT NULL DEFAULT '0xFFFF00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `npcs`
--

CREATE TABLE `npcs` (
  `id` int(11) NOT NULL,
  `MapID` int(11) UNSIGNED NOT NULL,
  `Name` varchar(60) NOT NULL,
  `File` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `npcs`
--

INSERT INTO `npcs` (`id`, `MapID`, `Name`, `File`) VALUES
(1, 11, 'Light', 'npcs/test7.swf'),
(2, 11, 'Joy', 'npcs/test2.swf');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `id` int(11) UNSIGNED NOT NULL,
  `WarID` int(11) UNSIGNED DEFAULT NULL,
  `AchievementID` int(11) UNSIGNED DEFAULT NULL,
  `TitleID` int(11) DEFAULT NULL,
  `FactionID` int(11) UNSIGNED DEFAULT 1,
  `WarMega` tinyint(1) DEFAULT 0,
  `ReqReputation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ReqClassID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ReqClassPoints` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Name` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `EndText` text NOT NULL,
  `Experience` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gold` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Coins` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Reputation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ClassPoints` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `RewardType` char(1) NOT NULL DEFAULT 'S',
  `Level` tinyint(3) NOT NULL DEFAULT 1,
  `Upgrade` tinyint(1) NOT NULL DEFAULT 0,
  `Once` tinyint(1) NOT NULL DEFAULT 0,
  `Slot` int(11) NOT NULL DEFAULT -1,
  `Value` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Field` char(3) NOT NULL DEFAULT '',
  `Index` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`id`, `WarID`, `AchievementID`, `TitleID`, `FactionID`, `WarMega`, `ReqReputation`, `ReqClassID`, `ReqClassPoints`, `Name`, `Description`, `EndText`, `Experience`, `Gold`, `Coins`, `Reputation`, `ClassPoints`, `RewardType`, `Level`, `Upgrade`, `Once`, `Slot`, `Value`, `Field`, `Index`) VALUES
(2, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Destiny Primary Wheel', '', '', 1000, 1250, 0, 0, 0, 'S', 1, 0, 0, -1, 0, '', -1),
(3, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Destiny Stacked Wheel', '', '', 1000, 1250, 0, 0, 0, 'S', 1, 0, 0, -1, 0, '', -1),
(4, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Daily Wheel Spin', '', '', 500, 100, 100, 0, 0, 'R', 1, 0, 0, -1, 0, 'id2', -1),
(5, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Monthly Wheel Spin', '', '', 500, 100, 100, 0, 0, 'R', 1, 0, 0, -1, 0, 'im0', -1),
(9, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Test', 'a', 'a', 1580, 150, 100, 0, 0, 'S', 1, 0, 0, 1, 1, '', 100),
(10, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Test1', 'asdfasdf', 'sadfasdfasdf', 0, 0, 0, 0, 0, 'S', 1, 0, 0, 1, 1, '', 2),
(11, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Test2', 'asdfadsf', 'asdfasdfasdf', 0, 0, 0, 0, 0, 'S', 1, 0, 0, 1, 1, '', 50),
(95, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Daily Wheel Spin', '', '', 500, 100, 100, 0, 0, 'S', 1, 0, 0, -1, 0, 'id0', 3),
(96, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Monthly Wheel', '', '', 700, 200, 200, 0, 0, 'S', 1, 0, 0, -1, 0, 'im0', 1),
(97, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Destiny Primary Wheel', '', '', 1000, 1250, 0, 0, 0, 'S', 1, 0, 0, -1, 0, '', -1),
(98, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Destiny Stacked Wheel', '', '', 1000, 1250, 0, 0, 0, 'S', 1, 0, 0, -1, 0, '', -1),
(172, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Rumors about the monsters', 'Something\'s fishy in this area..', 'Quest Complete!', 250, 300, 50, 1, 250, 'S', 1, 0, 0, 1, 1, '', -1),
(173, NULL, NULL, NULL, 1, 0, 0, 0, 0, 'Those monsters!', 'I\'ve seen those things!', 'Quest Complete!', 350, 500, 100, 0, 200, 'S', 1, 1, 0, 1, 2, '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `quests_locations`
--

CREATE TABLE `quests_locations` (
  `QuestID` int(11) UNSIGNED NOT NULL,
  `MapID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quests_required_items`
--

CREATE TABLE `quests_required_items` (
  `id` int(11) NOT NULL,
  `QuestID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quests_required_items`
--

INSERT INTO `quests_required_items` (`id`, `QuestID`, `ItemID`, `Quantity`) VALUES
(3, 173, 50, 10);

-- --------------------------------------------------------

--
-- Table structure for table `quests_requirements`
--

CREATE TABLE `quests_requirements` (
  `id` int(11) NOT NULL,
  `QuestID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `MapID` int(11) UNSIGNED DEFAULT NULL,
  `Quantity` int(11) DEFAULT 1,
  `Name` varchar(60) DEFAULT NULL,
  `Frame` varchar(60) DEFAULT NULL,
  `Cell` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quests_requirements`
--

INSERT INTO `quests_requirements` (`id`, `QuestID`, `ItemID`, `MapID`, `Quantity`, `Name`, `Frame`, `Cell`) VALUES
(2, 173, 50, 10, 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quests_rewards`
--

CREATE TABLE `quests_rewards` (
  `id` int(11) NOT NULL,
  `QuestID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `Quantity` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `Rate` decimal(7,2) UNSIGNED NOT NULL DEFAULT 1.00,
  `RewardType` varchar(60) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quests_rewards`
--

INSERT INTO `quests_rewards` (`id`, `QuestID`, `ItemID`, `Quantity`, `Rate`, `RewardType`) VALUES
(1, 172, 1170, 1, '0.50', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `races`
--

CREATE TABLE `races` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `races`
--

INSERT INTO `races` (`id`, `Name`) VALUES
(1, 'Unknown'),
(2, 'Human'),
(3, 'Evil'),
(4, 'Chaos'),
(5, 'Dragonkin'),
(6, 'Elemental');

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT 'Server',
  `IP` char(18) NOT NULL DEFAULT '0.0.0.0',
  `Online` tinyint(1) NOT NULL DEFAULT 0,
  `Status` int(11) NOT NULL DEFAULT 1,
  `Upgrade` tinyint(1) NOT NULL DEFAULT 0,
  `Chat` tinyint(1) NOT NULL DEFAULT 2,
  `Count` mediumint(4) NOT NULL DEFAULT 0,
  `Max` mediumint(4) NOT NULL DEFAULT 500,
  `MOTD` text NOT NULL,
  `Port` int(11) NOT NULL DEFAULT 5588
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `Name`, `IP`, `Online`, `Status`, `Upgrade`, `Chat`, `Count`, `Max`, `MOTD`, `Port`) VALUES
(1, 'Dimension', '127.0.0.1', 1, 1, 0, 2, 0, 1000, 'Welcome to Daedalus!', 5588),
(2, 'Offline', '127.0.0.1', 0, 1, 0, 2, 1, 1000, '', 5588);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_filters`
--

CREATE TABLE `settings_filters` (
  `id` int(11) NOT NULL,
  `Word` varchar(60) NOT NULL,
  `Mutetime` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings_filters`
--

INSERT INTO `settings_filters` (`id`, `Word`, `Mutetime`) VALUES
(1, 'dick', 360),
(2, 'dickhead', 360),
(3, 'kingina', 1000),
(4, 'tite', 360),
(5, 'titi', 360);

-- --------------------------------------------------------

--
-- Table structure for table `settings_login`
--

CREATE TABLE `settings_login` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(50) NOT NULL DEFAULT '',
  `location` enum('loader','game','wiki') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings_login`
--

INSERT INTO `settings_login` (`id`, `name`, `value`, `location`) VALUES
(1, 'gMenu', 'Gm.swf', 'game'),
(2, 'sAssets', 'Assets17.02.2020.swf', 'game'),
(3, 'sBG', 'coliseum.swf', 'loader'),
(4, 'sBook', 'interface/secure__FoM.Scroll4.swf', 'game'),
(5, 'sFBC', 'FBC-2011-03-08.swf', 'game'),
(6, 'sFile', '582.swf', 'loader'),
(7, 'sFileLite', 'CLIENT-Daedalus13.swff', 'loader'),
(8, 'sItemPreview', 'ItemPreview04.swf', 'wiki'),
(9, 'sLoader', 'LOADER-Tempest3.swf', 'loader'),
(10, 'sMap', 'extensions/WHEEL-Ethereal.swf', 'game'),
(11, 'sMapPreview', 'MapPreview01.swf', 'wiki'),
(12, 'sNews', 'ArmaGM.swf', 'game'),
(13, 'sProfile', 'Character01.swf', 'wiki'),
(14, 'sTitle', 'Fresh Start!', 'loader'),
(15, 'sVersion', '0.1', 'loader'),
(16, 'sWTSandbox', 'false', 'game');

-- --------------------------------------------------------

--
-- Table structure for table `settings_messages`
--

CREATE TABLE `settings_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Interval` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_rates`
--

CREATE TABLE `settings_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings_rates`
--

INSERT INTO `settings_rates` (`id`, `name`, `value`) VALUES
(1, 'baseBlock', '0.7'),
(2, 'baseBlockValue', '0.7'),
(3, 'baseCrit', '0.05'),
(4, 'baseCritValue', '1.5'),
(5, 'baseDodge', '0.04'),
(6, 'baseEventValue', '0.05'),
(7, 'baseHaste', '0'),
(8, 'baseHit', '0'),
(9, 'baseMiss', '0.1'),
(10, 'baseParry', '0.03'),
(11, 'baseResistValue', '0.7'),
(12, 'bigNumberBase', '8'),
(13, 'curveExponent', '0.66'),
(14, 'GstBase', '12'),
(15, 'GstGoal', '572'),
(16, 'GstRatio', '5.6'),
(17, 'intAPtoDPS', '10'),
(18, 'intBagSpaceCap', '500'),
(19, 'intBagSpacePrice', '200'),
(20, 'intBankSpaceCap', '550'),
(21, 'intBankSpacePrice', '200'),
(22, 'intCoinsCap', '1000000'),
(23, 'intCoinsReward', '5000'),
(24, 'intGoldCap', '1000000'),
(25, 'intHouseSpaceCap', '155'),
(26, 'intHouseSpacePrice', '200'),
(27, 'intHPperEND', '5'),
(28, 'intLevelCap', '100'),
(29, 'intLevelMax', '100'),
(30, 'intMPperWIS', '5'),
(31, 'intSPtoDPS', '10'),
(32, 'intStackCap', '1500'),
(33, 'intStatPointPerLevel', '3'),
(34, 'modRating', '3'),
(35, 'PCDPSMod', '0.85'),
(36, 'PChpBase1', '360'),
(37, 'PChpBase100', '4000'),
(38, 'PChpDelta', '1640'),
(39, 'PChpGoal1', '400'),
(40, 'PChpGoal100', '4000'),
(41, 'PCmpBase1', '100'),
(42, 'PCmpBase100', '2000'),
(43, 'PCmpDelta', '900'),
(44, 'PCstBase', '15'),
(45, 'PCstGoal', '762'),
(46, 'PCstRatio', '7.47'),
(47, 'resistRating', '17'),
(48, 'statsExponent', '1');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `House` tinyint(1) NOT NULL DEFAULT 0,
  `Upgrade` tinyint(1) NOT NULL DEFAULT 0,
  `Staff` tinyint(1) NOT NULL DEFAULT 0,
  `Limited` tinyint(1) NOT NULL DEFAULT 0,
  `Field` varchar(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `Name`, `House`, `Upgrade`, `Staff`, `Limited`, `Field`) VALUES
(1, 'Test Shop', 0, 0, 0, 0, ''),
(2, 'Wheel Ticket Shop', 0, 0, 0, 0, ''),
(3, 'MegaPhone Shop', 0, 0, 0, 0, ''),
(34, 'Newbie', 0, 0, 0, 0, ''),
(39, 'Newbie Shop', 0, 0, 0, 0, ''),
(184, 'Boost Shop', 0, 0, 0, 0, ''),
(299, 'Class Shop', 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `shops_items`
--

CREATE TABLE `shops_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `ShopID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `QuantityRemain` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shops_items`
--

INSERT INTO `shops_items` (`id`, `ShopID`, `ItemID`, `QuantityRemain`) VALUES
(1, 2, 1165, 1),
(2, 2, 1166, 1),
(3, 39, 1170, 1),
(4, 299, 7, 1),
(5, 299, 1171, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shops_locations`
--

CREATE TABLE `shops_locations` (
  `ShopID` int(11) UNSIGNED NOT NULL,
  `MapID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED DEFAULT NULL,
  `Name` varchar(32) NOT NULL,
  `Animation` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `Damage` decimal(7,2) NOT NULL DEFAULT 1.00,
  `Mana` smallint(3) NOT NULL,
  `Icon` varchar(32) NOT NULL,
  `Range` smallint(3) UNSIGNED NOT NULL DEFAULT 808,
  `Dsrc` varchar(70) NOT NULL,
  `Reference` char(2) NOT NULL,
  `Target` char(1) NOT NULL,
  `Effects` char(1) NOT NULL,
  `Type` varchar(7) NOT NULL,
  `Strl` varchar(32) NOT NULL,
  `Cooldown` int(11) UNSIGNED NOT NULL,
  `HitTargets` tinyint(2) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `ItemID`, `Name`, `Animation`, `Description`, `Damage`, `Mana`, `Icon`, `Range`, `Dsrc`, `Reference`, `Target`, `Effects`, `Type`, `Strl`, `Cooldown`, `HitTargets`) VALUES
(2, 2, 'Attack', 'Stab', 'Basic attack for all Warlords.', '0.50', 0, 'imr1,iwsword', 303, '', 'aa', 'h', 'm', 'p', '', 1500, 0),
(3, 2, 'Axe Cleave', 'Stab', 'Cleave your enemy with powerful axe that can does 300% of your current damage!!', '0.90', 30, 'ims2,iwaxe', 303, '', 'a4', 'h', 'm', 'p', 'sp_ee1', 12500, 0),
(4, 2, 'Slash', 'Stab', 'Slash your enemy with high damage to your enemy.', '0.87', 13, 'isl1', 808, '', 'a1', 'h', 'p', 'p', '', 6000, 0),
(5, 2, 'Stab', 'Stab', 'Stab your enemy using your sword and stun your enemy for 4 seconds!', '0.73', 15, 'iss1', 303, '', 'a2', 'h', 'p', 'm', '', 5000, 0),
(6, 2, 'Passive 1', '', 'Additional 10% Critical Chance', '1.00', 0, 'iwdagger, iwsword', 808, '', 'p1', 's', 'm', 'passive', '', 0, 1),
(7, 2, 'Passive 2', '', 'Additional 10% Attack Power', '0.00', 0, 'iwarmor', 808, '', 'p2', 'f', 'm', 'passive', '', 0, 1),
(8, 2, 'Cavalry Army Backup', 'Cheer', 'You got Backup from Kingdoms Cavalry Army to help you. Heal yourself, increase your damage and reduce your enemy damage for 8 seconds.', '-0.50', 25, 'imr2,iihelm', 303, '', 'a3', 'f', 'e', 'm', '', 5500, 0),
(9, 665, 'Health Potion', 'Powerup', 'T', '-2.00', 10, 'iei3', 808, '', 'i1', 'f', 'e', 'm', '', 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skills_auras`
--

CREATE TABLE `skills_auras` (
  `id` int(11) NOT NULL,
  `SkillID` int(11) UNSIGNED NOT NULL,
  `AuraID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `skills_auras`
--

INSERT INTO `skills_auras` (`id`, `SkillID`, `AuraID`) VALUES
(5, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Access` int(11) NOT NULL DEFAULT 1,
  `Color` varchar(60) NOT NULL DEFAULT '0xFFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `Name`, `Access`, `Color`) VALUES
(1, 'Administrator', 60, '0xFFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(32) NOT NULL,
  `password` char(70) NOT NULL,
  `Token` char(70) DEFAULT NULL,
  `TitleID` int(11) UNSIGNED DEFAULT NULL,
  `HairID` int(11) UNSIGNED NOT NULL,
  `Access` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `ActivationFlag` tinyint(1) UNSIGNED NOT NULL DEFAULT 5,
  `PermamuteFlag` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Country` char(2) NOT NULL DEFAULT 'xx',
  `Age` tinyint(2) UNSIGNED NOT NULL,
  `Gender` char(1) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Level` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `BattlePassRank` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `Gold` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Coins` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Exp` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `BattlePassPoints` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ColorHair` char(6) NOT NULL DEFAULT '000000',
  `ColorSkin` char(6) NOT NULL DEFAULT '000000',
  `ColorEye` char(6) NOT NULL DEFAULT '000000',
  `ColorBase` char(6) NOT NULL DEFAULT '000000',
  `ColorTrim` char(6) NOT NULL DEFAULT '000000',
  `ColorAccessory` char(6) NOT NULL DEFAULT '000000',
  `ColorChat` varchar(60) NOT NULL DEFAULT '0xFFFFFF',
  `ColorName` varchar(60) NOT NULL DEFAULT '0xFFFFFF',
  `SlotsAuction` smallint(5) NOT NULL DEFAULT 10,
  `SlotsBag` smallint(5) UNSIGNED NOT NULL DEFAULT 40,
  `SlotsBank` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `SlotsHouse` smallint(5) UNSIGNED NOT NULL DEFAULT 20,
  `DateCreated` datetime NOT NULL,
  `LastLogin` datetime NOT NULL,
  `CpBoostExpire` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `RepBoostExpire` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `GoldBoostExpire` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `CoinsBoostExpire` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `ExpBoostExpire` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `UpgradeExpire` datetime NOT NULL,
  `UpgradeDays` smallint(3) NOT NULL DEFAULT 0,
  `Upgraded` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Achievement` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Settings` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Quests` char(100) NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `Quests2` char(100) NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `DailyQuests0` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `DailyQuests1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `DailyQuests2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `MonthlyQuests0` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `LastArea` varchar(64) NOT NULL DEFAULT 'faroff-1|Enter|Spawn',
  `CurrentServer` varchar(16) NOT NULL DEFAULT 'Offline',
  `HouseInfo` text NOT NULL,
  `KillCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `DeathCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Address` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `GameAddress` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `Rebirth` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `testUsers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `password`, `Token`, `TitleID`, `HairID`, `Access`, `ActivationFlag`, `PermamuteFlag`, `Country`, `Age`, `Gender`, `Email`, `Level`, `BattlePassRank`, `Gold`, `Coins`, `Exp`, `BattlePassPoints`, `ColorHair`, `ColorSkin`, `ColorEye`, `ColorBase`, `ColorTrim`, `ColorAccessory`, `ColorChat`, `ColorName`, `SlotsAuction`, `SlotsBag`, `SlotsBank`, `SlotsHouse`, `DateCreated`, `LastLogin`, `CpBoostExpire`, `RepBoostExpire`, `GoldBoostExpire`, `CoinsBoostExpire`, `ExpBoostExpire`, `UpgradeExpire`, `UpgradeDays`, `Upgraded`, `Achievement`, `Settings`, `Quests`, `Quests2`, `DailyQuests0`, `DailyQuests1`, `DailyQuests2`, `MonthlyQuests0`, `LastArea`, `CurrentServer`, `HouseInfo`, `KillCount`, `DeathCount`, `Address`, `GameAddress`, `Rebirth`, `testUsers_id`) VALUES
(1, 'Leght', '$2y$10$zue9rzGsClkv6HFR.F.ELudf/LJGonRqZzEGjmtKdg3o3e4W/Rbim', NULL, NULL, 52, 60, 5, 0, 'PH', 17, 'M', 'laineyyz10@gmail.com', 50, 0, 47734, 20498, 1522, 0, '5e4f37', 'eacd8a', '1649e', '000000', '000000', '000000', '0xFFFFFF', '0xFFFFFF', 10, 40, 0, 20, '2022-10-29 15:03:07', '2022-09-24 15:03:07', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2022-09-24 15:03:07', 2, 1, 0, 1, '0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0, 2, 'faroff|Enter|Spawn', 'Offline', '', 0, 0, '127.0.0.1', '0.0.0.0', 0, NULL),
(2, 'Demo', '$2y$10$.8HMQBZMFWY8xClJQcgb/ON6e7brJD7i/TBIoQEr1KvvnL423DUQC', NULL, NULL, 52, 1, 5, 0, 'PH', 17, 'M', 'Demo@gmail.com', 30, 0, 30891, 206, 701, 0, '5e4f37', 'eacd8a', '1649e', '000000', '000000', '000000', '0xFFFFFF', '0xFFFFFF', 10, 40, 0, 20, '2022-10-30 02:38:02', '2022-10-30 02:38:02', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2022-09-29 02:38:02', -6, 0, 0, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0, 2, 'faroff|Enter|Spawn', 'Offline', '', 0, 0, '127.0.0.1', '0.0.0.0', 0, NULL),
(3, 'Light', '$2y$10$LrYFp24rYZ0jbKIwteJdpuAxWcjwNqlmb7bC9m0xm2AqVzpK6/MCq', NULL, 1, 52, 1, 5, 0, 'PH', 17, 'M', 'qqqqqqqqqqqqq@gmail.com', 1, 0, 500, 500, 500, 0, '5e4f37', 'eacd8a', '1649e', '000000', '000000', '000000', '0xFFFFFF', '0xFFFFFF', 10, 40, 0, 20, '2023-04-10 19:07:46', '2023-04-10 19:07:46', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '2023-04-10 19:07:46', 2, 1, 0, 0, '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', 0, 0, 0, 2, 'faroff|Enter|Spawn', 'Daedalus', '', 0, 0, '0.0.0.0', '0.0.0.0', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_achievements`
--

CREATE TABLE `users_achievements` (
  `id` int(11) UNSIGNED NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `AchievementID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_achievements`
--

INSERT INTO `users_achievements` (`id`, `UserID`, `AchievementID`) VALUES
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_factions`
--

CREATE TABLE `users_factions` (
  `id` int(11) NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `FactionID` int(11) UNSIGNED NOT NULL,
  `Reputation` mediumint(6) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_friends`
--

CREATE TABLE `users_friends` (
  `UserID` int(11) UNSIGNED NOT NULL,
  `FriendID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_friends`
--

INSERT INTO `users_friends` (`UserID`, `FriendID`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_guilds`
--

CREATE TABLE `users_guilds` (
  `id` int(11) UNSIGNED NOT NULL,
  `GuildID` int(11) UNSIGNED NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `Rank` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_guilds`
--

INSERT INTO `users_guilds` (`id`, `GuildID`, `UserID`, `Rank`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_items`
--

CREATE TABLE `users_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `ItemID` int(11) UNSIGNED NOT NULL,
  `EnhID` int(11) UNSIGNED DEFAULT NULL,
  `Equipped` tinyint(1) UNSIGNED NOT NULL,
  `Quantity` mediumint(6) UNSIGNED NOT NULL,
  `Bank` tinyint(1) UNSIGNED NOT NULL,
  `DatePurchased` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_items`
--

INSERT INTO `users_items` (`id`, `UserID`, `ItemID`, `EnhID`, `Equipped`, `Quantity`, `Bank`, `DatePurchased`) VALUES
(1, 1, 1, 2, 1, 1, 0, '2022-09-24 15:03:07'),
(2, 1, 2, 1, 1, 302500, 0, '2022-09-24 15:03:07'),
(3, 1, 4, 3, 0, 1, 0, '2023-02-18 22:56:09'),
(38, 1, 1169, 1, 0, 40, 0, '2023-02-18 23:07:49'),
(39, 1, 1170, 1, 0, 1, 0, '2023-03-17 10:57:14'),
(40, 2, 1, 2, 1, 1, 0, '2023-04-10 16:23:17'),
(41, 2, 2, 1, 1, 1, 0, '2023-04-10 16:23:37'),
(42, 3, 1, 2, 1, 1, 0, '2023-04-10 19:11:54'),
(43, 3, 2, 1, 1, 1, 0, '2023-04-10 19:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `Violation` varchar(64) NOT NULL,
  `Details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `UserID`, `Violation`, `Details`) VALUES
(1, 1, 'Packet Edit [TryQuestComplete]', 'Attempted to complete an unaccepted quest: Monthly Wheel'),
(2, 1, 'Packet Edit [TryQuestComplete]', 'Attempted to complete an unaccepted quest: Monthly Wheel'),
(3, 1, 'Packet Edit [TryQuestComplete]', 'Attempted to complete an unaccepted quest: Monthly Wheel'),
(4, 1, 'Packet Edit [TryQuestComplete]', 'Attempted to complete an unaccepted quest: Monthly Wheel'),
(5, 1, 'Packet Edit [TryQuestComplete]', 'Attempted to complete an unaccepted quest: Monthly Wheel'),
(6, 1, 'Packet Edit [BuyItem]', 'Attempted to purchase more than stack value'),
(7, 1, 'Packet Edit [BuyItem]', 'Attempted to purchase more than stack value'),
(8, 1, 'Packet Edit [BuyItem]', 'Attempted to purchase more than stack value'),
(9, 1, 'Packet Edit [BuyItem]', 'Attempted to purchase more than stack value'),
(10, 1, 'Packet Edit [BuyItem]', 'Attempted to purchase more than stack value');

-- --------------------------------------------------------

--
-- Table structure for table `users_reports`
--

CREATE TABLE `users_reports` (
  `id` int(11) NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `TargetName` varchar(60) NOT NULL,
  `Category` varchar(60) NOT NULL,
  `Description` text NOT NULL,
  `DateSubmitted` datetime NOT NULL DEFAULT '1974-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wars`
--

CREATE TABLE `wars` (
  `id` int(11) UNSIGNED NOT NULL,
  `Name` varchar(60) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `Points` int(11) DEFAULT 0,
  `MaxPoints` int(11) DEFAULT 10000000
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wheels`
--

CREATE TABLE `wheels` (
  `ItemID` int(11) UNSIGNED NOT NULL,
  `Chance` decimal(7,2) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `Type` enum('Doom','Destiny') NOT NULL DEFAULT 'Destiny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wheels`
--

INSERT INTO `wheels` (`ItemID`, `Chance`, `Quantity`, `Type`) VALUES
(1172, '0.30', 1, 'Destiny');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userarticles_userid` (`Author`);

--
-- Indexes for table `auras`
--
ALTER TABLE `auras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auras_effects`
--
ALTER TABLE `auras_effects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_auras_effects_auras` (`AuraID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`,`ItemID`) USING BTREE,
  ADD KEY `FK_classes_items` (`ItemID`);

--
-- Indexes for table `enhancements`
--
ALTER TABLE `enhancements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_enhancements_patternid` (`PatternID`);

--
-- Indexes for table `enhancements_patterns`
--
ALTER TABLE `enhancements_patterns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hairs`
--
ALTER TABLE `hairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_items_enhid` (`EnhID`),
  ADD KEY `fk_items_factionid` (`FactionID`),
  ADD KEY `fk_items_reqclassid` (`ReqClassID`),
  ADD KEY `FK_items_items_rarities` (`Rarity`),
  ADD KEY `FK_items_titles` (`TitleID`);

--
-- Indexes for table `items_rarities`
--
ALTER TABLE `items_rarities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_requirements`
--
ALTER TABLE `items_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_items_requirements_items` (`ItemID`),
  ADD KEY `FK_items_requirements_items_2` (`ReqItemID`);

--
-- Indexes for table `items_skills`
--
ALTER TABLE `items_skills`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `FK_items_skills_skills` (`SkillID`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps_cells`
--
ALTER TABLE `maps_cells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_MAPID` (`MapID`);

--
-- Indexes for table `maps_items`
--
ALTER TABLE `maps_items`
  ADD PRIMARY KEY (`MapID`,`ItemID`),
  ADD KEY `fk_mapitem_itemid` (`ItemID`);

--
-- Indexes for table `maps_monsters`
--
ALTER TABLE `maps_monsters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_maps_monsters_maps` (`MapID`),
  ADD KEY `FK_maps_monsters_monsters` (`MonsterID`);

--
-- Indexes for table `maps_npcs`
--
ALTER TABLE `maps_npcs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `maps_npcs_details`
--
ALTER TABLE `maps_npcs_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_maps_npcs_details_maps_npcs` (`MapNpcID`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_monsters_monsters_titles` (`TitleID`) USING BTREE,
  ADD KEY `FK_monsters_races` (`RaceID`);

--
-- Indexes for table `monsters_drops`
--
ALTER TABLE `monsters_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_monsters_drops_monsters` (`MonsterID`),
  ADD KEY `FK_monsters_drops_items` (`ItemID`);

--
-- Indexes for table `monsters_skills`
--
ALTER TABLE `monsters_skills`
  ADD PRIMARY KEY (`MonsterID`),
  ADD KEY `FK_monsters_skills_monsters` (`MonsterID`),
  ADD KEY `FK_monsters_skills_skills` (`SkillID`);

--
-- Indexes for table `monsters_titles`
--
ALTER TABLE `monsters_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `npcs`
--
ALTER TABLE `npcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quests_factionid` (`FactionID`),
  ADD KEY `fk_quests_classid` (`ReqClassID`),
  ADD KEY `FK_quests_achievements` (`AchievementID`),
  ADD KEY `FK_quests_wars` (`WarID`);

--
-- Indexes for table `quests_locations`
--
ALTER TABLE `quests_locations`
  ADD PRIMARY KEY (`QuestID`,`MapID`),
  ADD KEY `fk_quesloc_mapid` (`MapID`);

--
-- Indexes for table `quests_required_items`
--
ALTER TABLE `quests_required_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_quests_reqditems_quests` (`QuestID`),
  ADD KEY `FK_quests_reqditems_items` (`ItemID`);

--
-- Indexes for table `quests_requirements`
--
ALTER TABLE `quests_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmuw6ian13i0bgbncnisalmofo` (`ItemID`),
  ADD KEY `FKnv2akil8ddpptmwi9fuedlueo` (`MapID`),
  ADD KEY `FK7ja2i1gayntqyx8acr1fh80tf` (`QuestID`);

--
-- Indexes for table `quests_rewards`
--
ALTER TABLE `quests_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkxgsbchs88dj96al5gg18roi6` (`ItemID`),
  ADD KEY `FKp12rmebsmpa9a5hx6qa2yfv04` (`QuestID`);

--
-- Indexes for table `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings_filters`
--
ALTER TABLE `settings_filters`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `settings_login`
--
ALTER TABLE `settings_login`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `settings_messages`
--
ALTER TABLE `settings_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_rates`
--
ALTER TABLE `settings_rates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops_items`
--
ALTER TABLE `shops_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shopitems_shopid` (`ShopID`),
  ADD KEY `fk_shopitems_itemid` (`ItemID`);

--
-- Indexes for table `shops_locations`
--
ALTER TABLE `shops_locations`
  ADD PRIMARY KEY (`ShopID`,`MapID`),
  ADD KEY `fk_shoploc_mapid` (`MapID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_skills_classid` (`ItemID`);

--
-- Indexes for table `skills_auras`
--
ALTER TABLE `skills_auras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_skills_auras_skills` (`SkillID`),
  ADD KEY `FK_skills_auras_auras` (`AuraID`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`Name`,`password`),
  ADD UNIQUE KEY `Username` (`Name`),
  ADD KEY `fk_users_hairid` (`HairID`),
  ADD KEY `Hash` (`password`),
  ADD KEY `FK_users_titles` (`TitleID`);

--
-- Indexes for table `users_achievements`
--
ALTER TABLE `users_achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_achievements_users` (`UserID`),
  ADD KEY `FK_users_achievements_achievements` (`AchievementID`);

--
-- Indexes for table `users_factions`
--
ALTER TABLE `users_factions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UserID` (`UserID`,`FactionID`),
  ADD KEY `fk_userfactions_factionid` (`FactionID`);

--
-- Indexes for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`UserID`,`FriendID`),
  ADD KEY `fk_friends_friendid` (`FriendID`);

--
-- Indexes for table `users_guilds`
--
ALTER TABLE `users_guilds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_users_guilds_guilds` (`GuildID`),
  ADD KEY `FK_users_guilds_users` (`UserID`);

--
-- Indexes for table `users_items`
--
ALTER TABLE `users_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid_itemid` (`ItemID`,`UserID`),
  ADD KEY `fk_useritems_enhid` (`EnhID`),
  ADD KEY `fk_useritems_userid` (`UserID`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userlogs_userid` (`UserID`);

--
-- Indexes for table `users_reports`
--
ALTER TABLE `users_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_reports_users` (`UserID`);

--
-- Indexes for table `wars`
--
ALTER TABLE `wars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wheels`
--
ALTER TABLE `wheels`
  ADD PRIMARY KEY (`ItemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auras`
--
ALTER TABLE `auras`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auras_effects`
--
ALTER TABLE `auras_effects`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enhancements`
--
ALTER TABLE `enhancements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enhancements_patterns`
--
ALTER TABLE `enhancements_patterns`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hairs`
--
ALTER TABLE `hairs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=958;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1173;

--
-- AUTO_INCREMENT for table `items_rarities`
--
ALTER TABLE `items_rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `items_requirements`
--
ALTER TABLE `items_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `maps_cells`
--
ALTER TABLE `maps_cells`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maps_monsters`
--
ALTER TABLE `maps_monsters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `maps_npcs`
--
ALTER TABLE `maps_npcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `monsters`
--
ALTER TABLE `monsters`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `monsters_drops`
--
ALTER TABLE `monsters_drops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `monsters_titles`
--
ALTER TABLE `monsters_titles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quests`
--
ALTER TABLE `quests`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `quests_required_items`
--
ALTER TABLE `quests_required_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quests_requirements`
--
ALTER TABLE `quests_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quests_rewards`
--
ALTER TABLE `quests_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `races`
--
ALTER TABLE `races`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings_filters`
--
ALTER TABLE `settings_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings_login`
--
ALTER TABLE `settings_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `settings_messages`
--
ALTER TABLE `settings_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings_rates`
--
ALTER TABLE `settings_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `shops_items`
--
ALTER TABLE `shops_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `skills_auras`
--
ALTER TABLE `skills_auras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_achievements`
--
ALTER TABLE `users_achievements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_factions`
--
ALTER TABLE `users_factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_guilds`
--
ALTER TABLE `users_guilds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_items`
--
ALTER TABLE `users_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_reports`
--
ALTER TABLE `users_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wars`
--
ALTER TABLE `wars`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auras_effects`
--
ALTER TABLE `auras_effects`
  ADD CONSTRAINT `FK_auras_effects_auras` FOREIGN KEY (`AuraID`) REFERENCES `auras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `FK_classes_items` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enhancements`
--
ALTER TABLE `enhancements`
  ADD CONSTRAINT `FK_enhancements_enhancements_patterns` FOREIGN KEY (`PatternID`) REFERENCES `enhancements_patterns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FK_items_enhancements` FOREIGN KEY (`EnhID`) REFERENCES `enhancements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_items_factions` FOREIGN KEY (`FactionID`) REFERENCES `factions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_items_titles` FOREIGN KEY (`TitleID`) REFERENCES `titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items_requirements`
--
ALTER TABLE `items_requirements`
  ADD CONSTRAINT `FK_items_requirements_items` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_items_requirements_items_2` FOREIGN KEY (`ReqItemID`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items_skills`
--
ALTER TABLE `items_skills`
  ADD CONSTRAINT `FKpp1cdddrcqxq1qxx9rjnvpp3r` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `FKqyt8g25xcsjrbt21de7clmkf8` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`id`);

--
-- Constraints for table `maps_items`
--
ALTER TABLE `maps_items`
  ADD CONSTRAINT `FKg9692euy8ff48y6mmxntemklc` FOREIGN KEY (`MapID`) REFERENCES `maps` (`id`),
  ADD CONSTRAINT `FKqm8afl1ljard4s2nib32g69ts` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`);

--
-- Constraints for table `maps_monsters`
--
ALTER TABLE `maps_monsters`
  ADD CONSTRAINT `FKj4bx7ums3hogq184e3m3pnfb8` FOREIGN KEY (`MonsterID`) REFERENCES `monsters` (`id`),
  ADD CONSTRAINT `FKois5ak4sxfhdlx37p7xeh83sg` FOREIGN KEY (`MapID`) REFERENCES `maps` (`id`);

--
-- Constraints for table `maps_npcs_details`
--
ALTER TABLE `maps_npcs_details`
  ADD CONSTRAINT `FK_maps_npcs_details_maps_npcs` FOREIGN KEY (`MapNpcID`) REFERENCES `maps_npcs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `monsters`
--
ALTER TABLE `monsters`
  ADD CONSTRAINT `FK3b3wdgin2490jsg33binqqrvn` FOREIGN KEY (`TitleID`) REFERENCES `titles` (`id`),
  ADD CONSTRAINT `FK_monsters_races` FOREIGN KEY (`RaceID`) REFERENCES `races` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `monsters_drops`
--
ALTER TABLE `monsters_drops`
  ADD CONSTRAINT `FK6gxmy23qojgc6th3dclji6onq` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `FKn7mqwuhn9copfd5ychsisjvqc` FOREIGN KEY (`MonsterID`) REFERENCES `monsters` (`id`);

--
-- Constraints for table `monsters_skills`
--
ALTER TABLE `monsters_skills`
  ADD CONSTRAINT `FK8wpgjnoctef64danl01ia3swn` FOREIGN KEY (`MonsterID`) REFERENCES `monsters` (`id`),
  ADD CONSTRAINT `FKoe3xgdrji49tugb4307tsoa3h` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`id`);

--
-- Constraints for table `quests`
--
ALTER TABLE `quests`
  ADD CONSTRAINT `FK1kaook9lujr6s2cwqr8rknegv` FOREIGN KEY (`AchievementID`) REFERENCES `achievements` (`id`),
  ADD CONSTRAINT `FK8nw5gp0m01yv7u00kmgpdam55` FOREIGN KEY (`FactionID`) REFERENCES `factions` (`id`),
  ADD CONSTRAINT `FKnb8ktwlipo9t6el68robjv2p1` FOREIGN KEY (`WarID`) REFERENCES `wars` (`id`);

--
-- Constraints for table `quests_required_items`
--
ALTER TABLE `quests_required_items`
  ADD CONSTRAINT `FKaenplea63pwgmx8cdq7a4smpc` FOREIGN KEY (`QuestID`) REFERENCES `quests` (`id`),
  ADD CONSTRAINT `FKmqhhvsl7v6n7dcqveyyib0j1d` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`);

--
-- Constraints for table `quests_requirements`
--
ALTER TABLE `quests_requirements`
  ADD CONSTRAINT `FK7ja2i1gayntqyx8acr1fh80tf` FOREIGN KEY (`QuestID`) REFERENCES `quests` (`id`),
  ADD CONSTRAINT `FKmuw6ian13i0bgbncnisalmofo` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `FKnv2akil8ddpptmwi9fuedlueo` FOREIGN KEY (`MapID`) REFERENCES `maps` (`id`);

--
-- Constraints for table `quests_rewards`
--
ALTER TABLE `quests_rewards`
  ADD CONSTRAINT `FKkxgsbchs88dj96al5gg18roi6` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `FKp12rmebsmpa9a5hx6qa2yfv04` FOREIGN KEY (`QuestID`) REFERENCES `quests` (`id`);

--
-- Constraints for table `shops_items`
--
ALTER TABLE `shops_items`
  ADD CONSTRAINT `FKhy5g6k69qtdxbv0lpwl08jxc4` FOREIGN KEY (`ShopID`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `FKqikn091kioqm0dbkf1t0w0phm` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`);

--
-- Constraints for table `shops_locations`
--
ALTER TABLE `shops_locations`
  ADD CONSTRAINT `FK5iofm65m5fxa8j8gbxem1llub` FOREIGN KEY (`ShopID`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `FK70b7s541f5xuk1f2bq5nr98nv` FOREIGN KEY (`MapID`) REFERENCES `maps` (`id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `FKfnugnfosyatcqhkhum0otglx2` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills_auras`
--
ALTER TABLE `skills_auras`
  ADD CONSTRAINT `FK_skills_auras_auras` FOREIGN KEY (`AuraID`) REFERENCES `auras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_skills_auras_skills` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKjooxoq3dyfujnxdookvwmqm3f` FOREIGN KEY (`TitleID`) REFERENCES `titles` (`id`),
  ADD CONSTRAINT `FKk5xtmfxv33m8frrumlh13lje0` FOREIGN KEY (`HairID`) REFERENCES `hairs` (`id`);

--
-- Constraints for table `users_guilds`
--
ALTER TABLE `users_guilds`
  ADD CONSTRAINT `FK_users_guilds_guilds` FOREIGN KEY (`GuildID`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_guilds_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_items`
--
ALTER TABLE `users_items`
  ADD CONSTRAINT `FK74w0y27rldrrr5bxv7qilfjl4` FOREIGN KEY (`EnhID`) REFERENCES `enhancements` (`id`),
  ADD CONSTRAINT `FKskp2d25pul0ttf34s8qwg3hkl` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKss555n17dhk5gpfbbr5y67541` FOREIGN KEY (`ItemID`) REFERENCES `items` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `[Login] Daily Login Reset` ON SCHEDULE EVERY 1 DAY STARTS '2020-08-26 00:00:00' ENDS '2025-10-10 19:34:15' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE users_daily_login SET Day1 = 0, Day2 = 0, Day3 = 0, Day4 = 0, Day5 = 0, Day6 = 0 WHERE Day1 = 1 AND Day2 = 1 AND Day3 = 1 AND Day4 = 1 AND Day5 = 1 AND Day6 = 1$$

CREATE DEFINER=`root`@`localhost` EVENT `[Quest] Daily Quest Reset` ON SCHEDULE EVERY 1 DAY STARTS '2020-08-26 00:00:00' ENDS '2025-10-10 19:34:15' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE users SET DailyQuests0 = 0, DailyQuests1 = 0, DailyQuests2 = 0, UpgradeDays=UpgradeDays-1$$

CREATE DEFINER=`root`@`localhost` EVENT `[Quest] Monthly Reset` ON SCHEDULE EVERY 1 MONTH STARTS '2020-10-10 19:33:00' ENDS '2025-10-10 19:34:15' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE users SET MonthlyQuests0 = 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
