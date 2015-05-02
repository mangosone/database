--
-- Copyright (C) 2005-2014 MaNGOS <http://getmangos.eu/>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

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
-- Table structure for table `dbscripts_on_gossip`
--

DROP TABLE IF EXISTS `dbscripts_on_gossip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbscripts_on_gossip` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbscripts_on_gossip`
--

LOCK TABLES `dbscripts_on_gossip` WRITE;
/*!40000 ALTER TABLE `dbscripts_on_gossip` DISABLE KEYS */;
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (5,0,15,21100,0,0,0,0,0,0,0,0,0,0,0,0,'cast conjure elegant letter'),
(7,0,15,40632,0,0,0,4,0,0,0,0,0,0,0,0,''),
(8,0,15,40642,0,0,0,4,0,0,0,0,0,0,0,0,''),
(9,0,15,40640,0,0,0,4,0,0,0,0,0,0,0,0,''),
(10,0,15,40644,0,0,0,4,0,0,0,0,0,0,0,0,''),
(21,0,7,6981,0,0,0,0,0,0,0,0,0,0,0,0,'quest complete 6981'),
(321,0,15,9268,0,0,0,0,0,0,0,0,0,0,0,0,'Teleport to Darnassus'),
(342,0,15,24751,0,0,0,0,0,0,0,0,0,0,0,0,'generic Trick or Treat cast'),
(576,0,7,2278,5,0,0,0,0,0,0,0,0,0,0,0,'quest 2278 complete'),
(1045,0,15,11512,0,0,0,4,0,0,0,0,0,0,0,0,'Matrix Punchograph 3005-A - white->yellow card'),
(1047,0,15,11525,0,0,0,4,0,0,0,0,0,0,0,0,'Matrix Punchograph 3005-B - yellow->blue card'),
(1049,0,15,11528,0,0,0,4,0,0,0,0,0,0,0,0,'Matrix Punchograph 3005-C - blue->red card'),
(1282,0,10,8391,300000,0,0,0,0,0,0,0,-6460.42,-1267.62,180.785,3.15905,'summon Lathoric'),
(1288,1,9,112831,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues S - rough script, details missing'),
(1288,11,9,112832,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues N'),
(1288,22,9,112833,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues SW'),
(1288,33,9,112834,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues SE'),
(1288,44,9,112835,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues NW'),
(1288,55,9,112836,10,0,0,0,0,0,0,0,0,0,0,0,'AtalarionStatues NE'),
(1321,0,7,3441,0,0,0,0,0,0,0,0,0,0,0,0,'quest 3441 complete of npc 8479'),
(1405,0,8,8612,0,0,0,0,0,0,0,0,0,0,0,0,'give killcredit - Screecher Spirit'),
(1405,2,29,1,2,8612,5,0,0,0,0,0,0,0,0,0,''),
(1541,0,15,12885,0,0,0,0,0,0,0,0,0,0,0,0,'Teleport to Razelikh'),
(2177,0,7,4285,0,0,0,0,0,0,0,0,0,0,0,0,'explore northern pylon'),
(2178,0,7,4287,0,0,0,0,0,0,0,0,0,0,0,0,'explore eastern pylon'),
(2179,0,7,4288,0,0,0,0,0,0,0,0,0,0,0,0,'explore western pylon'),
(2208,0,15,15120,0,0,0,0,0,0,0,0,0,0,0,0,'cast Cenarion Beacon'),
(2208,0,0,0,0,0,0,0,2000000318,0,0,0,0,0,0,0,''),
(2465,0,15,23122,0,0,0,0,0,0,0,0,0,0,0,0,'Create Jaina\'s Autograph'),
(3049,0,7,5126,0,0,0,0,0,0,0,0,0,0,0,0,'give questcredit - Lorax\'s Tale'),
(3141,0,8,11064,1,0,0,0,0,0,0,0,0,0,0,0,''),
(3141,2,29,1,2,11064,5,0,0,0,0,0,0,0,0,0,''),
(3142,0,15,47043,0,0,0,0,0,0,0,0,0,0,0,0,'create item Flute of the Ancients'),
(3223,0,15,17529,0,0,0,0,0,0,0,0,0,0,0,0,'cast Vitreous Focuser'),
(3421,0,17,12846,1,0,0,0,0,0,0,0,0,0,0,0,'give item Argent Dawn Commission'),
(3801,0,15,17961,0,0,0,0,0,0,0,0,0,0,0,0,'cast Scarlet Illusion'),
(3884,1,7,5929,5,0,0,0,0,0,0,0,0,0,0,0,'Quest complete 5929'),
(3885,1,7,5930,5,0,0,0,0,0,0,0,0,0,0,0,'Quest complete 5930'),
(4041,0,30,315,0,0,0,0,0,0,0,0,0,0,0,0,'fly to Rut\'theran Village'),
(4042,0,30,316,0,0,0,0,0,0,0,0,0,0,0,0,'fly to Thunder Bluff'),
(4781,0,15,23059,0,0,0,0,0,0,0,0,0,0,0,0,'cast Create Thorium Brotherhood Contract'),
(5382,0,15,10843,0,0,0,0,0,0,0,0,0,0,0,0,'Heavy Mageweave Bandage'),
(5383,0,15,18631,0,0,0,0,0,0,0,0,0,0,0,0,'Runecloth Bandages'),
(5384,0,15,18632,0,0,0,0,0,0,0,0,0,0,0,0,'Heavy Runecloth Bandages'),
(5602,3,0,0,0,0,0,0,2000000195,0,0,0,0,0,0,0,'ironbark the redeemed - Say'),
(5602,7,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'ironbark the redeemed - Start movement'),
(5602,7,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'ironbark the redeemed - Set active'),
(5704,0,17,19016,1,0,0,0,0,0,0,0,0,0,0,0,'create Vessel of Rebirth'),
(5750,0,15,25139,0,0,0,6,0,0,0,0,0,0,0,0,'cast teleport molten core'),
(6092,0,15,23490,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Dimension Ripper - Everlook'),
(6094,0,15,23491,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Ultrasafe Transporter: Gadgetzan'),
(6443,0,15,24267,0,0,0,0,0,0,0,0,0,0,0,0,'Learn Gurubashi Mojo Madness'),
(6545,0,8,15222,0,0,0,0,0,0,0,0,0,0,0,0,'cast killcredit 15222'),
(6552,0,8,15221,0,0,0,0,0,0,0,0,0,0,0,0,'cast killcredit 15221'),
(6668,0,17,21109,1,0,0,0,0,0,0,0,0,0,0,0,'Give Draconic for Dummies Chap. VII'),
(6669,0,17,21107,1,0,0,0,0,0,0,0,0,0,0,0,'Give Draconic for Dummies Chap. V'),
(6670,0,17,21106,1,0,0,0,0,0,0,0,0,0,0,0,'Give Draconic for Dummies Chap. IV'),
(6763,0,15,25952,0,0,0,4,0,0,0,0,0,0,0,0,'free metzen - use visual effect'),
(6763,7,8,15664,5,0,0,0,0,0,0,0,0,0,0,0,'free metzen - credit for metzen'),
(6763,9,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'free metzen - despawn'),
(7399,0,15,30353,0,0,0,0,0,0,0,0,0,0,0,0,'cast Summon Tree Disguise Kit'),
(7585,0,17,24573,1,0,0,0,0,0,0,0,0,0,0,0,'give item 24573'),
(7671,0,8,18354,0,0,0,0,0,0,0,0,0,0,0,0,'lump kill credit'),
(7676,0,7,10108,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10108 explored'),
(7676,0,7,10107,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10107 explored'),
(7715,5,30,532,0,0,0,0,0,0,0,0,0,0,0,0,'taxi patch'),
(7722,0,15,32431,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Battle Standard - Horde'),
(7724,0,15,32430,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Battle Standard - Alliance'),
(7729,0,22,45,2,0,0,0,0,0,0,0,0,0,0,0,'change faction'),
(7729,1,0,0,0,0,0,0,2000000196,0,0,0,0,0,0,0,'say on start'),
(7729,1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,'attack start'),
(7730,0,22,45,2,0,0,0,0,0,0,0,0,0,0,0,'change faction'),
(7730,1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,'start attack'),
(7730,1,0,0,0,0,0,0,2000000197,0,0,0,0,0,0,0,'say on start'),
(7731,0,22,14,2,0,0,0,0,0,0,0,0,0,0,0,'change faction'),
(7731,1,26,0,0,0,0,0,0,0,0,0,0,0,0,0,'start attack'),
(7731,1,0,0,0,0,0,0,2000000198,0,0,0,0,0,0,0,'say on start'),
(7938,0,15,34924,0,0,0,0,0,0,0,0,0,0,0,0,'cast Stair of Destiny to Thrallmar'),
(7939,0,15,34907,0,0,0,0,0,0,0,0,0,0,0,0,'cast Taxi - Stair of Destiny to Honor Hold'),
(7959,0,30,534,0,0,0,0,0,0,0,0,0,0,0,0,'taxi path'),
(8072,0,15,34891,0,0,0,0,0,0,0,0,0,0,0,0,'Flight through Caverns'),
(8082,0,15,34905,0,0,0,0,0,0,0,0,0,0,0,0,'Stealth Flight'),
(8100,0,15,35066,0,0,0,0,0,0,0,0,0,0,0,0,'Taxi - Hellfire Peninsula - Beach Head to Shatter Point'),
(8161,0,8,20679,1,0,0,0,0,0,0,0,0,0,0,0,'Kill credit'),
(8161,0,0,0,0,0,0,0,2000000199,0,0,0,0,0,0,0,'say free'),
(8162,0,8,20677,1,0,0,0,0,0,0,0,0,0,0,0,'Kill credit'),
(8162,0,0,0,0,0,0,0,2000000200,0,0,0,0,0,0,0,'say free'),
(8163,0,8,20678,1,0,0,0,0,0,0,0,0,0,0,0,'Kill credit'),
(8163,0,0,0,0,0,0,0,2000000201,0,0,0,0,0,0,0,'say free'),
(8229,0,30,627,0,0,0,0,0,0,0,0,0,0,0,0,'taxi path'),
(8276,0,7,10519,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10519 explored'),
(8301,0,17,30639,1,0,0,0,0,0,0,0,0,0,0,0,'create item 30639'),
(8338,0,7,10577,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10577 complete'),
(8356,0,17,30658,1,0,0,0,0,0,0,0,0,0,0,0,'give Flanis\' Pack'),
(8371,0,17,30659,1,0,0,0,0,0,0,0,0,0,0,0,'give Kagrosh\'s Pack'),
(8396,0,7,10646,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10646 explored'),
(8429,0,7,10682,5,0,0,0,0,0,0,0,0,0,0,0,'complete quest 10682'),
(8497,0,7,10814,0,0,0,0,0,0,0,0,0,0,0,0,'quest 10814 explored'),
(8617,0,8,22932,0,0,0,0,0,0,0,0,0,0,0,0,'Kill credit for quest 10980'),
(8697,0,7,11082,0,0,0,0,0,0,0,0,0,0,0,0,'quest 11082 explored'),
(8697,0,15,41121,0,0,0,0,0,0,0,0,0,0,0,0,'Giving a Hand'),
(8718,0,15,41278,0,0,0,6,0,0,0,0,0,0,0,0,'Taxi - Skyguard Outpost to Skettis'),
(8719,0,15,41279,0,0,0,6,0,0,0,0,0,0,0,0,'Taxi - Skettis to Skyguard Outpost'),
(8761,0,15,42169,0,0,0,0,0,0,0,0,0,0,0,0,'Apply Aura: Invisibility Detection'),
(8775,0,15,42540,0,0,0,0,0,0,0,0,0,0,0,0,'Create Budd\'s Guise of Zul\'aman'),
(8782,0,15,42295,0,0,0,0,0,0,0,0,0,0,0,0,'Alcaz Island Survey'),
(8846,0,15,42711,0,0,0,0,0,0,0,0,0,0,0,0,'Stormwind to Dustwallow Teleport'),
(9205,0,15,37778,0,0,0,6,0,0,0,0,0,0,0,0,'Quest - Teleport: Caverns of Time'),
(9686,0,0,0,0,0,0,0,2000000163,0,0,0,0,0,0,0,'vekjik say'),
(10131,0,15,46343,0,0,0,2,0,0,0,0,0,0,0,0,'cast Teleport to Caverns of Time'),
(10219,0,10,17085,180000,0,0,8,0,0,0,0,-1321.79,4043.8,116.24,1.25,'Summon Aeranas'),
(20003,0,15,36956,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Dimensional Ripper - Area 52'),
(20004,0,15,36957,0,0,0,0,0,0,0,0,0,0,0,0,'Cast Ultrasafe Transporter - Toshley\'s Station'),
(20007,3,7,5727,10,0,0,0,0,0,0,0,0,0,0,0,'Quest: Hidden Enemies (2)'),
(80880,0,15,34975,0,0,0,0,0,0,0,0,0,0,0,0,'Conjure Chrono-Beacon'),
(105001,0,15,11545,0,0,0,4,0,0,0,0,0,0,0,0,'Matrix Punchograph 3005-D - red->prismatic card'),
(132302,0,15,19797,0,0,0,0,0,0,0,0,0,0,0,0,'cast Conjure Torch of Retribution'),
(194501,0,15,14894,0,0,0,0,0,0,0,0,0,0,0,0,'cast Smelt Dark Iron'),
(194502,1,9,19214,300,0,0,0,0,0,0,0,0,0,0,0,'spawn Spectral Chalice'),
(476301,0,15,6766,0,0,0,0,0,0,0,0,0,0,0,0,'cast Test of Lore'),
(476302,0,7,6627,5,0,0,0,0,0,0,0,0,0,0,0,'Quest complete 6627'),
(476401,0,15,6767,0,0,0,0,0,0,0,0,0,0,0,0,'cast Mark of Shame'),
(476402,0,7,6628,0,0,0,0,0,0,0,0,0,0,0,0,'quest complete'),
(737901,0,30,494,0,0,0,0,0,0,0,0,0,0,0,0,'William Kielar - Send Northpass Tower taxi'),
(737902,0,30,495,0,0,0,0,0,0,0,0,0,0,0,0,'William Kielar - Send Eastwall Tower taxi'),
(737903,0,30,496,0,0,0,0,0,0,0,0,0,0,0,0,'William Kielar - Send Crown Guard Tower taxi'),
(755900,0,8,17900,0,0,0,0,0,0,0,0,0,0,0,0,''),
(755900,1,15,31808,0,0,0,8,0,0,0,0,0,0,0,0,''),
(755901,0,8,17900,0,0,0,0,0,0,0,0,0,0,0,0,''),
(755901,1,15,31810,0,0,0,8,0,0,0,0,0,0,0,0,''),
(755902,0,8,17900,0,0,0,0,0,0,0,0,0,0,0,0,''),
(755902,1,15,31811,0,0,0,8,0,0,0,0,0,0,0,0,''),
(755903,0,8,17900,0,0,0,0,0,0,0,0,0,0,0,0,''),
(755903,1,15,31815,0,0,0,8,0,0,0,0,0,0,0,0,''),
(756000,0,8,17901,0,0,0,0,0,0,0,0,0,0,0,0,''),
(756000,1,15,31807,0,0,0,8,0,0,0,0,0,0,0,0,''),
(756001,0,8,17901,0,0,0,0,0,0,0,0,0,0,0,0,''),
(756001,1,15,31814,0,0,0,8,0,0,0,0,0,0,0,0,''),
(756002,0,8,17901,0,0,0,0,0,0,0,0,0,0,0,0,''),
(756002,1,15,31813,0,0,0,8,0,0,0,0,0,0,0,0,''),
(756003,0,8,17901,0,0,0,0,0,0,0,0,0,0,0,0,''),
(756003,1,15,31812,0,0,0,8,0,0,0,0,0,0,0,0,''),
(796701,0,15,33825,0,0,0,0,0,0,0,0,0,0,0,0,'Aerial Assault Flight (Horde)'),
(796703,0,15,33659,0,0,0,0,0,0,0,0,0,0,0,0,'Taxi Gateways Murket and Shaadraz'),
(796704,0,15,34578,0,0,0,0,0,0,0,0,0,0,0,0,'Taxi - Reaver\'s Fall to Spinebreaker Ridge'),
(797002,0,15,35069,0,0,0,0,0,0,0,0,0,0,0,0,'cast Taxi - Hellfire Peninsula - Expedition Point to Shatter Point'),
(797003,0,15,33768,0,0,0,0,0,0,0,0,0,0,0,0,'cast Gateways Murket and Shaadraz'),
(809600,0,15,35065,0,0,0,0,0,0,0,0,0,0,0,0,'Taxi - Hellfire Peninsula - Shatter Point to Beach Head'),
(809601,0,15,33899,0,0,0,0,0,0,0,0,0,0,0,0,'Aerial Assault Flight (Alliance)'),
(906201,0,15,45071,0,0,0,0,0,0,0,0,0,0,0,0,''),
(906202,0,15,45113,0,0,0,0,0,0,0,0,0,0,0,0,''),
(914301,0,15,45353,0,0,0,0,0,0,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `dbscripts_on_gossip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

