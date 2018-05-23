--Az adatbázis neve bor--

-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2018. Máj 21. 19:58
-- Kiszolgáló verziója: 5.7.21
-- PHP verzió: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bor`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cheeses`
--

DROP TABLE IF EXISTS `cheeses`;
CREATE TABLE IF NOT EXISTS `cheeses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `hardness` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `fat` float NOT NULL,
  `price` mediumint(9) NOT NULL,
  `smoked` tinyint(4) NOT NULL,
  `db` smallint(6) DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `db` (`db`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `cheeses`
--

INSERT INTO `cheeses` (`id`, `name`, `hardness`, `fat`, `price`, `smoked`, `db`) VALUES
(1, 'parmezán', 'kemény', 32, 6000, 0, 10),
(2, 'feta', 'lágy', 21.3, 2360, 0, 10),
(3, 'maci', 'lágy', 22.8, 2500, 0, 10),
(4, 'ricotta', 'kemény', 13, 1250, 0, 10),
(5, 'karaván', 'félkemény', 23, 2000, 1, 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cigars`
--

DROP TABLE IF EXISTS `cigars`;
CREATE TABLE IF NOT EXISTS `cigars` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `length` tinyint(4) NOT NULL,
  `country` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `price` mediumint(9) NOT NULL,
  `db` smallint(6) DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `db` (`db`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `cigars`
--

INSERT INTO `cigars` (`id`, `name`, `length`, `country`, `price`, `db`) VALUES
(1, 'The Edge Habano Torpedo', 8, 'Kuba', 1999, 10),
(2, 'Padron 1964 Anniversary Series A', 10, 'Kuba', 9499, 10),
(3, 'Árpád lelke', 9, 'Magyarország', 895, 10),
(4, 'Kiss of an English bride', 5, 'Anglia', 2947, 10),
(5, 'Santa Christina Campo Grande Orvieto Classico Cigaro', 18, 'Olaszország', 2349, 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderdate` date NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `wineid` bigint(20) DEFAULT NULL,
  `cheeseid` bigint(20) DEFAULT NULL,
  `cigarid` bigint(20) DEFAULT NULL,
  `winedb` smallint(6) DEFAULT NULL,
  `cheesedb` smallint(6) DEFAULT NULL,
  `cigardb` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users` (`userid`),
  KEY `fk_orders_wines` (`wineid`),
  KEY `fk_orders_cheeses` (`cheeseid`),
  KEY `fk_orders_cigars` (`cigarid`),
  KEY `winedb` (`winedb`),
  KEY `cheesedb` (`cheesedb`,`cigardb`),
  KEY `cigardb` (`cigardb`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orders`
--

INSERT INTO `orders` (`id`, `orderdate`, `userid`, `wineid`, `cheeseid`, `cigarid`, `winedb`, `cheesedb`, `cigardb`) VALUES
(1, '2018-05-17', 3, 4, 2, 4, 1, 2, 1),
(2, '2018-02-22', 2, 8, 4, 3, 2, 1, 3),
(3, '2018-03-03', 4, 3, NULL, 3, 2, NULL, 1),
(4, '2018-02-13', 8, 5, NULL, 1, 1, NULL, 1),
(5, '2017-12-12', 1, NULL, 4, 2, NULL, 1, 2),
(6, '2017-09-08', 3, NULL, 5, 3, NULL, 1, 5),
(7, '2018-01-02', 8, 12, 5, NULL, 2, 2, NULL),
(8, '2017-06-05', 7, 9, 4, NULL, 3, 1, NULL),
(9, '2017-09-05', 10, 4, NULL, NULL, 2, NULL, NULL),
(10, '2017-10-08', 8, 1, NULL, NULL, 3, NULL, NULL),
(11, '2018-03-15', 3, 4, NULL, NULL, 1, NULL, NULL),
(12, '2017-11-10', 2, 7, NULL, NULL, 2, NULL, NULL),
(13, '2017-05-02', 6, 8, NULL, 5, 2, NULL, 2),
(14, '2018-02-22', 1, 6, NULL, 3, 1, NULL, 1),
(15, '2017-10-12', 5, 2, 4, NULL, 2, 2, NULL),
(16, '2017-10-12', 5, 10, 3, NULL, 1, 1, NULL),
(17, '2018-04-20', 9, 11, 1, NULL, 1, 2, NULL),
(18, '2018-02-28', 6, 9, 5, NULL, 1, 2, NULL),
(19, '2018-02-28', 6, 3, 2, NULL, 2, 2, NULL),
(20, '2018-05-17', 7, 4, NULL, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `pw` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `dob` date NOT NULL,
  `postal_code` varchar(5) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `city` varchar(200) COLLATE utf8_hungarian_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `email`, `pw`, `name`, `dob`, `postal_code`, `city`, `address`) VALUES
(1, 'kisspista@gmail.com', '123456789', 'Kiss Pista', '1975-05-10', '1224', 'Budapest', 'Rózsa u. 2.'),
(2, 'horvathjozsef@gmail.com', '987654321', 'Horváth József', '1980-10-03', '5100', 'Jászberény', 'Rigó u. 10.'),
(3, 'molnarpetra@gmail.com', 'abcdefg', 'Molnár Petra', '1996-07-30', '2440', 'Százhalombatta', 'Béka u. 5.'),
(4, 'majoranna@gmail.com', 'gfedcba', 'Major Anna', '1997-04-01', '1015', 'Budapest', 'Bagoly u. 2.'),
(5, 'kormodon@gmail.com', 'hello', 'Körm Ödön', '1952-12-31', '2160', 'Váchartyán', 'Ady Endre u. 1.'),
(6, 'szajharmonika@gmail.com', 'olleh', 'Szájhar Mónika', '1960-02-05', '5000', 'Szolnok', 'Batsányi u. 41.'),
(7, 'kissbela@gmail.com', 'szia', 'Kiss Béla', '1947-08-21', '3508', 'Miskolc', 'Áchim András u. 8.'),
(8, 'horvathgeza@gmail.com', 'aizs', 'Horváth Géza', '1930-09-06', '6791', 'Szeged', 'Dózsa u. 22.'),
(9, 'tothpeter@gmail.com', 'blabla', 'Tóth Péter', '1989-11-23', '9092', 'Tarjánpuszta', 'Viola u. 75.'),
(10, 'temesvaribence@gmail.com', 'albalb', 'Temesvári Bence', '1995-04-10', '1066', 'Budapest', 'Fellegvár u. 60.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wines`
--

DROP TABLE IF EXISTS `wines`;
CREATE TABLE IF NOT EXISTS `wines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `color` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `taste` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `price` mediumint(9) NOT NULL,
  `type` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `wineyear` smallint(6) NOT NULL,
  `db` smallint(6) DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `db` (`db`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `wines`
--

INSERT INTO `wines` (`id`, `name`, `color`, `taste`, `country`, `price`, `type`, `wineyear`, `db`) VALUES
(1, 'SKIZO', 'fehér', 'száraz', 'Magyarország', 3999, 'Olaszrizling', 2009, 100),
(2, 'Varga', 'rozé', 'száraz', 'Magyarország', 1899, 'Hárslevelű', 2015, 100),
(3, 'Göncöl', 'fehér', 'félszáraz', 'Magyarország', 2050, 'Szamorodni', 2011, 100),
(4, 'Chateauchebal Blanc', 'fehér', 'édes', 'Franciaország', 5636589, 'Savignon Blanc', 1947, 100),
(5, 'Santa Christina Campo Grande Orvieto Classic', 'vörös', 'édes', 'Olaszország', 2350, 'Merlot', 2016, 100),
(6, 'Tenuta di Biserino', 'vörös', 'félédes', 'Portugália', 39868, 'Estate Malbec', 2000, 100),
(7, 'Egon Müller', 'fehér', 'édes', 'Németország', 4370000, 'Királyleányka', 2003, 100),
(8, 'Chateau  La Fite', 'rozé', 'félszáraz', 'Franciaország', 6328000, 'Rotschield', 1869, 100),
(9, 'Meandro do Bale Meao', 'vörös', 'száraz', 'Portugália', 6500, 'Estate Malbec', 2009, 100),
(10, 'Martinus', 'vörös', 'édes', 'Magyarország', 65325, 'Kékfrankos rozé', 2013, 100),
(11, 'Csaplárosné', 'vörös', 'száraz', 'Magyarország', 150, 'Tablettás', 2016, 100),
(12, 'Descendientes de J. Pacios', 'vörös', 'félszáraz', 'Spanyolország', 89000, 'La Faraona', 2006, 100);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_cheeses` FOREIGN KEY (`cheeseid`) REFERENCES `cheeses` (`id`),
  ADD CONSTRAINT `fk_orders_cigars` FOREIGN KEY (`cigarid`) REFERENCES `cigars` (`id`),
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_orders_wines` FOREIGN KEY (`wineid`) REFERENCES `wines` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
