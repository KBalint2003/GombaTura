-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Okt 16. 11:12
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gomba1`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `belépes`
--

CREATE TABLE `belépes` (
  `ID` int(6) NOT NULL,
  `Felhasznalonev` varchar(20) NOT NULL,
  `Jelszo` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Születesi_ido` date NOT NULL,
  `Telefon_szam` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `belépes`
--

INSERT INTO `belépes` (`ID`, `Felhasznalonev`, `Jelszo`, `Email`, `Születesi_ido`, `Telefon_szam`) VALUES
(1, 'Gombamester21', 'Laskagomba', 'Gombamester01@gmail.com', '2000-01-01', '+36301234567');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gomba`
--

CREATE TABLE `gomba` (
  `ID` int(11) NOT NULL,
  `Latin_nev` varchar(27) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Magyar_nev` varchar(25) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Nemzetseg` varchar(13) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Etkezes_ertek` int(1) DEFAULT NULL,
  `Feltetel` varchar(21) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Leiras` varchar(146) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Bocskora` tinyint(1) DEFAULT NULL,
  `Galler` tinyint(1) DEFAULT NULL,
  `Szezon_eleje` int(2) DEFAULT NULL,
  `Szezon_vege` int(2) DEFAULT NULL,
  `Novenyzet` varchar(90) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termotest_tipus` varchar(18) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termoretegtarto_tipusok` varchar(18) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_forma` varchar(23) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_felszin` varchar(45) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_perem` varchar(17) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemezallas` varchar(33) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemez_el` varchar(19) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Burok_maradvany` varchar(23) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tonk_alak` varchar(35) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tonk_felulet` varchar(45) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hus` varchar(39) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hus_elszinezodes` varchar(38) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Ara_HUF` int(5) DEFAULT NULL,
  `Kep_keszeto_neve` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `gomba`
--

INSERT INTO `gomba` (`ID`, `Latin_nev`, `Magyar_nev`, `Nemzetseg`, `Etkezes_ertek`, `Feltetel`, `Leiras`, `Bocskora`, `Galler`, `Szezon_eleje`, `Szezon_vege`, `Novenyzet`, `Termotest_tipus`, `Termoretegtarto_tipusok`, `Kalap_forma`, `Kalap_felszin`, `Kalap_perem`, `Lemezallas`, `Lemez_el`, `Burok_maradvany`, `Tonk_alak`, `Tonk_felulet`, `Hus`, `Hus_elszinezodes`, `Ara_HUF`, `Kep_keszeto_neve`) VALUES
(1, 'Agaricus arvensis', 'Erdőszéli csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig erdő szélén, füves helyen növő gyakori faj.', 1, 1, 5, 11, ' Erdő szélén, füves helyen', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Fogaskerékszerű az alja', 'Bunkó', 'Sima', 'Vastag', 'Sárgul', 0, ''),
(2, 'Agaricus augustus', 'Óriás csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, erdőszélen, erdei utakon fordul elő. Hazánkban elég ritka faj.', 0, 1, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Pelyhes', 'Vékony', 'Nincs', 0, ''),
(3, 'Agaricus benesii ', 'Ligeti csiperke', 'Csiperke', 0, NULL, 'Júniustól novemberig ligetes lomb- és fenyőerdőben, réten, legelőn növő elég gyakori faj.', 0, 1, 6, 11, 'Ligetes lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pikkelyes', 'Vastag', 'Vörös', 0, ''),
(4, 'Agaricus bernardii', 'Sziki csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig szikes alföldi tájakon, utak mentén seregesen találjuk az első fagyokig. Tűri a sok trágyát, igényli a talaj sótartalmát. ', 0, 1, 5, 11, 'Szikes alföldi tájakon', 'Kalapos', 'Lemezes', 'Domború', 'Fénytelen', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Foszladozik', 'Vastag', 'Nincs', 0, ''),
(5, 'Agaricus bisporus ', 'Kétspórás csiperke', 'Csiperke', 0, NULL, 'Kertekben, parkokban, komposzton, júniustól októberig gyakori. Termeszteni is szokták.', 0, 1, 6, 10, 'Kertekben, parkokban, komposzton', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Kemény', 'Vörös', 0, ''),
(6, 'Agaricus bitorquis', 'Ízletes csiperke', 'Csiperke', 0, NULL, 'Áprilistól novemberig bolygatott helyeken, parkokban, útszélen növő gyakori faj.', 0, 1, 5, 11, 'Parkokban, útszélen', 'Kalapos', 'Lemezes', 'Ellaposodót', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vastag', 'Nincs', 0, ''),
(7, 'Agaricus campestris', 'Mezei csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig legelőkön, füves helyeken növő gyakori faj.', 0, 1, 5, 11, 'Legelőkön, füves ', 'Kalapos', 'Lemezes', 'Félgömb', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Vörös', 0, ''),
(8, 'Agaricus crocodilinus', 'Nagyspórás csiperke', 'Csiperke', 0, NULL, 'Elvágva barnul, ánizs vagy keserűmandula szagú. Réten, erdőszélen, esetleg parkban júniustól októberig terem, nem gyakori faj. ', 0, 1, 7, 10, 'Réten, erdőszélen, esetleg parkban', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Nincs', 0, ''),
(9, 'Agaricus dulcidulus', 'Apró csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, egyenként vagy kis csoportokban, hazánkban elég gyakori faj.', 0, 1, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Fokozatosan ellaposodik', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Törékeny', 'Megsárgul', 0, ''),
(10, 'Agaricus essettei', 'Gumós csiperke', 'Csiperke', 0, NULL, 'Húsa vágásra enyhén sárgul, ánizsillatú. Májustól novemberig lomb- és fenyőerdőben növő gyakori faj.', 0, 1, 5, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vékony', 'Sárgul', 0, ''),
(11, 'Agaricus litoralis', 'Szekszárdi csiperke', 'Csiperke', 0, NULL, 'Kissé vörösödik a húsa. Májustól októberig réten, legelőn, füves erdőszéleken, szikes talajon is nő, viszonylag ritka faj.', 0, 1, 5, 10, 'Legelőn, füves erdőszéleken, szikes talajon is nő', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Túlérő', 'Sűrű', 'Csipkézett', 'Gallér', 'Zömök', 'Sima', 'Kemény', 'Vörös', 0, ''),
(12, 'Agaricus sylvaticus', 'Erdei csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, luc és bükk alatt, savanyú talajon nő, gyakori faj. Vörösödik.', 0, 1, 6, 11, 'Lomb- és fenyőerdőben, luc és bükk alatt', 'Kalapos', 'Lemezes', 'Széles', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vékony', 'Vörös', 0, ''),
(13, 'Russula adusta', 'Sötétedő galambgomba', 'Galambgomba', 0, NULL, 'Savanyú talajú fenyvesekben a síkvidéktől a hegységekig májustól októberig terem, gyakori.', 0, 0, 5, 10, 'Fenyvesekbe', 'Kalapos', 'Lemezes', 'Domború', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Korpás', 'Jellegzetes szagú', 'Kissé vörös majd szürke', 0, ''),
(14, 'Russula aeruginea', 'Fűzöld galambgomba', 'Galambgomba', 0, NULL, 'Füves erdőben, nyír és fenyők alatt, júliustól októberig terem, helyenként gyakori.', 0, 0, 7, 10, ' Nyír és fenyők', 'Kalapos', 'Lemezes', 'Félgömb', 'Ragadós', 'Bordázott', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Törékeny', 'Nincs', 0, ''),
(15, 'Russula aurea', 'Aranyos galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, különösen tölgy, de luc alatt is terem. Hazánkban nem gyakori.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 0, ''),
(16, 'Russula caerulea', 'Púpos galambgomba', 'Galambgomba', 0, NULL, 'Nyár végén, ősz elején kéttűs fenyők alatt található, nem túl gyakori.', 0, 0, 7, 10, 'Fenyvesekbe', 'Kalapos', 'Lemezes', 'Púpos', 'Fényes', 'Bordás', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Keserű', 'Nincs', 0, ''),
(17, 'Russula carpinii', 'Gyertyán-galambgomba', 'Galambgomba', 0, NULL, 'Gyertyánfák alatt fordul elő. Korai megjelenésű.', 0, 0, 6, 10, 'Gyertyánfák', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Puha', 'Nincs', 0, ''),
(18, 'Russula chloroides', 'Kékeslemezű galambgomba', 'Galambgomba', 0, NULL, 'Savanyú talajú erdőkben, a síkvidéktől a hegységekig, júliustól októberig megtalálható, hazánkban helyenként nem ritka.', 0, 0, 7, 10, 'Savanyú talajú erdőkben,', 'Kalapos', 'Lemezes', 'Domború', 'Ráncos', 'Begöngyölt', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs', 0, ''),
(19, 'Russula cyanoxantha', 'Kékhátú galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 7, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Nedves', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 0, ''),
(20, 'Russula delica', 'Földtoló galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig főleg meszes talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Földes', 'Begöngyölt', 'Ritkán', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 0, ''),
(21, 'Russula graveolens', 'Halszagú galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig, lomberdőben, elsősorban savanyú talajon tölgy alatt nő, hazánkban nem ritka.', 0, 0, 7, 10, 'Lomberdőben, elsősorban savanyú talajon tölgy alatt nő', 'Kalapos', 'Lemezes', 'Ellaposodót', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Barnán', 0, ''),
(22, 'Russula grisea', 'Szürkészöld galambgomba', 'Galambgomba', 0, NULL, 'Hegyvidéki tölgyesek, gyertyános-bükköseink gyakori gombája. Nyártól késő őszig terem.', 0, 0, 7, 10, ' Tölgyesek, gyertyános-bükköseink gyakori gombája', 'Kalapos', 'Lemezes', 'Ráncos', 'Deres', 'Ráncolt', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Foltos', 'Kemény', 'Nincs', 0, ''),
(23, 'Russula heterophylla', 'Dióízű galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, júliustól októberig fordul elő. Elterjedt, gyakori.', 0, 0, 7, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Kissé ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 0, ''),
(24, 'Russula integra', 'Barnásvörös galambgomba', 'Galambgomba', 0, NULL, 'Júniustól novemberig lucfenyő, erdei- és jegenyefenyők közelében, minden talajon, elsősorban hegyvidéken, de síkságon is gyakori.', 0, 0, 6, 11, 'Lucfenyő, erdei- és jegenyefenyők közelében', 'Kalapos', 'Lemezes', 'Félgömb', 'Tapadós', 'Bordázott', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Eres', 'Merev', 'Nincs', 0, ''),
(25, 'Russula ionochlora', 'Papagáj-galambgomba', 'Galambgomba', 0, NULL, 'Nyár végi, ősz elején lomb- és vegyes erdőkben található, ritka faj.', 0, 0, 5, 11, 'Lomb- és vegyeserdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Deres', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Vörös', 0, ''),
(26, 'Russula medullata', 'Acélszürke galambgomba', 'Galambgomba', 0, NULL, 'Hegyvidékeken élő gomba, főként nyár és nyír környezetben, de bükk, gyertyán vagy tölgy alatt is találták már. Nyári elejétől októberig terem.', 0, 0, 6, 10, 'Nyár és nyír környezetben, de bükk, gyertyán vagy tölgy ', 'Kalapos', 'Lemezes', 'Félgömb', 'Tapadós', 'Bordázott', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Törékeny', 'Nincs', 0, ''),
(27, 'Russula melliolens', 'Mézszagú galambgomba', 'Galambgomba', 0, NULL, 'Lomberdőben, tölgy, ritkábban bükk vagy gyertyán alatt, semleges vagy enyhén savanyú talajon, nyártól őszig nő. Magyarországon nem ritka.', 0, 0, 6, 9, 'Lomberdőben, tölgy, ritkábban bükk vagy gyertyán ', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Barázdált', 'Kemény', 'Nincs', 0, ''),
(28, 'Russula odorata', 'Illatos galambgomba', 'Galambgomba', 0, NULL, 'Vegyes erdőkben főként tölgyek közelében nyáron és ősszel terem. Ritka.', 0, 0, 6, 10, 'Tölgyek', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 0, ''),
(29, 'Russula parazurea', 'Deres galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig, lomb- és fenyőerdőben, főleg tölgy és bükk vagy kéttűs fenyő alatt nő. Hazánkban ritka gombafaj.', 0, 0, 6, 10, ' Lomb- és fenyőerdőben, főleg tölgy és bükk vagy kéttűs fenyő alatt nő', 'Kalapos', 'Lemezes', 'Lapos', 'Deres', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Rozsdafoltos', 'Kemény', 'Nincs', 0, ''),
(30, 'Russula risigallina', 'Cifra galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben leginkább tölgy és bükk alatt találhatjuk ezt az enyhe ízű, gyakori fajt.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 0, ''),
(31, 'Russula romellii', 'Sárgalemezű galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb és fenyőerdőben, főleg bükk, ritkán lucfenyő alatt savanyú talajú erdőkben találhatjuk.', 0, 0, 6, 10, 'Lomb és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Foltos', 'Kemény', 'Nincs', 0, ''),
(32, 'Russula rubroalba', 'Vörösfoltos galambgomba', 'Galambgomba', 0, NULL, 'Lombos erdőkben, elsősorban tölgy alatt nyáron és ősszel terem.', 0, 0, 6, 10, 'Lombos erdőkben, elsősorban tölgy', 'Kalapos', 'Lemezes', 'Domború', 'Hullámos', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs', 0, ''),
(33, 'Russula sericatula', 'Selymes galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig gyakran csoportosan, vegyes erdőben, parkban, leggyakrabban gyertyán, de olykor bükk és tölgy alatt nő. Nagyon ritka.', 0, 0, 6, 10, 'Vegyes erdőben', 'Kalapos', 'Lemezes', 'Domború', 'Matt', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Puha', 'Nincs', 0, ''),
(34, 'Russula velenovskyi', 'Téglavörös galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és vegyeserdőben, különböző talajokon növő, hazánkban nem gyakori faj.', 0, 0, 7, 10, 'Lomb- és vegyeserdőben', 'Kalapos', 'Lemezes', 'Széles', 'Sima', 'Bordás', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Nincs', 0, ''),
(35, 'Russula velutipes', 'Rózsás galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben, főleg tölgy és bükk alatt nő. Szárazságtűrő faj, hazánkban nem ritka.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben, főleg tölgy és bükk', 'Kalapos', 'Lemezes', 'Sima', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Hanvas', 'Enyhe ízű', 'Nincs', 0, ''),
(36, 'Russula vesca', 'Ráncos galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, májustól októberig nő. Elterjedt, nagyon gyakori.', 0, 0, 5, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Szivacsos', 'Nincs', 0, ''),
(37, 'Russula violeipes', 'Ibolyástönkű galambgomba', 'Galambgomba', 0, NULL, 'Júliustól szeptemberig lomb és fenyőerdőkben, különösen tölgy alatt növő hazánkban nem gyakori faj.', 0, 0, 5, 11, 'Lomb és fenyőerdőkben, különösen tölgy', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Nincs', 0, ''),
(38, 'Russula virescens', 'Varashátú galambgomba', 'Galambgomba', 0, NULL, 'Lomberdőkben terem júniustól szeptemberig, elterjedt, helyenként gyakori.', 0, 0, 6, 9, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Gömbölyű', 'Varrás', 'Bordázót', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Foltos', 'Pattanva törik', 'Okkeresen ', 0, ''),
(39, 'Russula vitellina', 'Baracksárga galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben, leginkább tölgy és bükk alatt terem. Hazánkban gyakori.', 0, 0, 7, 10, 'Lomb- és fenyőerdőben, leginkább tölgy és bükk alatt terem', 'Kalapos', 'Lemezes', 'Széles', 'Matt', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Nagyon törékeny', 'Nincs', 0, ''),
(40, 'Russula xerampelina', 'Barnulóhúsú galambgomba', 'Galambgomba', 0, NULL, 'Júliustól novemberig savanyú talajú fenyőerdőkben növő nem ritka faj. Rokonfajai lomberdőben is előfordulnak.', 0, 0, 6, 9, 'Fenyvesekbe', 'Kalapos', 'Lemezes', 'Félgömb', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Merev', 'Okkeresen ', 0, ''),
(41, 'Amanita excelsa ', 'Szürke galóca', 'Galóca', 0, NULL, 'Augusztustól októberig meszes talajú lomberdőben, gyakran száraz időben is előforduló, nem gyakori gomba.', 0, 1, 8, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Nincs', 0, ''),
(42, 'Amanita rubescens ', 'Piruló galóca', 'Galóca', 0, 'Feltételesen ehető', 'Nyáron ősszel lomb- és fenyőerdőben fordul elő. Nem gyakori faj', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Varras', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Rovarrágásnál Vörösödik', 0, ''),
(43, 'Amanita muscaria', 'Légyölő galóca', 'Galóca', 1, 'Mérgező', 'Augusztustól novemberig, erősen savanyú talajú lomb- és fenyőerdőben növő, helyenként gyakori faj.', 0, 1, 8, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Könnyen leváló, fehér pettyek', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Vastag, hengeres', 'Sima', 'Puha, vizenyős', 'Nincs', 0, ''),
(44, 'Amanita phalloides', 'Gyilkos galóca', 'Galóca', 1, 'Mérgező', 'Júniustól novemberig, lomberdőben, főleg tölgy alatt, ritkán fenyvesben növő, gyakori faj.', 1, 1, 6, 11, 'Lomberdőben tölgyes', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér vizenyős', 'Nincs', 0, ''),
(45, 'Amanita caesarea', 'Császárgalóca', 'Galóca', 3, 'Védett', 'Teljesen narancs sárga gomba gyüjtését a törvény bünteti', 1, 1, 6, 10, 'Savanyú talajú lomberdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Fénylő', 'Bordázott', 'Sűrű', 'Finoman csipkézet', 'Gallér', 'Hengeres', 'Sima', 'Puha', 'Nincs', 5000, ''),
(46, 'Morchella deliciosa', 'Hegyes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ehető, jóízű, aromás gomba, de jól főzzük, süssük meg, mert nyersen fogyasztva egyeseknél allergiás tüneteket okozhat!', 0, 0, 3, 5, 'Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Bordás', 'Nincs', 'Ovális kerekded bordák', 'Nincs', 'Nincs', 'Üreges', 'Okkeres, szemcsés', 'Vékony', 'Nincs', 0, ''),
(47, 'Morchella esculenta', 'Ízletes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Réteken, kertekben, bokros helyeken, liget erdőkben nagy mennyiségben terem, márciustól áprilisig.', 0, 0, 7, 10, 'Réteken, kertekben, bokros', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Viasszerű', 'Nincs', 'Rendezett bemélyedések ', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 0, ''),
(48, 'Morchella semilibera', 'Fattyú kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ligeterdőkben, erdőszéleken, tópartokon áprilistól májusig terem, helyenként gyakori.', 0, 0, 5, 5, 'Ligeterdőkben, erdőszéleken', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Rendezett méhsejt', 'Nincs', 'Hosszanti sorok rendezett méhsejt', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 0, ''),
(49, 'Morchella steppicola', 'Pusztai kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Az Alföld cserjés vagy szinte fátlan pusztáin terem, de a dunántúli dombok alacsony gyepjében is előfordul löszös vagy agyagos talajon. Ritka faj.', 0, 0, 3, 4, 'Fátlan pusztáin', 'Kucsma alaku süveg', 'Méh sejt', 'Szabálytalan bordák', 'Sűrűborda', 'Nincs', 'Elválasztó bordák', 'Nincs', 'Nincs', 'Üreges', 'Ráncosodó', 'Vékony', 'Nincs', 0, ''),
(50, 'Verpa bohemica', 'Cseh kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól áprilisig lombos erdők talaján, bokros, nedves területen növő helyenként gyakori faj. A legkorábban megjelenő kucsmagombánk.', 0, 0, 3, 4, 'Lombos erdők talaján, bokros, nedves területen', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Erősen ráncolt', 'Nincs', 'Érinti a tönköt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vékony', 'Nincs', 0, ''),
(51, 'Verpa conica', 'Simasüvegű kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Áprilistól májusig nedves lomb- és fenyőerdőben, ligeterdőben, folyópartokon nő. Hazánkban ritka faj.', 0, 0, 5, 5, 'Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Gyűszű', 'Nincs', ' Finoman ráncolt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vattás', 'Nincs', 0, ''),
(52, 'Pleurotus cornucopiae', 'Erestönkű laskagomba', 'Laskagomba', 0, NULL, 'Áprilistól júliusig elsősorban elhalt lombos fa anyagán, csoportosan nő. Hazánkban nem gyakori.', 0, 0, 4, 7, 'Lombos fa', 'Tapló', 'Lemezes', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Kalapban puha', 'Nincs', 0, ''),
(53, 'Pleurotus eryngii', 'Ördögszekér laskagomba', 'Laskagomba', 0, NULL, 'Késő nyártól a tartós fagyokig gyepekben egyesével vagy kisebb csoportokban nő. A mezei iringó kérgén él.', 0, 0, 9, 12, 'Mezei iringó kérgén', 'Tapló', 'Lemezes', 'Kör alakú', 'Finoman pikkelyes', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Nincs', 'Vastag,rostos', 'Nincs', 0, ''),
(54, 'Pleurotus ostreatus', 'Kései laskagomba', 'Laskagomba', 0, NULL, 'Októbertől decemberig lombos fákon vagy azok tuskóin, fahulladékon növő gyakori faj.', 0, 0, 10, 12, 'Lombos fákon vagy azok tuskóin', 'Tapló', 'Lemezes', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Oldalt álló', 'Nincs', 'Szivós', 'Nincs', 0, ''),
(55, 'Pleurotus pulmonarius', 'Nyári laskagomba', 'Laskagomba', 0, NULL, 'Májustól szeptemberig lomb- és fenyőerdőben, fatuskón, korhadó fán, fűrészporon növő gyakori faj.', 0, 0, 5, 9, ' Lomb- és fenyőerdőben, fatuskón', 'Tapló', 'lemezes', 'Féloldalas', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Rugalmas', 'Nincs', 0, ''),
(56, 'Macrolepiota procera', 'Nagy őzlábgomba', 'Őzláb', 0, NULL, 'Halvány barnás alapon nagy, sötétebb barna színű, könnyen letörölhető, gyapjas pikkelyek.', 0, 1, 5, 11, 'Erdő szélen tisztásokon', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Peremig nem érő', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Kígyóbőr', 'Vattás', 'Nincs', 0, ''),
(57, 'Macrolepiota mastoidea', 'Karcsú őzlábgomba', 'Őzláb', 0, NULL, 'Teljesen kifejlődve a közepén jellegzetesen púpos kalap világos alapon barnaság pikkelyezett.', 0, 1, 6, 11, 'Erdő szélen tisztásokon', 'Kalapos', 'Lemezes', 'Kúpos', 'Fakó', 'Peremig nem érő', 'Sűrű', 'Nem éri a tönköt', 'Gallér', 'Karcsú', 'Pikkelyes', 'Fehér', 'Nincs', 0, ''),
(58, 'Chlorophyllum rachodes', 'Piruló őzlánbomba', 'Őzláb', 0, NULL, 'Tulajdonságai meg egyeznek a nagy őzlábgombával, de termete kisebb.', 0, 1, 5, 11, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Lemezes', 'Félgömb', 'Gyapjas', 'Peremig nem érő', 'Sűrű', 'Sérülésre vörösödik', 'Gallér', 'Karcsú', 'Sima', 'Rostos', 'Naracsvörös', 0, ''),
(59, 'Gyromitra esculenta', 'Redős papsapkagomba', 'Papsapkagomba', 1, 'Mérgező', 'Márciustól májusig, savanyú talajú kéttűs fenyőerdőben, talajon vagy korhadó faanyag közelében. Hazánkban ritka faj. ', 0, 0, 3, 5, ' Lomb- és fenyőerdőben, fatuskón', 'Kucsma alaku süveg', 'Redők', 'Szabálytalan bordák', 'Erősen ráncolt', 'Nincs', 'Tekervényes', 'Nincs', 'Gallér', 'Tömör, később szabálytalanul üreges', 'Barázdált', 'Vékony', 'Nincs', 0, ''),
(60, 'Lycoperdon perlatum', 'Bimbós pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'A termőrésze a termőtest felső harmadának belsejében található.', 0, 0, 6, 11, 'Lomb és fenyőerdőkben megtalálható', 'Pöfeteg', 'Zárt ternőtest', 'Körte forma', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Kiszélesedő', 'Tüskés', 'Rugalmas', 'Nincs', 0, ''),
(61, 'Lycoperdon excipuliforme', 'Változékony pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Egészen nyúlánk pöffetegfaj,fehér,majd krémszínű, barnuló termoteszte hosszúkás.', 0, 0, 7, 10, 'Erdő,rétek,legelők', 'Pöfeteg', 'Zárt ternőtest', 'Körte forma', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Pikkelyes', 'Kemény', 'Nincs', 0, ''),
(62, 'Lycoperdon utriforme', 'Pikkelyes pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'A fiatal termőtest felszíne nemezes,szemcsés, majd fokozatosantáblásan felrepedezik és pikkelyes lesz.', 0, 0, 6, 10, 'Rétek,legelők,tisztások', 'Pöfeteg', 'Zárt ternőtest', 'Zsák alaku', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Rövid egybenött', 'Pikkelyes', 'Szivacsos', 'Nincs', 0, ''),
(63, 'Lycoperdon rupicola', 'Sziklai pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Andezit, gránit és homokkövön tenyésző meganám fedezhetjük fel.', 0, 0, 9, 11, 'Fenyveserdőkben mindig moha között', 'Pöfeteg', 'Zárt ternőtest', 'Kicsi körte', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Tüskés', 'Szivacsos', 'Nincs', 0, ''),
(64, 'Langermannia gigantea', 'Óriás pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Többé kevésbé gömbölyü, nagytermetű talajlakó gombafaj, fél méteres étmérőjűre és 10 kg-osra is megnőhet', 0, 0, 6, 10, 'Erdő,mező', 'Pöfeteg', 'Zárt ternőtest', 'Gömbölyű', 'Ráncos', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Ráncosodó', 'Rugalmas', 'Nincs', 0, ''),
(65, 'Bovista plumbea', 'Szürke pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Fehér felületesima kissé táblásan felrepedező,felső burok tojáshéjszerűen leválik.', 0, 0, 3, 8, 'Legelök', 'Pöfeteg', 'Zárt ternőtest', 'Golyó', 'Sima', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Sima', 'Szivacsos', 'Nincs', 0, ''),
(66, 'Cantharellus amethysteus', 'Ibolyás rókagomba', 'Rókagomba', 0, NULL, 'Nyártól késő őszig, lombhullató erdőben fordul elő. Nagyon ritka faj.', 0, 0, 6, 11, 'Lombhullató erdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Tojássárga színű, ibolyásszürke pikkelykékkel', 'Aláhajló', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', 'Tojássárga színű, ibolyásszürke pikkelykékkel', 'Dehér vagy sápadt sárga', 'Nincs', 0, ''),
(67, 'Cantharellus cibarius', 'Sárga rókagomba', 'Rókagomba', 0, NULL, 'Lombos és fenyőerdőben, savanyú preferenciával, júniustól októberig terem, ritka faj.', 0, 0, 6, 11, 'Lombos és fenyőerdőben, savanyú preferenciával', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', ' Vastag, tömör', 'Fehéres, a kalapbőr alatt világossárga,', 'Nincs', 0, ''),
(68, 'Cantharellus ferruginascens', 'Rozsdásodó rókagomba', 'Rókagomba', 0, NULL, 'Júniustól novemberig főleg savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 11, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Selymesen sima', 'Hullámos', 'Sűrű', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Pikkelyes-bordás', 'Vékony', 'Nincs', 0, ''),
(69, 'Cantharellus friesii', 'Narancsvörös rókagomba', 'Rókagomba', 0, NULL, 'Nyártól őszig lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban. Magyarországon nem ritka.', 0, 0, 6, 11, 'Lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban', 'Kalapos', 'Lemezes', 'Tölcséres', 'Szélén hullámos', 'Hullámos', ' Tompa élűek és villásan elágazók', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Vékony', 'Nincs', 0, ''),
(70, 'Cantharellus pallens', 'Halvány rókagomba', 'Rókagomba', 0, NULL, 'Júniustól októberig bükk- és tölgyfák alatt, savanyú talajon terem. A domb- és hegyvidékeken fordul elő. Hazánkban nagyon ritka faj.', 0, 0, 6, 11, 'Bükk- és tölgyfák alatt, savanyú talajon terem domb- és hegyvidékeken fordu', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', ' Vastag, tömör', 'Halvény világossárga', 'Nincs', 0, ''),
(71, 'Craterellus cinereus', 'Szürke rókagomba', 'Rókagomba', 0, NULL, 'Szeptembertől októberig savanyú talajú lomb- és fenyőerdőben fordul elő. Hazánkban ritka gombafaj.', 0, 0, 7, 10, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Száraz', 'Mélyen lefutó', 'Ráncos eres', 'Sima', 'Nincs', 'Üreges vékony', 'Vékony', 'Szívós vékony', 'Nincs', 0, ''),
(72, 'Erdei szömörcsög', 'Erdei szömörcsög', 'Szömörcsög', 0, 'Boszorkánytojás ehető', 'A spóratermő része a süveg felületét boritja. A nyálkás rétegben ágyazódott spórákat rovarok terjesztik .Összetéveszthetetlenül bödüs szaga van.', 1, 0, 6, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kupos', 'Méh sejt', 'Süveg', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Szivacsos', 'Kifejlődve szívacsos', 'Nincs', 0, ''),
(73, 'Clathrus archeri', 'Tintahalgomba', 'Szömörcsög', 2, 'Nem ehető', 'A termőtest 4-7 davab vörös színü szivacsos szerkezetü tintahalszerű kar .', 1, 0, 6, 10, 'Lomberdőben megtalálható', 'Csáp', 'Karok belsö oldala', 'Csápok', 'Nyálkás', 'Nyálkás', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Szivacsos', 'Szivacsos', 'Nincs', 0, ''),
(74, 'Xerocomellus chrysenteron', 'Arany tinóru', 'Tinóru', 0, NULL, 'Májustól novemberig lomb- és fenyőerdőben, parkokban növő gyakori faj.', 0, 0, 5, 11, 'Lomb- és fenyőerdőben, parkokban', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Korpás', 'Puha', 'Tönkön vörösödik kalapnál enyhén kékül', 0, ''),
(75, 'Aureoboletus gentilis ', 'Aranybélésű tinóru', 'Tinóru', 0, NULL, 'Júliustól októberig füves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken; hazánkban nem gyakori.', 0, 0, 7, 12, 'Üves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken', 'Kalapos', 'Csöves', 'Félgömb', 'Ragadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Puha', 'Nincs', 0, ''),
(76, 'Suillus luteus', 'Barna gyűrűstinóru', 'Tinóru', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 0, 1, 6, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Vattás', 'Hamar megpuhul', 'Nincs', 0, ''),
(77, 'Xerocomellus porosporus', 'Csapottspórás tinóru', 'Tinóru', 0, NULL, 'Júniustól szeptemberig lomb és fenyőerdőkben megtalálható gyakori faj. Húsa hamar megromlik, gyakran kukacos.', 0, 0, 7, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Csöves', 'Domború', 'Felrepedezett', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Tönk felé vékonyodó', 'Sima', 'Puha', 'Lassan kékeszöld', 0, ''),
(78, 'Suillus cavipes', 'Csövestönkű fenyőtinóru', 'Tinóru', 0, NULL, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás, nyáron és ősszel.', 0, 0, 6, 11, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hárgya', 'Lefele vastagodik', 'Szálas', 'Puha', 'Nincs', 0, ''),
(79, 'Xerocomus subtomentosus', 'Molyhos tinóru', 'Tinóru', 0, NULL, 'Nyáron lomb- és fenyőerdőkben található, fiatalon jóízű, idősen kesernyés gomba.', 0, 0, 5, 10, ' Lomb- és fenyőerdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Lefelé elvékonyodó', 'Puha', 'Gyengén kékül', 0, ''),
(80, 'Hortiboletus rubellus ', 'Piros tinóru', 'Tinóru', 0, NULL, 'Melegebb erdőkben, többféle lombhullató fa alatt (hárs, nyír, tölgy).', 0, 0, 6, 10, 'Lombhullató fa alatt (hárs, nyír, tölgy).', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Puha', 'Kékül', 0, ''),
(81, 'Suillus collinitus', 'Rózsástövű fenyőtinóru', 'Tinóru', 0, NULL, 'Augusztustól novemberig meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) alatt növő gyakori faj.', 0, 0, 8, 11, 'Meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) ', 'Kalapos', 'Csöves', 'Kiterülő', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Tömör', 'Nincs', 0, ''),
(82, 'Suillus grevillei', 'Sárga gyűrűstinóru', 'Tinóru', 0, NULL, 'Júniustól októberig vörösfenyők alatt növő gombafaj.', 0, 1, 6, 11, 'Vörösfenyők', 'Kalapos', 'Csöves', 'Félgömb', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Szálas', 'Vastag', 'Nincs', 0, ''),
(83, 'Suillus granulatus', 'Szemcsésnyelű fenyőtinóru', 'Tinóru', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 0, 0, 8, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Sárga', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Pontozót nyálkás', 'Vastag', 'Nincs', 0, ''),
(84, 'Suillus viscidus', 'Szürke gyűrűstinóru', 'Tinóru', 0, NULL, 'Júniustól októberig vörösfenyő alatt termő, nálunk ritka, magashegységi gombafaj.', 0, 1, 6, 10, 'Vörösfenyő alatt termő, nálunk ritka, magashegységi', 'Kalapos', 'Csöves', 'Félgömb', 'Szálas', 'Peremig nem érő', 'Nincs', 'Nincs', 'Vélummaradvány', 'Hengeres', 'Szálas', 'Szálas', 'Nincs', 0, ''),
(85, 'Suillus variegatus', 'Tarka tinóru', 'Tinóru', 0, NULL, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt, nyártól őszig terem.', 0, 0, 8, 11, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Zömök', 'Szemcsés', 'Sárga szín', 'Gyengén kékül', 0, ''),
(86, 'Suillus bovinus', 'Tehéntinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Augusztustól novemberig savanyú talajú erdei fenyvesekben, gyakran seregesen növő gombafaj.', 0, 0, 6, 8, 'Savanyú talajú erdei fenyvesekben', 'Kalapos', 'Csöves', 'Félgömb', 'Okkerbarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Csupasz', 'Gumiszerű', 'Nincs', 0, ''),
(87, 'Caloboletus calopus', 'Farkastinóru', 'Tinóru', 1, 'Mérgező', 'Savanyú talajú lombos és fenyőerdőben, nyártól őszig terem, dombvidéktől a magas hegységekig.', 0, 0, 6, 11, 'Savanyú talajú lombos és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Erősen vörös, hálózatos tönk', 'Merev, sárga vagy fehéres', ' Enyhén kékül', 0, ''),
(88, 'Coprinellus micaceus ', 'Kerti tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Júliustól novemberig lomb- és fenyőerdőben, ligetes, füves helyen növő helyenként nem ritka faj.', 0, 0, 7, 11, ' Lomb- és fenyőerdőben, ligetes, füves helyen', 'Kalapos', 'Lemezes', 'Kúpos', 'Szemcsés', 'Tönköt éri', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Csupasz', 'Fehér', 'Nincs', 0, ''),
(89, 'Coprinopsis acuminata', 'Csúcsoskalapú tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Áprilistól decemberig tuskókon vagy eltemetett faanyagon, csoportosan nő. Hazánkban gyakori.', 0, 0, 7, 11, ' Tuskókon vagy eltemetett faanyagon', 'Kalapos', 'Lemezes', 'Kúpos', 'Sima', 'Bordás', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Kissé pikkelyes', 'Szürke', 'Nincs', 0, ''),
(90, 'Coprinopsis atramentaria ', 'Ráncos tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Nyáron, ősszel tápanyagban gazdag környezetben nő. Ritka.', 0, 0, 5, 11, 'Tápanyagban gazdag környezetben', 'Kalapos', 'Lemezes', 'Kúpos', 'Ráncos', 'Hasadt', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 0, ''),
(91, 'Coprinopsis insignis ', 'Ezüstszálas tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Erdőkben, erdőszéleken, kertekben, parkokban, útszélen, tápanyagdús talajon magányosan vagy csoportosan nő, gyakori faj.', 0, 0, 6, 10, 'Erdőkben, erdőszéleken, kertekben, parkokban, útszélen, tápanyagdús talajon ', 'Kalapos', 'Lemezes', 'Kúpos', 'Selymes', 'Tönköt éri', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Pelyhes', 'Fehér', 'Nincs', 0, ''),
(92, 'Coprinus comatus ', 'Gyapjas tintagomba', 'Tintagomba', 0, NULL, 'Júniustól októberig elhalt faanyagon vagy élő lombos fák tövében, seregesen vagy csoportosan terem, nem gyakori gombafaj.', 0, 0, 5, 12, 'Elhalt faanyagon vagy élő lombos fák tövében', 'Kalapos', 'Lemezes', 'Kúpos', 'Gyapjas', 'Csepegnek', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 0, ''),
(93, 'Boletus aereus ', 'Bronzos vargánya', 'Vargánya', 0, NULL, 'Az őszi hónapokban hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő, mikorrhizaképző, ritka faj.', 0, 0, 5, 10, 'Hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő', 'Kalapos', 'Csöves', 'Félgömb', 'Molyhos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Sűrű hálózat', 'Kemény', 'Nincs', 0, ''),
(94, 'Boletus edulis', 'Ízletes vargánya', 'Vargánya', 0, NULL, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás. Melegkedvelő, dombvidéki faj.', 0, 0, 6, 10, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás', 'Kalapos', 'Csöves', 'Félgömb', 'Foltos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Hálózatos', 'Kemény', 'Nincs', 0, ''),
(95, 'Boletus pinophilus ', 'Vörösbarna vargánya', 'Vargánya', 0, NULL, 'Júniustól októberig csak savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 9, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Zsíros tapintású', 'Begöngyölt', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózatos barna', 'Kemény', 'Nincs', 0, ''),
(96, 'Boletus reticulatus ', 'Nyári vargánya', 'Vargánya', 0, NULL, 'Hegy- és dombvidéki fenyvesekben késő tavasztól őszig terem. Magyarországon ez a gomba elsősorban (hegyvidéki) bükkösökben terem.', 0, 0, 6, 9, 'Hegy- és dombvidéki fenyvesekben', 'Kalapos', 'Csöves', 'Félgömb', 'Ráncolt', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózattal', 'Kemény', 'Nincs', 0, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezok_turara`
--

CREATE TABLE `jelentkezok_turara` (
  `User_id` int(20) NOT NULL,
  `Tura_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `jelentkezok_turara`
--

INSERT INTO `jelentkezok_turara` (`User_id`, `Tura_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_databse`
--

CREATE TABLE `post_databse` (
  `Id` int(10) NOT NULL,
  `Postolo_neve` varchar(20) NOT NULL,
  `Kep_id` varchar(20) NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tervezet_turak`
--

CREATE TABLE `tervezet_turak` (
  `Id` int(3) NOT NULL,
  `Letrehozo` varchar(50) NOT NULL,
  `Indulas_ido` datetime NOT NULL,
  `Indulas_hely` varchar(50) NOT NULL,
  `Varhato_erkezési_ido` datetime NOT NULL,
  `Erkezesi_hely` varchar(50) NOT NULL,
  `Utvolan_nehezsege` varchar(50) NOT NULL,
  `Szervezo_elerhetosege` varchar(50) NOT NULL,
  `Tura_dija` varchar(20) NOT NULL,
  `Elmarad_a_tura` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tervezet_turak`
--

INSERT INTO `tervezet_turak` (`Id`, `Letrehozo`, `Indulas_ido`, `Indulas_hely`, `Varhato_erkezési_ido`, `Erkezesi_hely`, `Utvolan_nehezsege`, `Szervezo_elerhetosege`, `Tura_dija`, `Elmarad_a_tura`) VALUES
(1, 'Szerkesztőség', '2023-10-01 08:00:00', 'Rudabányácska Smaragdvölgy', '2023-10-01 12:00:00', 'Rudabányácska Smaragdvölgy', 'Könnyű/Közepes/Nehéz', 'Email/ telefon', '2000 HUF', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `belépes`
--
ALTER TABLE `belépes`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `gomba`
--
ALTER TABLE `gomba`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `post_databse`
--
ALTER TABLE `post_databse`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `tervezet_turak`
--
ALTER TABLE `tervezet_turak`
  ADD PRIMARY KEY (`Id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `belépes`
--
ALTER TABLE `belépes`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `gomba`
--
ALTER TABLE `gomba`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT a táblához `post_databse`
--
ALTER TABLE `post_databse`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tervezet_turak`
--
ALTER TABLE `tervezet_turak`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
