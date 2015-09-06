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
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `levelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `levelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reset_delay` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_template`
--

LOCK TABLES `instance_template` WRITE;
/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
INSERT INTO `instance_template` (`map`, `parent`, `levelMin`, `levelMax`, `maxPlayers`, `reset_delay`) VALUES (30,0,10,0,50,0),
(33,0,14,30,10,0),
(34,0,15,32,10,0),
(36,0,10,20,10,0),
(43,0,10,21,10,0),
(47,0,17,38,10,0),
(48,0,19,32,10,0),
(70,0,30,47,10,0),
(90,0,15,38,10,0),
(109,0,35,55,10,0),
(129,0,25,46,10,0),
(189,0,20,45,10,0),
(209,0,35,54,10,0),
(229,0,45,0,10,0),
(230,0,40,0,5,0),
(249,0,50,0,40,0),
(269,0,66,0,5,0),
(289,0,45,0,5,0),
(309,0,50,0,20,0),
(329,0,45,60,5,0),
(349,0,30,55,10,0),
(389,0,8,18,10,0),
(409,230,50,0,40,0),
(429,0,45,60,5,0),
(469,229,60,0,40,0),
(489,0,10,0,50,0),
(509,0,50,0,20,0),
(529,0,10,0,50,0),
(531,0,50,0,40,0),
(532,0,68,0,10,0),
(533,0,51,0,40,0),
(534,0,70,0,25,0),
(540,0,55,0,5,0),
(542,0,55,0,5,0),
(543,0,55,0,5,0),
(544,0,65,0,25,0),
(545,0,55,0,5,0),
(546,0,55,0,5,0),
(547,0,55,0,5,0),
(548,0,68,0,25,0),
(550,0,68,0,25,0),
(552,0,68,0,5,0),
(553,0,68,0,5,0),
(554,0,68,0,5,0),
(555,0,65,0,5,0),
(556,0,55,0,5,0),
(557,0,55,0,5,0),
(558,0,55,0,5,0),
(559,0,10,0,50,0),
(560,0,66,0,5,0),
(562,0,10,0,50,0),
(564,0,70,0,25,0),
(565,0,65,0,25,0),
(566,0,10,0,50,0),
(568,0,68,70,10,0),
(572,0,10,0,50,0),
(580,0,70,0,25,0),
(585,0,65,0,5,0);
/*!40000 ALTER TABLE `instance_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

