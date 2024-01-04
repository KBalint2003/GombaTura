-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Sze 27. 08:15
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `Gomba`
--
CREATE DATABASE IF NOT EXISTS `Gomba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `Gomba`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zemplen_eheto_gombai_teljes`
--

CREATE TABLE `zemplen_eheto_gombai_teljes` (
  `ID` int(3) NOT NULL,
  `Latin_név` varchar(27) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Magyar_név` varchar(25) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Nemzetség` varchar(13) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Mérgez` tinyint(1) DEFAULT NULL,
  `Besorolás` varchar(18) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Leírás` varchar(146) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Szezon_eleje` int(1) DEFAULT NULL,
  `Szezon_vége` int(1) DEFAULT NULL,
  `Növényzet` varchar(90) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termőtest_típus` varchar(18) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termőrétegtart_típusok` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `Bocskora` tinyint(1) DEFAULT NULL,
  `Gallér` tinyint(1) DEFAULT NULL,
  `Burok_maradvány` varchar(23) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_forma` varchar(23) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_felszín` varchar(45) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_perem` varchar(17) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemezállás` varchar(33) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemezél` varchar(13) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tönk_alak` varchar(35) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tönk_felület` varchar(45) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hús` varchar(39) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hús_elszinezödés` varchar(38) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `zemplen_eheto_gombai_teljes`
--

INSERT INTO `zemplen_eheto_gombai_teljes` (`ID`, `Latin_név`, `Magyar_név`, `Nemzetség`, `Mérgez`, `Besorolás`, `Leírás`, `Szezon_eleje`, `Szezon_vége`, `Növényzet`, `Termőtest_típus`, `Termőrétegtart_típusok`, `Bocskora`, `Gallér`, `Burok_maradvány`, `Kalap_forma`, `Kalap_felszín`, `Kalap_perem`, `Lemezállás`, `Lemezél`, `Tönk_alak`, `Tönk_felület`, `Hús`, `Hús_elszinezödés`) VALUES
(1, 'Agaricus arvensis', 'Erdőszéli csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig erdő szélén, füves helyen növő gyakori faj.', 5, 11, ' Erdő szélén, füves helyen', 'Kalapos', 'Lemezes', 1, 1, 'Fogaskerékszerű az alja', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Bunkó', 'Sima', 'Vastag', 'Sárgul'),
(2, 'Agaricus augustus', 'Óriás csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, erdőszélen, erdei utakon fordul elő. Hazánkban elég ritka faj.', 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Karcsú', 'Pelyhes', 'Vékony', 'Nincs'),
(3, 'Agaricus benesii ', 'Ligeti csiperke', 'Csiperke', 0, NULL, 'Júniustól novemberig ligetes lomb- és fenyőerdőben, réten, legelőn növő elég gyakori faj.', 6, 11, 'Ligetes lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Pikkelyes', 'Vastag', 'Vörös'),
(4, 'Agaricus bernardii', 'Sziki csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig szikes alföldi tájakon, utak mentén seregesen találjuk az első fagyokig. Tűri a sok trágyát, igényli a talaj sótartalmát. ', 5, 11, 'Szikes alföldi tájakon', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Domború', 'Fénytelen', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Foszladozik', 'Vastag', 'Nincs'),
(5, 'Agaricus bisporus ', 'Kétspórás csiperke', 'Csiperke', 0, NULL, 'Kertekben, parkokban, komposzton, júniustól októberig gyakori. Termeszteni is szokták.', 6, 10, 'Kertekben, parkokban, komposzton', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Kemény', 'Vörös'),
(6, 'Agaricus bitorquis', 'Ízletes csiperke', 'Csiperke', 0, NULL, 'Áprilistól novemberig bolygatott helyeken, parkokban, útszélen növő gyakori faj.', 5, 11, 'Parkokban, útszélen', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Ellaposodót', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Vastag', 'Nincs'),
(7, 'Agaricus campestris', 'Mezei csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig legelőkön, füves helyeken növő gyakori faj.', 5, 11, 'Legelőkön, füves ', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Félgömb', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Pelyhes', 'Vastag', 'Vörös'),
(8, 'Agaricus crocodilinus', 'Nagyspórás csiperke', 'Csiperke', 0, NULL, 'Elvágva barnul, ánizs vagy keserűmandula szagú. Réten, erdőszélen, esetleg parkban júniustól októberig terem, nem gyakori faj. ', 7, 10, 'Réten, erdőszélen, esetleg parkban', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Pelyhes', 'Vastag', 'Nincs'),
(9, 'Agaricus dulcidulus', 'Apró csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, egyenként vagy kis csoportokban, hazánkban elég gyakori faj.', 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Fokozatosan ellaposodik', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Törékeny', 'Megsárgul'),
(10, 'Agaricus essettei', 'Gumós csiperke', 'Csiperke', 0, NULL, 'Húsa vágásra enyhén sárgul, ánizsillatú. Májustól novemberig lomb- és fenyőerdőben növő gyakori faj.', 5, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Szögletes', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Vékony', 'Sárgul'),
(11, 'Agaricus litoralis', 'Szekszárdi csiperke', 'Csiperke', 0, NULL, 'Kissé vörösödik a húsa. Májustól októberig réten, legelőn, füves erdőszéleken, szikes talajon is nő, viszonylag ritka faj.', 5, 10, 'Legelőn, füves erdőszéleken, szikes talajon is nő', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Félgömb', 'Pikkelyes', 'Túlérő', 'Sűrű', 'Csipkézett', 'Zömök', 'Sima', 'Kemény', 'Vörös'),
(12, 'Agaricus sylvaticus', 'Erdei csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, luc és bükk alatt, savanyú talajon nő, gyakori faj. Vörösödik.', 6, 11, 'Lomb- és fenyőerdőben, luc és bükk alatt', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Széles', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Pelyhes', 'Vékony', 'Vörös'),
(13, 'Russula adusta', 'Sötétedő galambgomba', 'Galambgomba', 0, NULL, 'Savanyú talajú fenyvesekben a síkvidéktől a hegységekig májustól októberig terem, gyakori.', 5, 10, 'Fenyvesekbe', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Korpás', 'Vastag', 'Kissé vörös majd szürke'),
(14, 'Russula aeruginea', 'Fűzöld galambgomba', 'Galambgomba', 0, NULL, 'Füves erdőben, nyír és fenyők alatt, júliustól októberig terem, helyenként gyakori.', 7, 10, ' Nyír és fenyők', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Ragadós', 'Bordázott', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Törékeny', 'Nincs'),
(15, 'Russula aurea', 'Aranyos galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, különösen tölgy, de luc alatt is terem. Hazánkban nem gyakori.', 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs'),
(16, 'Russula caerulea', 'Púpos galambgomba', 'Galambgomba', 0, NULL, 'Nyár végén, ősz elején kéttűs fenyők alatt található, nem túl gyakori.', 7, 10, ' Fenyők', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Púpos', 'Fényes', 'Bordás', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Keserű', 'Nincs'),
(17, 'Russula carpinii', 'Gyertyán-galambgomba', 'Galambgomba', 0, NULL, 'Gyertyánfák alatt fordul elő. Korai megjelenésű.', 6, 10, 'Gyertyánfák', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Puha', 'Nincs'),
(18, 'Russula chloroides', 'Kékeslemezű galambgomba', 'Galambgomba', 0, NULL, 'Savanyú talajú erdőkben, a síkvidéktől a hegységekig, júliustól októberig megtalálható, hazánkban helyenként nem ritka.', 7, 10, 'Savanyú talajú erdőkben,', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Ráncos', 'Begöngyölt', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs'),
(19, 'Russula cyanoxantha', 'Kékhátú galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben növő gyakori faj.', 7, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Nedves', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs'),
(20, 'Russula delica', 'Földtoló galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig főleg meszes talajú lomb- és fenyőerdőben növő gyakori faj.', 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Földes', 'Begöngyölt', 'Ritkán', 'Sima', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs'),
(21, 'Russula graveolens', 'Halszagú galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig, lomberdőben, elsősorban savanyú talajon tölgy alatt nő, hazánkban nem ritka.', 7, 10, 'Lomberdőben, elsősorban savanyú talajon tölgy alatt nő', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Ellaposodót', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Barnán'),
(22, 'Russula grisea', 'Szürkészöld galambgomba', 'Galambgomba', 0, NULL, 'Hegyvidéki tölgyesek, gyertyános-bükköseink gyakori gombája. Nyártól késő őszig terem.', 7, 10, ' Tölgyesek, gyertyános-bükköseink gyakori gombája', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Ráncos', 'Deres', 'Ráncolt', 'Sűrű', 'Sima', 'Hengeres', 'Foltos', 'Kemény', 'Nincs'),
(23, 'Russula heterophylla', 'Dióízű galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, júliustól októberig fordul elő. Elterjedt, gyakori.', 7, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Kissé ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs'),
(24, 'Russula integra', 'Barnásvörös galambgomba', 'Galambgomba', 0, NULL, 'Júniustól novemberig lucfenyő, erdei- és jegenyefenyők közelében, minden talajon, elsősorban hegyvidéken, de síkságon is gyakori.', 6, 11, 'Lucfenyő, erdei- és jegenyefenyők közelében', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Tapadós', 'Bordázott', 'Sűrű', 'Sima', 'Hengeres', 'Eres', 'Merev', 'Nincs'),
(25, 'Russula ionochlora', 'Papagáj-galambgomba', 'Galambgomba', 0, NULL, 'Nyár végi, ősz elején lomb- és vegyes erdőkben található, ritka faj.', 5, 11, 'Lomb- és vegyeserdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Deres', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Kemény', 'Vörös'),
(26, 'Russula medullata', 'Acélszürke galambgomba', 'Galambgomba', 0, NULL, 'Hegyvidékeken élő gomba, főként nyár és nyír környezetben, de bükk, gyertyán vagy tölgy alatt is találták már. Nyári elejétől októberig terem.', 6, 10, 'Nyár és nyír környezetben, de bükk, gyertyán vagy tölgy ', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Tapadós', 'Bordázott', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Törékeny', 'Nincs'),
(27, 'Russula melliolens', 'Mézszagú galambgomba', 'Galambgomba', 0, NULL, 'Lomberdőben, tölgy, ritkábban bükk vagy gyertyán alatt, semleges vagy enyhén savanyú talajon, nyártól őszig nő. Magyarországon nem ritka.', 6, 9, 'Lomberdőben, tölgy, ritkábban bükk vagy gyertyán ', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Barázdált', 'Kemény', 'Nincs'),
(28, 'Russula odorata', 'Illatos galambgomba', 'Galambgomba', 0, NULL, 'Vegyes erdőkben főként tölgyek közelében nyáron és ősszel terem. Ritka.', 6, 10, 'Tölgyek', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs'),
(29, 'Russula parazurea', 'Deres galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig, lomb- és fenyőerdőben, főleg tölgy és bükk vagy kéttűs fenyő alatt nő. Hazánkban ritka gombafaj.', 6, 10, ' Lomb- és fenyőerdőben, főleg tölgy és bükk vagy kéttűs fenyő alatt nő', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Lapos', 'Deres', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Rozsdafoltos', 'Kemény', 'Nincs'),
(30, 'Russula risigallina', 'Cifra galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben leginkább tölgy és bükk alatt találhatjuk ezt az enyhe ízű, gyakori fajt.', 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs'),
(31, 'Russula romellii', 'Sárgalemezű galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb és fenyőerdőben, főleg bükk, ritkán lucfenyő alatt savanyú talajú erdőkben találhatjuk.', 6, 10, 'Lomb és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Foltos', 'Kemény', 'Nincs'),
(32, 'Russula rubroalba', 'Vörösfoltos galambgomba', 'Galambgomba', 0, NULL, 'Lombos erdőkben, elsősorban tölgy alatt nyáron és ősszel terem.', 6, 10, 'Lombos erdőkben, elsősorban tölgy', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Hullámos', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs'),
(33, 'Russula sericatula', 'Selymes galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig gyakran csoportosan, vegyes erdőben, parkban, leggyakrabban gyertyán, de olykor bükk és tölgy alatt nő. Nagyon ritka.', 6, 10, 'Vegyes erdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Domború', 'Matt', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Puha', 'Nincs'),
(34, 'Russula velenovskyi', 'Téglavörös galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és vegyeserdőben, különböző talajokon növő, hazánkban nem gyakori faj.', 7, 10, 'Lomb- és vegyeserdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Széles', 'Sima', 'Bordás', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Kemény', 'Nincs'),
(35, 'Russula velutipes', 'Rózsás galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben, főleg tölgy és bükk alatt nő. Szárazságtűrő faj, hazánkban nem ritka.', 6, 10, 'Lomb- és fenyőerdőben, főleg tölgy és bükk', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Sima', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Hanvas', 'Fehér színű', 'Nincs'),
(36, 'Russula vesca', 'Ráncos galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, májustól októberig nő. Elterjedt, nagyon gyakori.', 5, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Szivacsos', 'Nincs'),
(37, 'Russula violeipes', 'Ibolyástönkű galambgomba', 'Galambgomba', 0, NULL, 'Júliustól szeptemberig lomb és fenyőerdőkben, különösen tölgy alatt növő hazánkban nem gyakori faj.', 5, 11, 'Lomb és fenyőerdőkben, különösen tölgy', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Kemény', 'Nincs'),
(38, 'Russula virescens', 'Varashátú galambgomba', 'Galambgomba', 0, NULL, 'Lomberdőkben terem júniustól szeptemberig, elterjedt, helyenként gyakori.', 6, 9, 'Lomberdőkben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Gömbölyű', 'Varrás', 'Bordázót', 'Sűrű', 'Sima', 'Hengeres', 'Foltos', 'Pattanva törik', 'Okkeresen '),
(39, 'Russula vitellina', 'Baracksárga galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben, leginkább tölgy és bükk alatt terem. Hazánkban gyakori.', 7, 10, 'Lomb- és fenyőerdőben, leginkább tölgy és bükk alatt terem', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Széles', 'Matt', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Sima', 'Nagyon törékeny', 'Nincs'),
(40, 'Russula xerampelina', 'Barnulóhúsú galambgomba', 'Galambgomba', 0, NULL, 'Júliustól novemberig savanyú talajú fenyőerdőkben növő nem ritka faj. Rokonfajai lomberdőben is előfordulnak.', 6, 9, 'Fenyőerdőkben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Félgömb', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Ráncosodó', 'Merev', 'Okkeresen '),
(41, 'Amanita excelsa ', 'Szürke galóca', 'Galóca', 0, NULL, 'Augusztustól októberig meszes talajú lomberdőben, gyakran száraz időben is előforduló, nem gyakori gomba.', 8, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Domború', 'Pettyes', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Nincs'),
(42, 'Amanita rubescens ', 'Piruló galóca', 'Galóca', 0, 'Feltételesen ehető', 'Nyáron ősszel lomb- és fenyőerdőben fordul elő. Nem gyakori faj', 6, 10, ' Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Gallér', 'Domború', 'Pettyes', 'Varras', 'Sűrű', 'Sima', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Rovarrágásnál Vörösödik'),
(43, 'Amanita muscaria', 'Légyölő galóca', 'Galóca', 1, 'Nem ehető', 'Augusztustól novemberig, erősen savanyú talajú lomb- és fenyőerdőben növő, helyenként gyakori faj.', 8, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 1, 'Gallér', 'Félgömb', 'Könnyen leváló, fehér pettyek', 'Sima', 'Sűrű', 'Sima', 'Vastag, hengeres', 'Sima', 'Puha, vizenyős', 'Nincs'),
(44, 'Amanita phalloides', 'Gyilkos galóca', 'Galóca', 1, 'Nem ehető', 'Júniustól novemberig, lomberdőben, főleg tölgy alatt, ritkán fenyvesben növő, gyakori faj.', 6, 11, 'Lomberdőben tölgyes', 'Kalapos', 'Lemezes', 1, 1, 'Gallér', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Hengeres', 'Kígyóbőr', 'Fehér vizenyős', 'Nincs'),
(45, 'Morchella deliciosa', 'Hegyes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ehető, jóízű, aromás gomba, de jól főzzük, süssük meg, mert nyersen fogyasztva egyeseknél allergiás tüneteket okozhat!', 3, 5, ' Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Süveg', 'Bordás', 'Nincs', 'Ovális kerekded bordák', 'Nincs', 'Üreges', 'Okkeres, szemcsés', 'Vékony', 'Nincs'),
(46, 'Morchella esculenta', 'Ízletes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Réteken, kertekben, bokros helyeken, liget erdőkben nagy mennyiségben terem, márciustól áprilisig.', 7, 10, 'Réteken, kertekben, bokros', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Süveg', 'Viasszerű', 'Nincs', 'Rendezett bemélyedések ', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs'),
(47, 'Morchella semilibera', 'Fattyú kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ligeterdőkben, erdőszéleken, tópartokon áprilistól májusig terem, helyenként gyakori.', 5, 5, 'Ligeterdőkben, erdőszéleken', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Süveg', 'Rendezett méhsejt', 'Nincs', 'Hosszanti sorok rendezett méhsejt', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs'),
(48, 'Morchella steppicola', 'Pusztai kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Az Alföld cserjés vagy szinte fátlan pusztáin terem, de a dunántúli dombok alacsony gyepjében is előfordul löszös vagy agyagos talajon. Ritka faj.', 3, 4, 'Fátlan pusztáin', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Szabálytalan bordák', 'Sűrűborda', 'Nincs', 'Elválasztó bordák', 'Nincs', 'Üreges', 'Ráncosodó', 'Vékony', 'Nincs'),
(49, 'Verpa bohemica', 'Cseh kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól áprilisig lombos erdők talaján, bokros, nedves területen növő helyenként gyakori faj. A legkorábban megjelenő kucsmagombánk.', 3, 4, 'Lombos erdők talaján, bokros, nedves területen', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Süveg', 'Erősen ráncolt', 'Nincs', 'Érinti a tönköt', 'Nincs', 'Üreges', 'Szemcsés', 'Vékony', 'Nincs'),
(50, 'Verpa conica', 'Simasüvegű kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Áprilistól májusig nedves lomb- és fenyőerdőben, ligeterdőben, folyópartokon nő. Hazánkban ritka faj.', 5, 5, ' Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 0, 0, 'Nincs', 'Süveg', 'Gyűszű', 'Nincs', ' Finoman ráncolt', 'Nincs', 'Üreges', 'Szemcsés', 'Vattás', 'Nincs'),
(51, 'Pleurotus cornucopiae', 'Erestönkű laskagomba', 'laskagomba', 0, NULL, 'Áprilistól júliusig elsősorban elhalt lombos fa anyagán, csoportosan nő. Hazánkban nem gyakori.', 4, 7, 'Lombos fa', 'Tapló', 'Lemezes', 0, 0, 'Nincs', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Oldalt álló', 'Nincs', 'Kalapban puha', 'Nincs'),
(52, 'Pleurotus eryngii', 'Ördögszekér laskagomba', 'laskagomba', 0, NULL, 'Késő nyártól a tartós fagyokig gyepekben egyesével vagy kisebb csoportokban nő. A mezei iringó kérgén él.', 9, 12, 'Mezei iringó kérgén', 'Tapló', 'Lemezes', 0, 0, 'Nincs', 'Kör alakú', 'finoman pikkelyes', 'Aláhajló', 'Sűrű', 'Sima', 'Hengeres', 'Nincs', 'Vastag,rostos', 'Nincs'),
(53, 'Pleurotus ostreatus', 'Kései laskagomba', 'laskagomba', 0, NULL, 'Októbertől decemberig lombos fákon vagy azok tuskóin, fahulladékon növő gyakori faj.', 10, 12, 'Lombos fákon vagy azok tuskóin', 'Tapló', 'Lemezes', 0, 0, 'Nincs', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Tönkig lefuto', 'Oldalt álló', 'Nincs', 'Szivós', 'Nincs'),
(54, 'Pleurotus pulmonarius', 'Nyári laskagomba', 'laskagomba', 0, NULL, 'Májustól szeptemberig lomb- és fenyőerdőben, fatuskón, korhadó fán, fűrészporon növő gyakori faj.', 5, 9, ' Lomb- és fenyőerdőben, fatuskón', 'Tapló', 'lemezes', 0, 0, 'Nincs', 'Féloldalas', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Oldalt álló', 'Nincs', 'Rugalmas', 'Nincs'),
(55, 'Gyromitra esculenta', 'Redős papsapkagomba', 'Papsapkagomba', 1, 'Nem ehető', 'Márciustól májusig, savanyú talajú kéttűs fenyőerdőben, talajon vagy korhadó faanyag közelében. Hazánkban ritka faj. ', 3, 5, ' Lomb- és fenyőerdőben, fatuskón', 'Kucsma alaku süveg', 'Redők', 0, 0, 'Gallér', 'Szabálytalan bordák', 'Erősen ráncolt', 'Nincs', 'Tekervényes', 'Nincs', 'Tömör, később szabálytalanul üreges', 'Barázdált', 'Vékony', 'Nincs'),
(56, 'Xerocomellus chrysenteron', 'Arany tinóru', 'Tinóru', 0, NULL, 'Májustól novemberig lomb- és fenyőerdőben, parkokban növő gyakori faj.', 5, 11, 'Lomb- és fenyőerdőben, parkokban', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Korpás', 'Puha', 'Tönkön vörösödik kalapnál enyhén kékül'),
(57, 'Aureoboletus gentilis ', 'Aranybélésű tinóru', 'Tinóru', 0, NULL, 'Júliustól októberig füves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken; hazánkban nem gyakori.', 7, 12, 'Üves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Ragadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Puha', 'Nincs'),
(58, 'Suillus luteus', 'Barna gyűrűstinóru', 'Tinóru', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 6, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 0, 1, 'Van', 'Félgömb', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Vattás', 'Hamar megpuhul', 'Nincs'),
(59, 'Xerocomellus porosporus', 'Csapottspórás tinóru', 'Tinóru', 0, NULL, 'Júniustól szeptemberig lomb és fenyőerdőkben megtalálható gyakori faj. Húsa hamar megromlik, gyakran kukacos.', 7, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Domború', 'Felrepedezett', 'Peremig nem érő', 'Nincs', 'Nincs', 'Tönk felé vékonyodó', 'Sima', 'Puha', 'Lassan kékeszöld'),
(60, 'Suillus cavipes', 'Csövestönkű fenyőtinóru', 'Tinóru', 0, NULL, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás, nyáron és ősszel.', 6, 11, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás', 'Kalapos', 'Csöves', 0, 0, 'Hárgya', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Lefele vastagodik', 'Szálas', 'Puha', 'Nincs'),
(61, 'Xerocomus subtomentosus', 'Molyhos tinóru', 'Tinóru', 0, NULL, 'Nyáron lomb- és fenyőerdőkben található, fiatalon jóízű, idősen kesernyés gomba.', 5, 10, ' Lomb- és fenyőerdőkben', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Lefelé elvékonyodó', 'Puha', 'Gyengén kékül'),
(62, 'Hortiboletus rubellus ', 'Piros tinóru', 'Tinóru', 0, NULL, 'Melegebb erdőkben, többféle lombhullató fa alatt (hárs, nyír, tölgy).', 6, 10, 'Lombhullató fa alatt (hárs, nyír, tölgy).', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Puha', 'Kékül'),
(63, 'Suillus collinitus', 'Rózsástövű fenyőtinóru', 'Tinóru', 0, NULL, 'Augusztustól novemberig meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) alatt növő gyakori faj.', 8, 11, 'Meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) ', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Kiterülő', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Tömör', 'Nincs'),
(64, 'Suillus grevillei', 'Sárga gyűrűstinóru', 'Tinóru', 0, NULL, 'Júniustól októberig vörösfenyők alatt növő gombafaj.', 6, 11, 'Vörösfenyők', 'Kalapos', 'Csöves', 0, 1, 'Van', 'Félgömb', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Vastag', 'Nincs'),
(65, 'Suillus granulatus', 'Szemcsésnyelű fenyőtinóru', 'Tinóru', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 8, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Sárga', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Pontozót nyálkás', 'Vastag', 'Nincs'),
(66, 'Suillus viscidus', 'Szürke gyűrűstinóru', 'Tinóru', 0, NULL, 'Júniustól októberig vörösfenyő alatt termő, nálunk ritka, magashegységi gombafaj.', 6, 10, 'Vörösfenyő alatt termő, nálunk ritka, magashegységi', 'Kalapos', 'Csöves', 0, 1, 'Vélummaradvány', 'Félgömb', 'Szálas', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Szálas', 'Nincs'),
(67, 'Suillus variegatus', 'Tarka tinóru', 'Tinóru', 0, NULL, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt, nyártól őszig terem.', 8, 11, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Zömök', 'Szemcsés', 'Sárga szín', 'Gyengén kékül'),
(68, 'Suillus bovinus', 'Tehéntinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Augusztustól novemberig savanyú talajú erdei fenyvesekben, gyakran seregesen növő gombafaj.', 6, 8, 'Savanyú talajú erdei fenyvesekben', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Okkerbarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hengeres', 'Csupasz', 'Gumiszerű', 'Nincs'),
(69, 'Caloboletus calopus', 'Farkastinóru', 'Tinóru', 1, 'Nem ehető', 'Savanyú talajú lombos és fenyőerdőben, nyártól őszig terem, dombvidéktől a magas hegységekig.', 6, 11, 'Savanyú talajú lombos és fenyőerdőben', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Sima', 'Aláhajló', 'Nincs', 'Nincs', 'Hengeres', 'Erősen vörös, hálózatos tönk', 'Merev, sárga vagy fehéres', ' Enyhén kékül'),
(70, 'Coprinellus micaceus ', 'Kerti tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Júliustól novemberig lomb- és fenyőerdőben, ligetes, füves helyen növő helyenként nem ritka faj.', 7, 11, ' Lomb- és fenyőerdőben, ligetes, füves helyen', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Kúpos', 'Szemcsés', 'Tönköt éri', 'Sűrű', 'Sima', 'Vékony', 'Csupasz', 'Fehér', 'Nincs'),
(71, 'Coprinopsis acuminata', 'Csúcsoskalapú tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Áprilistól decemberig tuskókon vagy eltemetett faanyagon, csoportosan nő. Hazánkban gyakori.', 7, 11, ' Tuskókon vagy eltemetett faanyagon', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Kúpos', 'Sima', 'Bordás', 'Sűrű', 'Sima', 'Vékony', 'Kissé pikkelyes', 'Szürke', 'Nincs'),
(72, 'Coprinopsis atramentaria ', 'Ráncos tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Nyáron, ősszel tápanyagban gazdag környezetben nő. Ritka.', 5, 11, 'Tápanyagban gazdag környezetben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Kúpos', 'Ráncos', 'Hasadt', 'Sűrű', 'Sima', 'Vékony', 'Üreges', 'Törékeny', 'Nincs'),
(73, 'Coprinopsis insignis ', 'Ezüstszálas tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Erdőkben, erdőszéleken, kertekben, parkokban, útszélen, tápanyagdús talajon magányosan vagy csoportosan nő, gyakori faj.', 6, 10, 'Erdőkben, erdőszéleken, kertekben, parkokban, útszélen, tápanyagdús talajon ', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Kúpos', 'Selymes', 'Tönköt éri', 'Sűrű', 'Sima', 'Vékony', 'Pelyhes', 'Fehér', 'Nincs'),
(74, 'Coprinus comatus ', 'Gyapjas tintagomba', 'Tintagomba', 0, NULL, 'Júniustól októberig elhalt faanyagon vagy élő lombos fák tövében, seregesen vagy csoportosan terem, nem gyakori gombafaj.', 5, 12, 'Elhalt faanyagon vagy élő lombos fák tövében', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Kúpos', 'Gyapjas', 'Csepegnek', 'Sűrű', 'Sima', 'Vékony', 'Üreges', 'Törékeny', 'Nincs'),
(75, 'Boletus aereus ', 'Bronzos vargánya', 'Vargánya', 0, NULL, 'Az őszi hónapokban hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő, mikorrhizaképző, ritka faj.', 5, 10, 'Hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Molyhos', 'Nem éri el', 'Nincs', 'Nincs', 'Vastag hengeres', 'Sűrű hálózat', 'Kemény', 'Nincs'),
(76, 'Boletus edulis', 'Ízletes vargánya', 'Vargánya', 0, NULL, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás. Melegkedvelő, dombvidéki faj.', 6, 10, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Foltos', 'Nem éri el', 'Nincs', 'Nincs', 'Vastag hengeres', 'Hálózatos', 'Kemény', 'Nincs'),
(77, 'Boletus pinophilus ', 'Vörösbarna vargánya', 'Vargánya', 0, NULL, 'Júniustól októberig csak savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 6, 9, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Zsíros tapintású', 'Begöngyölt', 'Nincs', 'Nincs', 'Hasas', 'Hálózatos barna', 'Kemény', 'Nincs'),
(78, 'Boletus reticulatus ', 'Nyári vargánya', 'Vargánya', 0, NULL, 'Hegy- és dombvidéki fenyvesekben késő tavasztól őszig terem. Magyarországon ez a gomba elsősorban (hegyvidéki) bükkösökben terem.', 6, 9, 'Hegy- és dombvidéki fenyvesekben', 'Kalapos', 'Csöves', 0, 0, 'Nincs', 'Félgömb', 'Ráncolt', 'Aláhajló', 'Nincs', 'Nincs', 'Hasas', 'Hálózattal', 'Kemény', 'Nincs'),
(79, 'Cantharellus amethysteus', 'Ibolyás rókagomba', 'Rókagomba', 0, NULL, 'Nyártól késő őszig, lombhullató erdőben fordul elő. Nagyon ritka faj.', 6, 11, 'Lombhullató erdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Tojássárga színű, ibolyásszürke pikkelykékkel', 'Aláhajló', 'Sűrű', 'Tönkig lefuto', 'Lefelé vékonyodó', 'Tojássárga színű, ibolyásszürke pikkelykékkel', 'Dehér vagy sápadt sárga', 'Nincs'),
(80, 'Cantharellus cibarius', 'Sárga rókagomba', 'Rókagomba', 0, NULL, 'Lombos és fenyőerdőben, savanyú preferenciával, júniustól októberig terem, ritka faj.', 6, 11, 'Lombos és fenyőerdőben, savanyú preferenciával', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Lefelé vékonyodó', ' Vastag, tömör', 'Fehéres, a kalapbőr alatt világossárga,', 'Nincs'),
(81, 'Cantharellus ferruginascens', 'Rozsdásodó rókagomba', 'Rókagomba', 0, NULL, 'Júniustól novemberig főleg savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 6, 11, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Selymesen sima', 'Hullámos', 'Sűrű', 'Sima', 'Lefelé vékonyodó', 'Pikkelyes-bordás', 'Vékony', 'Nincs'),
(82, 'Cantharellus friesii', 'Narancsvörös rókagomba', 'Rókagomba', 0, NULL, 'Nyártól őszig lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban. Magyarországon nem ritka.', 6, 11, 'Lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Szélén hullámos', 'Hullámos', ' Tompa élűek és villásan elágazók', 'Sima', 'Lefelé vékonyodó', 'Sima', 'Vékony', 'Nincs'),
(83, 'Cantharellus pallens', 'Halvány rókagomba', 'Rókagomba', 0, NULL, 'Júniustól októberig bükk- és tölgyfák alatt, savanyú talajon terem. A domb- és hegyvidékeken fordul elő. Hazánkban nagyon ritka faj.', 6, 11, 'Bükk- és tölgyfák alatt, savanyú talajon terem domb- és hegyvidékeken fordu', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Lefelé vékonyodó', ' Vastag, tömör', 'Halvény világossárga', 'Nincs'),
(84, 'Craterellus cinereus', 'Szürke rókagomba', 'Rókagomba', 0, NULL, 'Szeptembertől októberig savanyú talajú lomb- és fenyőerdőben fordul elő. Hazánkban ritka gombafaj.', 7, 10, 'Savanyú talajú lomb- és fenyőerdőben fordul elő', 'Kalapos', 'Lemezes', 0, 0, 'Nincs', 'Tölcséres', 'Száraz', 'Mélyen lefutó', 'Ráncos eres', 'Sima', 'Üreges vékony', 'Vékony', 'Szívós vékony', 'Nincs');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `zemplen_eheto_gombai_teljes`
--
ALTER TABLE `zemplen_eheto_gombai_teljes`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `zemplen_eheto_gombai_teljes`
--
ALTER TABLE `zemplen_eheto_gombai_teljes`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
