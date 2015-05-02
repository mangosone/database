-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: characters
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `character_db_version`
--

DROP TABLE IF EXISTS `character_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_db_version` (
  `required_20001_02_dbdocs_Update` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_db_version`
--

LOCK TABLES `character_db_version` WRITE;
/*!40000 ALTER TABLE `character_db_version` DISABLE KEYS */;
INSERT INTO `character_db_version` VALUES
(NULL);
/*!40000 ALTER TABLE `character_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arena_team`
--

DROP TABLE IF EXISTS `arena_team`;
CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL default '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `BackgroundColor` int(10) unsigned NOT NULL default '0',
  `EmblemStyle` int(10) unsigned NOT NULL default '0',
  `EmblemColor` int(10) unsigned NOT NULL default '0',
  `BorderStyle` int(10) unsigned NOT NULL default '0',
  `BorderColor` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arena_team`
--

LOCK TABLES `arena_team` WRITE;
/*!40000 ALTER TABLE `arena_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arena_team_member`
--

DROP TABLE IF EXISTS `arena_team_member`;
CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL default '0',
  `guid` int(10) unsigned NOT NULL default '0',
  `played_week` int(10) unsigned NOT NULL default '0',
  `wons_week` int(10) unsigned NOT NULL default '0',
  `played_season` int(10) unsigned NOT NULL default '0',
  `wons_season` int(10) unsigned NOT NULL default '0',
  `personal_rating` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY  (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arena_team_member`
--

LOCK TABLES `arena_team_member` WRITE;
/*!40000 ALTER TABLE `arena_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arena_team_stats`
--

DROP TABLE IF EXISTS `arena_team_stats`;
CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL default '0',
  `rating` int(10) unsigned NOT NULL default '0',
  `games_week` int(10) unsigned NOT NULL default '0',
  `wins_week` int(10) unsigned NOT NULL default '0',
  `games_season` int(10) unsigned NOT NULL default '0',
  `wins_season` int(10) unsigned NOT NULL default '0',
  `rank` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arena_team_stats`
--

LOCK TABLES `arena_team_stats` WRITE;
/*!40000 ALTER TABLE `arena_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `houseid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemguid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `item_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item_randompropertyid` int(11) NOT NULL DEFAULT '0',
  `itemowner` int(11) unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int(11) NOT NULL DEFAULT '0',
  `time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `buyguid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastbid` int(11) NOT NULL DEFAULT '0',
  `startbid` int(11) NOT NULL DEFAULT '0',
  `deposit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugreport`
--

LOCK TABLES `bugreport` WRITE;
/*!40000 ALTER TABLE `bugreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_action`
--

DROP TABLE IF EXISTS `character_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_action`
--

LOCK TABLES `character_action` WRITE;
/*!40000 ALTER TABLE `character_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_aura`
--

DROP TABLE IF EXISTS `character_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_aura`
--

LOCK TABLES `character_aura` WRITE;
/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_battleground_data`
--

DROP TABLE IF EXISTS `character_battleground_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `team` int(11) unsigned NOT NULL DEFAULT '0',
  `join_x` float NOT NULL DEFAULT '0',
  `join_y` float NOT NULL DEFAULT '0',
  `join_z` float NOT NULL DEFAULT '0',
  `join_o` float NOT NULL DEFAULT '0',
  `join_map` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_battleground_data`
--

LOCK TABLES `character_battleground_data` WRITE;
/*!40000 ALTER TABLE `character_battleground_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_battleground_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_declinedname`
--

DROP TABLE IF EXISTS `character_declinedname`;
CREATE TABLE `character_declinedname` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL default '',
  `dative` varchar(15) NOT NULL default '',
  `accusative` varchar(15) NOT NULL default '',
  `instrumental` varchar(15) NOT NULL default '',
  `prepositional` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `character_declinedname`
--

LOCK TABLES `character_declinedname` WRITE;
/*!40000 ALTER TABLE `character_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_declinedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_gifts`
--

DROP TABLE IF EXISTS `character_gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(20) unsigned NOT NULL DEFAULT '0',
  `flags` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_gifts`
--

LOCK TABLES `character_gifts` WRITE;
/*!40000 ALTER TABLE `character_gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_homebind`
--

DROP TABLE IF EXISTS `character_homebind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_homebind`
--

LOCK TABLES `character_homebind` WRITE;
/*!40000 ALTER TABLE `character_homebind` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_homebind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_instance`
--

DROP TABLE IF EXISTS `character_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_instance`
--

LOCK TABLES `character_instance` WRITE;
/*!40000 ALTER TABLE `character_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`item`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_inventory`
--

LOCK TABLES `character_inventory` WRITE;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_pet`
--

DROP TABLE IF EXISTS `character_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid` int(11) unsigned DEFAULT '0',
  `CreatedBySpell` int(11) unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loyaltypoints` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `trainpoint` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(11) unsigned NOT NULL DEFAULT '1',
  `curmana` int(11) unsigned NOT NULL DEFAULT '0',
  `curhappiness` int(11) unsigned NOT NULL DEFAULT '0',
  `savetime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `abdata` longtext,
  `teachspelldata` longtext,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_pet`
--

LOCK TABLES `character_pet` WRITE;
/*!40000 ALTER TABLE `character_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_pet_declinedname`
--

DROP TABLE IF EXISTS `character_pet_declinedname`;
CREATE TABLE `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL default '0',
  `owner` int(11) unsigned NOT NULL default '0',
  `genitive` varchar(12) NOT NULL default '',
  `dative` varchar(12) NOT NULL default '',
  `accusative` varchar(12) NOT NULL default '',
  `instrumental` varchar(12) NOT NULL default '',
  `prepositional` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY owner_key (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `character_pet_declinedname`
--

LOCK TABLES `character_pet_declinedname` WRITE;
/*!40000 ALTER TABLE `character_pet_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet_declinedname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus`
--

DROP TABLE IF EXISTS `character_queststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mobcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount4` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_queststatus`
--

LOCK TABLES `character_queststatus` WRITE;
/*!40000 ALTER TABLE `character_queststatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_queststatus_daily`
--

DROP TABLE IF EXISTS `character_queststatus_daily`;
CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_queststatus_daily`
--

LOCK TABLES `character_queststatus_daily` WRITE;
/*!40000 ALTER TABLE `character_queststatus_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_reputation`
--

DROP TABLE IF EXISTS `character_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_reputation`
--

LOCK TABLES `character_reputation` WRITE;
/*!40000 ALTER TABLE `character_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_reputation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_skills`
--

DROP TABLE IF EXISTS `character_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_skills`
--

LOCK TABLES `character_skills` WRITE;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_social`
--

DROP TABLE IF EXISTS `character_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `guid` (`guid`),
  KEY `friend` (`friend`),
  KEY `guid_flags` (`guid`,`flags`),
  KEY `friend_flags` (`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_social`
--

LOCK TABLES `character_social` WRITE;
/*!40000 ALTER TABLE `character_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_spell`
--

DROP TABLE IF EXISTS `character_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`),
  KEY `Idx_spell` (`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_spell`
--

LOCK TABLES `character_spell` WRITE;
/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_spell_cooldown`
--

DROP TABLE IF EXISTS `character_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_spell_cooldown`
--

LOCK TABLES `character_spell_cooldown` WRITE;
/*!40000 ALTER TABLE `character_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell_cooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_stats`
--

DROP TABLE IF EXISTS `character_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower1` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower2` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower3` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower4` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower5` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower6` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower7` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` int(10) unsigned NOT NULL DEFAULT '0',
  `agility` int(10) unsigned NOT NULL DEFAULT '0',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0',
  `intellect` int(10) unsigned NOT NULL DEFAULT '0',
  `spirit` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `resHoly` int(10) unsigned NOT NULL DEFAULT '0',
  `resFire` int(10) unsigned NOT NULL DEFAULT '0',
  `resNature` int(10) unsigned NOT NULL DEFAULT '0',
  `resFrost` int(10) unsigned NOT NULL DEFAULT '0',
  `resShadow` int(10) unsigned NOT NULL DEFAULT '0',
  `resArcane` int(10) unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float UNSIGNED NOT NULL default '0',
  `attackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPower` int(10) UNSIGNED NOT NULL default '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_stats`
--

LOCK TABLES `character_stats` WRITE;
/*!40000 ALTER TABLE `character_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_ticket`
--

DROP TABLE IF EXISTS `character_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_text` text,
  `response_text` text CHARSET utf8 COLLATE utf8_general_ci NULL,
  `ticket_lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resolved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_ticket`
--

LOCK TABLES `character_ticket` WRITE;
/*!40000 ALTER TABLE `character_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_tutorial`
--

DROP TABLE IF EXISTS `character_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT '0',
  `tut1` int(11) unsigned NOT NULL DEFAULT '0',
  `tut2` int(11) unsigned NOT NULL DEFAULT '0',
  `tut3` int(11) unsigned NOT NULL DEFAULT '0',
  `tut4` int(11) unsigned NOT NULL DEFAULT '0',
  `tut5` int(11) unsigned NOT NULL DEFAULT '0',
  `tut6` int(11) unsigned NOT NULL DEFAULT '0',
  `tut7` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_tutorial`
--

LOCK TABLES `character_tutorial` WRITE;
/*!40000 ALTER TABLE `character_tutorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_tutorial` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `character_whispers`
--

DROP TABLE IF EXISTS `character_whispers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_whispers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id of the whisper, sort by this',
  `to_guid` int(10) NOT NULL COMMENT 'guid of receiver of the whisper',
  `from_guid` int(10) NOT NULL COMMENT 'guid of sender of the whisper',
  `message` varchar(256) NOT NULL COMMENT 'actual whisper that was sent',
  `regarding_ticket_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'link to character_ticket.ticket_id, if 0 just a log of a whisper sent',
  `sent_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'this is when the whisper was sent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` longtext,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(11) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(11) unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extra_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `at_login` int(11) unsigned NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) UNSIGNED NOT NULL default '0',
  `totalHonorPoints` int(10) UNSIGNED NOT NULL default '0',
  `todayHonorPoints` int(10) UNSIGNED NOT NULL default '0',
  `yesterdayHonorPoints` int(10) UNSIGNED NOT NULL default '0',
  `totalKills` int(10) UNSIGNED NOT NULL default '0',
  `todayKills` smallint(5) UNSIGNED NOT NULL default '0',
  `yesterdayKills` smallint(5) UNSIGNED NOT NULL default '0',
  `chosenTitle` int(10) UNSIGNED NOT NULL default '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) unsigned NOT NULL DEFAULT '0',
  `power2` int(10) unsigned NOT NULL DEFAULT '0',
  `power3` int(10) unsigned NOT NULL DEFAULT '0',
  `power4` int(10) unsigned NOT NULL DEFAULT '0',
  `power5` int(10) unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `ammoId` int(10) unsigned NOT NULL DEFAULT '0',
  `knownTitles` longtext,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(11) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpse`
--

DROP TABLE IF EXISTS `corpse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `instance` (`instance`),
  KEY `Idx_player` (`player`),
  KEY `Idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpse`
--

LOCK TABLES `corpse` WRITE;
/*!40000 ALTER TABLE `corpse` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_respawn`
--

LOCK TABLES `creature_respawn` WRITE;
/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocsfields`
--
DROP TABLE IF EXISTS `dbdocsfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocsfields` (
  `fieldId` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Id for this field',
  `languageId` INT(11) NOT NULL DEFAULT '0' COMMENT 'dbdocsLanguageId to link to. (Normally 0 = English)',
  `tableName` VARCHAR(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the table to link to',
  `fieldName` VARCHAR(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the field to link the note to',
  `fieldComment` VARCHAR(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Main field Note',
  `fieldNotes` TEXT COLLATE utf8_unicode_ci NOT NULL COMMENT 'Additional Field Notes',
  PRIMARY KEY (`fieldId`,`languageId`),
  KEY `fieldId` (`fieldId`)
) ENGINE=INNODB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for the table `dbdocsfields`
--

-- LOCK TABLES `dbdocsfields` WRITE; 
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (1,0,'account','expansion','Which expansion\'s content a user has access to.','The field controls to which expansion\'s content a user has access. By default this is set to 0, allowing access to vanilla WoW content. In mangos-zero, other values can be ignored, since there is no expansion.<br />\r\n¬subtable:2¬\r\n<br />\r\n* Base Game Version of World of Warcraft, otherwise known as Vanilla.\r\n<br />\r\nThe world server will block access to accounts with 0 in this field from accessing the TBC and WotLK areas in-game.\r\n<br />\r\nThe world server will block access to accounts with 1 in this field from accessing the WotLK areas in-game and so on.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (2,0,'auction','auctioneerguid','The GUID of the creature where the auction item was added. (See creature.guid)','The GUID of the creature where the auction item was added. (See creature.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (3,0,'auction','buyguid','The GUID of the highest bidder. See (character.guid)','The GUID of the highest bidder. See (character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (4,0,'auction','buyoutprice','The buyout price of the item in copper.','The buyout price of the item in copper. Divide by 100 to get silver and by 100 again to get gold.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (5,0,'auction','deposit','The amount of copper spent on the deposit.','The amount of copper spent on the deposit.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (6,0,'auction','houseid','The AuctionHouseId (See AuctionHouse.dbc)','The AuctionHouseId (See AuctionHouse.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (7,0,'auction','id','Unique identifier for every auction.','Unique identifier for every auction.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (8,0,'auction','item_count','The stack count of the item','The stack count of the item');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (9,0,'auction','item_randompropertyid','A link to the Item\'s RandomProperty Id (See item_template.Randompropertyid).','A link to the Item\'s RandomProperty Id (See item_template.Randompropertyid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (10,0,'auction','item_template','The entry of the item up for auction. See (item_template.entry)','The entry of the item up for auction. See (item_template.entry)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (11,0,'auction','itemguid','The GUID of the item that is up for auction. (See item_instance.guid)','The GUID of the item that is up for auction. (See item_instance.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (12,0,'auction','itemowner','The GUID of the owner of the item up for auction. (See character.guid)','The GUID of the owner of the item up for auction. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (13,0,'auction','lastbid','The amount of copper of the last bid made on the item.','The amount of copper of the last bid made on the item.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (14,0,'auction','startbid','The amount of copper of the starting bid made on the item.','The amount of copper of the starting bid made on the item.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (15,0,'auction','time','The time when this auction will end, measured in Unix time.','The time when this auction will end, measured in Unix time (number of seconds from 00:00 Jan 1, 1970).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (16,0,'bugreport','content','The text content of the bug/suggestion.','The text content of the bug/suggestion.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (17,0,'bugreport','id','Auto generated value when records are inserted by the core.','Auto generated value when records are inserted by the core. This id is just here to be a primary key and eases the data insertion. This field is also a auto increment field');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (18,0,'bugreport','type','The text description of the type of bug report / suggestion.','The text description of the type of bug report / suggestion.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (19,0,'character_action','action','Depending on the type value, this could be various values.','Depending on the type value, this could be either the spell ID (Spell.dbc), the item_template.entry or macro ID.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (20,0,'character_action','button','The ID of the button on the action bar where the action icon will be placed.','The ID of the button on the action bar where the action icon will be placed.<br />\r\nSpecial bars are used for stances, auras, pets, stealth, and other similar special modes.<br />\r\n\r\n¬subtable:13¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (21,0,'character_action','guid','The GUID of the character (See character.id).','The GUID of the character. (See character.id)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (22,0,'character_action','type','The type of action.','The type of action:<br />\r\n¬subtable:14¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (23,0,'character_aura','basepoints0','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (24,0,'character_aura','basepoints1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (25,0,'character_aura','basepoints2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (26,0,'character_aura','caster_guid','The GUID (Global Unique Identifier) of the player who cast the aura.','The GUID (Global Unique Identifier) of the player who cast the aura. (See character.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (27,0,'character_aura','effIndexMask','The effect index of the spell from which the aura came from.','The effect index of the spell from which the aura came from. A spell has up to three effects, with the index being 0, 1, or 2.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (28,0,'character_aura','guid','The GUID (Full Global Unique Identifier) of the target affected by the aura.','The GUID (Full Global Unique Identifier) of the target affected by the aura. (See character.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (29,0,'character_aura','item_guid','The GUID (Global Unique Identifier) of the item which casted the aura.','The GUID (Global Unique Identifier) of the item which casted the aura. (See item_instance.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (30,0,'character_aura','maxduration','The maximum duration of the aura.','The maximum duration of the aura.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (31,0,'character_aura','periodictime0','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (32,0,'character_aura','periodictime1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (33,0,'character_aura','periodictime2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (34,0,'character_aura','remaincharges','The number of charges remaining on the aura.','The number of charges remaining on the aura.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (35,0,'character_aura','remainingcharges','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (36,0,'character_aura','remaintime','The time remaining in seconds on the aura. -1 means that the aura is indefinite.','The time remaining in seconds on the aura. -1 means that the aura is indefinite.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (37,0,'character_aura','spell','The spell from which the aura was applied. (See Spell.dbc)','The spell from which the aura was applied. (See Spell.dbc column 1)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (38,0,'character_aura','stackcount','Determines how many stacks of the spell the character has.','Determines how many stacks of the spell the character has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (39,0,'character_battleground_data','guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (40,0,'character_battleground_data','instance_id','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (41,0,'character_battleground_data','join_map','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (42,0,'character_battleground_data','join_o','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (43,0,'character_battleground_data','join_x','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (44,0,'character_battleground_data','join_y','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (45,0,'character_battleground_data','join_z','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (46,0,'character_battleground_data','team','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (47,0,'character_db_version','required_20000_Release_019_Initial','The Version of the Character DB.','The Version of the Character DB.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (48,0,'character_gifts','entry','The entry of the item. (See item_template.entry).','The entry of the item. (See item_template.entry).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (49,0,'character_gifts','flags','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (50,0,'character_gifts','guid','The GUID (Global Unique Identifier) of the character. (See character.guid).','The GUID (Global Unique Identifier) of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (51,0,'character_gifts','item_guid','The GUID of the item. (See item_instance.guid).','The GUID of the item. (See item_instance.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (52,0,'character_homebind','guid','The GUID (Global Unique Identifier) of the character. (See character.guid).','The GUID (Global Unique Identifier) of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (53,0,'character_homebind','map','The Map Identifier where the character gets teleported to. (See Maps.dbc).','The Map Identifier where the character gets teleported to (See Maps.dbc).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (54,0,'character_homebind','position_x','The x position where the character gets teleported to.','The x position where the character gets teleported to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (55,0,'character_homebind','position_y','The y position where the character gets teleported to.','The y position where the character gets teleported to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (56,0,'character_homebind','position_z','The z position where the character gets teleported to.','The z position where the character gets teleported to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (57,0,'character_homebind','zone','The Zone Identifier where the character gets teleported to.','The zone ID (Zone Identifier) where the character gets teleported to (See WorldMapArea.dbc).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (58,0,'character_honor_cp','date','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (59,0,'character_honor_cp','guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (60,0,'character_honor_cp','honor','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (61,0,'character_honor_cp','type','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (62,0,'character_honor_cp','victim','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (63,0,'character_honor_cp','victim_type','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (64,0,'character_instance','guid','The GUID (Global Unique Identifier) of the character.','The GUID (Global Unique Identifier) of the character (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (65,0,'character_instance','instance','The instance ID. (See instance.id).','The instance ID. (See instance.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (66,0,'character_instance','permanent','Boolean 0 or 1 controlling if the player has been bound to the instance.','Boolean 0 or 1 controlling if the player has been bound to the instance. \r\nA player is bound to the instance only when he (or his party/raid) kills a creature with the CREATURE_FLAG_EXTRA_INSTANCE_BIND flag set in the (creature_template.flags_extra) field.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (67,0,'character_inventory','bag','If it isn\'t 0, then it is the bag\'s item GUID (Global Unique Identifier).','If it isn\'t 0, then it is the bag\'s item GUID (Global Unique Identifier). (See item_instance.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (68,0,'character_inventory','guid','The GUID (Global Unique Identifier) of the character. (See character.guid).','The GUID (Global Unique Identifier) of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (69,0,'character_inventory','item','The item\'s GUID. (See item_instance.guid).','The item\'s GUID. (See item_instance.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (70,0,'character_inventory','item_template','The item\'s template entry (Item Identifier). (See item_template.entry).','The item\'s template entry (Item Identifier). (See item_template.entry).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (71,0,'character_inventory','slot','The slot is the slot in the bag where the item is.','If the bag field is non-zero, then the slot is the slot in the bag where the item is kept. The range can differ depending on the number of slots the bag has.<br />\r\nIf the bag field is zero, then the slot has a range of 0 to 84 and the value stands for the following:<br />\r\n\r\n¬subtable:15¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (72,0,'character_pet','abdata','Data about pet action bar and action type ten pairs of action bar entry.','data about pet action bar and action type ten pairs of action bar entry (from 1 to 10) and action or spell IDs');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (73,0,'character_pet','CreatedBySpell','The ID of the spell that has created this pet.','The ID of the spell that has created this pet. \r\nFor hunters, this is usually the Tame Beast spell. \r\nFor warlocks or other classes (mages), it is the spell ID that summoned the creature. (See Spell.dbc column 1)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (74,0,'character_pet','curhappiness','The current pet happiness.','The current pet happiness.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (75,0,'character_pet','curhealth','The current pet health at the time it was saved to DB.','The current pet health at the time it was saved to DB.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (76,0,'character_pet','curmana','The current pet mana at the time it was saved to DB.','The current pet mana at the time it was saved to DB.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (77,0,'character_pet','entry','The creature entry of this pet. (See creature_template.entry).','The creature entry of this pet. (See creature_template.entry).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (78,0,'character_pet','exp','The current experience that this pet has.','The current experience that this pet has. For summoned pets, this field is always 0.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (79,0,'character_pet','id','The special pet ID. This is a unique identifier among all pets.','The special pet ID. This is a unique identifier among all pets.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (80,0,'character_pet','level','The current level of the pet.','The current level of the pet.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (81,0,'character_pet','loyalty','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (82,0,'character_pet','loyaltypoints','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (83,0,'character_pet','modelid','The model ID to use to display the pet.','The model ID to use to display the pet.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (84,0,'character_pet','name','The pet\'s name.','The pet\'s name.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (85,0,'character_pet','owner','The GUID of the pet\'s owner. (See character.guid).','The GUID of the pet\'s owner. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (86,0,'character_pet','PetType','The type of pet that this is. 0 = summoned pet, 1 = tamed pet','The type of pet that this is. 0 = summoned pet, 1 = tamed pet');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (87,0,'character_pet','Reactstate','The current reaction state of the pet (passive, aggressive, etc).','The current reaction state of the pet (passive, aggressive, etc).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (88,0,'character_pet','renamed','Boolean 1 or 0. 1 = Pet has been renamed.','Boolean 1 or 0. 1 = Pet has been renamed, 0 = Pet has never been renamed and still uses the same name as the creature that was tamed.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (89,0,'character_pet','resettalents_cost','This is the cost to \"untrain\" the pet talents.','This is the cost to \"untrain\" the pet talents.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (90,0,'character_pet','resettalents_time','How many times the pets talents have been reset.','How many times the pets talents have been reset.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (91,0,'character_pet','savetime','The time when the pet was last saved, in Unix time.','The time when the pet was last saved, in Unix time.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (92,0,'character_pet','slot','The pet slot that the pet is in. The slot is a number between 0 and 3 inclusive.','The pet slot that the pet is in. The slot is a number between 0 and 3 inclusive.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (93,0,'character_pet','teachspelldata','This field holds IDs of spells that have been taught to this pet.','This field holds IDs of spells that have been taught to this pet, abilities that this pet has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (94,0,'character_pet','trainpoint','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (95,0,'character_queststatus','explored','Boolean 1 or 0 representing if the character has explored what was needed.','Boolean 1 or 0 representing if the character has explored what was needed to explore for the quest.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (96,0,'character_queststatus','guid','The GUID of the character. (See character.guid).','The GUID of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (97,0,'character_queststatus','itemcount1','Current item count for the first item in a delivery quest, if any.','Current item count for the first item in a delivery quest, if any. Corresponds with quest_template.ReqItemCount1');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (98,0,'character_queststatus','itemcount2','Current item count for the second item in a delivery quest, if any.','Current item count for the second item in a delivery quest, if any. Corresponds with quest_template.ReqItemCount2');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (99,0,'character_queststatus','itemcount3','Current item count for the third item in a delivery quest, if any.','Current item count for the third item in a delivery quest, if any. Corresponds with quest_template.ReqItemCount3');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (100,0,'character_queststatus','itemcount4','Current item count for the forth item in a delivery quest, if any.','Current item count for the forth item in a delivery quest, if any. Corresponds with quest_template.ReqItemCount4');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (101,0,'character_queststatus','mobcount1','Current count of the first number of kills or casts.','Current count of the number of kills or casts on the second creature or gameobject, if any. Corresponds with quest_template.ReqCreatureOrGOCount1');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (102,0,'character_queststatus','mobcount2','Current count of the second number of kills or casts.','Current count of the number of kills or casts on the second creature or gameobject, if any. Corresponds with quest_template.ReqCreatureOrGOCount2');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (103,0,'character_queststatus','mobcount3','Current count of the third number of kills or casts.','Current count of the number of kills or casts on the third creature or gameobject, if any. Corresponds with quest_template.ReqCreatureOrGOCount3');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (104,0,'character_queststatus','mobcount4','Current count of the forth number of kills or casts.','Current count of the number of kills or casts on the forth creature or gameobject, if any. Corresponds with quest_template.ReqCreatureOrGOCount4');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (105,0,'character_queststatus','quest','The quest ID. (See quest_template.entry).','The quest ID. (See quest_template.entry).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (106,0,'character_queststatus','rewarded','Boolean 1 or 0 representing whether the quest has been rewarded or not.','Boolean 1 or 0 representing whether the quest has been rewarded or not.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (107,0,'character_queststatus','status','The current quest status.\r\n\r\n','The current quest status.<br />\r\n\r\n¬subtable:16¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (108,0,'character_queststatus','timer','Remaining time left on the quest if the quest has a timer (See quest_template).','Remaining time left on the quest if the quest has a timer. (See quest_template.LimitTime).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (109,0,'character_reputation','faction','The faction ID that the character has the given reputation in (See Faction.dbc).','The faction ID that the character has the given reputation in. (See Faction.dbc).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (110,0,'character_reputation','flags','This field is a bitmask containing flags that apply to the faction.','This field is a bitmask containing flags that apply to the faction and how it\'s displayed to the character. Just like any flag field, you can combine flags by adding them together. \r\nIf this field is 0, then it is not shown in the reputation list in-game.<br />\r\n\r\n¬subtable:17¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (111,0,'character_reputation','guid','The GUID of the character. (See character.guid).','The GUID of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (112,0,'character_reputation','standing','The current reputation value that the character has.','The current reputation value that the character has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (113,0,'character_skills','guid','The GUID (Global Unique Identifier) of the character. (See character.guid).','The GUID (Global Unique Identifier) of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (114,0,'character_skills','max','The highest possible value for the given skill within a given rank.','The highest possible value for the given skill within a given rank.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (115,0,'character_skills','skill','The list of skills a character knows. A listing of those can be found in here.','The list of skills a character knows. A listing of those can be found in here.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (116,0,'character_skills','value','The current skill rank(value) of the character skills a character has.','The current skill rank(value) of the character skills a character has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (117,0,'character_social','flags','Whether the character is a friend or ignored.','The flag indicating whether the entry is either a friend or ignored.<br />\r\n\r\n¬subtable:18¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (118,0,'character_social','friend','The GUID of the friend/ignored. (See character.guid)','The GUID of the friend/ignored. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (119,0,'character_social','guid','The GUID of the character. (See character.guid)','The GUID of the character. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (120,0,'character_spell','active','Boolean 1 or 0 signifying whether the spell is active (appears in the spell book','Boolean 1 or 0 signifying whether the spell is active (appears in the spell book).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (121,0,'character_spell','disabled','Boolean flag 0 or 1 when spell is disabled because of talents.','Boolean flag 0 or 1 when spell is disabled because talent which teaches it has been unlearned. When talent is learned again the spell will be available again.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (122,0,'character_spell','guid','The GUID (Global Unique Identifier) of the character. (See character.guid).','The GUID (Global Unique Identifier) of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (123,0,'character_spell','spell','The spell ID (Spell Identifier). (See Spell.dbc)','The spell ID (Spell Identifier). (See Spell.dbc column 1)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (124,0,'character_spell_cooldown','guid','The GUID (Global Unique Identifier, Low part) of the character.','The GUID (Global Unique Identifier, Low part) of the character. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (125,0,'character_spell_cooldown','item','If the spell was casted from an item, the item ID (Item Identifier).','If the spell was casted from an item, the item ID (Item Identifier). (See item_template.entry).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (126,0,'character_spell_cooldown','spell','The spell ID (Spell Identifier). (See Spell.dbc)','The spell ID (Spell Identifier). (See Spell.dbc column 1)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (127,0,'character_spell_cooldown','time','The time when the spell cooldown will finish, measured in Unix Time.','The time when the spell cooldown will finish, measured in Unix Time.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (128,0,'character_stats','agility','Character\'s current agility value','Character\'s current agility value');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (129,0,'character_stats','armor','Character\'s current armor value.','Character\'s current armor value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (130,0,'character_stats','attackPower','Character\'s current attackpower.','Character\'s current attackpower.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (131,0,'character_stats','blockPct','Character\'s current block chance','Character\'s current block chance');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (132,0,'character_stats','critPct','Character\'s current crit chance.','Character\'s current crit chance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (133,0,'character_stats','dodgePct','Character\'s current dodge chance.','Character\'s current dodge chance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (134,0,'character_stats','guid','The guid of the character. (See character.guid).','The guid of the character. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (135,0,'character_stats','intellect','Character\'s current intellect value.','Character\'s current intellect value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (136,0,'character_stats','maxhealth','Maximum amount of health that the character has.','Maximum amount of health that the character has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (137,0,'character_stats','maxpower1','Max Mana','Max Mana');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (138,0,'character_stats','maxpower2','Max Rage','Max Rage');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (139,0,'character_stats','maxpower3','Max Focus','Max Focus');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (140,0,'character_stats','maxpower4','Max Energy','Max Energy');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (141,0,'character_stats','maxpower5','Max Happiness','Max Happiness');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (142,0,'character_stats','maxpower6','Max Rune','Max Rune');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (143,0,'character_stats','maxpower7','Max Runic Power','Max Runic Power');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (144,0,'character_stats','parryPct','Character\'s current parry chance.','Character\'s current parry chance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (145,0,'character_stats','rangedAttackPower','Character\'s current ranged attackpower.','Character\'s current ranged attackpower.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (146,0,'character_stats','rangedCritPct','Character\'s current ranged crit chance.','Character\'s current ranged crit chance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (147,0,'character_stats','resArcane','Character\'s current arcane resistance value.','Character\'s current arcane resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (148,0,'character_stats','resFire','Character\'s current fire resistance value.','Character\'s current fire resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (149,0,'character_stats','resFrost','Character\'s current frost resistance value.','Character\'s current frost resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (150,0,'character_stats','resHoly','Character\'s current holy resistance value.','Character\'s current holy resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (151,0,'character_stats','resNature','Character\'s current nature resistance value.','Character\'s current nature resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (152,0,'character_stats','resShadow','Character\'s current shadow resistance value.','Character\'s current shadow resistance value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (153,0,'character_stats','spirit','Character\'s current spirit value.','Character\'s current spirit value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (154,0,'character_stats','stamina','Character\'s current stamina value.','Character\'s current stamina value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (155,0,'character_stats','strength','Character\'s current strength value.','Character\'s current strength value.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (156,0,'character_ticket','guid','The GUID of the character sending the ticket. (See character.guid).','The GUID of the character sending the ticket. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (157,0,'character_ticket','resolved','Resolved Flag = set to 1 if the GM has sucessfully resolved the ticket','Resolved Flag = set to 1 if the GM has sucessfully resolved the ticket');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (158,0,'character_ticket','response_text','The ticket solution text; the text written by the GM.','The ticket description text; the text written by the GM in describing the solution.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (159,0,'character_ticket','ticket_id','A unique ticket ID.','A unique ticket ID.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (160,0,'character_ticket','ticket_lastchange','Stores the time when this ticket was last changed.','Stores the time when this ticket was last changed.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (161,0,'character_ticket','ticket_text','The ticket description text; the text written by the player.','The ticket description text; the text written by the player in describing the problem.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (162,0,'character_tutorial','account','The account id of the user. (See account.id).','The account id of the user. (See account.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (163,0,'character_tutorial','tut0','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (164,0,'character_tutorial','tut1','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (165,0,'character_tutorial','tut2','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (166,0,'character_tutorial','tut3','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (167,0,'character_tutorial','tut4','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (168,0,'character_tutorial','tut5','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (169,0,'character_tutorial','tut6','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (170,0,'character_tutorial','tut7','These values are 32bits flags.','These values are 32bits flags. So 8 x 32bits values makes 256 bits available to store 256 tutorial messages status.\r\n\r\nEach bit means:\r\n\r\nbc.   0  -  Not yet shown\r\n  1  -  Shown\r\n\r\n\r\nThis is used to diplay only tutorial messages that the character did not see before.\r\n\r\nUnselecting the &quot;Show tutorial&quot; option in game, makes all bits to be set, so all tutX columns will contain then 11111111111111111111111111111111 binary = 4294967295 in decimal after this option is changed.\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (171,0,'character_whispers','from_guid','The GUID of the character sending the whisper. (See character.guid).','The GUID of the character sending the whisper. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (172,0,'character_whispers','id','The unique id of this whisper message','The unique id of this whisper message');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (173,0,'character_whispers','message','The body text of the whisper message','The body text of the whisper message');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (174,0,'character_whispers','regarding_ticket_id','The id of the ticket this whisper relates to. (See character_ticket.ticket_id).','The id of the ticket this whisper relates to. (See character_ticket.ticket_id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (175,0,'character_whispers','sent_on','Stores the time when this whisper was sent.','Stores the time when this whisper was sent.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (176,0,'character_whispers','to_guid','The GUID of the character receiving the whisper. (See character.guid).','The GUID of the character receiving the whisper. (See character.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (177,0,'characters','account','The account ID in which this character resides (See account.id) in the realm db.','The account ID in which this character resides. (See account.id) in the realm database.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (178,0,'characters','actionBars','actionbar\r\n\r\nList of entries that go on the pet-specific action bar.','actionbar\r\n\r\nList of entries that go on the pet-specific action bar (a.k.a. Pet Bar, Pet Action Bar). Entries are in the format: <actionid> <flags>,<actionid> <flags>,...,<actionid> <flags>\r\nFor example, a Hunter pet that is a low-level tamed cat might have an action bar that looks like this:\r\n<pre>\r\n    117440514 0,117440513 0,117440512 0,2649 33024,16827 33024,24450 33024,0 0,100663298 0,100663297 0,\r\n    <attack>     <follow>    <stay>     <Growl 1>  <Claw 1>    <Prowl 1>  <blank><aggress> <defens>\r\n</pre>\r\nEntries listed as \"0 0\" are blank slots on the action bar.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (179,0,'characters','ammoId','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (180,0,'characters','at_login','The status of the character.\r\n\r\n','The status of the character.\r\n\r\n¬subtable:11¬\r\n\r\nFor multiple actions, add values together.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (181,0,'characters','cinematic','Boolean 1 or 0 controlling whether the start cinematic has been shown or not.','Boolean 1 or 0 controlling whether the start cinematic has been shown or not.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (182,0,'characters','class','The Class Id of the character (See chrclasses.dbc).','The Class Id of the character (See chrclasses.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (183,0,'characters','death_expire_time','Time when a character can be resurrected.','Time when a character can be resurrected in case of a server crash or client exit while in ghost form.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (184,0,'characters','deleteDate','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (185,0,'characters','deleteInfos_Account','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (186,0,'characters','deleteInfos_Name','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (187,0,'characters','drunk','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (188,0,'characters','equipmentCache','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (189,0,'characters','exploredZones','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (190,0,'characters','extra_flags','These flags control certain player specific attributes, mostly GM features\r\n\r\n.','These flags control certain player specific attributes, mostly GM features\r\n\r\n<table border=\'1\' cellspacing=\'0\' cellpadding=\'4\' bgcolor=\'#f0f0f0\' width=\'100%\'>\r\n<tr bgcolor=\'#e0e0e0\'>\r\n<td align=\'center\' valign=\'middle\'><b>Bit</b></td>\r\n<td align=\'left\' valign=\'middle\'><b>Name</b></td>\r\n<td align=\'left\' valign=\'middle\'><b>Description</b></td>\r\n</tr>\r\n<tr>\r\n<td align=\'center\' valign=\'middle\'>1</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;GM&#95;ON</td>\r\n<td align=\'left\' valign=\'middle\'>Defines GM state</td>\r\n</tr>\r\n<tr>\r\n<td align=\'center\' valign=\'middle\'>2</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;GM&#95;ACCEPT&#95;TICKETS</td>\r\n<td align=\'left\' valign=\'middle\'>Defines if tickets are accepted</td>\r\n</tr>\r\n<tr>\r\n<td align=\'center\' valign=\'middle\'>4</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;ACCEPT&#95;WHISPERS</td>\r\n<td align=\'left\' valign=\'middle\'>Defines if whispers are accepted</td>\r\n</tr>\r\n<tr>\r\n<td align=\'center\' valign=\'middle\'>8</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;TAXICHEAT</td>\r\n<td align=\'left\' valign=\'middle\'>Sets taxicheat></td>\r\n</tr>\r\n<tr>\r\n<td align=\'center\' valign=\'middle\'>16</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;GM&#95;INVISIBLE</td>\r\n<td align=\'left\' valign=\'middle\'>Control\'s GM\'s invisibly</td>\r\n</tr><tr>\r\n<td align=\'center\' valign=\'middle\'>32</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;GM&#95;CHAT</td>\r\n<td align=\'left\' valign=\'middle\'>Show GM badge in chat messages</td>\r\n</tr><tr>\r\n<td align=\'center\' valign=\'middle\'>64</td>\r\n<td align=\'left\' valign=\'middle\'>PLAYER&#95;EXTRA&#95;PVP&#95;DEATH</td>\r\n<td align=\'left\' valign=\'middle\'>Store PvP death status until corpse creating</td>\r\n</tr></table>');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (191,0,'characters','gender','The Sex/Gender of the character.','The Sex/Gender of the character.<br/>\r\n\r\n¬subtable:10¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (192,0,'characters','guid','The character global unique identifier.','The character global unique identifier. This number must be unique and is the best way to identify separate characters.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (193,0,'characters','health','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (194,0,'characters','honor_highest_rank','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (195,0,'characters','honor_standing','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (196,0,'characters','is_logout_resting','Boolean 1 or 0 controlling if the character is currently in a resting zone.','Boolean 1 or 0 controlling if the character is currently in a resting zone or not.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (197,0,'characters','level','The current level of the designated player.','The current level of the designated player.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (198,0,'characters','leveltime','The total time the character has spent in the world at the current level.','The total time the character has spent in the world at the current level, measured in seconds.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (199,0,'characters','logout_time','The time when the character last logged out, measured in Unix time.','The time when the character last logged out, measured in Unix time.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (200,0,'characters','map','The map ID the character is in (See maps.dbc)','The map ID the character is in. (See maps.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (201,0,'characters','money','This is the amount of copper the character possesses.','This is the amount of copper the character possesses.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (202,0,'characters','name','The name of the character.','The name of the character.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (203,0,'characters','online','Records whether the character is online (1) or offline (0).','Records whether the character is online (1) or offline (0).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (204,0,'characters','orientation','The orientation the character is facing. (North = 0.0, South = 3.14159)','The orientation the character is facing. (North = 0.0, South = 3.14159)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (205,0,'characters','playerBytes','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (206,0,'characters','playerBytes2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (207,0,'characters','playerFlags','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (208,0,'characters','position_x','The x position of the character’s location.','The x position of the character’s location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (209,0,'characters','position_y','The y position of the character’s location.','The y position of the character’s location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (210,0,'characters','position_z','The z position of the character’s location.','The z position of the character’s location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (211,0,'characters','power1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (212,0,'characters','power2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (213,0,'characters','power3','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (214,0,'characters','power4','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (215,0,'characters','power5','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (216,0,'characters','race','The race of the character.','The race of the character.\r\n\r\n¬subtable:12¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (217,0,'characters','resettalents_cost','The cost for the character to reset its talents, measured in copper.','The cost for the character to reset its talents, measured in copper.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (218,0,'characters','resettalents_time','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (219,0,'characters','rest_bonus','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (220,0,'characters','stable_slots','The number of stable slots the player has available. Maximum is 2.','The number of stable slots the player has available. Maximum is 2.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (221,0,'characters','stored_dishonorable_kills','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (222,0,'characters','stored_honor_rating','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (223,0,'characters','stored_honorable_kills','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (224,0,'characters','taxi_path','Stores the players current taxi path (TaxiPath.dbc) if logged off while on one.','Stores the players current taxi path (TaxiPath.dbc) if logged off while on one.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (225,0,'characters','taximask','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (226,0,'characters','totaltime','The total time that the character has been active in the world.','The total time that the character has been active in the world, measured in seconds.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (227,0,'characters','trans_o','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (228,0,'characters','trans_x','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (229,0,'characters','trans_y','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (230,0,'characters','trans_z','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (231,0,'characters','transguid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (232,0,'characters','watchedFaction','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (233,0,'characters','xp','The total amount of xp that the signified player has.','The total amount of xp that the signified player has.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (234,0,'characters','zone','The zone ID the character is in.','The zone ID the character is in.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (235,0,'corpse','corpse_type','The Display Type of the corpse.','The Display Type of the corpse:\r\n<br />\r\n¬subtable:19¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (236,0,'corpse','guid','The character global unique identifier of the corpse.','The character global unique identifier of the corpse.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (237,0,'corpse','instance','The instance ID that the corpse is in.','The instance ID that the corpse is in.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (238,0,'corpse','map','The map ID the corpse is in. (See maps.dbc)','The map ID the corpse is in. (See maps.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (239,0,'corpse','orientation','The orientation of the corpse. (North = 0.0, South = 3.14159)','The orientation of the corpse. (North = 0.0, South = 3.14159)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (240,0,'corpse','player','The character global unique identifier. (See characters.guid).','The character global unique identifier. (See characters.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (241,0,'corpse','position_x','The x position of the character’s corpse location.','The x position of the character’s corpse location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (242,0,'corpse','position_y','The y position of the character’s corpse location.','The y position of the character’s corpse location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (243,0,'corpse','position_z','The z position of the character’s corpse location.','The z position of the character’s corpse location.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (244,0,'corpse','time','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (245,0,'creature_respawn','guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (246,0,'creature_respawn','instance','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (247,0,'creature_respawn','respawntime','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (248,0,'dbdocsfields','fieldComment','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (249,0,'dbdocsfields','fieldName','The fieldname in the table to link the note to.','The fieldname in the table to link the note to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (250,0,'dbdocsfields','fieldNotes','The Field Note text','The Field Note text');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (251,0,'dbdocsfields','tableName','The table name to link the note to.','The table name to link the note to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (252,0,'dbdocssubtables','subTableContent','The Content of the subTable','The Content of the subTable.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (253,0,'dbdocssubtables','subTableId','The Lookup Id of the subTable','This is the Lookup Id of the subTable');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (254,0,'dbdocssubtables','subTableName','The Name of the SubTable','The Name of the SubTable');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (255,0,'dbdocssubtables','subTableTemplate','The SubTable Template','The SubTable Template, Used to create the SubTableContent field content');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (256,0,'dbdocstable','tableName','The table name to link the note to.','The table name to link the note to.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (257,0,'dbdocstable','tableNotes','The table note text.','The table note text.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (258,0,'game_event_status','event','The Event Id (see game_event.is) of currently active game events.','The Event Id (see game_event.is) of currently active game events.<br />\r\n\r\nOnce the event is complete, the entry is removed.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (259,0,'gameobject_respawn','guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (260,0,'gameobject_respawn','instance','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (261,0,'gameobject_respawn','respawntime','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (262,0,'group_instance','instance','ID of the Instance session the group has enterd.','ID of the Instance session the group has enterd.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (263,0,'group_instance','leaderGuid','The Guid of the group leader. (See characters.guid)','The Guid of the group leader. (See characters.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (264,0,'group_instance','permanent','Boolean flag if the group is bound to the Instance or not','Boolean flag if the group is bound to the Instance or not');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (265,0,'group_member','assistant','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (266,0,'group_member','groupId','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (267,0,'group_member','memberGuid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (268,0,'group_member','subgroup','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (269,0,'groups','groupId','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (270,0,'groups','icon1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (271,0,'groups','icon2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (272,0,'groups','icon3','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (273,0,'groups','icon4','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (274,0,'groups','icon5','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (275,0,'groups','icon6','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (276,0,'groups','icon7','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (277,0,'groups','icon8','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (278,0,'groups','isRaid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (279,0,'groups','leaderGuid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (280,0,'groups','looterGuid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (281,0,'groups','lootMethod','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (282,0,'groups','lootThreshold','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (283,0,'groups','mainAssistant','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (284,0,'groups','mainTank','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (285,0,'guild','BackgroundColor','The background color of the guild tabard.','The background color of the guild tabard.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (286,0,'guild','BorderColor','The border color of the guild tabard.','The border color of the guild tabard.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (287,0,'guild','BorderStyle','The border style of the guild tabard.','The border style of the guild tabard.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (288,0,'guild','createdate','The date when the guild was created.','The date when the guild was created.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (289,0,'guild','EmblemColor','The emblem color of the guild tabard.','The emblem color of the guild tabard.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (290,0,'guild','EmblemStyle','The emblem style of the guild tabard.','The emblem style of the guild tabard.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (291,0,'guild','guildid','The ID of the guild.','The ID of the guild. This number is unique to each guild and is the main method to identify a guild.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (292,0,'guild','info','The text message that appears in the Guild Information box.','The text message that appears in the Guild Information box.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (293,0,'guild','leaderguid','The GUID of the character who created the guild. (See characters.guid)','The GUID of the character who created the guild. (See characters.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (294,0,'guild','motd','The text that appears in the Message Of The Day box.','The text that appears in the Message Of The Day box.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (295,0,'guild','name','The guild name.','The guild name.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (296,0,'guild_eventlog','EventType','The Guild Event Type.','The Guild Event Type:\r\n\r\n¬subtable:20¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (297,0,'guild_eventlog','guildid','Id of related guild. (See guild.guildid).','Id of related guild. (See guild.guildid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (298,0,'guild_eventlog','LogGuid','A unique identifier given to each log entry to distinguish it.','A unique identifier given to each log entry to distinguish one entry from another. Two guild event logs can NOT have same GUID.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (299,0,'guild_eventlog','NewRank','Id of new rank of PlayerGuid2. (See guild_rank.rid)','Id of new rank of PlayerGuid2. (See guild_rank.rid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (300,0,'guild_eventlog','PlayerGuid1','Guid of character who made the change. (See character.guid)','Guid of character who made the change. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (301,0,'guild_eventlog','PlayerGuid2','Guid of character who was \"changed\". (See character.guid)','Guid of character who was \"changed\". (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (302,0,'guild_eventlog','TimeStamp','Unix timestamp of when the event happened.','Unix timestamp of when the event happened.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (303,0,'guild_member','guid','The GUID of the player. (See character.guid)','The GUID of the player. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (304,0,'guild_member','guildid','The ID of the guild that the member is a part of. (See guild.guildid)','The ID of the guild that the member is a part of. (See guild.guildid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (305,0,'guild_member','offnote','The Officers Note set by officers in the guild.','The Officers Note set by officers in the guild, which can only be read by other officers of the guild.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (306,0,'guild_member','pnote','The Player Note set by the player.','The Player Note set by the player, which can be read by everyone in the guild.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (307,0,'guild_member','rank','The rank that the player has in the guild. (See guild_rank.rid)','The rank that the player has in the guild. (See guild_rank.rid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (308,0,'guild_rank','guildid','The guild ID that the rank is part of. (See guild.guildid)','The guild ID that the rank is part of. (See guild.guildid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (309,0,'guild_rank','rid','The particular rank ID. This number must be unique to each rank in a guild.','The particular rank ID. This number must be unique to each rank in a guild.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (310,0,'guild_rank','rights','The rights a player with this rank has in the guild.','The rights a player with this rank has in the guild. \r\nThe calculation of multiple rights is a bit different in this case as the rights do not all have 2^n values. \r\nTo combine ranks, you must do the OR operation (&#124;) on the two flags.<br />\r\n\r\n¬subtable:21¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (311,0,'guild_rank','rname','The name of the rank that is displayed in-game.','The name of the rank that is displayed in-game.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (312,0,'instance','data','Specific data belonging to the individual instance.','Specific data belonging to the individual instance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (313,0,'instance','id','The instance ID. This number is unique to every instance.','The instance ID. This number is unique to every instance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (314,0,'instance','map','The map ID the instance is in. (See Map.dbc)','The map ID the instance is in. (See Map.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (315,0,'instance','resettime','The time when the instance will be reset, in Unix time.','The time when the instance will be reset, in Unix time. This field is zero for raid and heroic instances.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (316,0,'instance_reset','mapid','The map ID of the instance. (See Map.dbc)','The map ID of the instance. (See Map.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (317,0,'instance_reset','resettime','Dungeon reset time in seconds.','Dungeon reset time in seconds.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (318,0,'item_instance','data','Much like the playerbytes fields in the characters table.','Much like the playerbytes fields in the characters table, this field has many number fields all separated by a space which contain specific individual item information like any enchantments applied to the item, etc.\r\n\r\n¬subtable:22¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (319,0,'item_instance','guid','The GUID of the item. This number is unique for each item instance.','The GUID of the item. This number is unique for each item instance.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (320,0,'item_instance','owner_guid','The GUID of the character who has ownership of this item. (See character.guid)','The GUID of the character who has ownership of this item. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (321,0,'item_loot','amount','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (322,0,'item_loot','guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (323,0,'item_loot','itemid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (324,0,'item_loot','owner_guid','The GUID of the owner. (See character.guid)','The GUID of the owner. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (325,0,'item_loot','property','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (326,0,'item_text','id','The text entry ID. This number is unique to every text entry in this table.','The text entry ID. This number is unique to every text entry in this table.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (327,0,'item_text','text','The actual text that was sent as mail using the mail system.','The actual text that was sent as mail using the mail system. There are some special messages that are sent through the mail and therefore use this table but have a special format to them:\r\n\r\n<pre>Auction won (sent to bidder): \"&lt;owner\'s GUID as hex&gt;:&lt;winning bid in copper&gt;:&lt;buyout price in copper&gt;\"\r\n\r\nAuction successful (sent to owner): \"&lt;bidder\'s GUID as hex&gt;:&lt;winning bid in copper&gt;:0: &lt;deposit in copper&gt;:&lt;auction cut in copper&gt;\"</pre>\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (328,0,'mail','checked','checked_flag\r\n.','checked_flag\r\n\r\nFlag Mask:<br />\r\n\r\n¬subtable:25¬\r\n<br />\r\nCommon values:<br />\r\n\r\n¬subtable:26¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (329,0,'mail','cod','Amount of money needed (COD).','Amount of money needed (COD).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (330,0,'mail','deliver_time','Current Unix Time + Unix Time till delivery.','Current Unix Time + Unix Time till delivery.<br />\r\nExample:<br />\r\ncurrent unix time + 86400 (seconds for one day) = delivery date<br />\r\nIn this example the mail would be delivered after one day.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (331,0,'mail','expire_time','Current Unix Time + Unix Time till expiry.','Current Unix Time + Unix Time till expiry.<br />\r\nExample:<br />\r\ncurrent unix time + 86400 (seconds for one day) = expiry date<br />\r\nIn this example the mail would expire after one day.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (332,0,'mail','has_items','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (333,0,'mail','id','Unique message id. Every new message gets a new auto incremented id.','Unique message id. Every new message gets a new auto incremented id.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (334,0,'mail','itemTextId','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (335,0,'mail','mailTemplateId','The Mail Template Id (See MailTemplate.dbc)','The Mail Template Id (See MailTemplate.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (336,0,'mail','messageType','message_type.','The type of the Message:</br >\r\n\r\n¬subtable:23¬');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (337,0,'mail','money','Amount of money sent.','Amount of money sent.<br />\r\nIf you want to send 100 gold 55 silver 33 copper then its 1005533');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (338,0,'mail','receiver','Guid of the character who receives the mail.','Guid of the character who receives the mail.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (339,0,'mail','sender','Guid of the character who sends the mail.','Guid of the character who sends the mail.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (340,0,'mail','stationery','The StationeryID (See Stationery.dbc).','The StationeryID (See Stationery.dbc).<br />\r\n\r\n¬subtable:24¬\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (341,0,'mail','subject','The Subject of the mail.','The Subject of the mail.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (342,0,'mail_items','item_guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (343,0,'mail_items','item_template','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (344,0,'mail_items','mail_id','The Mail Id (See mail.id).','The Mail Id (See mail.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (345,0,'mail_items','receiver','Guid of the character who receives the mail.','Guid of the character who receives the mail.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (346,0,'pet_aura','basepoints0','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (347,0,'pet_aura','basepoints1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (348,0,'pet_aura','basepoints2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (349,0,'pet_aura','caster_guid','The GUID of the player or creature who casted the aura. (See character.guid)','The GUID of the player or creature who casted the aura. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (350,0,'pet_aura','effIndexMask','The effect index of the spell from which the aura came from.','The effect index of the spell from which the aura came from. A spell has up to three effects, with the index being 0, 1, or 2.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (351,0,'pet_aura','guid','The GUID of the target affected by the aura. (See character.guid)','The GUID of the target affected by the aura. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (352,0,'pet_aura','item_guid','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (353,0,'pet_aura','maxduration','The maximum duration of the aura.','The maximum duration of the aura.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (354,0,'pet_aura','periodictime0','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (355,0,'pet_aura','periodictime1','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (356,0,'pet_aura','periodictime2','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (357,0,'pet_aura','remaincharges','The number of charges remaining on the aura.','The number of charges remaining on the aura.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (358,0,'pet_aura','remaintime','The time remaining in seconds on the aura. -1 means that the aura is indefinite.','The time remaining in seconds on the aura. -1 means that the aura is indefinite.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (359,0,'pet_aura','spell','The spell from which the aura was applied. (See Spell.dbc column 1)','The spell from which the aura was applied. (See Spell.dbc column 1)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (360,0,'pet_aura','stackcount','zzzz','zzzz');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (361,0,'pet_spell','active','Boolean 0 or 1 controlling if the spell is active or not.','Boolean 0 or 1 controlling if the spell is active or not.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (362,0,'pet_spell','guid','The pet GUID. (See character_pet.id).','The pet GUID. (See character_pet.id).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (363,0,'pet_spell','spell','The spell ID. See (Spell.dbc)','The spell ID. See (Spell.dbc)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (364,0,'pet_spell_cooldown','guid','The GUID of the pet. (See character_pet.id)','The GUID of the pet. (See character_pet.id)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (365,0,'pet_spell_cooldown','spell','The spell ID to which the cooldown applies.','The spell ID to which the cooldown applies.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (366,0,'pet_spell_cooldown','time','The time when the cooldown expires, in Unix time.','The time when the cooldown expires, in Unix time.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (367,0,'petition','name','The name of the guild or arena team that the player is trying to petition.','The name of the guild or arena team that the player is trying to ask for petitions for.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (368,0,'petition','ownerguid','The petition’s owner’s GUID. (See characters.guid)','The petition’s owner’s GUID. (See characters.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (369,0,'petition','petitionguid','The GUID of the petition item. See (item_instance.guid)','The GUID of the petition item. See (item_instance.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (370,0,'petition_sign','ownerguid','The GUID of the owner that is trying to make the guild/arena team.','The GUID of the owner that is trying to make the guild/arena team. (See characters.guid).');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (371,0,'petition_sign','petitionguid','The GUID of the charter item. (See item_template.guid)','The GUID of the charter item. (See item_template.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (372,0,'petition_sign','player_account','The account ID of the player that has signed the charter (See account.id).','The account ID of the player that has signed the charter (See account.id). No two players can sign the same charter from the same account.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (373,0,'petition_sign','playerguid','The GUID of the player that has signed the charter. (See character.guid)','The GUID of the player that has signed the charter. (See character.guid)');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (374,0,'saved_variables','cleaning_flags','The flags controlling character cleanup.','The flags controlling character cleanup:<br />\r\n\r\n¬subtable:27¬\r\n');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (375,0,'saved_variables','NextMaintenanceDate','The Date when the Honor Points / Rank etc. are updated.','The Date when the Honor Points / Rank etc. are updated.<br />\r\n\r\nThe date is then set 7 days in the future.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (376,0,'world','data','Specific data belonging to the world.','Specific data belonging to the world.');
INSERT  INTO `dbdocsfields`(`fieldId`,`languageId`,`tableName`,`fieldName`,`fieldComment`,`fieldNotes`) VALUES (377,0,'world','map','The map ID (See Map.dbc)','The map ID (See Map.dbc)');
-- UNLOCK TABLES;

--
-- Table structure for table `dbdocsfields_localised`
--
DROP TABLE IF EXISTS `dbdocsfields_localised`;

CREATE TABLE `dbdocsfields_localised` (
  `fieldId` INT(11) NOT NULL COMMENT 'dbdocsfields.fieldId to link to.',
  `languageId` INT(11) NOT NULL COMMENT 'dbdocsLanguageId to link to. (Normally 0 = English)',
  `fieldNotes` TEXT COLLATE utf8_unicode_ci NOT NULL COMMENT 'Additional Field Notes',
  `fieldComment` VARCHAR(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Main field Note',
  PRIMARY KEY (`fieldId`,`languageId`),
  KEY `fieldId` (`fieldId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `dbdocslanguage`
--
DROP TABLE IF EXISTS `dbdocslanguage`;

CREATE TABLE `dbdocslanguage` (
  `LanguageId` INT(11) NOT NULL COMMENT 'LanguageId for this Language',
  `LanguageName` VARCHAR(30) NOT NULL COMMENT 'The Language Name',
  PRIMARY KEY (`LanguageId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `dbdocslanguage` */
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (0,'English');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (1,'Korean');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (2,'French');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (3,'German');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (4,'Chinese');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (5,'Taiwanese');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (6,'Spanish (Spain)');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (7,'Spanish (Latin America)');
INSERT  INTO `dbdocslanguage`(`LanguageId`,`LanguageName`) VALUES (8,'Russian');
-- UNLOCK TABLES;

--
-- Table structure for table `dbdocssubtables`
--
DROP TABLE IF EXISTS `dbdocssubtables`;

CREATE TABLE `dbdocssubtables` (
  `subTableId` INT(11) NOT NULL COMMENT 'Unique Lookup Id',
  `languageId` INT(11) NOT NULL DEFAULT '0' COMMENT 'dbdocsLanguageId to link to. (Normally 0 = English)',
  `subTableName` VARCHAR(80) DEFAULT NULL COMMENT 'Description of Content',
  `subTableContent` TEXT NOT NULL COMMENT 'The Sub Table Content',
  `subTableTemplate` TEXT NOT NULL COMMENT 'The Sub Table Template',
  PRIMARY KEY (`subTableId`,`languageId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `dbdocssubtables` */
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (10,0,'Gender','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Gender</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Male</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Female</td></tr>\r\n</table>','Value|<Gender\r\n0|Male\r\n1|Female');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (11,0,'At Login','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Force character to change name</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>Reset spells (professions as well)</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Reset talents</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'left\' valign=\'middle\'>Character Customization enabled</td></tr>\r\n</table>\r\n','Value|<Meaning\r\n1|Force character to change name\r\n2|Reset spells (professions as well)\r\n4|Reset talents\r\n8|Character Customization enabled');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (12,0,'Races','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Index</b></th>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Race Name</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Human</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>Orc</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Dwarf</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>8</td><td align=\'left\' valign=\'middle\'>Night Elf</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>5</td><td align=\'center\' valign=\'middle\'>16</td><td align=\'left\' valign=\'middle\'>Undead</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'center\' valign=\'middle\'>32</td><td align=\'left\' valign=\'middle\'>Tauren</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>7</td><td align=\'center\' valign=\'middle\'>64</td><td align=\'left\' valign=\'middle\'>Gnome</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>128</td><td align=\'left\' valign=\'middle\'>Troll</td></tr>\r\n</table>\r\n','Index|Value|<Race Name\r\n1|1|Human\r\n2|2|Orc\r\n3|4|Dwarf\r\n4|8|Night Elf\r\n5|16|Undead\r\n6|32|Tauren\r\n7|64|Gnome\r\n8|128|Troll');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (13,0,'Buttons','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Button ID\'s</b></th>\r\n<th><b>Set (key)</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1-11</td><td align=\'center\' valign=\'middle\'>1 (SHIFT + 1)</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>12-23</td><td align=\'center\' valign=\'middle\'>2 (SHIFT + 2)</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>24-35</td><td align=\'center\' valign=\'middle\'>3 (SHIFT + 3) == Right Side Bar</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>36-47</td><td align=\'center\' valign=\'middle\'>4 (SHIFT + 4) == Right Side Bar 2</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>48-59</td><td align=\'center\' valign=\'middle\'>5 (SHIFT + 5) == Bottom Right Bar</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>60-71</td><td align=\'center\' valign=\'middle\'>6 (SHIFT + 6) == Bottom Left Bar</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>72-83</td><td align=\'center\' valign=\'middle\'>1 SpecialA</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>84-95</td><td align=\'center\' valign=\'middle\'>1 SpecialB</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>96-107</td><td align=\'center\' valign=\'middle\'>1 SpecialC</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>108-119</td><td align=\'center\' valign=\'middle\'>1 SpecialD</td></tr>\r\n</table>\r\n','Button ID\'s|Set (key)\r\n 1-11 | 1 (SHIFT + 1)\r\n 12-23 | 2 (SHIFT + 2)\r\n 24-35 | 3 (SHIFT + 3) == Right Side Bar\r\n 36-47 | 4 (SHIFT + 4) == Right Side Bar 2\r\n 48-59 | 5 (SHIFT + 5) == Bottom Right Bar\r\n 60-71 | 6 (SHIFT + 6) == Bottom Left Bar\r\n 72-83 | 1 SpecialA\r\n 84-95 | 1 SpecialB\r\n 96-107 | 1 SpecialC\r\n 108-119 | 1 SpecialD');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (14,0,'Action Type','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th><b>Possible types</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'center\' valign=\'middle\'>Spell</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>64</td><td align=\'center\' valign=\'middle\'>Macro</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>128</td><td align=\'center\' valign=\'middle\'>Item</td></tr>\r\n</table>\r\n','Value|Possible types\r\n0 | Spell\r\n64 | Macro\r\n128 | Item');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (15,0,'Character Slot','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Slot #</b></th>\r\n<th><b>Slot Name</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'center\' valign=\'middle\'>Head</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>Neck</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>Shoulders</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'center\' valign=\'middle\'>Body</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>Chest</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>5</td><td align=\'center\' valign=\'middle\'>Waist</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'center\' valign=\'middle\'>Legs</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>7</td><td align=\'center\' valign=\'middle\'>Feet</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>Wrists</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>9</td><td align=\'center\' valign=\'middle\'>Hands</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>10</td><td align=\'center\' valign=\'middle\'>Finger 1</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>11</td><td align=\'center\' valign=\'middle\'>Finger 2</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>12</td><td align=\'center\' valign=\'middle\'>Trinket 1</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>13</td><td align=\'center\' valign=\'middle\'>Trinket 2</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>14</td><td align=\'center\' valign=\'middle\'>Back</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>15</td><td align=\'center\' valign=\'middle\'>Main Hand</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>16</td><td align=\'center\' valign=\'middle\'>Off Hand</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>17</td><td align=\'center\' valign=\'middle\'>Ranged</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>18</td><td align=\'center\' valign=\'middle\'>Tabard</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>19-22</td><td align=\'center\' valign=\'middle\'>Equipped Bags</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>23-38</td><td align=\'center\' valign=\'middle\'>Main Backpack</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>39-62</td><td align=\'center\' valign=\'middle\'>Main Bank - 24 positions</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>63-68</td><td align=\'center\' valign=\'middle\'>Bank Bags - 6 positions</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>&nbsp;</td><td align=\'center\' valign=\'middle\'>later changed to</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>39-67</td><td align=\'center\' valign=\'middle\'>Main Bank - 28 positions&#160;?</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>68-74</td><td align=\'center\' valign=\'middle\'>Bank Bags - 7 positions&#160;?</td></tr>\r\n</table>\r\n','Slot #|Slot Name\r\n 0 | Head\r\n 1 | Neck\r\n 2 | Shoulders\r\n 3 | Body\r\n 4 | Chest\r\n 5 | Waist\r\n 6 | Legs\r\n 7 | Feet\r\n 8 | Wrists\r\n 9 | Hands\r\n 10 | Finger 1\r\n 11 | Finger 2\r\n 12 | Trinket 1\r\n 13 | Trinket 2\r\n 14 | Back\r\n 15 | Main Hand\r\n 16 | Off Hand\r\n 17 | Ranged\r\n 18 | Tabard\r\n 19-22 | Equipped Bags\r\n 23-38 | Main Backpack\r\n 39-62 | Main Bank - 24 positions\r\n 63-68 | Bank Bags - 6 positions\r\n|&nbsp;| later changed to\r\n 39-67 | Main Bank - 28 positions&#160;?\r\n 68-74 | Bank Bags - 7 positions&#160;?');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (16,0,'Quest Status','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th><b>Status Flag</b></th>\r\n<th align=\'left\'><b>Notes</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'center\' valign=\'middle\'>QUEST&#95;STATUS&#95;NONE</td><td align=\'left\' valign=\'middle\'>Quest isn\'t shown in quest list - default value</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>QUEST&#95;STATUS&#95;COMPLETE</td><td align=\'left\' valign=\'middle\'>Quest has been completed.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>QUEST&#95;STATUS&#95;UNAVAILABLE</td><td align=\'left\' valign=\'middle\'>Quest is unavailable to the character.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'center\' valign=\'middle\'>QUEST&#95;STATUS&#95;INCOMPLETE</td><td align=\'left\' valign=\'middle\'>Quest is active in quest log but incomplete</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>QUEST&#95;STATUS&#95;AVAILABLE</td><td align=\'left\' valign=\'middle\'>Quest is available to be taken by character</td></tr>\r\n</table>\r\n','Value|Status Flag|<Notes\r\n0|QUEST&#95;STATUS&#95;NONE|Quest isn\'t shown in quest list - default value\r\n1|QUEST&#95;STATUS&#95;COMPLETE|Quest has been completed.\r\n2|QUEST&#95;STATUS&#95;UNAVAILABLE|Quest is unavailable to the character.\r\n3|QUEST&#95;STATUS&#95;INCOMPLETE|Quest is active in quest log but incomplete\r\n4|QUEST&#95;STATUS&#95;AVAILABLE|Quest is available to be taken by character');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (17,0,'Reputation Flags','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Flag</b></th>\r\n<th><b>Flag Name</b></th>\r\n<th align=\'left\'><b>Notes</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;VISIBLE</td><td align=\'left\' valign=\'middle\'>Displayed in the reputation tab</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;AT&#95;WAR</td><td align=\'left\' valign=\'middle\'>Active when the player sets the at war checkbox</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;UNKNOWN</td><td align=\'left\' valign=\'middle\'>UNKNOWN</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;INVISIBLE</td><td align=\'left\' valign=\'middle\'>Not Displayed in the reputation tab</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>16</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;OWN&#95;TEAM</td><td align=\'left\' valign=\'middle\'>OWN&#95;TEAM</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>32</td><td align=\'center\' valign=\'middle\'>FACTION&#95;FLAG&#95;INACTIVE</td><td align=\'left\' valign=\'middle\'>INACTIVE</td></tr>\r\n</table>\r\n','Flag|Flag Name|<Notes\r\n1|FACTION&#95;FLAG&#95;VISIBLE|Displayed in the reputation tab\r\n2|FACTION&#95;FLAG&#95;AT&#95;WAR|Active when the player sets the at war checkbox\r\n4|FACTION&#95;FLAG&#95;UNKNOWN|UNKNOWN\r\n8|FACTION&#95;FLAG&#95;INVISIBLE|Not Displayed in the reputation tab\r\n16|FACTION&#95;FLAG&#95;OWN&#95;TEAM|OWN&#95;TEAM\r\n32|FACTION&#95;FLAG&#95;INACTIVE|INACTIVE');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (18,0,'Social Flags','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Friend</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Ignored</td></tr>\r\n</table>\r\n','Value|<Meaning\r\n0|Friend\r\n1|Ignored');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (19,0,'Corpse Type','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Member Name</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Bones</td><td align=\'left\' valign=\'middle\'>Bones only corpse.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>ResurrectablePvE</td><td align=\'left\' valign=\'middle\'>Ressurectable corpse, pve only.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>ResurrectablePvP</td><td align=\'left\' valign=\'middle\'>Ressurectable corpse, pvp only.</td></tr>\r\n</table>','Value|<Member Name|<Description\r\n0|Bones|Bones only corpse.\r\n1|ResurrectablePvE|Ressurectable corpse, pve only.\r\n2|ResurrectablePvP|Ressurectable corpse, pvp only.');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (20,0,'Guild Event Types','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_INVITE_PLAYER</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_JOIN_GUILD</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_PROMOTE_PLAYER</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_DEMOTE_PLAYER</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>5</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_UNINVITE_PLAYER</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'left\' valign=\'middle\'>GUILD_EVENT_LOG_LEAVE_GUILD</td></tr>\r\n</table>\r\n','Value|<Meaning\r\n1|GUILD_EVENT_LOG_INVITE_PLAYER\r\n2|GUILD_EVENT_LOG_JOIN_GUILD\r\n3|GUILD_EVENT_LOG_PROMOTE_PLAYER\r\n4|GUILD_EVENT_LOG_DEMOTE_PLAYER\r\n5|GUILD_EVENT_LOG_UNINVITE_PLAYER\r\n6|GUILD_EVENT_LOG_LEAVE_GUILD');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (21,0,'Guild Rights','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Flag</b></th>\r\n<th><b>Flag Name</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>64</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;EMPTY</td><td align=\'left\' valign=\'middle\'>Having just this flag by itself is equivalent to having no rights at all.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>65</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;GCHATLISTEN</td><td align=\'left\' valign=\'middle\'>Player can read messages in the guild general chat channel.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>66</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;GCHATSPEAK</td><td align=\'left\' valign=\'middle\'>Player can type messages in the guild general chat channel.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>68</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;OFFCHATLISTEN</td><td align=\'left\' valign=\'middle\'>Player can read messages in the guild officers channel.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>72</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;OFFCHATSPEAK</td><td align=\'left\' valign=\'middle\'>Player can type messages in the guild officers channel.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>80</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;INVITE</td><td align=\'left\' valign=\'middle\'>Can invite other players to guild.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>80</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;INVITE</td><td align=\'left\' valign=\'middle\'>Can invite other players to guild.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>96</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;REMOVE</td><td align=\'left\' valign=\'middle\'>Can kick other players out of guild.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>192</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;PROMOTE</td><td align=\'left\' valign=\'middle\'>Can promote other players.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>320</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;DEMOTE</td><td align=\'left\' valign=\'middle\'>Can demote other players.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4160</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;SETMOTD</td><td align=\'left\' valign=\'middle\'>Can change the guild message of the day.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8256</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;EPNOTE</td><td align=\'left\' valign=\'middle\'>Can edit other players\' personal notes.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>16448</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;VIEWOFFNOTE</td><td align=\'left\' valign=\'middle\'>Can view the officer notes of other players.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>32832</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;EOFFNOTE</td><td align=\'left\' valign=\'middle\'>Can edit officer notes of other players.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>61951</td><td align=\'center\' valign=\'middle\'>GR&#95;RIGHT&#95;ALL</td><td align=\'left\' valign=\'middle\'>Has all of the rights.</td></tr>\r\n</table>\r\n','Flag|Flag Name|<Meaning\r\n64|GR&#95;RIGHT&#95;EMPTY|Having just this flag by itself is equivalent to having no rights at all.\r\n65|GR&#95;RIGHT&#95;GCHATLISTEN|Player can read messages in the guild general chat channel.\r\n66|GR&#95;RIGHT&#95;GCHATSPEAK|Player can type messages in the guild general chat channel.\r\n68|GR&#95;RIGHT&#95;OFFCHATLISTEN|Player can read messages in the guild officers channel.\r\n72|GR&#95;RIGHT&#95;OFFCHATSPEAK|Player can type messages in the guild officers channel.\r\n80|GR&#95;RIGHT&#95;INVITE|Can invite other players to guild.\r\n80|GR&#95;RIGHT&#95;INVITE|Can invite other players to guild.\r\n96|GR&#95;RIGHT&#95;REMOVE|Can kick other players out of guild.\r\n192|GR&#95;RIGHT&#95;PROMOTE|Can promote other players.\r\n320|GR&#95;RIGHT&#95;DEMOTE|Can demote other players.\r\n4160|GR&#95;RIGHT&#95;SETMOTD|Can change the guild message of the day.\r\n8256|GR&#95;RIGHT&#95;EPNOTE|Can edit other players\' personal notes.\r\n16448|GR&#95;RIGHT&#95;VIEWOFFNOTE|Can view the officer notes of other players.\r\n32832|GR&#95;RIGHT&#95;EOFFNOTE|Can edit officer notes of other players.\r\n61951|GR&#95;RIGHT&#95;ALL|Has all of the rights.');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (22,0,'Item Instance Data','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Index</b></th>\r\n<th><b>Flag Name</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'center\' valign=\'middle\'>OBJECT&#95;FIELD&#95;GUID</td><td align=\'left\' valign=\'middle\'>Item GUID</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>OBJECT&#95;FIELD&#95;TYPE</td><td align=\'left\' valign=\'middle\'>Should be 3 (TYPE&#95;OBJECT + TYPE&#95;ITEM)</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'center\' valign=\'middle\'>OBJECT&#95;FIELD&#95;ENTRY</td><td align=\'left\' valign=\'middle\'>Entry</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>OBJECT&#95;FIELD&#95;SCALE&#95;X</td><td align=\'left\' valign=\'middle\'>1.0</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>5</td><td align=\'center\' valign=\'middle\'>OBJECT&#95;FIELD&#95;PADDING</td><td align=\'left\' valign=\'middle\'>Some padding, need more info here.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;OWNER</td><td align=\'left\' valign=\'middle\'>owner&#95;guid</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;CONTAINED</td><td align=\'left\' valign=\'middle\'>If the item is in a bag, the GUID of the bag item; otherwise owner GUID.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>10</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;CREATOR</td><td align=\'left\' valign=\'middle\'>GUID of character who created the item.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>12</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;GIFTCREATOR</td><td align=\'left\' valign=\'middle\'>GUID of character who created the \"item\". (See character_gifts.item_guid).</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>14</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;STACK&#95;COUNT</td><td align=\'left\' valign=\'middle\'>Current number of item copies in the stack.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>15</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;DURATION</td><td align=\'left\' valign=\'middle\'>Current duration (in milliseconds)</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>16</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;SPELL&#95;CHARGES</td><td align=\'left\' valign=\'middle\'>Current Number of charges left in the item</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>21</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;FLAGS</td><td align=\'left\' valign=\'middle\'>Flags from \"item&#95;template\" (See Item_template.flags).</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>22</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;ENCHANTMENT</td><td align=\'left\' valign=\'middle\'>Unknown</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>55</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;PROPERTY&#95;SEED</td><td align=\'left\' valign=\'middle\'>Also called ITEM&#95;FIELD&#95;SUFFIX&#95;FACTOR</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>56</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;RANDOM&#95;PROPERTIES&#95;ID</td><td align=\'left\' valign=\'middle\'>Unknown</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>57</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;ITEM&#95;TEXT&#95;ID</td><td align=\'left\' valign=\'middle\'>Text id used and shown by the item.</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>58</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;DURABILITY</td><td align=\'left\' valign=\'middle\'>Current item durability.</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>59</td><td align=\'center\' valign=\'middle\'>ITEM&#95;FIELD&#95;MAXDURABILITY</td><td align=\'left\' valign=\'middle\'>Maximum item durability.</td></tr>\r\n</table>\r\n','Index|Flag Name|<Meaning\r\n0|OBJECT&#95;FIELD&#95;GUID|Item GUID\r\n2|OBJECT&#95;FIELD&#95;TYPE|Should be 3 (TYPE&#95;OBJECT + TYPE&#95;ITEM)\r\n3|OBJECT&#95;FIELD&#95;ENTRY|Entry\r\n4|OBJECT&#95;FIELD&#95;SCALE&#95;X|1.0\r\n5|OBJECT&#95;FIELD&#95;PADDING|Some padding, need more info here.\r\n6|ITEM&#95;FIELD&#95;OWNER|owner&#95;guid\r\n8|ITEM&#95;FIELD&#95;CONTAINED|If the item is in a bag, the GUID of the bag item; otherwise owner GUID.\r\n10|ITEM&#95;FIELD&#95;CREATOR|GUID of character who created the item.\r\n12|ITEM&#95;FIELD&#95;GIFTCREATOR|GUID of character who created the \"item\". (See character_gifts.item_guid).\r\n14|ITEM&#95;FIELD&#95;STACK&#95;COUNT|Current number of item copies in the stack.\r\n15|ITEM&#95;FIELD&#95;DURATION|Current duration (in milliseconds)\r\n16|ITEM&#95;FIELD&#95;SPELL&#95;CHARGES|Current Number of charges left in the item\r\n21|ITEM&#95;FIELD&#95;FLAGS|Flags from \"item&#95;template\" (See Item_template.flags).\r\n22|ITEM&#95;FIELD&#95;ENCHANTMENT|Unknown\r\n55|ITEM&#95;FIELD&#95;PROPERTY&#95;SEED|Also called ITEM&#95;FIELD&#95;SUFFIX&#95;FACTOR\r\n56|ITEM&#95;FIELD&#95;RANDOM&#95;PROPERTIES&#95;ID|Unknown\r\n57|ITEM&#95;FIELD&#95;ITEM&#95;TEXT&#95;ID|Text id used and shown by the item.\r\n58|ITEM&#95;FIELD&#95;DURABILITY|Current item durability.\r\n59|ITEM&#95;FIELD&#95;MAXDURABILITY|Maximum item durability.');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (23,0,'Mail Message Type','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Type</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>NORMAL</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>COD</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n2</td><td align=\'left\' valign=\'middle\'>AUCTION</td></tr>\r\n</table>\r\n','Value|<Type\r\n0|NORMAL\r\n1|COD\r\n2|AUCTION');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (24,0,'Mail Stationary Type','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Type</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>plain &amp; purple scroll icon</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n41</td><td align=\'left\' valign=\'middle\'>Normal Mail</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n61</td><td align=\'left\' valign=\'middle\'>GM Mail</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n62</td><td align=\'left\' valign=\'middle\'>Auction House</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n64</td><td align=\'left\' valign=\'middle\'>Valentine\'s Day</td></tr>\r\n</table>\r\n','Value|<Type\r\n1|plain &amp; purple scroll icon\r\n41|Normal Mail\r\n61|GM Mail\r\n62|Auction House\r\n64|Valentine\'s Day');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (25,0,'Mail Checked Flags','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Hex Value</b></th>\r\n<th><b>Value</b></th>\r\n<th><b>Binary</b></th>\r\n<th align=\'left\'><b>ENUM Name</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x00</td><td align=\'center\' valign=\'middle\'>0</td><td align=\'center\' valign=\'middle\'>0000 0000</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_NONE  </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n0x01</td><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>0000 0001</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_READ</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n0x02</td><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>0000 0010</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_RETURNED</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n0x04</td><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>0000 0100</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_COPIED</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n0x08</td><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>0000 1000</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_COD_PAYMENT</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n0x10</td><td align=\'center\' valign=\'middle\'>16</td><td align=\'center\' valign=\'middle\'>0001 0000</td><td align=\'left\' valign=\'middle\'>MAIL_CHECK_MASK_HAS_BODY</td></tr>\r\n</table>','Hex Value|Value|Binary|<ENUM Name\r\n0x00|0|0000 0000|MAIL_CHECK_MASK_NONE  \r\n0x01|1|0000 0001|MAIL_CHECK_MASK_READ\r\n0x02|2|0000 0010|MAIL_CHECK_MASK_RETURNED\r\n0x04|4|0000 0100|MAIL_CHECK_MASK_COPIED\r\n0x08|8|0000 1000|MAIL_CHECK_MASK_COD_PAYMENT\r\n0x10|16|0001 0000|MAIL_CHECK_MASK_HAS_BODY');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (26,0,'Mail Checked Flags - Common','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>ENUM Name</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Mail has no body (subject only) [TODO: check this behaviour]</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n16</td><td align=\'left\' valign=\'middle\'>Mail was not read</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n17</td><td align=\'left\' valign=\'middle\'>Mail was read</td></tr>\r\n</table>','Value|<ENUM Name\r\n4|Mail has no body (subject only) [TODO: check this behaviour]\r\n16|Mail was not read\r\n17|Mail was read');
INSERT  INTO `dbdocssubtables`(`subTableId`,`languageId`,`subTableName`,`subTableContent`,`subTableTemplate`) VALUES (27,0,'Cleaning Flags','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th><b>Enum Name</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x2</td><td align=\'center\' valign=\'middle\'>CLEANING_FLAG_SKILLS</td><td align=\'left\' valign=\'middle\'>Clean out obsolete Skills (See character_skills).</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>0x4</td><td align=\'center\' valign=\'middle\'>CLEANING_FLAG_SPELLS</td><td align=\'left\' valign=\'middle\'>Clean out obsolete Spells (See character_spells).</td></tr>\r\n</table>\r\n','Value|Enum Name|<Meaning\r\n0x2|CLEANING_FLAG_SKILLS|Clean out obsolete Skills (See character_skills).\r\n0x4|CLEANING_FLAG_SPELLS|Clean out obsolete Spells (See character_spells).');

-- UNLOCK TABLES;

--
-- Table structure for table `dbdocssubtables_localised`
--
DROP TABLE IF EXISTS `dbdocssubtables_localised`;

CREATE TABLE `dbdocssubtables_localised` (
  `subTableId` INT(11) NOT NULL COMMENT 'dbdocsSubtableId to link to',
  `languageId` INT(11) NOT NULL DEFAULT '0' COMMENT 'dbdocsLanguageId to link to.',
  `subTableContent` TEXT NOT NULL COMMENT 'The Sub Table Content',
  `subTableTemplate` TEXT NOT NULL COMMENT 'The Sub Table Template',
  PRIMARY KEY (`subTableId`,`languageId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

--
-- Table structure for table `dbdocstable`
--
DROP TABLE IF EXISTS `dbdocstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocstable` (
  `tableId` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of this entry',
  `languageId` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Language Id for the Notes (Normally 0 for English)',
  `tableName` VARCHAR(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the table to add additional notes to',
  `tableNotes` TEXT COLLATE utf8_unicode_ci NOT NULL COMMENT 'The additional note to be added to the table',
  PRIMARY KEY (`tableId`,`languageId`,`tableName`),
  KEY `tableId` (`tableId`)
) ENGINE=INNODB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data for the table `dbdocstable`
--

-- LOCK TABLES `dbdocstable` WRITE;
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (1,0,'auction','Contains all information about the currently ongoing auctions in the auction houses. It controls what items are put up for auction and who put it up, who is the highest bidder, etc.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (2,0,'bugreport ','This table stores all the Bugs/Suggestions submitted in-game by Players.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (3,0,'character_action ','This table contains all the individual button data for each character. A button is any of the places in the GUI where you can place for example a spell, item, or macro as a shortcut.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (4,0,'character_aura','Contains aura information that is loaded when a character is loaded, so the auras that were on the character when it logged out are still kept when it logs back in. A spell can have up to three auras, one in each of its effects.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (5,0,'character_battleground_data','xxxx');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (6,0,'character_db_version','This table holds the current version of the character database.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (7,0,'character_gifts','This table holds data about wrapped/gift items.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (8,0,'character_homebind','Contains information on the location where characters get teleported when they use for example the soul stone or the .start command.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (9,0,'character_honor_cp','xxxx');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (10,0,'character_instance','Contains the instance data for characters.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (11,0,'character_inventory','Contains all the character inventory data, including the bank data.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (12,0,'character_pet','This table holds the pet data for each pet summoned by anyone in the game.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (13,0,'character_queststatus','Holds information on the quest status of each character.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (14,0,'character_reputation','This table holds the reputation information of each faction for the character.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (15,0,'character_skills','This table holds a listing of all skill for each character.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (16,0,'character_social','Contains data about characters’ friends/ignored list.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (17,0,'character_spell','Holds information for each character’s spells.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (18,0,'character_spell_cooldown','Holds the remaining cooldowns from either character spells or item spells for each character.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (19,0,'character_stats','This table holds information on all the stats regarding the character.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (20,0,'character_ticket','Holds ticket information from tickets written through the client help request -function.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (21,0,'character_tutorial','This table is used to store the tutorial state of all the characters.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (22,0,'character_whispers','This table is used to store whispers that have been sent by players.<br/> \r\nBy default it only stores whispers made in reply to tickets raised by players, but can be changed in mangos.conf to store all whispers.<br/>\r\nIt can also be completely disabled by the same setting.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (23,0,'characters','This table holds vital static information for each character. This information loaded and used to create the player objects in-game.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (24,0,'corpse','This table is used to store status of players corpse.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (25,0,'creature_respawn','This table holds the respawn time when creatures should be respawned in the world. In case of a server crash, this table holds the respawn data so that the creatures don\'t respawn immediately on server restart. How often the respawn time is saved for creatures can be controlled in mangosd.conf');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (26,0,'dbdocsfields','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a link to the table and field to allow additional notes to describe the field in the Wiki.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (27,0,'dbdocssubtables','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a table which dirctly replaces the link in the fieldnotes.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (28,0,'dbdocstable','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a additional notes field to describe the database in the Wiki.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (29,0,'game_event_status','Lists the currently active game events, ie. Darkmoon faire etc.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (30,0,'gameobject_respawn','This table holds the re-spawn time when game objects should be respawned in the world. In case of a server crash, this table holds the re-spawn data so that the game objects don\'t re-spawn immediately on server restart. How often the re-spawn time is saved for game objects can be controlled in mangosd.conf. Usually the only objects that despawn and need to be re-spawned are chests and doors.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (31,0,'group_instance','This table tracks a group of characters in an instance.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (32,0,'group_member','This table holds info about group members.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (33,0,'groups','This table holds basic info about groups.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (34,0,'guild','This table holds the main guild information. All created guilds or all guilds in the process of being created have a record in this table.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (35,0,'guild_eventlog','This table holds information about changes in guilds membership.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (36,0,'guild_member','This table holds information on the members of all guilds, their ranks in the guild, and any notes made by them or by guild officers.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (37,0,'guild_rank','This table holds the information on all of the ranks available in a guild along with their names and what rights a person with that rank has.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (38,0,'instance','This table holds static information on all current instances that have not yet been reset.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (39,0,'instance_reset','This table holds information about the instance reset time.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (40,0,'item_instance','This table holds individual item instance information for all items currently equipped or in some kind of character bag or bank.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (41,0,'item_loot','Contains the items associated with a lootable inventory items.\r\nThis table is populated the first time the player right-clicks to open an item. Rows are deleted when\r\nthe player either removes an item or destroys the container item.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (42,0,'item_text','This table is part of the mail system and holds the text information of every letter.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (43,0,'mail','This table contains main data about all mails in the game.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (44,0,'mail_items','This table contains data regarding items from item_instance which are being sent via email.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (45,0,'pet_aura','This table contains aura information that is loaded when a pet is loaded, so the auras that were on the pet when the owner character logged out are still kept when they log back in. A spell can have up to three auras, one in each of its effects.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (46,0,'pet_spell','This table holds information on individual pet spells.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (47,0,'pet_spell_cooldown','This table holds information on pet spell cooldowns.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (48,0,'petition','This table holds information on all ongoing petitions for a guild or for an arena team.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (49,0,'petition_sign','This table holds information on all the signatures of a petition for either a guild or an arena team.');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (50,0,'saved_variables','Stores server required values.<br />\r\ni.e. Character Database cleanup flags and Honor Point / Rank reset date\r\n');
INSERT  INTO `dbdocstable`(`tableId`,`languageId`,`tableName`,`tableNotes`) VALUES (51,0,'world','Stores World Status information');
-- UNLOCK TABLES;

--
-- Table structure for table `dbdocstable_localised`
--
DROP TABLE IF EXISTS `dbdocstable_localised`;

CREATE TABLE `dbdocstable_localised` (
  `tableId` INT(11) NOT NULL COMMENT 'The dbdocsTableId to link to',
  `languageId` INT(11) NOT NULL DEFAULT '0' COMMENT 'The dbdocsLanguageId to link to',
  `tableNotes` TEXT COLLATE utf8_unicode_ci NOT NULL COMMENT 'The additional note to be added to the table',
  PRIMARY KEY (`tableId`,`languageId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `game_event_status`
--

DROP TABLE IF EXISTS `game_event_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event_status` (
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_event_status`
--

LOCK TABLES `game_event_status` WRITE;
/*!40000 ALTER TABLE `game_event_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameobject_respawn`
--

LOCK TABLES `gameobject_respawn` WRITE;
/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_instance`
--

DROP TABLE IF EXISTS `group_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_instance` (
  `leaderGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaderGuid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_instance`
--

LOCK TABLES `group_instance` WRITE;
/*!40000 ALTER TABLE `group_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_member` (
  `groupId` int(11) unsigned NOT NULL,
  `memberGuid` int(11) unsigned NOT NULL,
  `assistant` tinyint(1) unsigned NOT NULL,
  `subgroup` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`memberGuid`),
  KEY `Idx_memberGuid` (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupId` int(11) unsigned NOT NULL,
  `leaderGuid` int(11) unsigned NOT NULL,
  `mainTank` int(11) unsigned NOT NULL,
  `mainAssistant` int(11) unsigned NOT NULL,
  `lootMethod` tinyint(4) unsigned NOT NULL,
  `looterGuid` int(11) unsigned NOT NULL,
  `lootThreshold` tinyint(4) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `isRaid` tinyint(1) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `leaderguid` int(6) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(5) NOT NULL DEFAULT '0',
  `EmblemColor` int(5) NOT NULL DEFAULT '0',
  `BorderStyle` int(5) NOT NULL DEFAULT '0',
  `BorderColor` int(5) NOT NULL DEFAULT '0',
  `BackgroundColor` int(5) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `createdate` bigint(20) unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_eventlog`
--

DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL default '0' COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL default '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL default '0',
  `ItemOrMoney` int(11) unsigned NOT NULL default '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL default '0',
  `DestTabId` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL default '0' COMMENT 'Event UNIX time',
  PRIMARY KEY  (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  INDEX `Idx_PlayerGuid`(`PlayerGuid`),
  INDEX `Idx_LogGuid`(`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guild_bank_eventlog`
--

LOCK TABLES `guild_bank_eventlog` WRITE;
/*!40000 ALTER TABLE `guild_bank_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_item`
--

DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL default '0',
  `TabId` tinyint(1) unsigned NOT NULL default '0',
  `SlotId` tinyint(3) unsigned NOT NULL default '0',
  `item_guid` int(11) unsigned NOT NULL default '0',
  `item_entry` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guildid`,`tabid`,`slotid`),
  KEY `guildid_key` (`guildid`),
  INDEX `Idx_item_guid`(`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guild_bank_item`
--

LOCK TABLES `guild_bank_item` WRITE;
/*!40000 ALTER TABLE `guild_bank_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_right`
--

DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL default '0',
  `TabId` tinyint(1) unsigned NOT NULL default '0',
  `rid` int(11) unsigned NOT NULL default '0',
  `gbright` tinyint(3) unsigned NOT NULL default '0',
  `SlotPerDay` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guild_bank_right`
--

LOCK TABLES `guild_bank_right` WRITE;
/*!40000 ALTER TABLE `guild_bank_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_bank_tab`
--

DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL default '0',
  `TabId` tinyint(1) unsigned NOT NULL default '0',
  `TabName` varchar(100) NOT NULL default '',
  `TabIcon` varchar(100) NOT NULL default '',
  `TabText` text,
  PRIMARY KEY  (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guild_bank_tab`
--

LOCK TABLES `guild_bank_tab` WRITE;
/*!40000 ALTER TABLE `guild_bank_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_eventlog`
--

DROP TABLE IF EXISTS `guild_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_eventlog` (
  `guildid` int(11) unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(1) unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(11) unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(11) unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(2) unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint(20) unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_eventlog`
--

LOCK TABLES `guild_eventlog` WRITE;
/*!40000 ALTER TABLE `guild_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_eventlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_member`
--

DROP TABLE IF EXISTS `guild_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_member` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pnote` varchar(255) NOT NULL DEFAULT '',
  `offnote` varchar(255) NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(11) unsigned NOT NULL default '0',
  `BankRemMoney` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab0` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab0` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab1` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab1` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab2` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab2` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab3` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab3` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab4` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab4` int(11) unsigned NOT NULL default '0',
  `BankResetTimeTab5` int(11) unsigned NOT NULL default '0',
  `BankRemSlotsTab5` int(11) unsigned NOT NULL default '0',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_member`
--

LOCK TABLES `guild_member` WRITE;
/*!40000 ALTER TABLE `guild_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_rank`
--

DROP TABLE IF EXISTS `guild_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_rank` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_rank`
--

LOCK TABLES `guild_rank` WRITE;
/*!40000 ALTER TABLE `guild_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_reset`
--

DROP TABLE IF EXISTS `instance_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_reset` (
  `mapid` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_reset`
--

LOCK TABLES `instance_reset` WRITE;
/*!40000 ALTER TABLE `instance_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_instance`
--

DROP TABLE IF EXISTS `item_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_instance`
--

LOCK TABLES `item_instance` WRITE;
/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_loot`
--

DROP TABLE IF EXISTS `item_loot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_loot` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemid` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `suffix` int(11) unsigned NOT NULL default '0',
  `property` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`itemid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_loot`
--

LOCK TABLES `item_loot` WRITE;
/*!40000 ALTER TABLE `item_loot` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_text`
--

DROP TABLE IF EXISTS `item_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_text` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_text`
--

LOCK TABLES `item_text` WRITE;
/*!40000 ALTER TABLE `item_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `itemTextId` int(11) unsigned NOT NULL DEFAULT '0',
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `deliver_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `cod` int(11) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_items`
--

DROP TABLE IF EXISTS `mail_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_items` (
  `mail_id` int(11) NOT NULL DEFAULT '0',
  `item_guid` int(11) NOT NULL DEFAULT '0',
  `item_template` int(11) NOT NULL DEFAULT '0',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_items`
--

LOCK TABLES `mail_items` WRITE;
/*!40000 ALTER TABLE `mail_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_aura`
--

DROP TABLE IF EXISTS `pet_aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_aura`
--

LOCK TABLES `pet_aura` WRITE;
/*!40000 ALTER TABLE `pet_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_spell`
--

DROP TABLE IF EXISTS `pet_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_spell`
--

LOCK TABLES `pet_spell` WRITE;
/*!40000 ALTER TABLE `pet_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_spell_cooldown`
--

DROP TABLE IF EXISTS `pet_spell_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_spell_cooldown`
--

LOCK TABLES `pet_spell_cooldown` WRITE;
/*!40000 ALTER TABLE `pet_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell_cooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petition`
--

DROP TABLE IF EXISTS `petition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petition`
--

LOCK TABLES `petition` WRITE;
/*!40000 ALTER TABLE `petition` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petition_sign`
--

DROP TABLE IF EXISTS `petition_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(11) unsigned NOT NULL DEFAULT '0',
  `playerguid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_account` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petition_sign`
--

LOCK TABLES `petition_sign` WRITE;
/*!40000 ALTER TABLE `petition_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition_sign` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `pvpstats_battlegrounds`
--

DROP TABLE IF EXISTS `pvpstats_battlegrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvpstats_battlegrounds` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `winner_team` TINYINT NOT NULL,
  `bracket_id` TINYINT UNSIGNED NOT NULL,
  `type` TINYINT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pvpstats_players`
--

DROP TABLE IF EXISTS `pvpstats_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvpstats_players` (
  `battleground_id` BIGINT UNSIGNED NOT NULL,
  `player_guid` INT UNSIGNED NOT NULL,
  `score_killing_blows` MEDIUMINT UNSIGNED NOT NULL,
  `score_deaths` MEDIUMINT UNSIGNED NOT NULL,
  `score_honorable_kills` MEDIUMINT UNSIGNED NOT NULL,
  `score_bonus_honor` MEDIUMINT UNSIGNED NOT NULL,
  `score_damage_done` MEDIUMINT UNSIGNED NOT NULL,
  `score_healing_done` MEDIUMINT UNSIGNED NOT NULL,
  `attr_1` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `attr_2` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `attr_3` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `attr_4` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `attr_5` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`battleground_id`, `player_guid`)
) ENGINE=INNODB;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `saved_variables`
--

DROP TABLE IF EXISTS `saved_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_variables` (
    `NextArenaPointDistributionTime` bigint(40) UNSIGNED NOT NULL DEFAULT '0',
    `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL default '0',
  `cleaning_flags` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Variable Saves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_variables`
--

LOCK TABLES `saved_variables` WRITE;
/*!40000 ALTER TABLE `saved_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world`
--

DROP TABLE IF EXISTS `world`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world` (
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world`
--

LOCK TABLES `world` WRITE;
/*!40000 ALTER TABLE `world` DISABLE KEYS */;
/*!40000 ALTER TABLE `world` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
