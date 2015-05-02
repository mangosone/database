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
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_area`
--

LOCK TABLES `spell_area` WRITE;
/*!40000 ALTER TABLE `spell_area` DISABLE KEYS */;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `condition_id`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES (35480,2367,0,0,0,0,0,690,0,1),
(35481,2367,0,0,0,0,0,690,1,1),
(35482,2367,0,0,0,0,0,1032,0,1),
(35483,2367,0,0,0,0,0,1032,1,1),
(40567,3522,0,0,0,0,0,0,2,0),
(40568,3522,0,0,0,0,0,0,2,0),
(40572,3522,0,0,0,0,0,0,2,0),
(40573,3522,0,0,0,0,0,0,2,0),
(40575,3522,0,0,0,0,0,0,2,0),
(40576,3522,0,0,0,0,0,0,2,0),
(41608,3606,0,0,0,0,0,0,2,0),
(41609,3606,0,0,0,0,0,0,2,0),
(41610,3606,0,0,0,0,0,0,2,0),
(41611,3606,0,0,0,0,0,0,2,0),
(46837,3606,0,0,0,0,0,0,2,0),
(46839,3606,0,0,0,0,0,0,2,0),
(41608,3607,0,0,0,0,0,0,2,0),
(41609,3607,0,0,0,0,0,0,2,0),
(41610,3607,0,0,0,0,0,0,2,0),
(41611,3607,0,0,0,0,0,0,2,0),
(41617,3607,0,0,0,0,0,0,2,0),
(41619,3607,0,0,0,0,0,0,2,0),
(46837,3607,0,0,0,0,0,0,2,0),
(46839,3607,0,0,0,0,0,0,2,0),
(41617,3715,0,0,0,0,0,0,2,0),
(41619,3715,0,0,0,0,0,0,2,0),
(41617,3716,0,0,0,0,0,0,2,0),
(41619,3716,0,0,0,0,0,0,2,0),
(41617,3717,0,0,0,0,0,0,2,0),
(41619,3717,0,0,0,0,0,0,2,0),
(40214,3759,11013,1,0,0,0,0,2,1),
(33836,3803,0,0,0,0,0,0,2,0),
(41608,3845,0,0,0,0,0,0,2,0),
(41609,3845,0,0,0,0,0,0,2,0),
(41610,3845,0,0,0,0,0,0,2,0),
(41611,3845,0,0,0,0,0,0,2,0),
(41618,3845,0,0,0,0,0,0,2,0),
(41620,3845,0,0,0,0,0,0,2,0),
(46837,3845,0,0,0,0,0,0,2,0),
(46839,3845,0,0,0,0,0,0,2,0),
(41608,3847,0,0,0,0,0,0,2,0),
(41609,3847,0,0,0,0,0,0,2,0),
(41610,3847,0,0,0,0,0,0,2,0),
(41611,3847,0,0,0,0,0,0,2,0),
(41618,3847,0,0,0,0,0,0,2,0),
(41620,3847,0,0,0,0,0,0,2,0),
(46837,3847,0,0,0,0,0,0,2,0),
(46839,3847,0,0,0,0,0,0,2,0),
(41608,3848,0,0,0,0,0,0,2,0),
(41609,3848,0,0,0,0,0,0,2,0),
(41610,3848,0,0,0,0,0,0,2,0),
(41611,3848,0,0,0,0,0,0,2,0),
(41618,3848,0,0,0,0,0,0,2,0),
(41620,3848,0,0,0,0,0,0,2,0),
(46837,3848,0,0,0,0,0,0,2,0),
(46839,3848,0,0,0,0,0,0,2,0),
(41608,3849,0,0,0,0,0,0,2,0),
(41609,3849,0,0,0,0,0,0,2,0),
(41610,3849,0,0,0,0,0,0,2,0),
(41611,3849,0,0,0,0,0,0,2,0),
(41618,3849,0,0,0,0,0,0,2,0),
(41620,3849,0,0,0,0,0,0,2,0),
(46837,3849,0,0,0,0,0,0,2,0),
(46839,3849,0,0,0,0,0,0,2,0),
(40567,3923,0,0,0,0,0,0,2,0),
(40568,3923,0,0,0,0,0,0,2,0),
(40572,3923,0,0,0,0,0,0,2,0),
(40573,3923,0,0,0,0,0,0,2,0),
(40575,3923,0,0,0,0,0,0,2,0),
(40576,3923,0,0,0,0,0,0,2,0),
(40214,3939,11013,1,0,0,0,0,2,1),
(41608,3959,0,0,0,0,0,0,2,0),
(41609,3959,0,0,0,0,0,0,2,0),
(41610,3959,0,0,0,0,0,0,2,0),
(41611,3959,0,0,0,0,0,0,2,0),
(46837,3959,0,0,0,0,0,0,2,0),
(46839,3959,0,0,0,0,0,0,2,0),
(40214,3966,11013,1,0,0,0,0,2,1),
(41608,4075,0,0,0,0,0,0,2,0),
(41609,4075,0,0,0,0,0,0,2,0),
(41610,4075,0,0,0,0,0,0,2,0),
(41611,4075,0,0,0,0,0,0,2,0),
(45373,4075,0,0,0,0,0,0,2,0),
(46837,4075,0,0,0,0,0,0,2,0),
(46839,4075,0,0,0,0,0,0,2,0);
/*!40000 ALTER TABLE `spell_area` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

