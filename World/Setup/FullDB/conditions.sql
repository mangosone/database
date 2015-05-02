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
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `condition_entry` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Type of the condition',
  `value1` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'data field one for the condition',
  `value2` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'data field two for the condition',
  PRIMARY KEY (`condition_entry`),
  UNIQUE KEY `unique_conditions` (`type`,`value1`,`value2`)
) ENGINE=MyISAM AUTO_INCREMENT=1734 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Condition System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (1,9,11668,0),
(2,2,11511,1),
(3,7,197,1),
(4,7,165,1),
(5,7,164,1),
(6,7,755,1),
(7,7,186,1),
(8,7,333,1),
(9,7,202,1),
(10,6,469,0),
(11,9,1846,0),
(12,6,67,0),
(13,2,13370,1),
(14,10,0,0),
(15,7,171,1),
(16,1,33377,0),
(17,8,8460,0),
(18,2,12384,1),
(19,9,5056,0),
(20,8,8464,0),
(21,8,4242,0),
(22,8,5128,0),
(23,8,5251,0),
(24,8,5384,0),
(25,9,11515,0),
(26,8,6383,0),
(27,12,2,0),
(28,8,7786,0),
(29,9,11541,0),
(30,9,10855,0),
(31,9,10821,0),
(32,9,9923,0),
(33,9,9924,0),
(34,8,10970,0),
(35,9,9955,0),
(36,9,10852,0),
(37,9,10641,0),
(38,8,10265,0),
(39,9,10565,0),
(40,9,11020,0),
(41,9,10804,0),
(42,8,10682,0),
(43,9,10980,0),
(44,8,11004,0),
(45,8,11014,0),
(46,9,8620,0),
(47,2,12766,1),
(48,2,12765,1),
(49,2,19727,1),
(50,8,11075,0),
(239,5,942,5),
(240,5,942,4),
(392,5,942,7),
(435,5,942,6),
(1733,38,181054,12);
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

