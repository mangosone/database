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
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlemaster_entry`
--

LOCK TABLES `battlemaster_entry` WRITE;
/*!40000 ALTER TABLE `battlemaster_entry` DISABLE KEYS */;
INSERT INTO `battlemaster_entry` (`entry`, `bg_template`) VALUES (347,1),
(857,3),
(907,3),
(2302,2),
(2804,2),
(3890,2),
(5118,1),
(7410,1),
(7427,1),
(10360,2),
(12197,1),
(12198,3),
(14942,1),
(14981,2),
(14982,2),
(14990,3),
(14991,3),
(15006,3),
(15007,3),
(15008,3),
(15102,2),
(15103,1),
(15105,2),
(15106,1),
(16694,3),
(16695,1),
(16696,2),
(16711,3),
(17506,1),
(17507,2),
(18895,6),
(19855,3),
(19858,6),
(19859,6),
(19905,3),
(19906,1),
(19907,1),
(19908,2),
(19909,6),
(19910,2),
(19911,6),
(19912,6),
(19915,6),
(19923,6),
(19925,6),
(20002,2),
(20118,2),
(20119,1),
(20120,3),
(20269,2),
(20271,1),
(20272,2),
(20273,3),
(20274,3),
(20276,1),
(20362,7),
(20374,7),
(20381,7),
(20382,7),
(20383,7),
(20384,7),
(20385,7),
(20386,7),
(20388,7),
(20390,7),
(20497,6),
(20499,6),
(21235,6),
(22013,7),
(22015,7),
(25991,6);
/*!40000 ALTER TABLE `battlemaster_entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

