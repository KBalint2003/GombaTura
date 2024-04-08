-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 08. 23:40
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mushroomtour`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feketelista`
--

CREATE TABLE `feketelista` (
  `id` int(11) NOT NULL,
  `token` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `feketelista`
--

INSERT INTO `feketelista` (`id`, `token`) VALUES
(1, '5ac39ea8-9f63-4397-8329-9db009579ea4'),
(2, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(3, '48078cd3-4239-4fcb-b13e-3d851144627d'),
(4, '48078cd3-4239-4fcb-b13e-3d851144627d'),
(5, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(6, '48078cd3-4239-4fcb-b13e-3d851144627d'),
(7, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(8, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(9, 'b0eae816-1a11-4e57-8b03-96b79f7cb733'),
(10, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(11, '56e45c7c-81fd-4288-bf04-1aa0abcd244f'),
(12, 'b0eae816-1a11-4e57-8b03-96b79f7cb733'),
(13, 'b0eae816-1a11-4e57-8b03-96b79f7cb733'),
(14, 'b0eae816-1a11-4e57-8b03-96b79f7cb733');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `User_id` varchar(255) NOT NULL,
  `Felhasznalonev` varchar(255) NOT NULL,
  `Jelszo` varchar(60) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Szuletesi_ido` date DEFAULT NULL,
  `Telefon_szam` varchar(12) DEFAULT NULL,
  `FelhasznaloProfilKep` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gomba`
--

CREATE TABLE `gomba` (
  `Gomba_Id` int(11) NOT NULL COMMENT 'Gomba ID',
  `Latin_nev` varchar(255) NOT NULL COMMENT 'Gomba latin neve',
  `Magyar_nev` varchar(255) NOT NULL COMMENT 'Gomba magyar neve',
  `Nemzetseg` varchar(255) NOT NULL COMMENT 'Gomba nemzetsége',
  `Etkezes_ertek` tinyint(4) NOT NULL COMMENT 'Gomba étkezési értéke',
  `Feltetel` varchar(255) NOT NULL COMMENT 'Gomba étkezésének feltétele',
  `Leiras` varchar(255) NOT NULL COMMENT 'Gomba rövid leírása',
  `Bocskora` tinyint(4) NOT NULL COMMENT 'Gomba van e bocskora',
  `Galler` tinyint(4) NOT NULL COMMENT 'Gomba van e gallérja',
  `Szezon_eleje` tinyint(4) NOT NULL COMMENT 'Gomba hivatalos megtalálásának első honapja számként',
  `Szezon_vege` tinyint(4) NOT NULL COMMENT 'Gomba hivatalos megtalálásának utolso honapja számként',
  `Novenyzet` varchar(255) NOT NULL COMMENT 'Gomba körül megtalálhato növényzet',
  `Termotest_tipus` varchar(255) NOT NULL COMMENT 'Gomba termotestének típusa',
  `Termoretegtarto_tipusok` varchar(255) NOT NULL COMMENT 'Gomba termőrétegtartő típusa',
  `Kalap_forma` varchar(255) NOT NULL COMMENT 'Gomba kalapjának formája',
  `Kalap_felszin` varchar(255) NOT NULL COMMENT 'Gomba kalapjának felszíne',
  `Kalap_perem` varchar(255) NOT NULL COMMENT 'Gomba kalapjénak pereme',
  `Lemezallas` varchar(255) NOT NULL COMMENT 'Gomba lemez állása',
  `Lemez_el` varchar(255) NOT NULL COMMENT 'Gomba lemezéle',
  `Burok_maradvany` varchar(255) NOT NULL COMMENT 'Gomba gallérjának felépitése',
  `Tonk_alak` varchar(255) NOT NULL COMMENT 'Gomba tönkjének ',
  `Tonk_felulet` varchar(255) NOT NULL COMMENT 'Gomba tönkjének alakja',
  `Hus` varchar(255) NOT NULL COMMENT 'Gomba húsának állaga',
  `Hus_elszinezodes` varchar(255) NOT NULL COMMENT 'Gomba húsának elszineződése',
  `Ize` varchar(255) NOT NULL COMMENT 'Gomba ize',
  `Illata` varchar(255) NOT NULL COMMENT 'Gomba illata',
  `Ara_HUF` int(11) NOT NULL COMMENT 'Gomba ára csak védett gombánál',
  `Kep_keszito_neve` varchar(35) NOT NULL COMMENT 'Gomba kép készítöjének a neve',
  `Kep_neve` varchar(255) NOT NULL COMMENT 'Gomba kép neve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gomba`
--

INSERT INTO `gomba` (`Gomba_Id`, `Latin_nev`, `Magyar_nev`, `Nemzetseg`, `Etkezes_ertek`, `Feltetel`, `Leiras`, `Bocskora`, `Galler`, `Szezon_eleje`, `Szezon_vege`, `Novenyzet`, `Termotest_tipus`, `Termoretegtarto_tipusok`, `Kalap_forma`, `Kalap_felszin`, `Kalap_perem`, `Lemezallas`, `Lemez_el`, `Burok_maradvany`, `Tonk_alak`, `Tonk_felulet`, `Hus`, `Hus_elszinezodes`, `Ize`, `Illata`, `Ara_HUF`, `Kep_keszito_neve`, `Kep_neve`) VALUES
(1, 'Agaricus arvensis', 'Erdőszéli csiperke', 'Csiperke', 0, '', 'Késő tavasztól ősz végéig, erdőszéleken. Ízletes gomba faj.', 1, 1, 5, 11, 'Erdő szélén, füves helyen', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Fogaskerékszerű az alja', 'Bunkó', 'Sima', 'Vastag', 'Sárgul', 'Dió', 'Keserümandula', 0, 'Varju Sándor', '../../assets/img/gombak/Csiperke_erdoszeli.JPG'),
(2, 'Agaricus augustus', 'Óriás csiperke', 'Csiperke', 0, '', 'Nyár elejétől ősz derekáig, főleg gyertyánosokban. Egyesével nő, ritka, ezért kíméljük. ', 0, 1, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Pelyhes', 'Vékony', 'Nincs', 'Jó ízű', 'Keserűmandula', 0, 'Szűcs Béla', '../../assets/img/gombak/Csiperke_oriasi.JPG'),
(3, 'Agaricus benesii ', 'Ligeti csiperke', 'Csiperke', 0, '', 'Júniustól akár novemberig, füves területen. Jó ízű gomba faj.', 0, 1, 6, 11, 'Füves terület', 'Kalapos', 'Lemezes', 'Szögletes', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pikkelyes', 'Vastag', 'Vörös', 'Nincs', 'Csiperkeillat', 0, 'Borsi Valéria', '../../assets/img/gombak/Csiperke_ligeti.JPG'),
(4, 'Agaricus bernardii', 'Sziki csiperke', 'Csiperke', 0, '', 'Tavasz végétől ősz közepéig, legelőkön, boszorkány körben.', 0, 1, 5, 11, 'Szikes, alföldi tájakon', 'Kalapos', 'Lemezes', 'Domború', 'Fénytelen', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Foszladozik', 'Vastag', 'Nincs', 'Nincs', 'Nem kellemes', 0, 'Nagy Angéla', '../../assets/img/gombak/Csiperke_sziki.JPG'),
(5, 'Agaricus bisporus ', 'Kétspórás csiperke', 'Csiperke', 0, '', 'Márciustól egészen novemberig, kertekben, parkokban, komposzton.', 0, 1, 6, 10, 'Kertekben, parkokban, komposzton', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Kemény', 'Vörös', 'Kellemes', 'Kellemes', 0, 'Boros Lajos', '../../assets/img/gombak/Csiperke_ketsporas.JPG'),
(6, 'Agaricus bitorquis', 'Ízletes csiperke', 'Csiperke', 0, '', 'Tavasz közepétől egészen kellemes hőmérsékletű őszig.', 0, 1, 5, 11, 'Parkokban, útszélen', 'Kalapos', 'Lemezes', 'Ellaposodott', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vastag', 'Nincs', 'Kellemes', 'Csiperkeillat', 0, 'Szűcs Béla', '../../assets/img/gombak/Csiperke_izletes.JPG'),
(7, 'Agaricus campestris', 'Mezei csiperke', 'Csiperke', 0, '', 'Nyár elejétől ősz végéig. Más gombász könyvek Kerti csiperkének nevezik.', 0, 1, 5, 11, 'Legelőkön, füves ', 'Kalapos', 'Lemezes', 'Félgömb', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Vörös', 'Jó ízű', 'Kellemes', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Csiperke_mezei.JPG'),
(8, 'Agaricus crocodilinus', 'Nagyspórás csiperke', 'Csiperke', 0, '', 'Májustól novemberig nő legelőkön. Az állattartás csökkenésével egyre ritkább.', 0, 1, 7, 10, 'Réten, erdőszélen, esetleg parkban', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vastag', 'Nincs', 'Nincs', 'Keserűmandula', 0, 'Kőszegi Balázs', '../../assets/img/gombak/Csiperke_nagysporas.JPG'),
(9, 'Agaricus essettei', 'Gumós csiperke', 'Csiperke', 0, '', 'Tavasz végétől az ősz végi fagyokig. A gumós tönkvég és a sárguló árnyalata miatt nem jellemző a gyűjtése.', 0, 1, 5, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Szögletes', 'Selymes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Sima', 'Vékony', 'Sárgul', 'Nincs', 'Keserűmandula', 0, 'Nagy Angéla', '../../assets/img/gombak/Csiperke_gumos.JPG'),
(10, 'Agaricus sylvaticus', 'Erdei csiperke', 'Csiperke', 0, '', 'Nyár elejétől a késő őszi fagyokig. Hegységekben nem ritka faj, de a helyiek mégsem gyűjtik.', 0, 1, 6, 11, 'Lomb- és fenyőerdőben, luc és bükk alatt', 'Kalapos', 'Lemezes', 'Széles', 'Pikkelyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Pelyhes', 'Vékony', 'Vörös', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Csiperke_erdei.JPG'),
(11, 'Russula aurea', 'Aranyos galambgomba', 'Galambgomba', 0, '', 'Júniustól októberig, tölgyes, de lucosok alatt is terem. ', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Tapadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Enyhe', 'Nincs', 0, 'Szajkó Attila', '../../assets/img/gombak/Galambgomba_aranyos.JPG'),
(12, 'Russula chloroides', 'Kékeslemezű galambgomba', 'Galambgomba', 0, '', 'Júliustól októberig, savanyú talajú erdőkben, a síkvidéktől a hegységekig megtalálható. Hazánkban helyenként nem ritka.', 0, 0, 7, 10, 'Savanyú talajú erdőkben', 'Kalapos', 'Lemezes', 'Domború', 'Ráncos', 'Begöngyölt', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Kemény', 'Nincs', 'Hal', 'Nincs', 0, 'Molnár Rudolf', '../../assets/img/gombak/Galambgomba_keklemezu.jpg'),
(13, 'Russula cyanoxantha', 'Kékhátú galambgomba', 'Galambgomba', 0, '', 'Nyár elejétől ősz közepéig lomb és fenyőerdőben termő, együtt élő faj. Nevével ellentétben kalapja sohasem kék, húsa pattanva törik.  ', 0, 0, 7, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Nedves', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Mogyoró', 'Nincs', 0, 'Hajda Piroska', '../../assets/img/gombak/Galambgomba_kekhatu.JPG'),
(14, 'Russula delica', 'Földtoló galambgomba', 'Galambgomba', 0, '', 'Nyár elejétől ősz közepéig, főleg meszes talajú lomb- és fenyőerdőben növő gyakori faj. Hasonlít a Fehértejű keserűgombához.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Földes', 'Begöngyölt', 'Ritkán', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 'Nem csípős', 'Gyümölcsös', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Galambgomba_foldtolo.JPG'),
(15, 'Russula graveolens', 'Halszagú galambgomba', 'Galambgomba', 0, '', 'Júliustól októberig, lomberdőben, elsősorban savanyú talajon, tölgy alatt nő. Hazánkban nem ritka.', 0, 0, 7, 10, 'Lomberdőben, elsősorban savanyú talajon, tölgy alatt nő', 'Kalapos', 'Lemezes', 'Ellaposodott', 'Ragadós', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Barnán', 'Nem csípős', 'Hal szagú', 0, 'Albert László', '../../assets/img/gombak/Galambgomba_halszagu.JPG'),
(16, 'Russula heterophylla', 'Dióízű galambgomba', 'Galambgomba', 0, '', 'Májustól novemberig nő, bőre nem mindig éri el a kalap szélet. Nevét az ízéről kapta.', 0, 0, 7, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Kissé ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Pattanva törik', 'Nincs', 'Dió', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Galambgomba_dioizu.JPG'),
(17, 'Russula risigallina', 'Cifra galambgomba', 'Galambgomba', 0, '', 'Nyár elejétől ősz közepéig, lomb- és fenyőerdőben, leginkább tölgy, gyertyános és bükk alatt találhatjuk, gyakori faj.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Pattanva törik', 'Nincs', 'Enyhe', 'Gyümölcsös', 0, 'Nagy Angéla', '../../assets/img/gombak/Galambgomba_cifra.JPG'),
(18, 'Russula vesca', 'Ráncos galambgomba', 'Galambgomba', 0, '', 'Májustól novemberig, főleg lomberdőkben nő. Elterjedt, nagyon gyakori.', 0, 0, 5, 11, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Ragadós', 'A bőre nem éri el', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Ráncosodó', 'Szivacsos', 'Nincs', 'Dió', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Galambgomba_rancos.JPG'),
(19, 'Russula violeipes', 'Ibolyástönkű galambgomba', 'Galambgomba', 0, '', 'Júliustól szeptemberig, lomb- és fenyőerdőkben, különösen tölgy alatt növő. Hazánkban nem gyakori faj.', 0, 0, 5, 9, 'Lomb- és fenyőerdőkben, különösen tölgyerdőkben', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Nincs', 'Nincs', 'Hering', 0, 'Molnár Rudolf', '../../assets/img/gombak/Galambgomba_Ibolyastunku.jpg'),
(20, 'Russula virescens', 'Varashátú galambgomba', 'Galambgomba', 0, '', 'Nyár elejétől kezdve melegebb őszi napokig, kitűnő ízű gomba.', 0, 0, 6, 9, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Gömbölyű', 'Varras', 'Bordázott', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Foltos', 'Pattanva törik', 'Okkeresen ', 'Dió', 'Nincs', 0, 'Varju Sándor', '../../assets/img/gombak/Galambgomba_varashatu.JPG'),
(21, 'Amanita excelsa ', 'Szürke galóca', 'Galóca', 0, 'Feltételesen ehető', 'Nyár elejétől ősz végéig, savanyú talajú lomberdőben, nem gyakori gomba. Pettyek könnyen leválhatnak, 20 perc főzési időt igényel.', 0, 1, 8, 10, 'Lomberdőkben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', '../../assets/img/gombak/Galoca_szurke.JPG'),
(22, 'Amanita rubescens ', 'Piruló galóca', 'Galóca', 0, 'Feltételesen ehető', 'Nyár elejétől ősz közepéig, lomb- és fenyőerdőben fordul elő. Pettyek könnyen leválhatnak. Hazánkban gyakori faj. 20 perc főzési időt igényel.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Varras', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér', 'Rovarrágásnál vörösödik', 'Nincs', 'Nincs', 0, 'Varju Sándor', '../../assets/img/gombak/Galoca_pirulo.JPG'),
(23, 'Amanita muscaria', 'Légyölő galóca', 'Galóca', 1, '', 'Késő nyártól ősz végéig, erősen savanyú talajú lomb- és fenyőerdőben termő, helyenként gyakori faj. Mérgező. A pettyek könnyen leválhatnak.', 0, 1, 8, 11, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Könnyen leváló, fehér pettyek', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Vastag, hengeres', 'Sima', 'Puha, vizenyős', 'Nincs', 'Nincs', 'Nincs', 0, 'Imre Gergely', '../../assets/img/gombak/Galoca_legyolo.JPG'),
(24, 'Amanita phalloides', 'Gyilkos galóca', 'Galóca', 1, '', 'Nyáron és ősszel, lomberdőben, főleg tölgy alatt termő, gyakori faj. Halálosan mérgező.', 1, 1, 6, 11, 'Lomberdőben tölgyes', 'Kalapos', 'Lemezes', 'Félgömb', 'Sima', 'Sima', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Fehér, vizenyős', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Renátó', '../../assets/img/gombak/Galoca_gyilkos.JPG'),
(25, 'Amanita caesarea', 'Császárgalóca', 'Galóca', 3, '', 'Teljesen narancssárga gomba, gyűjtését a törvény bünteti. Sok étkezési gombász Úrigombára kapja fel a fejét.', 1, 1, 6, 10, 'Savanyú talajú lomberdőben', 'Kalapos', 'Lemezes', 'Félgömb', 'Fénylő', 'Bordázott', 'Sűrű', 'Finoman csipkézett', 'Gallér', 'Hengeres', 'Sima', 'Puha', 'Nincs', 'Nincs', 'Nincs', 5000, 'Boros Lajos', '../../assets/img/gombak/Galoca_csaszar.JPG'),
(26, 'Amanita franchetii', 'Érdes galóca', 'Galóca', 0, 'Feltételesen ehető', 'Júniustól októberig terem, meszes talajon. Hőkezelést igényel, de ritkasága miatt ne gyűjtsük.', 0, 1, 8, 10, 'Lomb- és fenyőerdőkben megtalálható', 'Kalapos', 'Lemezes', 'Domború', 'Pettyes', 'Aláhajló', 'Sűrű', 'Sima', 'Gallér', 'Hengeres', 'Kígyóbőr', 'Puha', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Galoca_erdes.JPG'),
(27, 'Morchella deliciosa', 'Hegyes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Tavasz folyamán, de márciusban is találkozhatunk vele, ehető, jóízű, aromás gomba, de alapos sütést-főzést igényel. ', 0, 0, 3, 5, 'Lomb- és fenyőerdőben', 'Kucsma alakú süveg', 'Méhsejt', 'Süveg', 'Bordás', 'Nincs', 'Ovális, kerekded bordák', 'Nincs', 'Nincs', 'Üreges', 'Okkeres, szemcsés', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes, spermatikus', 0, 'Albert László', '../../assets/img/gombak/Kucsmagomba_hegyes.JPG'),
(28, 'Morchella esculenta', 'Ízletes kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól, de leginkább áprilisig terem, gyakran rejtőznek benne fullánkos hangyák, alapos sütést-főzést igényel. ', 0, 0, 7, 10, 'Réteken, kertekben, bokros', 'Kucsma alakú süveg', 'Méhsejt', 'Süveg', 'Viasszerű', 'Nincs', 'Rendezett bemélyedések ', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes, spermatikus', 0, 'Kendelényi Ágnes', '../../assets/img/gombak/Kucsmagomba_izletes.JPG'),
(29, 'Morchella semilibera', 'Fattyú kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Áprilistól májusig terem, de alapos sütést-főzést igényel.', 0, 0, 5, 5, 'Ligeterdőkben, erdőszéleken', 'Kucsma alakú süveg', 'Méhsejt', 'Süveg', 'Rendezett méhsejt', 'Nincs', 'Hosszanti sorok, rendezett méhsejt', 'Nincs', 'Nincs', 'Üreges', 'Egy üregű', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes, spermatikus', 0, 'Szegedi Zsolt', '../../assets/img/gombak/Kucsmagomba_fattyu.JPG'),
(30, 'Morchella steppicola', 'Pusztai kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól áprilisig terem, löszös vagy agyagos talajon, füves helyeken.', 0, 0, 3, 4, 'Fátlan pusztáin', 'Kucsma alakú süveg', 'Méhsejt', 'Szabálytalan bordák', 'Sűrűborda', 'Nincs', 'Elválasztó bordák', 'Nincs', 'Nincs', 'Üreges', 'Ráncosodó', 'Vékony', 'Nincs', 'Kellemes', 'Kellemes, spermatikus', 0, 'Varju Sándor', '../../assets/img/gombak/Kucsmagomba_pusztai.JPG'),
(31, 'Verpa bohemica', 'Cseh kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól áprilisig, lombos erdők talaján, bokros, nedves területen. A legkorábban megjelenő kucsmagombánk.', 0, 0, 3, 4, 'Lombos erdők talaján, bokros, nedves területen', 'Kucsma alakú süveg', 'Méhsejt', 'Süveg', 'Erősen ráncolt', 'Nincs', 'Érinti a tönköt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vékony', 'Nincs', 'Nincs', 'Kellemes, spermatikus', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Kucsmagomba_cseh.JPG'),
(32, 'Verpa conica', 'Simasüvegű kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Áprilistól májusig, ligeterdőben, folyópartokon gyűjthető faj.', 0, 0, 5, 5, 'Lomb- és fenyőerdőben', 'Kucsma alakú süveg', 'Méhsejt', 'Süveg', 'Gyűszű', 'Nincs', 'Finoman ráncolt', 'Nincs', 'Nincs', 'Üreges', 'Szemcsés', 'Vattás', 'Nincs', 'Nincs', 'Nincs', 0, 'Frits Kata', '../../assets/img/gombak/Kucsmagomba_simasuvegu.JPG'),
(33, 'Morchella importuna', 'Fakéreg kucsmagomba', 'Kucsmagomba', 0, 'Feltételesen ehető', 'Márciustól májusig nő. Lakott területeken, parkokban, kertekben faaprítékon, mulcson.', 0, 0, 3, 5, 'Parkokban, útszélen', 'Kucsma alakú süveg', 'Méhsejt', 'Szélesen kúpos', 'Bordás', 'Nincs', 'Keresztirányu bordák', 'Nincs', 'Nincs', 'Üreges', 'Sima, finom, fehér szemcsés', 'Vékony', 'Nincs', 'Nincs', 'Idősen spermatikus', 0, 'Gánóczy Gábor', '../../assets/img/gombak/Kucsmagomba_fakereg.JPG'),
(34, 'Pleurotus cornucopiae', 'Erestönkű laskagomba', 'Laskagomba', 0, '', 'Áprilistól júliusig, elsősorban elhalt lombos fa anyagon, csoportosan nő. Hazánkban nem gyakori.', 0, 0, 4, 7, 'Lombos fa', 'Tapló', 'Lemezes', 'Kagyló alakú', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Kalapban puha', 'Nincs', 'Nincs', 'Ánizs', 0, 'Lukács Zoltán', '../../assets/img/gombak/Laskagomba_erestonku.JPG'),
(35, 'Pleurotus eryngii', 'Ördögszekér laskagomba', 'Laskagomba', 0, '', 'Kimondottan őszi gomba, de a tartós fagyokig gyepekben egyesével vagy kisebb csoportokban nő. A mezei iringó, másnéven ördögszekér nevű növényen él.', 0, 0, 9, 12, 'Mezei iringó kérgén', 'Tapló', 'Lemezes', 'Kör alakú', 'Finoman pikkelyes', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Hengeres', 'Nincs', 'Vastag, rostos', 'Nincs', 'Jó ízű', 'Fűszeres', 0, 'Varju Sándor', '../../assets/img/gombak/Laskagomba_ordogszeker.JPG'),
(36, 'Pleurotus ostreatus', 'Kései laskagomba', 'Laskagomba', 0, '', 'Első hidegebb napok után kezd fejlődni, lombos fákon vagy azok tuskóin, fahulladékon termő, gyakori faj.', 0, 0, 10, 12, 'Lombos fákon vagy azok tuskóin', 'Tapló', 'Lemezes', 'Kagyló alakú', 'Sima', 'Aláhajló', 'Sűrű', 'Tönkig lefutó', 'Nincs', 'Oldalt álló', 'Nincs', 'Szivós', 'Nincs', 'Nincs', 'Nincs', 0, 'Szajkó Attila', '../../assets/img/gombak/Laskagomba_kesei.JPG'),
(37, 'Pleurotus pulmonarius', 'Nyári laskagomba', 'Laskagomba', 0, '', 'Nyáron termő, fatuskón, korhadó fán, fűrészporon termő faj.', 0, 0, 5, 9, 'Lomb- és fenyőerdőben, fatuskón', 'Tapló', 'Lemezes', 'Féloldalas', 'Sima', 'Aláhajló', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Nincs', 'Rugalmas', 'Nincs', 'Nincs', 'Nincs', 0, 'id. Kaposvári László', '../../assets/img/gombak/Laskagomba_nyari.JPG'),
(38, 'Hohenbuehelia petaloides', 'Földi állaskagomba', 'Laskagomba', 0, '', 'Nyár elejétől ősz végéig, lomberdőben, erősen korhadó fán, fűrészporon terem.', 0, 0, 6, 10, 'Lomberdőkben korhadó fa anyagon', 'Tapló', 'Lemezes', 'Félgömb', 'Sima', 'Begöngyölt', 'Sűrű', 'Sima', 'Nincs', 'Oldalt álló', 'Okkeres', 'Puha', 'Nincs', 'Liszt', 'Liszt', 0, 'Frits Kata', '../../assets/img/gombak/Allaskagomba_foldi.JPG'),
(39, 'Macrolepiota procera', 'Nagy őzlábgomba', 'Őzláb', 0, '', 'Tavasz végétől ősz végéig találkozunk az esernyőkkel, egy-két hetes időszakban találkozunk vele tömegesen.', 0, 1, 5, 11, 'Erdő szélen, tisztásokon', 'Kalapos', 'Lemezes', 'Félgömb', 'Pikkelyes', 'Peremig nem érő', 'Sűrű', 'Sima', 'Gallér', 'Karcsú', 'Kígyóbőr', 'Vattás', 'Nincs', 'Jó ízű', 'Mogyoró', 0, 'Abrudán Barbara', '../../assets/img/gombak/Ozlabgomba_nagy.JPG'),
(40, 'Macrolepiota mastoidea', 'Karcsú őzlábgomba', 'Őzláb', 0, '', 'Nyár elejétől kezdődően őszön át, kifejlődve a közepén jellegzetesen púpos a kalap. Egyes helyeken kis mérete miatt megkérdőjelezik a fogyaszthatoságát.', 0, 1, 6, 11, 'Erdő szélen, tisztásokon', 'Kalapos', 'Lemezes', 'Kúpos', 'Fakó', 'Peremig nem érő', 'Sűrű', 'Nem éri a tönköt', 'Gallér', 'Karcsú', 'Pikkelyes', 'Fehér', 'Nincs', 'Kellemes', 'Mogyoró', 0, 'Vidra Gyula', '../../assets/img/gombak/Ozlabgomba_karcsu.JPG'),
(41, 'Chlorophyllum rachodes', 'Piruló őzlábgomba', 'Őzláb', 0, '', 'Nyár elejétől ősz végéig, tulajdonságai meg egyeznek a Nagy Őzláb gombával, viszont valamivel kisebb.', 0, 1, 5, 11, 'Lomb és fenyőerdőkben megtalálható', 'Kalapos', 'Lemezes', 'Félgömb', 'Gyapjas', 'Peremig nem érő', 'Sűrű', 'Sérülésre vörösödik', 'Gallér', 'Karcsú', 'Sima', 'Rostos', 'Naracsvörös', 'Nincs', 'Kellemes', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Ozlabgomba_pirulo.JPG'),
(42, 'Gyromitra esculenta', 'Redős papsapkagomba', 'Papsapkagomba', 1, '', 'Tavasszal fejlődik, savanyú talajú fenyőerdőben, talajon vagy korhadó faanyag közelében. Mérgező gombafaj, összekeverhető a kucsmagombákkal.', 0, 0, 3, 5, 'Lomb- és fenyőerdőben, fatuskón', 'Kucsma alakú süveg', 'Redők', 'Szabálytalan bordák', 'Erősen ráncolt', 'Nincs', 'Tekervényes', 'Nincs', 'Gallér', 'Tömör, később szabálytalanul üreges', 'Barázdált', 'Vékony', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Papsapkagomba_redos.JPG'),
(43, 'Lycoperdon perlatum', 'Bimbós pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Nyár elejétől ősz közepéig, fordított körte formájú. Csak fiatalon fogyasztható.', 0, 0, 6, 11, 'Lomb és fenyőerdőkben megtalálható', 'Pöfeteg', 'Zárt termőtest', 'Körte forma', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Kiszélesedő', 'Tüskés', 'Rugalmas', 'Nincs', 'Fűszeres', 'Nincs', 0, 'Kőszegi Balázs', '../../assets/img/gombak/Pofeteg_bimbos.JPG'),
(44, 'Lycoperdon excipuliforme', 'Változékony pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Júniustól novemberig, fehér, majd krémszínű, barnuló termőteste hosszúkás. Csak fiatalon fogyasztható.', 0, 0, 7, 10, 'Erdők, rétek, legelők', 'Pöfeteg', 'Zárt termőtest', 'Körte forma', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Pikkelyes', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Szűcs Béla', '../../assets/img/gombak/Pofeteg_valtozekony.JPG'),
(45, 'Lycoperdon utriforme', 'Pikkelyes pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Júniustól az ősz végi fagyokig. Termőtest felszíne  pikkelyes. Addig ehető, míg fiatal és fehér a belseje. Íze markánsabb, mint más pöfetegé.', 0, 0, 6, 10, 'Rétek, legelők, tisztások', 'Pöfeteg', 'Zárt termőtest', 'Zsák alakú', 'Pikkelyes', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Rövid, egybenőtt', 'Pikkelyes', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Varju Sándor', '../../assets/img/gombak/Pofeteg_pikkelyes.JPG'),
(46, 'Lycoperdon rupicola', 'Sziklai pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Ősszel megjelenő. Andezit, gránit és homokkövön található. Amíg fiatal, fehér a belseje, addig elméletileg fogyasztható.', 0, 0, 9, 11, 'Fenyveserdőkben mindig moha között', 'Pöfeteg', 'Zárt termőtest', 'Kicsi körte', 'Tüskés', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Tüskés', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Boros Lajos', '../../assets/img/gombak/Pofeteg_sziklai.JPG'),
(47, 'Langermannia gigantea', 'Óriás pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Nyár közepétől ősz közepéig terem, képtelenség összekeverni, fél méteres átmérőjűre és 10 kg-osra is megnőhet.', 0, 0, 6, 10, 'Erdő, mező', 'Pöfeteg', 'Zárt termőtest', 'Gömbölyű', 'Ráncos', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Ráncosodó', 'Rugalmas', 'Nincs', 'Nincs', 'Nincs', 0, 'Szajkó Attila', '../../assets/img/gombak/Pofeteg_orias.JPG'),
(48, 'Bovista plumbea', 'Szürke pöfeteg', 'Pöfeteg', 0, 'Fiatalon ehető', 'Nyár folyamán növő, kissé táblásan felrepedező, a felső burok tojáshéj szerűen leválik. Amíg fehér a belső része, addig fogyasztható, bár nem jellemző a gyűjtése.', 0, 0, 3, 8, 'Legelők', 'Pöfeteg', 'Zárt termőtest', 'Golyó', 'Sima', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Sima', 'Szivacsos', 'Nincs', 'Nincs', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Pofeteg_szurke.JPG'),
(49, 'Melanogaster variegatus', 'Vörösbarna kocsonyáspöfeteg', 'Pöfeteg', 0, '', 'Májustól szeptemberig, lomb-, ritkábban fenyőerdőben, kertekben. Hazánkban nem ritka.', 0, 0, 5, 9, 'Lomb és fenyőerdőkben megtalálható', 'Pöfeteg', 'Zárt termőtest', 'Hosszúkásan gömbölyded ', 'Sima vagy eres', 'Nincs', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Sima vagy eres', 'Kocsonyás', 'Nincs', 'Alma vagy rum', 'Aromás', 0, 'Szajkó Attila', '../../assets/img/gombak/Kocsonyaspofeteg_vorosbarna.JPG'),
(50, 'Cantharellus cibarius', 'Sárga rókagomba', 'Rókagomba', 0, '', 'Nyár közepétől ősz végéig. Fenyőerdőben, savanyú talajon. Kevesen tudják, hogy gyógyhatású gomba, antioxidáns és baktériumellenes hatást mutattak ki.', 0, 0, 6, 11, 'Lombos és fenyőerdőben, savanyú preferenciával', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefutó', 'Nincs', 'Lefelé vékonyodó', 'Vastag, tömör', 'Fehéres, a kalapbőr alatt világossárga', 'Nincs', 'Csípős', 'Kajszibarack', 0, 'Molnár Renátó', '../../assets/img/gombak/Rokagomba_sarga.JPG'),
(51, 'Cantharellus ferruginascens', 'Rozsdásodó rókagomba', 'Rókagomba', 0, '', 'Nyári és őszi megjelenésű meszes talajú lomberdőkben seregesen növő faj.', 0, 0, 6, 11, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Selymesen sima', 'Hullámos', 'Sűrű', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Pikkelyes-bordás', 'Vékony', 'Nincs', 'Enyhe', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Rokagomba_rozsdasodo.JPG'),
(52, 'Cantharellus friesii', 'Narancsvörös rókagomba', 'Rókagomba', 0, '', 'Júniustól októberig, savanyú talajon, bükk és lucfenyő alatt. Együtt élő faj.', 0, 0, 6, 10, 'Lomb- és olykor tűlevelű erdők avarján, gyakran kis csoportokban, seregesen vagy csomókban', 'Kalapos', 'Lemezes', 'Tölcséres', 'Szélén hullámos', 'Hullámos', 'Tompa élűek és villásan elágazók', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Vékony', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Rokagomba_narancsvoros.JPG'),
(53, 'Cantharellus pallens', 'Halvány rókagomba', 'Rókagomba', 0, '', 'Májustól októberig, bükk- és tölgyfák alatt fordul elő. Finom étkezési gomba, gyűjtői nem tesznek különbséget a sárga és halvány rókagomba között.', 0, 0, 6, 11, 'Bükk- és tölgyfák alatt, savanyú talajon terem domb- és hegyvidékeken fordul elő', 'Kalapos', 'Lemezes', 'Tölcséres', 'Begöngyölt', 'Hullámos ', 'Sűrű', 'Tönkig lefutó', 'Nincs', 'Lefelé vékonyodó', 'Vastag, tömör', 'Halvány világossárga', 'Nincs', 'Nincs', 'Kajszibarack', 0, 'Molnár Edit', '../../assets/img/gombak/Rokagomba_halvany.JPG'),
(54, 'Craterellus cinereus', 'Szürke rókagomba', 'Rókagomba', 0, '', 'Júniustól novemberig, savanyú talajú lomberdőkben található. Szárítva fűszerként alkalmazzák.', 0, 0, 7, 10, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Száraz', 'Mélyen lefutó', 'Ráncos, eres', 'Sima', 'Nincs', 'Üreges, vékony', 'Vékony', 'Szívós vékony', 'Nincs', 'Nincs', 'Gyümölcsös', 0, 'Molnár Rudolf', '../../assets/img/gombak/Rokagomba_szurke.JPG'),
(55, 'Craterellus lutescens', 'Szagos rókagomba', 'Rókagomba', 0, '', 'Nyár derekától ősz végéig, főképpen erősen savanyú talajú, mohás aljzatú fenyveseket kedveli.', 0, 0, 8, 11, 'Savanyú talajú bükk- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Bemélyedt', 'Hullámos', 'Sűrű', 'Tönkig lefutó', 'Nincs', 'Lefelé vékonyodó', 'Üreges', 'Vékony szálas', 'Nincs', 'Aromás', 'Aromás', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Rokagomba_szagos.JPG'),
(56, 'Craterellus tubaeformis', 'Tölcséres rókagomba', 'Rókagomba', 0, '', 'Nyáron és ősszel növő, erősen savanyú talajú erdőkben. Környékünkön nem jellemző a fogyasztása.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Lemezes', 'Tölcséres', 'Ráncos', 'Hullámos', 'Ráncos ', 'Sima', 'Nincs', 'Lefelé vékonyodó', 'Ráncosodó', 'Vékony', 'Nincs', 'Jó ízű', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Rokagomba_tolcseres.JPG'),
(57, 'Erdei szömörcsög', 'Erdei szömörcsög', 'Szömörcsög', 0, 'Boszorkánytojás ehető', 'Nyár közepétől ősz közepéig. A nyálkás rétegben ágyazódott spórákat rovarok terjesztik. Összetéveszthetetlen szaga van. Boszorkánytojása ehető.', 1, 0, 6, 10, 'Lomb- és fenyőerdőkben megtalálható', 'Kupos', 'Méhsejt', 'Süveg', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Szivacsos', 'Kifejlődve szivacsos', 'Nincs', 'Nincs', 'Dögszag', 0, 'Vidra Gyula', '../../assets/img/gombak/Szomorcsog_erdei.JPG'),
(58, 'Clathrus archeri', 'Tintahalgomba', 'Szömörcsög', 2, '', 'Nyári, kora őszi időszakban. A termőtest 4-7 darab vörös színű, szivacsos szerkezetű, tintahalszerű kar, ami nem fogyasztható.', 1, 0, 6, 9, 'Lomberdőben megtalálható', 'Csáp', 'Karok belső oldala', 'Csápok', 'Nyálkás', 'Nyálkás', 'Nincs', 'Nincs', 'Nincs', 'Egybenőtt', 'Szivacsos', 'Szivacsos', 'Nincs', 'Nincs', 'Dögszag', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Tintahalgomba.JPG'),
(59, 'Xerocomellus chrysenteron', 'Arany tinóru', 'Tinóru', 0, '', 'Májustól novemberig, lomb- és fenyőerdőben, savanyú talajon található.', 0, 0, 5, 11, 'Lomb- és fenyőerdőben, parkokban', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Korpás', 'Puha', 'Tönkön vörösödik, kalapnál enyhén kékül', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Tinoru_arany.JPG'),
(60, 'Aureoboletus gentilis ', 'Aranybélésű tinóru', 'Tinóru', 0, '', 'Júliustól a téli fagyokig lomberdőkben, gyertyán, bükk és tölgy alatt. Ritkasága miatt kíméljük.', 0, 0, 7, 12, 'Füves helyeken, réteken, legelőkön, akár boszorkánykörökben is, többnyire hegyvidéken', 'Kalapos', 'Csöves', 'Félgömb', 'Ragadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Sima', 'Puha', 'Nincs', 'Nincs', 'Gyümölcsös', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Tinoru_aranybelesu.JPG'),
(61, 'Xerocomellus porosporus', 'Csapottspórás tinóru', 'Tinóru', 0, '', 'Júniustól októberig, lomberdőkben, jellemzően tölgyfa erdőkben együtt élő. Repedezett kalapbőr, hamar romlik és megtámadja az aranypenész.', 0, 0, 7, 10, 'Lomb- és fenyőerdőkben megtalálható', 'Kalapos', 'Csöves', 'Domború', 'Felrepedezett', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Tönk felé vékonyodó', 'Sima', 'Puha', 'Lassan kékeszöld', 'Fanyar', 'Nincs', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Tinoru_csapotsporas.JPG'),
(62, 'Xerocomus subtomentosus', 'Molyhos tinóru', 'Tinóru', 0, '', 'Főleg nyáron, lomb- és fenyőerdőkben található, együtt élő faj.', 0, 0, 5, 10, 'Lomb- és fenyőerdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vékonyodó', 'Lefelé elvékonyodó', 'Puha', 'Enyhén kékül', 'Jó ízű', 'Kellemes', 0, 'Vidra Gyula', '../../assets/img/gombak/Tinoru_molyhos.JPG'),
(63, 'Hortiboletus rubellus ', 'Piros tinóru', 'Tinóru', 0, '', 'Júniustól ősz közepéig, lomberdőben található, hamar kukacoskodik.', 0, 0, 6, 10, 'Lombhullató fa alatt (hárs, nyír, tölgy)', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szálas', 'Puha', 'Kékül', 'Savanykás', 'Gyümölcsös', 0, 'Szabó Ernő', '../../assets/img/gombak/Tinoru_piros.JPG'),
(64, 'Suillus variegatus', 'Tarka tinóru', 'Tinóru', 0, '', 'Augusztustól novemberig, savanyú talajú erdőkben található.', 0, 0, 8, 11, 'Domb és hegyvidéki fenyvesekben, talajminőségtől függetlenül, kéttűs fenyők alatt', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Zömök', 'Szemcsés', 'Sárga szín', 'Enyhén kékül', 'Nincs', 'Nincs', 0, 'Abrudán Barbara', '../../assets/img/gombak/Tinoru_tarka.JPG'),
(65, 'Suillus bovinus', 'Tehéntinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Nyár végi, őszi, savanyú talajú, kéttűs fenyvesekben nő, gyorsan kukacosodik. Étkezésben nem értékes gomba.', 0, 0, 6, 8, 'Savanyú talajú erdei fenyvesekben', 'Kalapos', 'Csöves', 'Félgömb', 'Okkerbarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Csupasz', 'Gumiszerű', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Molnár Rudolf', '../../assets/img/gombak/Tinoru_tehen.JPG'),
(66, 'Caloboletus calopus', 'Farkastinóru', 'Tinóru', 1, '', 'Nyár  közepétől ősz közepéig, savanyú talajú erdőben. Szakirodalom szerint ritka faj, de környékünkön megtalálható. Mérgező faj.\n', 0, 0, 6, 11, 'Savanyú talajú lombos- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Erősen vörös, hálózatos tönk', 'Merev, sárga vagy fehéres', 'Enyhén kékül', 'Nincs', 'Nincs', 0, 'Molnár Storman Ákos', '../../assets/img/gombak/Tinoru_farkas.JPG'),
(67, 'Chalciporus piperatus', 'Borsos tinóru', 'Tinóru', 0, '', 'Nyár közepétől ősz végéig, savanyú talajú lombos- és fenyőerdőben. Legújabb kutatások alapján galóca parazita.', 0, 0, 6, 11, 'Savanyú talajú lombos- és fenyőerdőben', 'Kalapos', 'Csöves', 'Domború', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Vastag', 'Kékül', 'Savanykás', 'Mogyoró', 0, 'Molnár Rudolf', '../../assets/img/gombak/Tinoru_borsos.JPG'),
(68, 'Imleria badia', 'Barna tinóru', 'Tinóru', 0, '', 'Nyár második felében, ősszel terem. Decemberben fagyott példányokkal is találkozhatunk, savanyú talajú, lomb- és fenyőerdőket kedveli.', 0, 0, 6, 10, 'Lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Hamvas', 'Kemény', 'Kékül', 'Nincs', 'Gyümölcsös', 0, 'Szegedi Zsolt', '../../assets/img/gombak/Tinoru_barna.JPG'),
(69, 'Cyanoboletus pulverulentus', 'Ligeti tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Júniustól októberig, többnyire tölgy, bükk és lucfenyő alatt. Feltételesen ehető, 20 perc hőkezelést igényel.', 0, 0, 6, 10, 'Lomb- és vegyeserdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Korpás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Karcsú', 'Korpás', 'Kemény', 'Sötétkék', 'Nincs', 'Gyümölcsös', 0, 'Nagy Angéla', '../../assets/img/gombak/Tinoru_ligeti.JPG'),
(70, 'Butyriboletus appendiculatus', 'Sárgahúsú tinóru', 'Tinóru', 0, '', 'Júniustól októberig, leginkább savanyú talajú tölgyeseket kedveli. Gyakran kukacos, Zemplénben Vajas tinóruként is emlegetik.', 0, 0, 6, 10, 'Lomberdőben főleg tölgyes', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Sima, szárazon repedezett', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Finoman hálós', 'Kemény', 'Enyhén kékül', 'Kellemes', 'Kellemes', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Tinoru_sargahusu.JPG'),
(71, 'Butyriboletus regius', 'Királytinóru', 'Tinóru', 0, '', 'Májustól októberig , savanyú talajú lomberdőkben, tölgyfával együtt élő. Kettévágva nem vagy csak enyhén kékül.', 0, 0, 5, 10, 'Savanyú talajú lombos erdő', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Finoman hálós', 'Kemény', 'Enyhén kékül', 'Kellemes', 'Kellemes', 0, 'Szajkó Attila', '../../assets/img/gombak/Tinoru_kiraly.JPG'),
(72, 'Hemileccinum impolitum', 'Okkerszínű tinóru', 'Tinóru', 0, '', 'Májustól októberig, csak tölgyfák mellett növekszik. Ehető faj, csak a tönk végét vágjuk le a szaga miatt.', 0, 0, 5, 10, 'Lomberdőben főleg tölgyes', 'Kalapos', 'Csöves', 'Félgömb', 'Hamvas, deres', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Szemcsés', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Tinoru_okkerszinu.JPG'),
(73, 'Suillellus mendax', 'Csalóka tinoru', 'Tinóru', 0, 'Feltételesen ehető', 'Nyáron, savanyú talajú lomberdőkben. Csalóka színe, száraz időben barnássárga, nedves időben bíbor. Feltételesen ehető, nyersen gyomorpanaszokat okozhat.', 0, 0, 6, 8, 'Savanyú talajú bükk, gesztenye, csertölgy', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Vastag', 'Hálózatos', 'Kemény', 'Kékül', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', '../../assets/img/gombak/Tinoru_csaloka.JPG'),
(74, 'Suillellus queletii', 'Vörös tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Nyáron és az ősz elején, lomberdőben tölgyfákkal terem együtt. Feltételesen ehető,  nyersen gyomorpanaszokat okozhat.', 0, 0, 6, 9, 'Savanyú talajú lomberdők', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Sima', 'Kemény', 'Enyhén kékül', 'Savanykás', 'Nincs', 0, 'Molnár Rudolf', '../../assets/img/gombak/Tinoru_voros.JPG'),
(75, 'Neoboletus xanthopus', 'Cékla Tinóru', 'Tinóru', 0, 'Feltételesen ehető', 'Májustól októberig, savanyú lomberdőkben található. Nyersen mérgező, alapos sütést vagy főzést igényel.', 0, 0, 5, 10, 'Savanyú talajú lomberdők', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Szemcsés', 'Kemény', 'Kékül', 'Savanykás', 'Gyümölcsös', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Tinoru_cekla.JPG'),
(76, 'Imperator rhodopurpureus', 'Borvörös tinoru', 'Tinóru', 0, 'Feltételesen ehető', 'Júliustól szeptemberig, meleg, esős időben, lomberdőben főleg tölgyfák alatt termő. Nyersen mérgező.', 0, 0, 7, 9, 'Tölgyek és bükk', 'Kalapos', 'Csöves', 'Félgömb', 'Sima', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Finoman hálós', 'Kemény', 'Kékül', 'Nincs', 'Gyümölcsös', 0, 'Szajkó Attila', '../../assets/img/gombak/Tinoru_borvoros.JPG'),
(77, 'Leccinellum crocipodium', 'Sárga érdestinóru', 'Tinóru_Érdes', 0, 'Feltételesen ehető', 'Nyár közepéből ősz közepéig, tölgyesekben találkozhatunk vele, 20 perc hőkezelést igényel.', 0, 0, 7, 10, 'Tölgyek', 'Kalapos', 'Csöves', 'Félgömb', 'Matt', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Korpás', 'Kemény', 'Vörös', 'Kellemes', 'Kellemes', 0, 'Molnár Rudolf', '../../assets/img/gombak/Erdestinoru_sarga.JPG'),
(78, 'Leccinum pseudoscabrum', 'Sötét érdestinóru', 'Tinóru_Érdes', 0, '', 'Nyár elejétől ősz közepéig terem, gyertyánhoz kötődő gomba faj. Ehető, de sokan nem gyűjtik, mert az ételt feketére színezi.', 0, 0, 6, 10, 'Gyertyánfák', 'Kalapos', 'Csöves', 'Félgömb', 'Ráncos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Nyúlánk', 'Pikkelyes', 'Puha', 'Feketedik', 'Nincs', 'Nincs', 0, 'Gánóczy Gábor', '../../assets/img/gombak/Erdestinoru_sotet.JPG'),
(79, 'Leccinum scabrum', 'Barna érdestinóru', 'Tinóru_Érdes', 0, '', 'Júniustól október végéig, kizárólag nyírfa mellett található.', 0, 0, 6, 10, 'Nyírfa', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Kemény', 'Nincs', 'Kellemes', 'Kellemes', 0, 'Molnár Rudolf', '../../assets/img/gombak/Erdestinoru_barna.JPG'),
(80, 'Leccinum duriusculum', 'Nyárfa érdestinóru', 'Tinóru_Érdes', 0, '', 'Tavasz végétől ősz közepéig, kizárólag alföldi jellegű nyárfa alatt terem. Egyes helyeken Nyirfaszépének is nevezik.', 0, 0, 5, 10, 'Nyárfa', 'Kalapos', 'Csöves', 'Félgömb', 'Repedt', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Zömök', 'Pikkelyes', 'Kemény', 'Vörös', 'Nincs', 'Nincs', 0, 'Kaposvári László', '../../assets/img/gombak/Erdestinoru_nyarfa.JPG'),
(81, 'Leccinum albostipitatum', 'Vörös érdestinóru', 'Tinóru_Érdes', 0, '', 'Nyár második felétől az őszön át, rezgő nyárfa alatt terem, világos erdőkben.', 0, 0, 7, 11, 'Rezdő nyár', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Lefelé vastagodik', 'Pikkelyes', 'Kemény', 'Feketedik', 'Nincs', 'Nincs', 0, 'Dankó Attila', '../../assets/img/gombak/Erdestinoru_voros.JPG'),
(82, 'Leccinum aurantiacum', 'Tölgyfa érdestinóru', 'Tinóru_Érdes', 0, '', 'Júniustól októberig, savanyú talajon, lomberdőben, főleg tölggyel él együtt. Más helyeken Piroshátú szepe és a kozákgombának is nevezik. ', 0, 0, 7, 10, 'Savanyú talajú tölgyekben', 'Kalapos', 'Csöves', 'Félgömb', 'Nemezes', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Kemény', 'Szürke', 'Nincs', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Erdestinoru_tolgyfa.JPG'),
(83, 'Suillus cavipes', 'Csövestönkű fenyőtinóru', 'Tinóru_Fenyő', 0, '', 'Nyár végétől ősz végéig, kizárólag vörösfenyővel él együtt.', 0, 0, 8, 11, 'Domb- és hegyvidéki faj, kizárólag vörösfenyőnél', 'Kalapos', 'Csöves', 'Félgömb', 'Tapadós', 'Peremig nem érő', 'Nincs', 'Nincs', 'Hárgya', 'Lefelé vastagodik', 'Szálas', 'Puha', 'Nincs', 'Nincs', 'Nincs', 0, 'Szegedi Zsolt', '../../assets/img/gombak/Fenyotinoru_csovestonku.JPG'),
(84, 'Suillus collinitus', 'Rózsástövű fenyőtinóru', 'Tinóru_Fenyő', 0, '', 'Nyár végén, ősszel, meszes talajú, kéttűs fenyők alatt termő faj. Ehető, de érdemes a kalapbőrt lehúzni elkészítés előtt.', 0, 0, 8, 11, 'Meszes talajú, telepített, kéttűs fenyők (fekete-, erdei fenyő) ', 'Kalapos', 'Csöves', 'Kiterülő', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Szemcsés', 'Tömör', 'Nincs', 'Savanykás', 'Gyümölcsös', 0, 'Vidra Gyula', '../../assets/img/gombak/Fenyotinoru_rozsastovu.JPG'),
(85, 'Suillus granulatus', 'Szemcsésnyelű fenyőtinóru', 'Tinóru_Fenyő', 0, '', 'Kora nyártól késő őszig, kéttűs fenyő alatt terem. Elkészítés előtt húzzuk le a kalap bőrt, de lehet, hogy barna lesz a kezünk, amit nehéz lesz lemosni.', 0, 0, 8, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Sárga', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Pontozott, nyálkás', 'Vastag', 'Nincs', 'Savanykás', 'Nincs', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Fenyotinoru_szemcsesnyelu.JPG'),
(86, 'Suillus luteus', 'Barna gyűrűstinóru', 'Tinóru_Gyűrűs', 0, '', 'Tavasz végétől ősz végéig, kéttűs fenyő alatt terem. Húzzuk le a kalapbőrt előkészítés előtt. Idősebb példányok allergiás reakciókat válthatnak ki.', 0, 1, 5, 11, 'Kéttűs fenyő (erdei és feketefenyő)', 'Kalapos', 'Csöves', 'Félgömb', 'Gesztenyebarna', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Vattás', 'Hamar megpuhul', 'Nincs', 'Nincs', 'Nincs', 0, 'Szűcs Béla', '../../assets/img/gombak/Gyurustinoru_barna.JPG'),
(87, 'Suillus grevillei', 'Sárga gyűrűstinóru', 'Tinóru_Gyűrűs', 0, '', 'Nyár elejétől ősz közepéig, vörösfenyők alatt terem. Hegyközben régen lekvárt készítettek belőtte.', 0, 1, 6, 11, 'Vörösfenyők', 'Kalapos', 'Csöves', 'Félgömb', 'Nyálkás', 'Peremig nem érő', 'Nincs', 'Nincs', 'Van', 'Hengeres', 'Szálas', 'Vastag', 'Nincs', 'Kellemes', 'Gyümölcsös', 0, 'Molnár Rudolf', '../../assets/img/gombak/Gyurustinoru_sarga.JPG'),
(88, 'Suillus viscidus', 'Szürke gyűrűstinóru', 'Tinóru_Gyűrűs', 0, '', 'Nyár elejétől ősz közepéig, vörösfenyő alatt termő, ehető gombafaj, viszont ritkasága miatt hagyjuk a termőhelyén. ', 0, 1, 6, 10, 'Vörösfenyő alatt termő, nálunk ritka, magashegységi', 'Kalapos', 'Csöves', 'Félgömb', 'Szálas', 'Peremig nem érő', 'Nincs', 'Nincs', 'Vélummaradvány', 'Hengeres', 'Szálas', 'Szálas', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Rudolf', '../../assets/img/gombak/Gyurustinoru_szurke.JPG'),
(89, 'Gyroporus castaneus', 'Gesztenyebarna üregestinóru', 'Tinóru_Üreges', 0, '', 'Nyáron át ősz közepéig, lomboserdőben, tölgy, bükk és gyertyánosatokat, humuszban gazdag területet kedveli.', 0, 0, 6, 10, 'Lomberdőben tölgy, bükk, gyertyán ', 'Kalapos', 'Csöves', 'Ellaposodott', 'Bársonyos', 'Peremig nem érő', 'Nincs', 'Nincs', 'Nincs', 'Hengeres', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Mogyoró', 0, 'Dr.Dima Bálint', '../../assets/img/gombak/Uregestinoru_gesztenyebarna.JPG'),
(90, 'Coprinellus micaceus ', 'Kerti tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Áprilistól egészen novemberig, elhalt fákon termő, alkohollal nem mérgező gomba. Gyűjtése nem gyakori.', 0, 0, 4, 11, 'Lomb- és fenyőerdőben, ligetes, füves helyen', 'Kalapos', 'Lemezes', 'Kúpos', 'Szemcsés', 'Tönköt éri', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Csupasz', 'Fehér', 'Nincs', 'Nincs', 'Kellemes', 0, 'Dr.Csajbók József', '../../assets/img/gombak/Tintagomba_kerti.JPG'),
(91, 'Coprinopsis atramentaria ', 'Ráncos tintagomba', 'Tintagomba', 0, 'Feltételesen ehető', 'Tavasz végétől egészen a fagyos őszi napokig bárhol találkozhatunk vele csoportosan. Alkohollal fogyasztva mérgező. Fiatalon fogyasztható.', 0, 0, 5, 11, 'Tápanyagban gazdag környezetben', 'Kalapos', 'Lemezes', 'Kúpos', 'Ráncos', 'Hasadt', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Nincs', 0, 'Kőszeginé Tóth Judit', '../../assets/img/gombak/Tintagomba_rancos.JPG'),
(92, 'Coprinus comatus ', 'Gyapjas tintagomba', 'Tintagomba', 0, '', 'Tavasz közepétől ősz végéig, füves helyeken találkozhatunk vele, csak fiatalon fogyasztható.', 0, 0, 4, 11, 'Elhalt faanyagon vagy élő lombos fák tövében', 'Kalapos', 'Lemezes', 'Kúpos', 'Gyapjas', 'Csepegnek', 'Sűrű', 'Sima', 'Nincs', 'Vékony', 'Üreges', 'Törékeny', 'Nincs', 'Nincs', 'Kellemes', 0, 'Molnár Rudolf', '../../assets/img/gombak/Tintagomba_gyapjas.JPG'),
(93, 'Boletus aereus ', 'Bronzos vargánya', 'Vargánya', 0, '', 'Nyári és kora őszi hónapok, tölgyesekben találkozhatunk vele. Egyes helyeken Feketehátú tinórunak is nevezik. Intenzív vargánya illat, jól szárítható.', 0, 0, 5, 9, 'Hegyvidéki lucosokban, néha savanyú talajú bükkösökben nő', 'Kalapos', 'Csöves', 'Félgömb', 'Molyhos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Sűrű hálózat', 'Kemény', 'Nincs', 'Nincs', 'Vargánya', 0, 'Vidra Gyula', '../../assets/img/gombak/Varganya_bronzos.JPG'),
(94, 'Boletus edulis', 'Ízletes vargánya', 'Vargánya', 0, '', 'Kora nyáron és ősszel két hullámban, főleg tölgy, bükk és lucfenyő alján terem. Gyulladáscsökkentő hatását kevesen ismerik. Keresett gomba tinóuként is gyűjtik.', 0, 0, 6, 10, 'Lomberdőkben, tölgy és bükk', 'Kalapos', 'Csöves', 'Félgömb', 'Foltos', 'Nem éri el', 'Nincs', 'Nincs', 'Nincs', 'Vastag hengeres', 'Hálózatos', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Nagy Angéla', '../../assets/img/gombak/Varganya_izletes.JPG'),
(95, 'Boletus pinophilus ', 'Vörösbarna vargánya', 'Vargánya', 0, '', 'Májustól novemberig, savanyú talajú erdőben, bükk, tölgy és erdeifenyő mellett található. Ehető, de nem árusítható, ritka faj.', 0, 0, 5, 11, 'Savanyú talajú lomb- és fenyőerdőben', 'Kalapos', 'Csöves', 'Félgömb', 'Zsíros tapintású', 'Begöngyölt', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózatos, barna', 'Kemény', 'Nincs', 'Nincs', 'Vargánya', 0, 'Szegedi Zsolt', '../../assets/img/gombak/Varganya_vorosbarna.JPG'),
(96, 'Boletus reticulatus ', 'Nyári vargánya', 'Vargánya', 0, '', 'Májustól októberig, savanyú talajú lomberdőkben gyűjthető, melegkedvelő. Sokan nem tesznek különbséget az ízletes és a nyári vargánya között.', 0, 0, 5, 10, 'Savanyú talajú lomberdőkben', 'Kalapos', 'Csöves', 'Félgömb', 'Ráncolt', 'Aláhajló', 'Nincs', 'Nincs', 'Nincs', 'Hasas', 'Hálózattal', 'Kemény', 'Nincs', 'Nincs', 'Nincs', 0, 'Molnár Storman Ákos', '../../assets/img/gombak/Varganya_nyari.JPG');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kommentek`
--

CREATE TABLE `kommentek` (
  `Komment_id` varchar(255) NOT NULL,
  `Kommentelo` varchar(255) NOT NULL,
  `Komment` text NOT NULL,
  `Poszt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posztok`
--

CREATE TABLE `posztok` (
  `Poszt_id` varchar(255) NOT NULL,
  `Posztolo` varchar(255) NOT NULL,
  `Cim` varchar(255) NOT NULL,
  `Szoveg` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turak`
--

CREATE TABLE `turak` (
  `Tura_id` varchar(255) NOT NULL,
  `Tura_neve` varchar(255) NOT NULL,
  `Letrehozo` varchar(255) DEFAULT NULL,
  `Indulas_ido` datetime NOT NULL,
  `Indulas_hely` varchar(255) NOT NULL,
  `Varhato_erkezesi_ido` datetime NOT NULL,
  `Erkezesi_hely` varchar(255) NOT NULL,
  `Utvonal_nehezsege` varchar(255) NOT NULL,
  `Szervezo_elerhetosege` varchar(255) DEFAULT NULL,
  `Tura_dija` int(11) DEFAULT 0,
  `Elmarad_a_tura` tinyint(1) DEFAULT 0,
  `Leiras` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `turarajelentkezestabla`
--

CREATE TABLE `turarajelentkezestabla` (
  `TurakTuraId` varchar(255) DEFAULT NULL,
  `FelhasznalokUserId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `feketelista`
--
ALTER TABLE `feketelista`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`User_id`);

--
-- A tábla indexei `gomba`
--
ALTER TABLE `gomba`
  ADD PRIMARY KEY (`Gomba_Id`);

--
-- A tábla indexei `kommentek`
--
ALTER TABLE `kommentek`
  ADD PRIMARY KEY (`Komment_id`),
  ADD KEY `Kommentelo` (`Kommentelo`),
  ADD KEY `Poszt` (`Poszt`);

--
-- A tábla indexei `posztok`
--
ALTER TABLE `posztok`
  ADD PRIMARY KEY (`Poszt_id`),
  ADD KEY `Posztolo` (`Posztolo`);

--
-- A tábla indexei `turak`
--
ALTER TABLE `turak`
  ADD PRIMARY KEY (`Tura_id`),
  ADD KEY `Letrehozo` (`Letrehozo`);

--
-- A tábla indexei `turarajelentkezestabla`
--
ALTER TABLE `turarajelentkezestabla`
  ADD UNIQUE KEY `TuraraJelentkezesTabla_FelhasznalokUserId_TurakTuraId_unique` (`TurakTuraId`,`FelhasznalokUserId`),
  ADD KEY `FelhasznalokUserId` (`FelhasznalokUserId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `feketelista`
--
ALTER TABLE `feketelista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kommentek`
--
ALTER TABLE `kommentek`
  ADD CONSTRAINT `kommentek_ibfk_1` FOREIGN KEY (`Kommentelo`) REFERENCES `felhasznalok` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kommentek_ibfk_2` FOREIGN KEY (`Poszt`) REFERENCES `posztok` (`Poszt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `posztok`
--
ALTER TABLE `posztok`
  ADD CONSTRAINT `posztok_ibfk_1` FOREIGN KEY (`Posztolo`) REFERENCES `felhasznalok` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `turak`
--
ALTER TABLE `turak`
  ADD CONSTRAINT `turak_ibfk_1` FOREIGN KEY (`Letrehozo`) REFERENCES `felhasznalok` (`User_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `turarajelentkezestabla`
--
ALTER TABLE `turarajelentkezestabla`
  ADD CONSTRAINT `turarajelentkezestabla_ibfk_1` FOREIGN KEY (`TurakTuraId`) REFERENCES `turak` (`Tura_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `turarajelentkezestabla_ibfk_2` FOREIGN KEY (`FelhasznalokUserId`) REFERENCES `felhasznalok` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
