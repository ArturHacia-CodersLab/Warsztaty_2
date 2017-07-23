-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 23 Lip 2017, 11:16
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `workshop`
--
CREATE DATABASE IF NOT EXISTS `workshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `workshop`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `excercise`
--

CREATE TABLE IF NOT EXISTS `excercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `solution`
--

CREATE TABLE IF NOT EXISTS `solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `excercise_id` int(11) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `excercise_id` (`excercise_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_group_id` (`person_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `solution`
--
ALTER TABLE `solution`
  ADD CONSTRAINT `solution_ibfk_1` FOREIGN KEY (`excercise_id`) REFERENCES `excercise` (`id`),
  ADD CONSTRAINT `solution_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`person_group_id`) REFERENCES `user_group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
