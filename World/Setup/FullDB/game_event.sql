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
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event`
--

LOCK TABLES `game_event` WRITE;
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (1,'2011-06-21 09:00:00','2020-12-31 08:00:00',525600,20160,341,'Midsummer Fire Festival'),
(2,'2010-12-15 15:00:00','2020-12-31 08:00:00',525600,25920,141,'Feast of Winter Veil'),
(3,'2011-02-06 08:01:00','2020-12-31 08:00:00',131040,8638,376,'Darkmoon Faire (Terokkar Forest)'),
(4,'2011-03-06 08:01:00','2020-12-31 08:00:00',131040,8638,374,'Darkmoon Faire (Elwynn Forest)'),
(5,'2011-01-02 08:01:00','2020-12-31 08:00:00',131040,8638,375,'Darkmoon Faire (Mulgore)'),
(6,'2010-12-31 20:00:00','2020-12-31 08:00:00',525600,1080,0,'New Year\'s Eve'),
(7,'2010-01-23 09:00:00','2020-12-31 08:00:00',525600,30240,327,'Lunar Festival'),
(8,'2011-02-06 09:00:00','2020-12-31 08:00:00',525600,20160,335,'Love is in the Air'),
(9,'2010-12-25 08:00:00','2020-12-31 08:00:00',525600,11520,0,'Feast of Winter Veil - Presents'),
(10,'2011-05-01 09:00:00','2020-12-31 08:00:00',525600,10080,201,'Children\'s Week '),
(11,'2011-09-06 09:00:00','2020-12-31 08:00:00',525600,10080,321,'Harvest Festival'),
(12,'2011-10-18 10:00:00','2020-12-31 08:00:00',525600,18720,324,'Hallow\'s End'),
(13,'0000-00-00 00:00:00','0000-00-00 00:00:00',525600,1,0,'Elemental Invasions'),
(14,'2009-01-04 18:00:00','2020-12-31 08:00:00',10080,240,0,'Stranglethorn Fishing Extravaganza - Announce'),
(15,'2009-01-04 22:00:00','2020-12-31 08:00:00',10080,120,301,'Stranglethorn Fishing Extravaganza'),
(16,'2007-08-04 22:00:00','2020-12-31 08:00:00',180,120,0,'Gurubashi Arena Booty Run'),
(17,'0000-00-00 00:00:00','0000-00-00 00:00:00',525600,1,0,'Scourge Invasion'),
(18,'2011-01-14 09:00:00','2020-12-31 08:00:00',40320,5760,283,'Call to Arms: Alterac Valley!'),
(19,'2011-01-21 09:00:00','2020-12-31 08:00:00',40320,5760,284,'Call to Arms: Warsong Gulch!'),
(20,'2011-01-28 09:00:00','2020-12-31 08:00:00',40320,5760,285,'Call to Arms: Arathi Basin!'),
(21,'2010-01-07 09:00:00','2020-12-31 08:00:00',40320,5760,353,'Call to Arms: Eye of the Storm!'),
(22,'0000-00-00 00:00:00','0000-00-00 00:00:00',525600,1,0,'AQ War Effort'),
(26,'2011-09-20 09:00:00','2020-12-31 08:00:00',525600,23040,372,'Brewfest'),
(27,'2011-01-02 05:00:00','2020-12-31 08:00:00',1440,510,0,'Nights'),
(28,'2011-04-24 09:00:00','2020-12-31 08:00:00',525600,10080,181,'Noblegarden'),
(29,'2010-12-28 05:00:00','2020-12-31 08:00:00',86400,21600,0,'Edge of Madness, Gri\'lek'),
(30,'2011-01-11 05:00:00','2020-12-31 08:00:00',86400,21600,0,'Edge of Madness, Hazza\'rah'),
(31,'2011-01-25 05:00:00','2020-12-31 08:00:00',86400,21600,0,'Edge of Madness, Renataki'),
(32,'2010-12-14 05:00:00','2020-12-31 08:00:00',86400,21600,0,'Edge of Madness, Wushoolay'),
(33,'0000-00-00 00:00:00','0000-00-00 00:00:00',5184000,2592000,0,'Arena Tournament'),
(34,'2011-10-22 08:00:00','2011-10-24 08:00:00',60,5,0,'L70ETC Concert - Terrokar Forest (Blizzcon Event)'),
(36,'2009-01-04 22:00:00','2020-12-31 08:00:00',10080,180,0,'Stranglethorn Fishing Extravaganza - Turn-in'),
(41,'2011-03-03 08:01:00','2020-12-31 08:00:00',131040,4320,0,'Darkmoon Faire (Elwynn Forest) - Building Stage 1'),
(42,'2011-03-04 08:01:00','2020-12-31 08:00:00',131040,2880,0,'Darkmoon Faire (Elwynn Forest) - Building Stage 2'),
(43,'2011-02-03 08:01:00','2020-12-31 07:00:00',131040,4320,0,'Darkmoon Faire (Terokkar Forest) - Building Stage 1'),
(44,'2011-02-04 08:01:00','2020-12-31 07:00:00',131040,2880,0,'Darkmoon Faire (Terokkar Forest) - Building Stage 2'),
(45,'2011-01-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - January'),
(46,'2011-02-01 08:00:00','2020-12-31 07:00:00',525600,40320,0,'Brew of the Month - February'),
(47,'2011-03-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - March'),
(48,'2011-04-01 08:00:00','2020-12-31 07:00:00',525600,43200,0,'Brew of the Month - April'),
(49,'2011-05-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - May'),
(50,'2011-06-01 08:00:00','2020-12-31 07:00:00',525600,43200,0,'Brew of the Month - June'),
(51,'2011-07-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - July'),
(52,'2011-08-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - August'),
(53,'2011-09-01 08:00:00','2020-12-31 07:00:00',525600,43200,0,'Brew of the Month - September'),
(54,'2011-10-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - October'),
(55,'2011-11-01 07:00:00','2020-12-31 07:00:00',525600,43200,0,'Brew of the Month - November'),
(56,'2011-12-01 08:00:00','2020-12-31 07:00:00',525600,44640,0,'Brew of the Month - December'),
(57,'2011-01-01 10:48:00','2020-12-31 08:00:00',180,24,0,'World\'s End Tavern - Perry Gatner Announce'),
(58,'2011-01-01 11:00:00','2020-12-31 08:00:00',180,5,0,'World\'s End Tavern - Perry Gatner Standup Comedy'),
(59,'2011-01-01 11:48:00','2020-12-31 08:00:00',180,24,0,'World\'s End Tavern - L70ETC Concert Announce'),
(60,'2011-01-01 09:00:00','2020-12-31 08:00:00',180,5,0,'World\'s End Tavern - L70ETC Concert'),
(61,'2011-01-01 08:58:00','2020-12-31 08:00:00',30,10,0,'Stormwind City - Stockades Jail Break'),
(62,'2010-12-30 08:01:00','2020-12-31 07:00:00',131040,4320,0,'Darkmoon Faire (Mulgore) - Building Stage 1'),
(63,'2010-12-31 08:01:00','2020-12-31 07:00:00',131040,2880,0,'Darkmoon Faire (Mulgore) - Building Stage 2'),
(64,'2011-01-02 03:48:00','2020-12-31 08:00:00',1440,24,0,'Grim Guzzler - L70ETC Pre-Concert'),
(65,'2011-01-02 04:00:00','2020-12-31 08:00:00',1440,5,0,'Grim Guzzler - L70ETC Concert');
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

