-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 13. 11:12
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gomba`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `belepes`
--

CREATE TABLE `belepes` (
  `User_id` int(11) NOT NULL,
  `Felhasznalonev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Jelszo` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Születesi_ido` date NOT NULL,
  `Telefon_szam` varchar(12) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `belepes`
--

INSERT INTO `belepes` (`User_id`, `Felhasznalonev`, `Jelszo`, `Email`, `Születesi_ido`, `Telefon_szam`) VALUES
(1, 'Gombamester21', 'Laskagomba', 'Gombamester01@gmail.com', '2000-01-01', '+36301234567'),
(2, 'Papsapka', 'Papsapkagomba21', 'Laskagomba01@gmail.com', '2013-11-01', '+36302547787');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezok_turara`
--

CREATE TABLE `jelentkezok_turara` (
  `User_id` int(11) NOT NULL,
  `Tura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `jelentkezok_turara`
--

INSERT INTO `jelentkezok_turara` (`User_id`, `Tura_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `post_databse`
--

CREATE TABLE `post_databse` (
  `Id` int(10) NOT NULL,
  `Postolo_neve` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Kep_id` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Comment` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tervezet_turak`
--

CREATE TABLE `tervezet_turak` (
  `Tura_id` int(11) NOT NULL,
  `Letrehozo` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Indulas_ido` datetime NOT NULL,
  `Indulas_hely` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Varhato_erkezési_ido` datetime NOT NULL,
  `Erkezesi_hely` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Utvolan_nehezsege` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Szervezo_elerhetosege` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Tura_dija` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Elmarad_a_tura` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tervezet_turak`
--

INSERT INTO `tervezet_turak` (`Tura_id`, `Letrehozo`, `Indulas_ido`, `Indulas_hely`, `Varhato_erkezési_ido`, `Erkezesi_hely`, `Utvolan_nehezsege`, `Szervezo_elerhetosege`, `Tura_dija`, `Elmarad_a_tura`) VALUES
(1, 'Szerkesztőség', '2023-10-01 08:00:00', 'Rudabányácska Smaragdvölgy', '2023-10-01 12:00:00', 'Rudabányácska Smaragdvölgy', 'Könnyű/Közepes/Nehéz', 'Email/ telefon', '2000 HUF', 0),
(2, 'Szerkesztőség', '2023-09-14 09:00:00', 'Sátoraljaújhely Aldi parkoló', '2023-09-14 12:00:00', 'Sátoraljaújhely Tesco parkoló', 'Könnyű', 'Szervezö@gmail.com', 'Ingyenes', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zemplen_eheto_gombai_gomba_adatbazis`
--

CREATE TABLE `zemplen_eheto_gombai_gomba_adatbazis` (
  `ID` int(4) NOT NULL,
  `Latin_nev` varchar(28) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Magyar_nev` varchar(27) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Nemzetseg` varchar(13) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Etkezes_ertek` tinyint(1) DEFAULT NULL,
  `Feltetel` varchar(44) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Leiras` varchar(146) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Bocskora` tinyint(1) DEFAULT NULL,
  `Galler` tinyint(1) DEFAULT NULL,
  `Szezon_eleje` tinyint(2) DEFAULT NULL,
  `Szezon_vege` tinyint(2) DEFAULT NULL,
  `Novenyzet` varchar(90) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termotest_tipus` varchar(18) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Termoretegtarto_tipusok` varchar(18) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_forma` varchar(23) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_felszin` varchar(29) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kalap_perem` varchar(24) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemezallas` varchar(33) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lemez_el` varchar(19) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Burok_maradvany` varchar(23) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tonk_alak` varchar(35) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Tonk_felulet` varchar(28) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hus` varchar(39) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Hus_elszinezodes` varchar(38) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Ize` varchar(13) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Illata` varchar(20) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Ara_HUF` int(6) DEFAULT NULL,
  `Kep_keszeto_neve` varchar(20) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kep_neve` varchar(27) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `zemplen_eheto_gombai_gomba_adatbazis`
--

INSERT INTO `zemplen_eheto_gombai_gomba_adatbazis` (`ID`, `Latin_nev`, `Magyar_nev`, `Nemzetseg`, `Etkezes_ertek`, `Feltetel`, `Leiras`, `Bocskora`, `Galler`, `Szezon_eleje`, `Szezon_vege`, `Novenyzet`, `Termotest_tipus`, `Termoretegtarto_tipusok`, `Kalap_forma`, `Kalap_felszin`, `Kalap_perem`, `Lemezallas`, `Lemez_el`, `Burok_maradvany`, `Tonk_alak`, `Tonk_felulet`, `Hus`, `Hus_elszinezodes`, `Ize`, `Illata`, `Ara_HUF`, `Kep_keszeto_neve`, `Kep_neve`) VALUES
(1, 'Agaricus arvensis', 'Erdőszéli csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig erdő szélén, füves helyen növő gyakori faj.', 1, 1, 5, 11, ' Erdő szélén, füves helyen', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Fogaskerékszerű az alja', 'Bunkó', 'Sima', 'Vastag', 'Sárgul', 'Dió', 'Keserümandula', 0, 'Varju Sándor', 'Csiperke_erdoszeli'),
(2, 'Agaricus augustus', 'Óriás csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, erdőszélen, erdei utakon fordul elő. Hazánkban elég ritka faj.', 0, 1, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Pelyhes', 'Vékony', 'Nincs', 'Jó ízű', 'Keserümandula', 0, 'Szűcs Béla', 'Csiperke_orias'),
(3, 'Agaricus benesii ', 'Ligeti csiperke', 'Csiperke', 0, NULL, 'Júniustól novemberig ligetes lomb- és fenyőerdőben, réten, legelőn növő elég gyakori faj.', 0, 1, 6, 11, 'Ligetes lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pikkelyes', 'Vastag', 'Vörös', 'Nincs', 'Csiperkeillat', 0, 'Borsi Valéria', 'Csiperke_ligeti'),
(4, 'Agaricus bernardii', 'Sziki csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig szikes alföldi tájakon, utak mentén seregesen találjuk az első fagyokig. Tűri a sok trágyát, igényli a talaj sótartalmát. ', 0, 1, 5, 11, 'Szikes alföldi tájakon', 'Kalapos', 'Lemezes', 'Domború', 'Fénytelen', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Foszladozik', 'Vastag', 'Nincs', 'Nincs', 'Nem kellemes', 0, 'Nagy Angéla', 'Csiperke_sziki'),
(5, 'Agaricus bisporus ', 'Kétspórás csiperke', 'Csiperke', 0, NULL, 'Kertekben, parkokban, komposzton, júniustól októberig gyakori. Termeszteni is szokták.', 0, 1, 6, 10, 'Kertekben, parkokban, komposzton', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Kemény', 'Vörös', 'Kellemes', 'Kellemes', 0, 'Boros Lajos', 'Csiperke_ketsporas'),
(6, 'Agaricus bitorquis', 'Ízletes csiperke', 'Csiperke', 0, NULL, 'Áprilistól novemberig bolygatott helyeken, parkokban, útszélen növő gyakori faj.', 0, 1, 5, 11, 'Parkokban, útszélen', 'Kalapos', 'Lemezes', 'Ellaposodót', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vastag', 'Nincs', 'Kellemes', 'Csiperkeillat', 0, 'Szűcs Béla', 'Csiperke_izletes'),
(7, 'Agaricus campestris', 'Mezei csiperke', 'Csiperke', 0, NULL, 'Májustól novemberig legelőkön, füves helyeken növő gyakori faj.', 0, 1, 5, 11, 'Legelőkön, füves ', 'Kalapos', 'Lemezes', 'Félgömb', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Vörös', 'Jó ízű', 'Kellemes', 0, 'Dr.Dima Bálint', 'Csiperke_mezei'),
(8, 'Agaricus crocodilinus', 'Nagyspórás csiperke', 'Csiperke', 0, NULL, 'Elvágva barnul, ánizs vagy keserűmandula szagú. Réten, erdőszélen, esetleg parkban júniustól októberig terem, nem gyakori faj. ', 0, 1, 7, 10, 'Réten, erdőszélen, esetleg parkban', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Nincs', 'Nincs', 'Keserümandula', 0, 'Kőszegi Balázs', 'Csiperke_nagysporas'),
(9, 'Agaricus essettei', 'Gumós csiperke', 'Csiperke', 0, NULL, 'Húsa vágásra enyhén sárgul, ánizsillatú. Májustól novemberig lomb- és fenyőerdőben növő gyakori faj.', 0, 1, 5, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vékony', 'Sárgul', 'Nincs', 'Keserümandula', 0, 'Nagy Angéla', 'Csiperke_gumos'),
(10, 'Agaricus sylvaticus', 'Erdei csiperke', 'Csiperke', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, luc és bükk alatt, savanyú talajon nő, gyakori faj. Vörösödik.', 0, 1, 6, 11, 'Lomb- és fenyőerdőben, luc és bükk alatt', 'Kalapos', 'Lemezes', 'Széles', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vékony', 'Vörös', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', 'Csiperke_erdei'),
(11, 'Russula aurea', 'Aranyos galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben, különösen tölgy, de luc alatt is terem. Hazánkban nem gyakori.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Enyhe', 'Nincs', 0, 'Szajkó Attila', 'Galambgomba_aranyos'),
(12, 'Russula chloroides', 'Kékeslemezű galambgomba', 'Galambgomba', 0, NULL, 'Savanyú talajú erdőkben, a síkvidéktől a hegységekig, júliustól októberig megtalálható, hazánkban helyenként nem ritka.', 0, 0, 7, 10, 'Savanyú talajú erdőkben,', 'Kalapos', 'Lemezes', 'Domború', 'Ráncos', 'Begöngyölt', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs', 'Hal', 'Nincs', 0, 'Molnár Rudolf', 'Galambgomba_keklemezu'),
(13, 'Russula cyanoxantha', 'Kékhátú galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 7, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Nedves', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Mogyoró', 'Nincs', 0, 'Hajda Piroska', 'Galambgomba_kekhatu'),
(14, 'Russula delica', 'Földtoló galambgomba', 'Galambgomba', 0, NULL, 'Júniustól októberig főleg meszes talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Földes', 'Begöngyölt', 'Ritkán', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 'Nem csípős', 'Gyümölcsös', 0, 'Dr.Dima Bálint', 'Galambgomba_foldtolo'),
(15, 'Russula graveolens', 'Halszagú galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig, lomberdőben, elsősorban savanyú talajon tölgy alatt nő, hazánkban nem ritka.', 0, 0, 7, 10, 'Lomberdőben, elsősorban savanyú talajon tölgy alatt nő', 'Kalapos', 'Lemezes', 'Ellaposodót', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Barnán', 'Nem csípős', 'Hal szagú', 0, 'Albert László', 'Galambgomba_halszagu'),
(16, 'Russula heterophylla', 'Dióízű galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, júliustól októberig fordul elő. Elterjedt, gyakori.', 0, 0, 7, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Kissé ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 'Dió', 'Nincs', 0, 'Nagy Angéla', 'Galambgomba_dioizu'),
(17, 'Russula risigallina', 'Cifra galambgomba', 'Galambgomba', 0, NULL, 'Júliustól októberig lomb- és fenyőerdőben leginkább tölgy és bükk alatt találhatjuk ezt az enyhe ízű, gyakori fajt.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Enyhe', 'Gyümölcsös', 0, 'Nagy Angéla', 'Galambgomba_cifra'),
(18, 'Russula vesca', 'Ráncos galambgomba', 'Galambgomba', 0, NULL, 'Főleg lomberdőkben, májustól októberig nő. Elterjedt, nagyon gyakori.', 0, 0, 5, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Szivacsos', 'Nincs', 'Dió', 'Nincs', 0, 'Nagy Angéla', 'Galambgomba_rancos'),
(19, 'Russula violeipes', 'Ibolyástönkű galambgomba', 'Galambgomba', 0, NULL, 'Júliustól szeptemberig lomb és fenyőerdőkben, különösen tölgy alatt növő hazánkban nem gyakori faj.', 0, 0, 5, 11, 'Lomb és fenyőerdőkben, különösen tölgy', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Nincs', 'Nincs', 'Hering', 0, 'Molnár Rudolf', 'Galambgomba_Ibolyastunku'),
(20, 'Russula virescens', 'Varashátú galambgomba', 'Galambgomba', 0, NULL, 'Lomberdőkben terem júniustól szeptemberig, elterjedt, helyenként gyakori.', 0, 0, 6, 9, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Gömbölyű', 'Varrás', 'Bordázót', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Foltos', 'Pattanva törik', 'Okkeresen ', 'Dió', 'Nincs', 0, 'Varju Sándor', 'Galambgomba_varashatu'),
(21, 'Amanita excelsa ', 'Szürke galóca', 'Galóca', 0, NULL, 'Augusztustól októberig meszes talajú lomberdőben, gyakran száraz időben is előforduló, nem gyakori gomba.', 0, 1, 8, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', 'Galoca_szurke'),
(22, 'Amanita rubescens ', 'Piruló galóca', 'Galóca', 0, 'Feltételesen ehető', 'Nyáron ősszel lomb- és fenyőerdőben fordul elő. Nem gyakori faj', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Varras', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Rovarrágásnál Vörösödik', 'Nincs', 'Nincs', 0, 'Varju Sándor', 'Galoca_pirulo'),
(23, 'Amanita muscaria', 'Légyölő galóca', 'Galóca', 1, 'Mérgező', 'Augusztustól novemberig, erősen savanyú talajú lomb- és fenyőerdőben növő, helyenként gyakori faj.', 0, 1, 8, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Könnyen leváló, fehér pettyek', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Vastag, hengeres', 'Sima', 'Puha, vizenyős', 'Nincs', 'Nincs', 'Nincs', 0, 'Imre Gergely', 'Galoca_legyolo'),
(24, 'Amanita phalloides', 'Gyilkos galóca', 'Galóca', 1, 'Mérgező', 'Júniustól novemberig, lomberdőben, főleg tölgy alatt, ritkán fenyvesben növő, gyakori faj.', 1, 1, 6, 11, 'Lomberdőben tölgyes', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér vizenyős', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Renátó', 'Galoca_gyilkos'),
(25, 'Amanita caesarea', 'Császárgalóca', 'Galóca', 3, 'Védett', 'Teljesen narancs sárga gomba gyüjtését a törvény bünteti', 1, 1, 6, 10, 'Savanyú talajú lomberdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Fénylő', 'Bordázott', 'Sűrű', 'Finoman csipkézet', 'Gallér', 'Hengeres', 'Sima', 'Puha', 'Nincs', 'Nincs', 'Nincs', 5000, 'Boros Lajos', 'Galoca_csaszar'),
(26, 'Amanita franchetii', 'Érdes galóca', 'Galóca', 0, 'Feltételesen ehető', ' Lomb- és fenyőerdőben, melegkedvelő. Magyarországon ritka faj, a mediterrán térségben jóval gyakoribb.', 0, 1, 8, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Aláhajló', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Puha', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', 'Galoca_erdes'),
(27, 'Morchella deliciosa', 'Hegyes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ehető, jóízű, aromás gomba, de jól főzzük, süssük meg, mert nyersen fogyasztva egyeseknél allergiás tüneteket okozhat!', 0, 0, 3, 5, 'Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Bordás', 'Nincs', 'Ovális kerekded bordák', 'Nincs', 'Nincs', 'Üreges', 'Okkeres, szemcsés', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes,Spermatikus', 0, 'Albert László', 'Kucsmagomba_hegyes'),
(28, 'Morchella esculenta', 'Ízletes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Réteken, kertekben, bokros helyeken, liget erdőkben nagy mennyiségben terem, márciustól áprilisig.', 0, 0, 7, 10, 'Réteken, kertekben, bokros', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Viasszerű', 'Nincs', 'Rendezett bemélyedések ', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes,Spermatikus', 0, 'Kendelényi Ágnes', 'Kucsmagomba_izletes'),
(29, 'Morchella semilibera', 'Fattyú kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Ligeterdőkben, erdőszéleken, tópartokon áprilistól májusig terem, helyenként gyakori.', 0, 0, 5, 5, 'Ligeterdőkben, erdőszéleken', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Rendezett méhsejt', 'Nincs', 'Hosszanti sorok rendezett méhsejt', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes,Spermatikus', 0, 'Szegedi Zsolt', 'Kucsmagomba_fattyu'),
(30, 'Morchella steppicola', 'Pusztai kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Az Alföld cserjés vagy szinte fátlan pusztáin terem, de a dunántúli dombok alacsony gyepjében is előfordul löszös vagy agyagos talajon. Ritka faj.', 0, 0, 3, 4, 'Fátlan pusztáin', 'Kucsma alaku süveg', 'Méh sejt', 'Szabálytalan bordák', 'Sűrűborda', 'Nincs', 'Elválasztó bordák', 'Nincs', 'Nincs', 'Üreges', 'Ráncosodó', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes,Spermatikus', 0, 'Varju Sándor', 'Kucsmagomba_pusztai'),
(31, 'Verpa bohemica', 'Cseh kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól áprilisig lombos erdők talaján, bokros, nedves területen növő helyenként gyakori faj. A legkorábban megjelenő kucsmagombánk.', 0, 0, 3, 4, 'Lombos erdők talaján, bokros, nedves területen', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Erősen ráncolt', 'Nincs', 'Érinti a tönköt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vékony', 'Nincs', 'Nincs', 'Kellemes,Spermatikus', 0, 'Dr.Dima Bálint', 'Kucsmagomba_cseh'),
(32, 'Verpa conica', 'Simasüvegű kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Áprilistól májusig nedves lomb- és fenyőerdőben, ligeterdőben, folyópartokon nő. Hazánkban ritka faj.', 0, 0, 5, 5, 'Lomb- és fenyőerdőben', 'Kucsma alaku süveg', 'Méh sejt', 'Süveg', 'Gyűszű', 'Nincs', ' Finoman ráncolt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vattás', 'Nincs', 'Nincs', 'Nincs', 0, 'Frits Kata', 'Kucsmagomba_simasuvegu'),
(33, 'Morchella importuna', 'Fakéreg kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Lakott területeken, parkokban, kertekben faaprítékon, mulcson márciustól májusig nő', 0, 0, 3, 5, 'Parkokban, útszélen', 'Kucsma alaku süveg', 'Méh sejt', 'Szélesen kupos', 'Bordás', 'Nincs', 'Keresztirányu bordák', 'Nincs', 'Nincs', 'Üreges', 'Sima finom fehér szemcsés', 'Vékony', 'Nincs', 'Nincs', 'Idősen spermatikus', 0, 'Gánóczy Gábor', 'Kucsmagomba_fakereg'),
(34, 'Pleurotus cornucopiae', 'Erestönkű laskagomba', 'Laskagomba', 0, NULL, 'Áprilistól júliusig elsősorban elhalt lombos fa anyagán, csoportosan nő. Hazánkban nem gyakori.', 0, 0, 4, 7, 'Lombos fa', 'Tapló', 'Lemezes', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Kalapban puha', 'Nincs', 'Nincs', 'Ánizs', 0, 'Lukács Zoltán', 'Laskagomba_erestonku'),
(35, 'Pleurotus eryngii', 'Ördögszekér laskagomba', 'Laskagomba', 0, NULL, 'Késő nyártól a tartós fagyokig gyepekben egyesével vagy kisebb csoportokban nő. A mezei iringó kérgén él.', 0, 0, 9, 12, 'Mezei iringó kérgén', 'Tapló', 'Lemezes', 'Kör alakú', 'Finoman pikkelyes', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Nincs', 'Vastag,rostos', 'Nincs', 'Jó ízű', 'Fűszeres', 0, 'Varju Sándor', 'Laskagomba_ordogszeker'),
(36, 'Pleurotus ostreatus', 'Kései laskagomba', 'Laskagomba', 0, NULL, 'Októbertől decemberig lombos fákon vagy azok tuskóin, fahulladékon növő gyakori faj.', 0, 0, 10, 12, 'Lombos fákon vagy azok tuskóin', 'Tapló', 'Lemezes', 'Kagyló alaku', 'Sima', 'Aláhajló', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Oldalt álló', 'Nincs', 'Szivós', 'Nincs', 'Nincs', 'Nincs', 0, 'Szajkó Attila', 'Laskagomba_kesei'),
(37, 'Pleurotus pulmonarius', 'Nyári laskagomba', 'Laskagomba', 0, NULL, 'Májustól szeptemberig lomb- és fenyőerdőben, fatuskón, korhadó fán, fűrészporon növő gyakori faj.', 0, 0, 5, 9, ' Lomb- és fenyőerdőben, fatuskón', 'Tapló', 'Lemezes', 'Féloldalas', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Rugalmas', 'Nincs', 'Nincs', 'Nincs', 0, 'id. Kaposvári László', 'Laskagomba_nyari'),
(38, 'Hohenbuehelia petaloides', 'Földi állaskagomba', 'Laskagomba', 0, NULL, 'Talajon, erősen korhadó fán, fűrészporon, égett helyeken, főleg lomberdőben júniustól októberig.', 0, 0, 6, 10, 'Lomberdőkben korhado fa anyagon', 'Tapló', 'Lemezes', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Okkeres', 'Puha', 'Nincs', 'Liszt', 'Liszt', 0, 'Frits Kata', 'Allaskagomba_foldi'),
(39, 'Macrolepiota procera', 'Nagy őzlábgomba', 'Őzláb', 0, NULL, 'Halvány barnás alapon nagy, sötétebb barna színű, könnyen letörölhető, gyapjas pikkelyek.', 0, 1, 5, 11, 'Erdő szélen tisztásokon', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Peremig nem érő', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Kígyóbőr', 'Vattás', 'Nincs', 'Jó ízű', 'Mogyoró', 0, 'Abrudán Barbara', 'Ozlaggomba_nagy'),
(40, 'Macrolepiota mastoidea', 'Karcsú őzlábgomba', 'Őzláb', 0, NULL, 'Teljesen kifejlődve a közepén jellegzetesen púpos kalap világos alapon barnaság pikkelyezett.', 0, 1, 6, 11, 'Erdő szélen tisztásokon', 'Kalapos', 'Lemezes', 'Kúpos', 'Fakó', 'Peremig nem érő', 'Sűrű', 'Nem éri a tönköt', 'Gallér', 'Karcsú', 'Pikkelyes', 'Fehér', 'Nincs', 'Kellemes', 'Mogyoró', 0, 'Vidra Gyula', 'Ozlaggomba_karcsu'),
(41, 'Chlorophyllum rachodes', 'Piruló őzlánbomba', 'Őzláb', 0, NULL, 'Tulajdonságai meg egyeznek a nagy őzlábgombával, de termete kisebb.', 0, 1, 5, 11, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Lemezes', 'Félgömb', 'Gyapjas', 'Peremig nem érő', 'Sűrű', 'Sérülésre vörösödik', 'Gallér', 'Karcsú', 'Sima', 'Rostos', 'Naracsvörös', 'Nincs', 'Kellemes', 0, 'Dr.Dima Bálint', 'Ozlaggomba_pirulo'),
(42, 'Gyromitra esculenta', 'Redős papsapkagomba', 'Papsapkagomba', 1, 'Mérgező', 'Márciustól májusig, savanyú talajú kéttűs fenyőerdőben, talajon vagy korhadó faanyag közelében. Hazánkban ritka faj. ', 0, 0, 3, 5, ' Lomb- és fenyőerdőben, fatuskón', 'Kucsma alaku süveg', 'Redők', 'Szabálytalan bordák', 'Erősen ráncolt', 'Nincs', 'Tekervényes', 'Nincs', 'Gallér', 'Tömör, később szabálytalanul üreges', 'Barázdált', 'Vékony', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', 'Papsapkagomba_redos'),
(43, 'Lycoperdon perlatum', 'Bimbós pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'A termőrésze a termőtest felső harmadának belsejében található.', 0, 0, 6, 11, 'Lomb és fenyőerdőkben megtalálható', 'Pöfeteg', 'Zárt ternőtest', 'Körte forma', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Kiszélesedő', 'Tüskés', 'Rugalmas', 'Nincs', 'fűszeres', 'Nincs', 0, 'Kőszegi Balázs', 'Pofeteg_bimbos'),
(44, 'Lycoperdon excipuliforme', 'Változékony pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Egészen nyúlánk pöffetegfaj,fehér,majd krémszínű, barnuló termoteszte hosszúkás.', 0, 0, 7, 10, 'Erdő,rétek,legelők', 'Pöfeteg', 'Zárt ternőtest', 'Körte forma', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Pikkelyes', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Szűcs Béla', 'Pofeteg_valtozekony'),
(45, 'Lycoperdon utriforme', 'Pikkelyes pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'A fiatal termőtest felszíne nemezes,szemcsés, majd fokozatosantáblásan felrepedezik és pikkelyes lesz.', 0, 0, 6, 10, 'Rétek,legelők,tisztások', 'Pöfeteg', 'Zárt ternőtest', 'Zsák alaku', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Rövid egybenött', 'Pikkelyes', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Varju Sándor', 'Pofeteg_pikkelyes'),
(46, 'Lycoperdon rupicola', 'Sziklai pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Andezit, gránit és homokkövön tenyésző meganám fedezhetjük fel.', 0, 0, 9, 11, 'Fenyveserdőkben mindig moha között', 'Pöfeteg', 'Zárt ternőtest', 'Kicsi körte', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Tüskés', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Boros Lajos', 'Pofeteg_sziklai'),
(47, 'Langermannia gigantea', 'Óriás pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Többé kevésbé gömbölyü, nagytermetű talajlakó gombafaj, fél méteres étmérőjűre és 10 kg-osra is megnőhet', 0, 0, 6, 10, 'Erdő,mező', 'Pöfeteg', 'Zárt ternőtest', 'Gömbölyű', 'Ráncos', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Ráncosodó', 'Rugalmas', 'Nincs', 'Nincs', 'Nincs', 0, 'Szajkó Attila', 'Pofeteg_orias'),
(48, 'Bovista plumbea', 'Szürke pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Fehér felületesima kissé táblásan felrepedező,felső burok tojáshéjszerűen leválik.', 0, 0, 3, 8, 'Legelök', 'Pöfeteg', 'Zárt ternőtest', 'Golyó', 'Sima', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Sima', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Nagy Angéla', 'Pofeteg_szurke'),
(49, 'Melanogaster variegatus', 'Vörösbarna kocsonyáspöfeteg', 'Pöfeteg', 0, '                                            ', 'Májustól szeptemberig, lomb-, ritkábban fenyőerdőben, kertekben; hazánkban nem ritka, mikorrhizás.', 0, 0, 5, 9, 'Lomb és fenyőerdőkben megtalálható', 'Pöfeteg', 'Zárt ternőtest', 'Hosszukásan Gombolyded ', 'Sima vagy eres', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Sima vagy eres', 'Kocsonyas', 'Nincs', 'Alma vagy rum', 'Aromás', 0, 'Szajkó Attila', 'Konyonyaspofeteg_vorosbarna'),
(50, 'Cantharellus cibarius', 'Sárga rókagomba', 'Rókagomba', 0, NULL, 'Lombos és fenyőerdőben, savanyú preferenciával, júniustól októberig terem, ritka faj.', 0, 0, 6, 11, 'Lombos és fenyőerdőben, savanyú preferenciával', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', 'Vastag, tömör', 'Fehéres, a kalapbőr alatt világossárga,', 'Nincs', 'Csípős', 'Kajszibarack', 0, 'Molnár Renátó', 'Rokagomba_sarga'),
(51, 'Cantharellus ferruginascens', 'Rozsdásodó rókagomba', 'Rókagomba', 0, NULL, 'Júniustól novemberig főleg savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 11, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Selymesen sima', 'Hullámos', 'Sűrű', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Pikkelyes-bordás', 'Vékony', 'Nincs', 'Enyhe', 'Nincs', 0, 'Nagy Angéla', 'Rokagomba_rozsdasodo'),
(52, 'Cantharellus friesii', 'Narancsvörös rókagomba', 'Rókagomba', 0, NULL, 'Nyártól őszig lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban. Magyarországon nem ritka.', 0, 0, 6, 11, 'Lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban', 'Kalapos', 'Lemezes', 'Tölcséres', 'Szélén hullámos', 'Hullámos', 'Tompa élűek és villásan elágazók', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Vékony', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', 'Rokagomba_narancsvoros'),
(53, 'Cantharellus pallens', 'Halvány rókagomba', 'Rókagomba', 0, NULL, 'Júniustól októberig bükk- és tölgyfák alatt, savanyú talajon terem. A domb- és hegyvidékeken fordul elő. Hazánkban nagyon ritka faj.', 0, 0, 6, 11, 'Bükk- és tölgyfák alatt, savanyú talajon terem domb- és hegyvidékeken fordu', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', 'Vastag, tömör', 'Halvény világossárga', 'Nincs', 'Nincs', 'Kajszibarack', 0, 'Molnár Edit', 'Rokagomba_halvany'),
(54, 'Craterellus cinereus', 'Szürke rókagomba', 'Rókagomba', 0, NULL, 'Szeptembertől októberig savanyú talajú lomb- és fenyőerdőben fordul elő. Hazánkban ritka gombafaj.', 0, 0, 7, 10, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Száraz', 'Mélyen lefutó', 'Ráncos eres', 'Sima', 'Nincs', 'Üreges vékony', 'Vékony', 'Szívós vékony', 'Nincs', 'Nincs', 'Gyümölcsös', 0, 'Molnár Rudolf', 'Rokagomba_szurke'),
(55, 'Craterellus lutescens', 'Szagos rókagomba', 'Rókagomba', 0, NULL, 'Augusztustól november elejéig fenyőerdőkben, főként lucosokban', 0, 0, 8, 11, 'Savanyú talajú Bükk- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Bemélyedt', 'Hullámos', 'Sűrű', 'Tönkig lefuto', 'Nincs', 'Lefelé vékonyodó', 'Üreges', 'Vékony szálasz', 'Nincs', 'Aromás', 'Aromás', 0, 'Dr.Dima Bálint', 'Rokagomba_szagos'),
(56, 'Craterellus tubaeformis', 'Tölcséres rókagomba', 'Rókagomba', 0, NULL, 'Lombos és fenyőerdőben, savanyú és nedves preferenciával, júniustól októberig.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Rancos', 'Hullámos', 'Ráncos ', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Ráncosodó', 'Vékony', 'Nincs', 'Jó ízű', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', 'Rokagomba_tolcseres'),
(57, 'Erdei szömörcsög', 'Erdei szömörcsög', 'Szömörcsög', 0, 'Boszorkánytojás ehető', 'A spóratermő része a süveg felületét boritja. A nyálkás rétegben ágyazódott spórákat rovarok terjesztik .Összetéveszthetetlenül bödüs szaga van.', 1, 0, 6, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kupos', 'Méh sejt', 'Süveg', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Szivacsos', 'Kifejlődve szívacsos', 'Nincs', 'Nincs', 'Dögszag', 0, 'Vidra Gyula', 'Szormorcsog_erdei'),
(58, 'Clathrus archeri', 'Tintahalgomba', 'Szömörcsög', 2, 'Nem ehető', 'A termőtest 4-7 davab vörös színü szivacsos szerkezetü tintahalszerű kar .', 1, 0, 6, 10, 'Lomberdőben megtalálható', 'Csáp', 'Karok belsö oldala', 'Csápok', 'Nyálkás', 'Nyálkás', 'Nincs', 'Nincs', 'Nincs', 'Egybenött', 'Szivacsos', 'Szivacsos', 'Nincs', 'Nincs', 'Dögszag', 0, 'Kőszeginé Tóth Judit', 'Tintahalgomba'),
(59, 'Xerocomellus chrysenteron', 'Arany tinóru', 'Tinóru', 0, NULL, 'Májustól novemberig lomb- és fenyőerdőben, parkokban növő gyakori faj.', 0, 0, 5, 11, 'Lomb- és fenyőerdőben, parkokban', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Korpás', 'Puha', 'Tönkön vörösödik kalapnál enyhén kékül', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', 'Tinoru_arany'),
(60, 'Aureoboletus gentilis ', 'Aranybélésű tinóru', 'Tinóru', 0, NULL, 'Júliustól októberig füves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken; hazánkban nem gyakori.', 0, 0, 7, 12, 'Üves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken', 'Kalapos', 'Csöves', 'Félgömb', 'Ragadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Puha', 'Nincs', 'Nincs', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', 'Tinoru_aranbelesu'),
(61, 'Xerocomellus porosporus', 'Csapottspórás tinóru', 'Tinóru', 0, NULL, 'Júniustól szeptemberig lomb és fenyőerdőkben megtalálható gyakori faj. Húsa hamar megromlik, gyakran kukacos.', 0, 0, 7, 10, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Csöves', 'Domború', 'Felrepedezett', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Tönk felé vékonyodó', 'Sima', 'Puha', 'Lassan kékeszöld', 'Fanyar', 'Nincs', 0, 'Kőszeginé Tóth Judit', 'Tinoru_csapotsporas'),
(62, 'Xerocomus subtomentosus', 'Molyhos tinóru', 'Tinóru', 0, NULL, 'Nyáron lomb- és fenyőerdőkben található, fiatalon jóízű, idősen kesernyés gomba.', 0, 0, 5, 10, 'Lomb- és fenyőerdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Lefelé elvékonyodó', 'Puha', 'Enyhén kékül', 'Jó ízű', 'Kellemes', 0, 'Vidra Gyula', 'Tinoru_molyhos'),
(63, 'Hortiboletus rubellus ', 'Piros tinóru', 'Tinóru', 0, NULL, 'Melegebb erdőkben, többféle lombhullató fa alatt (hárs, nyír, tölgy).', 0, 0, 6, 10, 'Lombhullató fa alatt (hárs, nyír, tölgy).', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Puha', 'Kékül', 'Savanykás', 'Gyümölcsös', 0, 'Szabó Ernő', 'Tinoru_piros'),
(64, 'Suillus variegatus', 'Tarka tinóru', 'Tinóru', 0, NULL, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt, nyártól őszig terem.', 0, 0, 8, 11, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Zömök', 'Szemcsés', 'Sárga szín', 'Enyhén kékül', 'Nincs', 'Nincs', 0, 'Abrudán Barbara', 'Tinoru_tarka'),
(65, 'Suillus bovinus', 'Tehéntinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Augusztustól novemberig savanyú talajú erdei fenyvesekben, gyakran seregesen növő gombafaj.', 0, 0, 6, 8, 'Savanyú talajú erdei fenyvesekben', 'Kalapos', 'Csöves', 'Félgömb', 'Okkerbarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Csupasz', 'Gumiszerű', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Molnár Rudolf', 'Tinoru_tehen'),
(66, 'Caloboletus calopus', 'Farkastinóru', 'Tinóru', 1, 'Mérgező', 'Savanyú talajú lombos és fenyőerdőben, nyártól őszig terem, dombvidéktől a magas hegységekig.', 0, 0, 6, 11, 'Savanyú talajú lombos és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Erősen vörös, hálózatos tönk', 'Merev, sárga vagy fehéres', 'Enyhén kékül', 'Nincs', 'Nincs', 0, 'Molnár Storman Ákos', 'Tinoru_farkas'),
(67, 'Chalciporus piperatus', 'Borsos tinóru', 'Tinóru', 0, NULL, 'Savanyú talajú lombos és fenyőerdőben nyártól őszig.', 0, 0, 6, 11, 'Savanyú talajú lombos és fenyőerdőben', 'Kalapos', 'Csöves', 'Domború', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Vastag', 'Kékül', 'Savanykás', 'Mogyoró', 0, 'Molnár Rudolf', 'Tinoru_borsos'),
(68, 'Imleria badia', 'Barna tinóru', 'Tinóru', 0, NULL, 'Júniustól októberig, savanyú talajú lomb- és fenyőerdőben növő, helyenként gyakori faj.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Hanvas', 'Kemény', 'Kékül', 'Nincs', 'Gyümölcsös', 0, 'Szegedi Zsolt', 'Tinoru_barna'),
(69, 'Cyanoboletus pulverulentus', 'Ligeti tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Júniustól októberig, lomb- és vegyes erdőkben, többnyire tölgy, bükk és luc alatt. Hazánkban ritka gombafaj.', 0, 0, 6, 10, 'Lomb- és vegyeserdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Korpás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Karcsú', 'Korpás', 'Kemény', 'Sötétkék', 'Nincs', 'Gyümölcsös', 0, 'Nagy Angéla', 'Tinoru_ligeti'),
(70, 'Butyriboletus appendiculatus', 'Sárgahúsú tinóru', 'Tinóru', 0, NULL, 'Júniustól októberig, lomberdőben, főleg meleg tölgyesekben, még száraz időjáráskor is termő, ritka faj.', 0, 0, 6, 10, 'Lomberdőben főleg tölgyes', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Sima szárazon repedezett', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Finoman hálos', 'Kemény', 'Enyhén kékül', 'Kellemes', 'Kellemes', 0, 'Kőszeginé Tóth Judit', 'Tinoru_sargahusu'),
(71, 'Butyriboletus regius', 'Királytinóru', 'Tinóru', 0, NULL, 'Júniustól októberig, savanyú talajú lomberdőkben, nálunk elég ritka.', 0, 0, 6, 10, 'Savanyú talajú lombos erdő', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Finoman hálos', 'Kemény', 'Enyhén kékül', 'Kellemes', 'Kellemes', 0, 'Szajkó Attila', 'Tinoru_kiraly'),
(72, 'Hemileccinum impolitum', 'Okkerszínű tinóru', 'Tinóru', 0, NULL, 'Júniustól szeptemberig, lomberdőben, főleg tölgyesekben növő, elég gyakori faj.', 0, 0, 5, 10, 'Lomberdőben főleg tölgyes', 'Kalapos', 'Csöves', 'Félgömb', 'Hanvas deres', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Szemcsés', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', 'Tinoru_okkerszinu'),
(73, 'Suillellus mendax', 'Csalóka tinoru', 'Tinóru', 0, 'Feltételesen ehető', 'Csalóka a színe  Száraz időben barnássárga nedvesidoben bíbor', 0, 0, 6, 8, 'Savanyú talajú bükk,gesztenye.csertölgy', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Hálozatos', 'Kemény', 'Kékül', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', 'Tinoru_csaploka'),
(74, 'Suillellus queletii', 'Vörös tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Júniustól októberig, többnyire meszes talajú lomberdőben növő, egyes helyeken elég gyakori faj.', 0, 0, 6, 9, 'Meszes talajú lomberdok', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Enyhén kékül', 'Savanykás', 'Nincs', 0, 'Molnár Rudolf', 'Tinoru_voros'),
(75, 'Neoboletus xanthopus', 'Cékla Tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Meleg, száraz, nem túl savanyú talajú lomhullató erdőkben. Tölggyel alkot mikorrhizás kapcsolatot.', 0, 0, 5, 10, 'Lomberdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Szemcsés', 'Kemény', 'Kékül', 'Savanykás', 'Gyümölcsös', 0, 'Dr.Dima Bálint', 'Tinoru_cekla'),
(76, 'Imperator rhodopurpureus', 'Borvörös tinoru', 'Tinóru', 0, 'Feltételesen ehető', 'Júliustól szeptemberig, meleg, esős időben, lomberdőben főleg tölgyfák alatt termő, ritka faj, ezért kímélendő.', 0, 0, 7, 9, 'Tölgyek és bükk', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Finoman hálos', 'Kemény', 'Kékül', 'Nincs', 'Gyümölcsös', 0, 'Szajkó Attila', 'Tinoru_borvoros'),
(77, 'Leccinellum crocipodium', 'Sárga érdestinóru', 'Tinóru_Érdes', 0, 'Feltételesen ehető', 'Savanyú talajú lomberdőkben, főleg tölgyesekben , nyártól kora őszig. Ritkasága miatt kímélendő gomba.', 0, 0, 7, 10, 'Tölgyek', 'Kalapos', 'Csöves', 'Félgömb', 'Matt', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Korpás', 'Kemény', 'Vörös', 'Kellemes', 'Kellemes', 0, 'Molnár Rudolf', 'Erdestinoru_sarga'),
(78, 'Leccinum pseudoscabrum', 'Sötét érdestinóru', 'Tinóru_Érdes', 0, NULL, 'Üde gyertyánelegyes erdőkben, kora nyártól késő őszig, hegy és dombvidéken.', 0, 0, 6, 10, 'Gyertyánfák', 'Kalapos', 'Csöves', 'Félgömb', 'Ráncos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Nyúlánk', 'Pikkelyes', 'Puha', 'Feketedik', 'Nincs', 'Nincs', 0, 'Gánóczy Gábor', 'Erdestinoru_sotet'),
(79, 'Leccinum scabrum', 'Barna érdestinóru', 'Tinóru_Érdes', 0, NULL, 'Júniustól októberig, csak nyírfák alatt növő faj.', 0, 0, 6, 10, 'Nyírfa', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Kemény', 'Nincs', 'Kellemes', 'Kellemes', 0, 'Molnár Rudolf', 'Erdestinoru_barna'),
(80, 'Leccinum duriusculum', 'Nyárfa érdestinóru', 'Tinóru_Érdes', 0, NULL, 'Májustól októberig, kizárólag nyárfa alatt növő, egyes helyeken gyakori gombafaj.', 0, 0, 6, 10, 'Nyárfa', 'Kalapos', 'Csöves', 'Félgömb', 'Repedt', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Zömök', 'Pikkelyes', 'Kemény', 'Vörös', 'Nincs', 'Nincs', 0, 'Kaposvári László', 'Erdestinoru_nyarfa'),
(81, 'Leccinum albostipitatum', 'Vörös érdestinóru', 'Tinóru_Érdes', 0, NULL, 'Nyárfamikorrhizás, világos erdőkben, nyártól kora őszig.', 0, 0, 7, 11, 'Rezdő nyár', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefele vastagodik', 'Pikkelyes', 'Kemény', 'Feketedik', 'Nincs', 'Nincs', 0, 'Dankó Attila', 'Erdestinoru_voros'),
(82, 'Leccinum aurantiacum', 'Tölgyfa érdestinóru', 'Tinóru_Érdes', 0, NULL, 'Júniustól októberig, savanyú talajon, lomberdőben, főleg tölgyek alatt, elég gyakori.', 0, 0, 7, 10, 'Savanyú talajú tölgyekben', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Kemény', 'Szürke', 'Nincs', 'Nincs', 0, 'Nagy Angéla', 'Erdestinoru_tolgyfa'),
(83, 'Suillus cavipes', 'Csövestönkű fenyőtinóru', 'Tinóru_Fenyő', 0, NULL, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás, nyáron és ősszel.', 0, 0, 6, 11, 'Domb- és hegyvidéki faj, kizárólag vörösfenyővel mikorrhizás', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hárgya', 'Lefele vastagodik', 'Szálas', 'Puha', 'Nincs', 'Nincs', 'Nincs', 0, 'Szegedi Zsolt', 'Fenyőtinoru_csovestonku'),
(84, 'Suillus collinitus', 'Rózsástövű fenyőtinóru', 'Tinóru_Fenyő', 0, NULL, 'Augusztustól novemberig meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) alatt növő gyakori faj.', 0, 0, 8, 11, 'Meszes talajú telepített kéttűs fenyők (fekete-, erdei fenyő) ', 'Kalapos', 'Csöves', 'Kiterülő', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Tömör', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Vidra Gyula', 'Fenyőtinoru_rozsastovu'),
(85, 'Suillus granulatus', 'Szemcsésnyelű fenyőtinóru', 'Tinóru_Fenyő', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 0, 0, 8, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Sárga', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Pontozót nyálkás', 'Vastag', 'Nincs', 'Savanykás', 'Nincs', 0, 'Kőszeginé Tóth Judit', 'Fenyőtinoru_szemcsesnyelu'),
(86, 'Suillus luteus', 'Barna gyűrűstinóru', 'Tinóru_Gyűrűs', 0, NULL, 'Májustól novemberig kéttűs fenyő (erdei és feketefenyő) alatt növő gyakori faj.', 0, 1, 6, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Vattás', 'Hamar megpuhul', 'Nincs', 'Nincs', 'Nincs', 0, 'Szűcs Béla', 'Gyurustinoru_barna'),
(87, 'Suillus grevillei', 'Sárga gyűrűstinóru', 'Tinóru_Gyűrűs', 0, NULL, 'Júniustól októberig vörösfenyők alatt növő gombafaj.', 0, 1, 6, 11, 'Vörösfenyők', 'Kalapos', 'Csöves', 'Félgömb', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Szálas', 'Vastag', 'Nincs', 'Kellemes', 'Gyümölcsös', 0, 'Molnár Rudolf', 'Gyurustinoru_sarga'),
(88, 'Suillus viscidus', 'Szürke gyűrűstinóru', 'Tinóru_Gyűrűs', 0, NULL, 'Júniustól októberig vörösfenyő alatt termő, nálunk ritka, magashegységi gombafaj.', 0, 1, 6, 10, 'Vörösfenyő alatt termő, nálunk ritka, magashegységi', 'Kalapos', 'Csöves', 'Félgömb', 'Szálas', 'Peremig nem érő', 'Nincs', 'Nincs', 'Vélummaradvány', 'Hengeres', 'Szálas', 'Szálas', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', 'Gyurustinoru_szurke'),
(89, 'Coprinellus micaceus ', 'Kerti tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Júliustól novemberig lomb- és fenyőerdőben, ligetes, füves helyen növő helyenként nem ritka faj.', 0, 0, 7, 11, 'Lomb- és fenyőerdőben, ligetes, füves helyen', 'Kalapos', 'Lemezes', 'Kúpos', 'Szemcsés', 'Tönköt éri', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Csupasz', 'Fehér', 'Nincs', 'Nincs', 'Kellemes', 0, 'Dr.Csajbók József', 'Tintagomba_kerti'),
(90, 'Coprinopsis atramentaria ', 'Ráncos tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Nyáron, ősszel tápanyagban gazdag környezetben nő. Ritka.', 0, 0, 5, 11, 'Tápanyagban gazdag környezetben', 'Kalapos', 'Lemezes', 'Kúpos', 'Ráncos', 'Hasadt', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Nincs', 0, 'Kőszeginé Tóth Judit', 'Tintagomba_rancos'),
(91, 'Coprinus comatus ', 'Gyapjas tintagomba', 'Tintagomba', 0, NULL, 'Júniustól októberig elhalt faanyagon vagy élő lombos fák tövében, seregesen vagy csoportosan terem, nem gyakori gombafaj.', 0, 0, 5, 12, 'Elhalt faanyagon vagy élő lombos fák tövében', 'Kalapos', 'Lemezes', 'Kúpos', 'Gyapjas', 'Csepegnek', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Kellemes', 0, 'Molnár Rudolf', 'Tintagomba_gyapjas'),
(92, 'Gyroporus castaneus', 'Gesztenyebarna üregestinóru', 'Üregestinóru', 0, NULL, 'Melegkedvelő lombos és fenyőerdőben, savanyú preferenciával, az alföldtől az alacsonyabb hegyvidékig, nyártól koraőszig.', 0, 0, 6, 10, 'Lomberdoben tölgy, bükk,gyertyán ', 'Kalapos', 'Csöves', 'Ellaposodót', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Mogyoró', 0, 'Dr.Dima Bálint', 'Uregestinoru_gesztenyebarna'),
(93, 'Boletus aereus ', 'Bronzos vargánya', 'Vargánya', 0, NULL, 'Az őszi hónapokban hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő, mikorrhizaképző, ritka faj.', 0, 0, 5, 10, 'Hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő', 'Kalapos', 'Csöves', 'Félgömb', 'Molyhos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Sűrű hálózat', 'Kemény', 'Nincs', 'Nincs', 'Vargánya', 0, 'Vidra Gyula', 'Varganya_bronzos'),
(94, 'Boletus edulis', 'Ízletes vargánya', 'Vargánya', 0, NULL, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás. Melegkedvelő, dombvidéki faj.', 0, 0, 6, 10, 'Lomberdőkben, nyáron és ősszel tölgy és bükkmikorrhizás', 'Kalapos', 'Csöves', 'Félgömb', 'Foltos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Hálózatos', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Nagy Angéla', 'Varganya_izletes'),
(95, 'Boletus pinophilus ', 'Vörösbarna vargánya', 'Vargánya', 0, NULL, 'Júniustól októberig csak savanyú talajú lomb- és fenyőerdőben növő gyakori faj.', 0, 0, 6, 9, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Zsíros tapintású', 'Begöngyölt', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózatos barna', 'Kemény', 'Nincs', 'Nincs', 'Vargánya', 0, 'Szegedi Zsolt', 'Varganya_vorosbarna'),
(96, 'Boletus reticulatus ', 'Nyári vargánya', 'Vargánya', 0, NULL, 'Hegy- és dombvidéki fenyvesekben késő tavasztól őszig terem. Magyarországon ez a gomba elsősorban (hegyvidéki) bükkösökben terem.', 0, 0, 6, 9, 'Hegy- és dombvidéki bükkben', 'Kalapos', 'Csöves', 'Félgömb', 'Ráncolt', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózattal', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Storman Ákos', 'Varganya_nyari');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `belepes`
--
ALTER TABLE `belepes`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Felhasznalonev` (`Felhasznalonev`);

--
-- A tábla indexei `jelentkezok_turara`
--
ALTER TABLE `jelentkezok_turara`
  ADD UNIQUE KEY `User_id` (`User_id`,`Tura_id`),
  ADD KEY `Tura_id` (`Tura_id`);

--
-- A tábla indexei `post_databse`
--
ALTER TABLE `post_databse`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Postolo_neve` (`Postolo_neve`),
  ADD KEY `Id` (`Id`);

--
-- A tábla indexei `tervezet_turak`
--
ALTER TABLE `tervezet_turak`
  ADD PRIMARY KEY (`Tura_id`),
  ADD KEY `Tura_id` (`Tura_id`);

--
-- A tábla indexei `zemplen_eheto_gombai_gomba_adatbazis`
--
ALTER TABLE `zemplen_eheto_gombai_gomba_adatbazis`
  ADD PRIMARY KEY (`ID`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jelentkezok_turara`
--
ALTER TABLE `jelentkezok_turara`
  ADD CONSTRAINT `jelentkezok_turara_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `belepes` (`User_id`),
  ADD CONSTRAINT `jelentkezok_turara_ibfk_2` FOREIGN KEY (`Tura_id`) REFERENCES `tervezet_turak` (`Tura_id`);

--
-- Megkötések a táblához `post_databse`
--
ALTER TABLE `post_databse`
  ADD CONSTRAINT `post_databse_ibfk_1` FOREIGN KEY (`Postolo_neve`) REFERENCES `belepes` (`Felhasznalonev`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
