-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 03:51
-- Version du serveur :  5.5.48
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `kindo`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`name`, `description`) VALUES
('aef', 'aefae'),
('eaffea', 'efafa'),
('feaeaf', 'feaa');

-- --------------------------------------------------------

--
-- Structure de la table `activity_class`
--

DROP TABLE IF EXISTS `activity_class`;
CREATE TABLE IF NOT EXISTS `activity_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity_class`
--

INSERT INTO `activity_class` (`id`, `class_id`, `activity_id`, `date`) VALUES
(19, 15, 4, '2020-02-10'),
(27, 0, 0, '2020-02-02'),
(28, 0, 0, '2020-02-12'),
(29, 0, 0, '2020-02-12'),
(30, 0, 0, '2020-02-12'),
(31, 0, 0, '2020-02-12'),
(32, 0, 0, '2020-02-12');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) NOT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `cin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `child`
--

DROP TABLE IF EXISTS `child`;
CREATE TABLE IF NOT EXISTS `child` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `save_nurs_id` int(11) NOT NULL,
  `save_resto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_child` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `class`
--

INSERT INTO `class` (`id`, `nb_child`, `name`, `level`) VALUES
(41, 12, 'Claase 1', 2),
(43, 11, 'Class2', 2),
(44, 2, 'class3', 1);

-- --------------------------------------------------------

--
-- Structure de la table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `date_day` date NOT NULL,
  `plate1` varchar(255) NOT NULL,
  `plate2` varchar(255) NOT NULL,
  `plate3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) NOT NULL,
  `password_requested_at` varchar(255) DEFAULT NULL,
  `roles` longtext NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `nbr_child` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `teacher_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `publication`
--

INSERT INTO `publication` (`id`, `subject`, `content`, `teacher_name`) VALUES
(8, 'To do at home ', 'repating activities e', 'layla'),
(13, 'gea', 'eeee', 'layla'),
(14, 'fzafaz', 'abababa', 'layla'),
(15, 'aaaaaa', 'aaaaa', 'layla'),
(16, 'work to do', 'hello this person can', 'aziz');

-- --------------------------------------------------------

--
-- Structure de la table `save_nurse`
--

DROP TABLE IF EXISTS `save_nurse`;
CREATE TABLE IF NOT EXISTS `save_nurse` (
  `id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `hour_begin` datetime NOT NULL,
  `hour_end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `save_resto`
--

DROP TABLE IF EXISTS `save_resto`;
CREATE TABLE IF NOT EXISTS `save_resto` (
  `id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(180) NOT NULL,
  `password_requested_at` varchar(255) DEFAULT NULL,
  `roles` longtext NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `teacher`
--

INSERT INTO `teacher` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `account_type`, `subject`) VALUES
(1, 'aziz', 'username_canonical', 'aziz13mth@gmail.com', 'email_canonical', 0, 'salt', '1512', NULL, 'confirmation_token', NULL, 'roles', 'Teacher', 'Electronics'),
(2, 'layla', 'lili', 'layla@gmail.com', 'lili@gmail.tn', 4, 'qqq', 'qsdf', '', 'lili1741', 'qqqqq', 'hh', '', ''),
(7, 'layla', 'lili', 'layla@gmail.com', 'lili@gmail.tn', 4, 'qqq', 'qsdf', '', 'lili1741', 'qqqqq', 'hh', 'hh', 'hh');

-- --------------------------------------------------------

--
-- Structure de la table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
CREATE TABLE IF NOT EXISTS `time_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(20) NOT NULL,
  `activity` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) NOT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `account_type`) VALUES
(0, 'skander', 'username_canonical', 'skander.baccouche@esprit.tn', 'skander.baccouche@esprit.tn', 0, 'salt', '1512', NULL, 'confirmation_token', NULL, 'roles', 'Teacher'),
(1, 'maissa', 'username_canonical', 'maissa.belfekih@esprit.tn', 'maissa.belfekih@esprit.tn', 0, 'salt', '1234', NULL, 'confirmation_token', NULL, 'roles', 'Teacher');

-- --------------------------------------------------------

--
-- Structure de la table `view`
--

DROP TABLE IF EXISTS `view`;
CREATE TABLE IF NOT EXISTS `view` (
  `id` int(11) NOT NULL,
  `nb_stars` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
