-- ---------------------------------------- 
-- --        CLEAR DOWN THE TABLE        -- 
-- ---------------------------------------- 
TRUNCATE TABLE `areatrigger_teleport`; 
-- ---------------------------------------- 
-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos1
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `areatrigger_teleport`
--

LOCK TABLES `areatrigger_teleport` WRITE;
/*!40000 ALTER TABLE `areatrigger_teleport` DISABLE KEYS */;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `required_level`, `required_item`, `required_item2`, `heroic_key`, `heroic_key2`, `required_quest_done`, `required_quest_done_heroic`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(45,'Scarlet Monastery - Graveyard (Entrance)',20,0,0,0,0,0,0,189,1688.99,1053.48,18.6775,0.00117),
(78,'DeadMines Entrance',10,0,0,0,0,0,0,36,-16.4,-383.07,61.78,1.86),
(101,'Stormwind Stockades Entrance',15,0,0,0,0,0,0,34,54.23,0.28,-18.34,6.26),
(107,'Stormwind Vault Entrance',0,0,0,0,0,0,0,35,-0.91,40.57,-24.23,0),
(109,'Stormwind Vault Instance',0,0,0,0,0,0,0,0,-8653.45,606.19,91.16,0),
(119,'DeadMines Instance Start',0,0,0,0,0,0,0,0,-11208.3,1672.52,24.66,0),
(121,'Deadmines Instance End',0,0,0,0,0,0,0,0,-11339.4,1571.16,100.56,0),
(145,'Shadowfang Keep Entrance',10,0,0,0,0,0,0,33,-229.135,2109.18,76.8898,1.267),
(194,'Shadowfang keep - Entrance',0,0,0,0,0,0,0,0,-232.796,1568.28,76.8909,4.398),
(226,'The Barrens - Wailing Caverns',0,0,0,0,0,0,0,1,-740.059,-2214.23,16.1374,5.68),
(228,'The Barrens - Wailing Caverns',10,0,0,0,0,0,0,43,-163.49,132.9,-73.66,5.83),
(242,'Razorfen Kraul Instance Start',0,0,0,0,0,0,0,1,-4464.92,-1666.24,81.9,0),
(244,'Razorfen Kraul Entrance',17,0,0,0,0,0,0,47,1943,1544.63,82,1.38),
(257,'Blackphantom Deeps Entrance',19,0,0,0,0,0,0,48,-151.89,106.96,-39.87,4.53),
(259,'Blackfathom Deeps Instance Start',0,0,0,0,0,0,0,1,4247.74,745.879,-24.5299,0),
(286,'Uldaman Entrance',30,0,0,0,0,0,0,70,-226.8,49.09,-46.03,1.39),
(288,'Uldaman Instance Start',0,0,0,0,0,0,0,0,-6066.73,-2955.63,209.776,0),
(322,'Gnomeregan Instance Start',0,0,0,0,0,0,0,0,-5163.33,927.623,257.188,0),
(324,'Gnomeregan Entrance',20,0,0,0,0,0,0,90,-332.22,-2.28,-150.86,2.77),
(442,'Razorfen Downs Entrance',25,0,0,0,0,0,0,129,2592.55,1107.5,51.29,4.74),
(444,'Razorfen Downs Instance Start',0,0,0,0,0,0,0,1,-4658.12,-2526.35,82.9671,0),
(446,'Altar of Atal\'Hakkar Entrance',35,0,0,0,0,0,0,109,-319.24,99.9,-131.85,3.19),
(448,'Altar Of Atal\'Hakkar Instance Start',0,0,0,0,0,0,0,0,-10175.1,-3995.15,-112.9,0),
(503,'Stockades Instance',0,0,0,0,0,0,0,0,-8764.83,846.075,87.4842,0),
(523,'Gnomeregan Train Depot Entrance',20,0,0,0,0,0,0,90,-736.51,2.71,-249.99,3.14),
(525,'Gnomeregan Train Depot Instance',0,0,0,0,0,0,0,0,-4858.27,756.435,244.923,0),
(527,'Teddrassil - Ruth Theran',0,0,0,0,0,0,0,1,8786.36,967.445,30.197,3.39632),
(542,'Teddrassil - Darnassus',0,0,0,0,0,0,0,1,9945.13,2616.89,1316.46,4.61446),
(602,'Scarlet Monastery - Graveyard (Exit)',0,0,0,0,0,0,0,0,2913.92,-802.404,160.333,3.50405),
(604,'Scarlet Monastery - Cathedral (Exit)',0,0,0,0,0,0,0,0,2906.14,-813.772,160.333,1.95739),
(606,'Scarlet Monastery - Armory (Exit)',20,0,0,0,0,0,0,0,2884.45,-822.01,160.333,1.95268),
(608,'Scarlet Monastery - Library (Exit)',0,0,0,0,0,0,0,0,2870.9,-820.164,160.333,0.387856),
(610,'Scarlet Monastery - Cathedral (Entrance)',20,0,0,0,0,0,0,189,855.683,1321.5,18.6709,0.001747),
(612,'Scarlet Monastery - Armory (Entrance)',20,0,0,0,0,0,0,189,1610.83,-323.433,18.6738,6.28022),
(614,'Scarlet Monastery - Library (Entrance)',20,0,0,0,0,0,0,189,255.346,-209.09,18.6773,6.26656),
(702,'Stormwind - Wizard Sanctum Room',0,0,0,0,0,0,0,0,-9015.8,874.6,148.617,5.31),
(704,'Stormwind - Wizard Sanctum Tower Portal',0,0,0,0,0,0,0,0,-9017.4,886.3,29.6206,5.38),
(882,'Uldaman Instance End',0,0,0,0,0,0,0,0,-6620.48,-3765.19,266.91,0),
(902,'Uldaman Exit',30,0,0,0,0,0,0,70,-214.02,383.607,-38.7687,0.5),
(922,'Zul\'Farrak Instance Start',0,0,0,0,0,0,0,1,-6796.49,-2890.77,8.88063,0),
(924,'Zul\'Farrak Entrance',35,0,0,0,0,0,0,209,1213.52,841.59,8.93,6.09),
(943,'Leap of Faith - End of fall',0,0,0,0,0,0,0,1,-5187.47,-2804.32,-8.375,5.76),
(1064,'Onyxia\'s Lair - Dustwallow Instance',0,0,0,0,0,0,0,1,-4747.17,-3753.27,49.8122,0.713271),
(1466,'Blackrock Mountain - Searing Gorge Instance?',40,0,0,0,0,0,0,230,458.32,26.52,-70.67,4.95),
(1468,'Blackrock Spire - Searing Gorge Instance (Inside)',45,0,0,0,0,0,0,229,78.5083,-225.044,49.839,5.1),
(1470,'Blackrock Spire - Searing Gorge Instance',0,0,0,0,0,0,0,0,-7524.19,-1230.13,285.743,0),
(1472,'Blackrock Dephts - Searing Gorge Instance',0,0,0,0,0,0,0,0,-7179.63,-923.667,166.416,0),
(2166,'Deeprun Tram - Ironforge Instance (Inside)',0,0,0,0,0,0,0,0,-4838.95,-1318.46,501.868,1.42372),
(2171,'Deeprun Tram - Stormwind Instance (Inside)',0,0,0,0,0,0,0,0,-8364.57,535.981,91.7969,2.24619),
(2173,'Deeprun Tram - Stormwind Instance',0,0,0,0,0,0,0,369,68.3006,2490.91,-4.29647,3.12192),
(2175,'Deeprun Tram - Ironforge Instance',0,0,0,0,0,0,0,369,69.2542,10.257,-4.29664,3.09832),
(2214,'Stratholme - Eastern Plaguelands Instance',45,0,0,0,0,0,0,329,3593.15,-3646.56,138.5,5.33),
(2216,'Stratholme - Eastern Plaguelands Instance',45,0,0,0,0,0,0,329,3395.09,-3380.25,142.702,0.1),
(2217,'Stratholme - Eastern Plaguelands Instance',45,0,0,0,0,0,0,329,3395.09,-3380.25,142.702,0.1),
(2221,'Stratholme - Eastern Plaguelands Instance (Inside)',0,0,0,0,0,0,0,0,3235.46,-4050.6,110.01,0),
(2226,'Ragefire Chasm - Ogrimmar Instance (Inside)',0,0,0,0,0,0,0,1,1813.49,-4418.58,-18.57,1.78),
(2230,'Ragefire Chasm - Ogrimmar Instance',8,0,0,0,0,0,0,389,3.81,-14.82,-17.84,4.39),
(2527,'Hall of Legends - Ogrimmar',0,0,0,0,0,0,0,450,221.322,74.4933,25.7195,0.484836),
(2530,'Hall of Legends - Ogrimmar (Inside)',0,0,0,0,0,0,0,1,1637.32,-4242.7,56.1827,4.1927),
(2532,'Stormwind - Champions Hall',0,0,0,0,0,0,0,449,-0.299116,4.39156,-0.255884,1.54805),
(2534,'Stormwind (Inside) - Champions Hall',0,0,0,0,0,0,0,0,-8762.45,403.062,103.902,5.34463),
(2567,'Scholomance Entrance',45,0,0,0,0,0,0,289,196.37,127.05,134.91,6.09),
(2568,'Scholomance Instance',0,0,0,0,0,0,0,0,1275.05,-2552.03,90.3994,0),
(2606,'Alterac Valley - Horde Exit',0,0,0,0,0,0,0,0,534.868,-1087.68,106.119,3.35758),
(2608,'Alterac Valley - Alliance Exit',0,0,0,0,0,0,0,0,98.432,-182.274,127.52,5.02654),
(2848,'Onyxia\'s Lair Entrance',50,16309,0,0,0,0,0,249,29.1607,-71.3372,-8.18032,4.58),
(2886,'The Molten Bridge',50,0,0,0,0,0,0,409,1096,-467,-104.6,3.64),
(2890,'Molten Core Entrance, Inside',50,0,0,0,0,0,0,230,1115.35,-457.35,-102.7,0.5),
(3126,'Maraudon',0,0,0,0,0,0,0,1,-1186.98,2875.95,85.7258,0),
(3131,'Maraudon',0,0,0,0,0,0,0,1,-1471.07,2618.57,76.1944,0),
(3133,'Maraudon',30,0,0,0,0,0,0,349,1019.69,-458.31,-43.43,0.31),
(3134,'Maraudon',30,0,0,0,0,0,0,349,752.91,-616.53,-33.11,1.37),
(3183,'Dire Maul',45,0,0,0,0,0,0,429,44.4499,-154.822,-2.71201,0),
(3184,'Dire Maul',45,0,0,0,0,0,0,429,-201.11,-328.66,-2.72,5.22),
(3185,'Dire Maul',45,0,0,0,0,0,0,429,9.31119,-837.085,-32.5305,0),
(3186,'Dire Maul',45,0,0,0,0,0,0,429,-62.9658,159.867,-3.46206,0),
(3187,'Dire Maul',45,0,0,0,0,0,0,429,31.5609,159.45,-3.4777,0.01),
(3189,'Dire Maul',45,0,0,0,0,0,0,429,255.249,-16.0561,-2.58737,4.7),
(3190,'Dire Maul',0,0,0,0,0,0,0,1,-3831.79,1250.23,160.223,0),
(3191,'Dire Maul',0,0,0,0,0,0,0,1,-3747.96,1249.18,160.217,3.15827),
(3193,'Dire Maul',0,0,0,0,0,0,0,1,-3520.65,1077.72,161.138,1.5009),
(3194,'Dire Maul',0,0,0,0,0,0,0,1,-3737.48,934.975,160.973,3.13864),
(3195,'Dire Maul',0,0,0,0,0,0,0,1,-3980.58,776.193,161.006,0),
(3196,'Dire Maul',0,0,0,0,0,0,0,1,-4030.21,127.966,26.8109,0),
(3197,'Dire Maul',0,0,0,0,0,0,0,1,-3577.67,841.859,134.594,0),
(3528,'The Molten Core Window Entrance',50,0,0,0,0,7487,0,409,1096,-467,-104.6,3.64),
(3529,'The Molten Core Window(Lava) Entrance',50,0,0,0,0,7487,0,409,1096,-467,-104.6,3.64),
(3726,'Blackwing Lair - Blackrock Mountain - Eastern Kingdoms',60,0,0,0,0,7761,0,469,-7673.03,-1106.08,396.651,0.703353),
(3728,'Blackrock Spire, Unknown',45,0,0,0,0,0,0,229,174.74,-474.77,116.84,3.2),
(3928,'Zul\'Gurub Entrance ',50,0,0,0,0,0,0,309,-11916.1,-1230.53,92.5334,0),
(3930,'Zul\'Gurub Exit ',0,0,0,0,0,0,0,0,-11916.3,-1208.37,92.2868,0),
(3948,'Arathi Basin Alliance Out',0,0,0,0,0,0,0,0,-1198,-2533,22,0),
(3949,'Arathi Basin Horde Out',0,0,0,0,0,0,0,0,-817,-3509,73,0),
(4006,'Ruins Of Ahn\'Qiraj (Inside)',0,0,0,0,0,0,0,1,-8418.5,1505.94,31.8232,0),
(4008,'Ruins Of Ahn\'Qiraj (Outside)',50,0,0,0,0,0,0,509,-8429.74,1512.14,31.9074,0),
(4010,'Ahn\'Qiraj Temple (Outside)',50,0,0,0,0,0,0,531,-8231.33,2010.6,129.861,0),
(4012,'Ahn\'Qiraj Temple (Inside)',0,0,0,0,0,0,0,1,-8242.67,1992.06,129.072,0),
(4055,'Naxxramas (Exit)',51,0,0,0,0,0,0,533,3005.87,-3435.01,293.882,0),
(4131,'Karazhan, Main (Entrance)',68,0,0,0,0,0,0,532,-11100,-2003.98,49.8927,0.577268),
(4135,'Karazhan, Service (Entrance)',68,0,0,0,0,0,0,532,-11040.1,-1996.85,94.6837,2.20224),
(4145,'The Shattered Halls (Exit)',0,0,0,0,0,0,0,530,-311.16,3082.1,-3.71,4.92),
(4147,'The Blood Furnace (Exit)',0,0,0,0,0,0,0,530,-303.506,3164.82,31.7425,5.24025),
(4149,'Magtheridon\'s Lair (Exit)',0,0,0,0,0,0,0,530,-313.679,3088.35,-116.502,2.05307),
(4150,'Hellfire Ramparts (Entrance)',55,0,0,30637,30622,0,0,543,-1355.24,1641.12,68.2491,0.6687),
(4151,'The Shattered Halls (Entrance)',55,0,0,30637,30622,0,0,540,-40.8716,-19.7538,-13.8065,1.11133),
(4152,'The Blood Furnace (Entrance)',55,0,0,30637,30622,0,0,542,-3.9967,14.6363,-44.8009,4.88748),
(4153,'Magtheridon\'s Lair (Entrance)',65,0,0,0,0,0,0,544,187.843,35.9232,67.9252,4.79879),
(4156,'Naxxramas (Entrance)',51,0,0,0,0,0,0,533,3498.28,-5349.9,144.968,1.31324),
(4297,'Hellfire Ramparts (Exit)',0,0,0,0,0,0,0,530,-360.671,3071.9,-15.0977,5.14274),
(4311,'Battle Of Mount Hyjal, Alliance Base (Entrance)',70,0,0,0,0,0,0,534,4954,-1886.2,1326,0.13),
(4312,'Battle Of Mount Hyjal, Horde Base (Entrance)',70,0,0,0,0,0,0,534,5497.33,-2971.14,1537.63,2.832),
(4313,'Battle Of Mount Hyjal, Night Elf Base (Entrance)',70,0,0,0,0,0,0,534,5152.33,-3364.4,1644.74,6.2),
(4319,'Caverns Of Time, Battle Of Mount Hyjal (Entrance) ',70,0,0,0,0,0,0,534,4259.61,-4233.77,868.199,2.53),
(4320,'Caverns Of Time, Black Morass (Entrance)',66,0,0,30635,0,10285,0,269,-1496.24,7034.7,32.5619,1.75699),
(4321,'Caverns Of Time, Old Hillsbrad Foothills (Entrance)',66,0,0,30635,0,0,0,560,2741.87,1315.25,14.0423,2.96016),
(4322,'Caverns Of Time, Black Morass (Exit)',0,0,0,0,0,0,0,1,-8765.66,-4175,-209.863,5.53463),
(4323,'Caverns Of Time, Battle Of Mount Hyjal (Exit)',0,0,0,0,0,0,0,1,-8177.5,-4183,-168,4.5),
(4324,'Caverns Of Time, Old Hillsbrad Foothills (Exit)',0,0,0,0,0,0,0,1,-8334.98,-4055.32,-207.737,3.27431),
(4352,'Outland To Dark Portal',58,0,0,0,0,0,0,0,-11877.7,-3204.49,-18.49,0.23),
(4354,'Dark Portal To Outland',58,0,0,0,0,0,0,530,-248,956,85,0),
(4363,'The Underbog (Entrance)',55,0,0,30623,0,0,0,546,9.71391,-16.2008,-2.75334,5.57082),
(4364,'The Steamvault (Entrance)',55,0,0,30623,0,0,0,545,-13.8425,6.7542,-4.2586,0),
(4365,'The Slave Pens (Entrance)',55,0,0,30623,0,0,0,547,120.101,-131.957,-0.801547,1.47574),
(4366,'The Steamvault (Exit)',0,0,0,0,0,0,0,530,816.59,6934.67,-80.5446,4.53174),
(4367,'The Underbog (Exit)',0,0,0,0,0,0,0,530,777.089,6763.45,-72.0662,2.72453),
(4379,'The Slave Pens (Exit)',0,0,0,0,0,0,0,530,719.508,6999.34,-73.0743,4.52702),
(4386,'Sunstrider Isle to Eastern Plaguelands',1,0,0,0,0,0,0,0,3476.36,-4493.36,137.49,0),
(4397,'Shadow Labyrinth (Exit)',0,0,0,0,0,0,0,530,-3645.06,4943.62,-101.048,6.27058),
(4399,'Auchenai Crypts (Exit)',0,0,0,0,0,0,0,530,-3361.96,4660.41,-101.048,4.76654),
(4401,'Mana Tombs (Exit)',0,0,0,0,0,0,0,530,-3079.81,4943.04,-101.047,3.16432),
(4403,'Sethekk Halls (Exit)',0,0,0,0,0,0,0,530,-3362.22,5225.77,-101.049,1.62101),
(4404,'Auchenai Crypts (Entrance)',55,0,0,30633,0,0,0,558,-21.8975,0.16,-0.1206,0.0353412),
(4405,'Mana Tombs (Entrance)',55,0,0,30633,0,0,0,557,0.0191,0.9478,-0.9543,3.03164),
(4406,'Sethekk Halls (Entrance)',55,0,0,30633,0,0,0,556,-4.6811,-0.0930796,0.0062,0.0353424),
(4407,'Shadow Labyrinth (Entrance)',65,0,0,30633,0,0,0,555,0.488033,-0.215935,-1.12788,3.15888),
(4409,'Eastern Plaguelands To Sunstrider Isle',0,0,0,0,0,0,0,530,6123,-7005,138,5),
(4416,'Serpentshrine Cavern (Entrance)',70,0,0,0,0,0,0,548,2.5343,-0.022318,821.727,0.004512),
(4418,'Serpentshrine Cavern (Exit)',0,0,0,0,0,0,0,530,827.011,6865.47,-63.7844,3.06507),
(4436,'Karazhan, Main (Exit)',0,0,0,0,0,0,0,0,-11112.9,-2005.89,49.3307,4.02516),
(4455,'The Mechanar (Exit)',0,0,0,0,0,0,0,530,3312.09,1331.89,505.559,2.00554),
(4457,'The Eye (Exit)',0,0,0,0,0,0,0,530,3087.31,1373.79,184.643,1.52918),
(4459,'The Botanica (Exit)',0,0,0,0,0,0,0,530,3413.65,1483.32,182.838,2.54432),
(4461,'The Arcatraz (Exit)',0,0,0,0,0,0,0,530,2862.41,1546.09,252.161,0.805457),
(4467,'The Botanica (Entrance)',68,0,0,30634,0,0,0,553,40.0395,-28.613,-1.1189,2.35856),
(4468,'The Arcatraz (Entrance)',68,0,0,30634,0,0,0,552,-1.23165,0.0143459,-0.204293,0.0157123),
(4469,'The Mechanar (Entrance)',68,0,0,30634,0,0,0,554,-28.906,0.680314,-1.81282,0.0345509),
(4470,'The Eye (Entrance)',68,0,0,0,0,0,0,550,-10.8021,-1.15045,-2.42833,6.22821),
(4487,'Battle Of Mount Hyjal (Exit)',0,0,0,0,0,0,0,1,-8177.5,-4183,-168,4.5),
(4523,'Socrethar\'s Seat To Mainland',0,0,0,0,0,0,0,530,4773.76,3451.27,105.15,3.84),
(4534,'Gruul\'s Lair (Exit)',0,0,0,0,0,0,0,530,3549.8,5085.97,2.46332,2.25742),
(4535,'Gruul\'s Lair (Entrance)',65,0,0,0,0,0,0,565,62.7842,35.462,-3.9835,1.41844),
(4561,'Invasion Point, Cataclysm (Return Point)',0,0,0,0,0,0,0,530,-3278.63,2831.31,123.01,1.56),
(4562,'Invasion Point, Cataclysm (Return Point)',0,0,0,0,0,0,0,530,-3278.63,2831.31,123.01,1.56),
(4598,'Black Temple (Entrance)',70,0,0,0,0,0,0,564,96.4462,1002.35,-86.9984,6.15675),
(4612,'The Botanica',0,0,0,0,0,0,0,530,3407.11,1488.48,182.838,2.50112),
(4614,'The Mechanar',0,0,0,0,0,0,0,530,2869.89,1552.76,252.159,0.733993),
(4619,'Black Temple (Exit)',0,0,0,0,0,0,0,530,-3653.51,317.493,36.1671,6.24941),
(4738,'Zul\'Aman (Entrance)',68,0,0,0,0,0,0,568,120.7,1776,43.46,4.7713),
(4739,'Zul\'Aman (Exit)',0,0,0,0,0,0,0,530,6851.5,-7997.68,192.36,1.56688),
(4885,'Magisters\' Terrace (Exit)',0,0,0,0,0,0,0,530,12884.6,-7336.17,65.48,1.09),
(4887,'Magisters\' Terrace (Entrance)',70,0,0,0,0,0,0,585,7.09,-0.45,-2.8,0.05),
(4889,'Sunwell Plateau (Entrance)',70,0,0,0,0,0,0,580,1790.65,925.67,15.15,3.1),
(4891,'Sunwell Plateau (Exit)',0,0,0,0,0,0,0,530,12560.8,-6774.59,15.08,6.25);
/*!40000 ALTER TABLE `areatrigger_teleport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 23:44:55
