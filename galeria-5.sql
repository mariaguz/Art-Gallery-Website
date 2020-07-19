-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Sty 2020, 20:32
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `galeria`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_comment` (IN `Pcomm` TEXT, IN `PidClient` INT, IN `PidPastEve` INT)  NO SQL
INSERT INTO comentt(Commentt, ID_Client, ID_PastEvent) VALUES(Pcomm, PidClient, PidPastEvent)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_event` (IN `Pdate` DATE, IN `Pplace` TEXT, IN `Ptitle` TEXT, IN `Ptype` TEXT, IN `Pdescription` TEXT, IN `PpriceR` FLOAT(5) UNSIGNED, IN `PproceN` FLOAT(5) UNSIGNED, IN `Pphoto` INT UNSIGNED)  NO SQL
INSERT INTO eventt(eventDate, place, title, type, description, price_R, price_N, ID_photo) VALUES(Pdate, Pplace, Ptitle, Ptype, Pdescription, PpriceR, PpriceN, Pphoto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_exhibit` (IN `Pname` TEXT, IN `Pprice` FLOAT, IN `Psold` DATE, IN `Pdesc` TEXT, IN `PidC` INT, IN `PidP` INT)  NO SQL
INSERT INTO exhibit(name, price, sold_date, description, ID_Client, ID_Photo) VALUES(Pname, Pprice, Psold, Pdesc, PidC, PidP)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_photo` (IN `Pphoto` TEXT)  NO SQL
INSERT INTO photo(photo) VALUES(Pphoto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_res` (IN `PidC` INT(10), IN `PidE` INT(10))  NO SQL
INSERT INTO reservation(ID_CLient, ID_Eventt) VALUES(PidC, PidE)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_schedule` (IN `Pbeg` DATE, IN `Pend` DATE, IN `PidW` INT)  NO SQL
INSERT INTO schedule(beg_date, end_date, ID_Worker) VALUES(Pbeg, Pend, PidW)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_worker` (IN `Ppass` INT, IN `Ptype` TEXT, IN `Plogin` TEXT, IN `Pname` TEXT, IN `Psurname` TEXT, IN `Pmail` TEXT, IN `PcreData` DATE, IN `Pphone` TEXT)  NO SQL
INSERT INTO worker(password, type, login, name, surname, mail, create_Data, phone_number) VALUES(Ppass, Ptype, Plogin, Pname, Psurname, Pmail, PcreData, Pphone)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `apply` (IN `Pname` TEXT, IN `Psurname` TEXT, IN `Pmail` TEXT, IN `Pportfolio` TEXT, IN `Pdesctription` TEXT, IN `Pphone` TEXT)  NO SQL
INSERT INTO apply(name, surname, mail, potfolio, description, phone_number)
VALUES(Pname, Psurname, Pmail, Pportfolio, Pdesctription, Pphone)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `artist` (IN `Pname` TEXT, IN `Psurname` TEXT)  NO SQL
INSERT INTO artist(name, surname) VALUES(Pname, Psurname)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `del_comment` (IN `PidCom` INT)  NO SQL
DELETE FROM comentt WHERE ID_Commentt=PidCom$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `del_event` (IN `Pid` INT)  NO SQL
DELETE FROM eventt WHERE ID_Eventt=Pid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `del_res` (IN `PidC` INT(10), IN `PidE` INT(10))  NO SQL
DELETE FROM reservation WHERE ID_CLient=PidC AND ID_Eventt=PidE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `Plogin` TEXT, IN `Ppass` TEXT)  NO SQL
SELECT ID_Client FROM client WHERE login=Plogin$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `makeEventPast` (IN `PidEvent` INT(10) UNSIGNED, IN `Pstory` TEXT)  NO SQL
INSERT INTO pastevent(ID_event, story) VALUES(PidEvent, Pstory)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `register` (IN `Plogin` TEXT, IN `Pemail` TEXT, IN `Ppass` TEXT)  NO SQL
INSERT INTO client (login, mail, password, create_date) VALUES(Plogin, Pemail, Ppass, CURDATE())$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `apply`
--

CREATE TABLE `apply` (
  `ID_Apply` int(4) NOT NULL,
  `name` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `potfolio` varchar(2000) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artist`
--

CREATE TABLE `artist` (
  `ID_Artist` int(4) NOT NULL,
  `name` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `portfolio` varchar(2000) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `artist`
--

INSERT INTO `artist` (`ID_Artist`, `name`, `surname`, `description`, `mail`, `phone_number`, `portfolio`) VALUES
(10, 'Wojciech', 'Maludzinski', 'mój opis', 'wojmal@gmail.com', '593758362', 'portfolio.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client`
--

CREATE TABLE `client` (
  `ID_Client` int(4) NOT NULL,
  `login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `mail` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `client`
--

INSERT INTO `client` (`ID_Client`, `login`, `password`, `name`, `surname`, `mail`, `create_date`, `phone_number`) VALUES
(1, 'k12345678', '', 'Asadasd', 'Asadasd', 'kkk@kk.pl', '2019-12-01 00:00:00', '123123124'),
(62, 'karolpatko', 'c10d3260d48301499139bce2cae6154c', 'Karol', 'Patko', 'karolpatko97@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `commentt`
--

CREATE TABLE `commentt` (
  `ID_Commentt` int(4) NOT NULL,
  `Commentt` varchar(2000) COLLATE utf8_polish_ci NOT NULL,
  `ID_Client` int(4) NOT NULL,
  `ID_PastEvent` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `commentt`
--

INSERT INTO `commentt` (`ID_Commentt`, `Commentt`, `ID_Client`, `ID_PastEvent`) VALUES
(13, 'ale o co chodzi?', 62, 9),
(14, 'no właśnie o to', 62, 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `eventt`
--

CREATE TABLE `eventt` (
  `ID_Eventt` int(4) NOT NULL,
  `eventDate` datetime NOT NULL,
  `place` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` varchar(20000) COLLATE utf8_polish_ci DEFAULT NULL,
  `price_R` float(4,2) NOT NULL,
  `price_N` float(4,2) NOT NULL,
  `ID_photo` int(4) NOT NULL,
  `ilosc_biletow` int(11) NOT NULL,
  `ID_Zew` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `eventt`
--

INSERT INTO `eventt` (`ID_Eventt`, `eventDate`, `place`, `title`, `type`, `description`, `price_R`, `price_N`, `ID_photo`, `ilosc_biletow`, `ID_Zew`) VALUES
(41, '2020-01-16 00:00:00', 'KrakÃ³w', 'ANUBIS W PODRÃÅ»Y', 'WernisaÅ¼', ' â¦Zawsze gdy jadÄ do obcego kraju lub innego miasta zadajÄ sobie pytanie, jak szybko zacznÄ nazywaÄ nowe miejsce domem. KtÃ³rego dnia wracajÄc z plaÅ¼y pomyÅlÄ lub powiem: po drodze do domu wstÄpiÄ jeszcze do sklepuâ¦       â¦O tym rozmyÅlam, wpatrujÄc siÄ w seriÄ obrazÃ³w przedstawiajÄcych Anubisa w podrÃ³Å¼y. Anubis jest na nich wyalienowany i samotny, lecz rÃ³wnoczeÅnie wydaje siÄ byÄ caÅkiem dobrze zadomowiony w kaÅ¼dym z odwiedzanych miejsc. Przed nocnym klubem prezentuje nienaganny nonszalancki styl, w wyludnionej kawiarni, w metrze czy na tarasie wpatrzony w ciemnoÅÄ wyglÄda jakby byÅ u siebie. A czasami wtapia siÄ tak dobrze w otoczenie, Å¼e odszukanie go na obrazie staje siÄ kolejnÄ zagadkÄâ¦', 12.00, 18.00, 25, 154, NULL),
(42, '2020-01-19 20:00:00', 'Sala wystawowa ul. DÅuga 40', 'KRAKÃW', 'WernisaÅ¼', ' Uwiedziony spojrzeniem Åani zabrnÄÅem w ciemny bÃ³r. WÄdrujÄce gÅosy nie dajÄ mi spokoju. BÅÄdzÄ. Napotykam tu i Ã³wdzie na podziemne jamy, do ktÃ³rych trzeba zejÅÄ i zajrzeÄ niczym w lustra. Nagle martwy fragment lasu: kikuty drzew jak niemy wyrzut, zbolaÅy krzyk. Polana, na ktÃ³rej moÅ¼na okrzepnÄÄ w promieniach czuÅego sÅoÅca. A potem dalej iÅÄ przez leÅne ostÄpy, nie znajÄc drogi. ZnÃ³w gÄsto i mroczno. W rozdrapanym gaÅÄziami skrawku nieba majaczy wierzchoÅek. Do przeÅÄczy zdaje siÄ niedaleko...', 10.00, 20.00, 26, 293, NULL),
(43, '2020-01-24 18:00:00', 'Sala wystawowa ul. DÅuga 40', 'PRZEPÅYWY', 'WernisaÅ¼', ' HasÅem tego artystycznego wydarzenia w tym roku byÅa âZmianaâ i chociaÅ¼ eksponaty nie powstaÅy specjalnie na tÄ okazjÄ, to problem rozstrzygany w malarskim cyklu, okreÅlany tytuÅem PrzepÅywy, jest niezwykle interesujÄcÄ, indywidualnÄ wizjÄ jednej z moÅ¼liwoÅci zmian w sztuce. Subtelnie zaaranÅ¼owane kompozycje na ukazujÄ pulsujÄcy ukÅad linii, bÄdÄcych fragmentem geometrycznych figur.', 10.00, 15.00, 27, 298, NULL),
(45, '2020-01-31 22:00:00', 'Sala czerwona ul. KrÃ³lewska 30', 'ÅWIADOMOÅÄ ISTNIENIA', 'WernisaÅ¼', 'To przykÅad synergii ekspresyjnej formy dzieÅa i wypÅywajÄcej z osobistych przemyÅleÅ artystki - wieloÅci znaczeÅ. Bez wzglÄdu na to, czy impulsem twÃ³rczych poszukiwaÅ staje siÄ obserwacja otaczajÄcej rzeczywistoÅci, inspiracja Åwiatem âtu i terazâ, czy filozoficzno-literackie tropy â malarstwo to cechuje artystyczny autentyzm i konsekwencja podejmowanych wyborÃ³w. Najnowszy cykl prac â ÅwiadomoÅÄ istnienia â stanowi udanÄ egzemplifikacjÄ malarskiego credo. KilkanaÅcie pÅÃ³cien o zrÃ³Å¼nicowanych formatach ewokuje pytania o naturÄ Åwiata i ludzkiego postrzegania, zasadnoÅÄ konwencjonalnych koncepcji czasu i przestrzeni, rolÄ jakÄ nasza ÅwiadomoÅÄ odgrywa w formowaniu sÄdÃ³w o otaczajÄcej rzeczywistoÅciâ¦', 13.00, 15.00, 37, 200, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exhibit`
--

CREATE TABLE `exhibit` (
  `ID_Exhibit` int(4) NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `price` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `sold_date` datetime DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL,
  `ID_Client` int(4) DEFAULT NULL,
  `ID_Photo` int(4) DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `exhibit`
--

INSERT INTO `exhibit` (`ID_Exhibit`, `name`, `price`, `sold_date`, `description`, `ID_Client`, `ID_Photo`, `type`) VALUES
(10, 'Linie', '2300.00', NULL, 'rÃ³Å¼ne materiaÅy', NULL, 33, 'Instalacja'),
(11, 'Kwaa', '5000.00', '2020-01-14 00:00:00', 'tusz chiÅski, sygnowany na froncie', 62, 34, 'Obraz'),
(12, 'Wspomnienia', '2000.00', NULL, 'analogowe', NULL, 35, 'Fotografie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exhibit_artist`
--

CREATE TABLE `exhibit_artist` (
  `ID_Exhibit` int(4) NOT NULL,
  `ID_Artist` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontakt`
--

CREATE TABLE `kontakt` (
  `ID_Kontakt` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `tresc` varchar(2000) NOT NULL,
  `zrobiony` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kontakt`
--

INSERT INTO `kontakt` (`ID_Kontakt`, `email`, `tresc`, `zrobiony`) VALUES
(5, 'karolpatko97@gmail.com', 'tresc\r\n', 'tak'),
(6, 'karolpatko97@gmail.com', 'Witam, mam pytanie', 'tak'),
(7, 'karolpatko97@gmail.com', 'dfsdf', 'nie'),
(8, 'karolpatko97@gmail.com', 'zapytanie', 'nie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `ID_Koszyk` int(11) NOT NULL,
  `ID_Klient` int(11) NOT NULL,
  `iloscUlgowe` varchar(20) NOT NULL,
  `ID_typ` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `koszyk`
--

INSERT INTO `koszyk` (`ID_Koszyk`, `ID_Klient`, `iloscUlgowe`, `ID_typ`, `ilosc`) VALUES
(11, 62, '2', 47, 2),
(12, 62, '', 47, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pastevent`
--

CREATE TABLE `pastevent` (
  `ID_PastEvent` int(4) NOT NULL,
  `ID_Event` int(4) NOT NULL,
  `ID_Photo` int(4) DEFAULT NULL,
  `story` varchar(2000) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pastevent`
--

INSERT INTO `pastevent` (`ID_PastEvent`, `ID_Event`, `ID_Photo`, `story`) VALUES
(9, 45, 1, 'W sztuce, jak wszędzie, opłaca się być młodym. Na młodych z reguły skupiają się też instytucje sztuki, tym ciekawiej zapowiada się więc jedna z tegorocznych propozycji białostockiego Arsenału – planowana na koniec maja wystawa Historie o starości. Kuratorowana przez Magdalenę Godlewską-Siwerską ekspozycja skupiać się będzie na różnych aspektach starości, od biologicznego przez ekonomiczny po relacje międzypokoleniowe.'),
(10, 42, 1, 'storyyyy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `photo`
--

CREATE TABLE `photo` (
  `ID_Photo` int(4) NOT NULL,
  `photo` varchar(1000) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `photo`
--

INSERT INTO `photo` (`ID_Photo`, `photo`) VALUES
(23, 'e_null.jpg'),
(24, 'e_null.jpg'),
(25, 'e_41.jpg'),
(26, 'e_42.jpg'),
(27, 'e_43.jpg'),
(28, 'e_44.jpg'),
(32, 'ex_9.jpg'),
(33, 'ex_10.jpg'),
(34, 'ex_11.jpg'),
(35, 'ex_12.jpg'),
(36, 'e_45.jpg'),
(37, 'e_45.jpg'),
(38, 'e_46.jpg'),
(39, 'e_47.jpg'),
(40, 'e_48.jpg'),
(41, 'ex_13.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservation`
--

CREATE TABLE `reservation` (
  `ID_Reservation` int(4) NOT NULL,
  `ID_CLient` int(4) NOT NULL,
  `ID_Eventt` int(4) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `iloscUlgowe` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schedule`
--

CREATE TABLE `schedule` (
  `ID_Schedule` int(4) NOT NULL,
  `beg_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `ID_Worker` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `schedule`
--

INSERT INTO `schedule` (`ID_Schedule`, `beg_date`, `end_date`, `ID_Worker`) VALUES
(2, '2020-01-24 00:00:00', '2020-01-24 06:00:00', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ticket`
--

CREATE TABLE `ticket` (
  `ID_Ticket` int(4) NOT NULL,
  `ID_CLient` int(4) NOT NULL,
  `ID_Eventt` int(4) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `iloscUlgowych` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ticket`
--

INSERT INTO `ticket` (`ID_Ticket`, `ID_CLient`, `ID_Eventt`, `ilosc`, `iloscUlgowych`) VALUES
(68, 62, 41, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `worker`
--

CREATE TABLE `worker` (
  `ID_Worker` int(4) NOT NULL,
  `password` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `worker`
--

INSERT INTO `worker` (`ID_Worker`, `password`, `type`, `login`, `name`, `surname`, `mail`, `create_date`, `phone_number`) VALUES
(1, 'ec6ef230f1828039ee794566b9c58adc', 'w', 'p1', 'Jan', 'Kowalski', 'p1@p1.p1', '0000-00-00 00:00:00', '123456789'),
(2, 'a1', 'a', 'a1', 'a1', 'a1', 'a1@a1.a1', '0000-00-00 00:00:00', '987654321'),
(3, '3b770ebe9b04f171f0ead0e07d8e2882', 'z', 'z1', 'z1', 'z1', 'z1@z1.z1', '0000-00-00 00:00:00', '123123123'),
(9, '8a8bb7cd343aa2ad99b7d762030857a2', 'a', 'a1', 'admin', 'admin', '', '2020-01-06 00:00:00', '');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`ID_Apply`);

--
-- Indeksy dla tabeli `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`ID_Artist`);

--
-- Indeksy dla tabeli `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_Client`);

--
-- Indeksy dla tabeli `commentt`
--
ALTER TABLE `commentt`
  ADD PRIMARY KEY (`ID_Commentt`),
  ADD KEY `ID_Client` (`ID_Client`),
  ADD KEY `ID_PastEvent` (`ID_PastEvent`);

--
-- Indeksy dla tabeli `eventt`
--
ALTER TABLE `eventt`
  ADD PRIMARY KEY (`ID_Eventt`),
  ADD KEY `ID_photo` (`ID_photo`);

--
-- Indeksy dla tabeli `exhibit`
--
ALTER TABLE `exhibit`
  ADD PRIMARY KEY (`ID_Exhibit`),
  ADD KEY `ID_Client` (`ID_Client`),
  ADD KEY `ID_Photo` (`ID_Photo`);

--
-- Indeksy dla tabeli `exhibit_artist`
--
ALTER TABLE `exhibit_artist`
  ADD PRIMARY KEY (`ID_Exhibit`,`ID_Artist`),
  ADD KEY `ID_Artist` (`ID_Artist`);

--
-- Indeksy dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`ID_Kontakt`);

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`ID_Koszyk`);

--
-- Indeksy dla tabeli `pastevent`
--
ALTER TABLE `pastevent`
  ADD PRIMARY KEY (`ID_PastEvent`),
  ADD KEY `ID_Event` (`ID_Event`),
  ADD KEY `ID_Photo` (`ID_Photo`);

--
-- Indeksy dla tabeli `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`ID_Photo`);

--
-- Indeksy dla tabeli `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID_Reservation`),
  ADD KEY `ID_CLient` (`ID_CLient`),
  ADD KEY `ID_Eventt` (`ID_Eventt`);

--
-- Indeksy dla tabeli `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ID_Schedule`),
  ADD KEY `ID_Worker` (`ID_Worker`);

--
-- Indeksy dla tabeli `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID_Ticket`),
  ADD KEY `ID_CLient` (`ID_CLient`),
  ADD KEY `ID_Eventt` (`ID_Eventt`);

--
-- Indeksy dla tabeli `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`ID_Worker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `apply`
--
ALTER TABLE `apply`
  MODIFY `ID_Apply` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `artist`
--
ALTER TABLE `artist`
  MODIFY `ID_Artist` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `client`
--
ALTER TABLE `client`
  MODIFY `ID_Client` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT dla tabeli `commentt`
--
ALTER TABLE `commentt`
  MODIFY `ID_Commentt` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `eventt`
--
ALTER TABLE `eventt`
  MODIFY `ID_Eventt` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT dla tabeli `exhibit`
--
ALTER TABLE `exhibit`
  MODIFY `ID_Exhibit` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `ID_Kontakt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `ID_Koszyk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `pastevent`
--
ALTER TABLE `pastevent`
  MODIFY `ID_PastEvent` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `photo`
--
ALTER TABLE `photo`
  MODIFY `ID_Photo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID_Reservation` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT dla tabeli `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ID_Schedule` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID_Ticket` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT dla tabeli `worker`
--
ALTER TABLE `worker`
  MODIFY `ID_Worker` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `commentt`
--
ALTER TABLE `commentt`
  ADD CONSTRAINT `commentt_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`),
  ADD CONSTRAINT `commentt_ibfk_2` FOREIGN KEY (`ID_PastEvent`) REFERENCES `pastevent` (`ID_PastEvent`);

--
-- Ograniczenia dla tabeli `eventt`
--
ALTER TABLE `eventt`
  ADD CONSTRAINT `eventt_ibfk_1` FOREIGN KEY (`ID_photo`) REFERENCES `photo` (`ID_Photo`);

--
-- Ograniczenia dla tabeli `exhibit`
--
ALTER TABLE `exhibit`
  ADD CONSTRAINT `exhibit_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`),
  ADD CONSTRAINT `exhibit_ibfk_2` FOREIGN KEY (`ID_Photo`) REFERENCES `photo` (`ID_Photo`);

--
-- Ograniczenia dla tabeli `exhibit_artist`
--
ALTER TABLE `exhibit_artist`
  ADD CONSTRAINT `exhibit_artist_ibfk_1` FOREIGN KEY (`ID_Exhibit`) REFERENCES `exhibit` (`ID_Exhibit`),
  ADD CONSTRAINT `exhibit_artist_ibfk_2` FOREIGN KEY (`ID_Artist`) REFERENCES `artist` (`ID_Artist`),
  ADD CONSTRAINT `exhibit_artist_ibfk_3` FOREIGN KEY (`ID_Exhibit`) REFERENCES `exhibit` (`ID_Exhibit`);

--
-- Ograniczenia dla tabeli `pastevent`
--
ALTER TABLE `pastevent`
  ADD CONSTRAINT `pastevent_ibfk_1` FOREIGN KEY (`ID_Event`) REFERENCES `eventt` (`ID_Eventt`);

--
-- Ograniczenia dla tabeli `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ID_CLient`) REFERENCES `client` (`ID_Client`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`ID_Eventt`) REFERENCES `eventt` (`ID_Eventt`);

--
-- Ograniczenia dla tabeli `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`ID_Worker`) REFERENCES `worker` (`ID_Worker`);

--
-- Ograniczenia dla tabeli `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ID_CLient`) REFERENCES `client` (`ID_Client`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_Eventt`) REFERENCES `eventt` (`ID_Eventt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
