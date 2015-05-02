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
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_bonus_data` (
  `entry` smallint(5) unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_bonus_data`
--

LOCK TABLES `spell_bonus_data` WRITE;
/*!40000 ALTER TABLE `spell_bonus_data` DISABLE KEYS */;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (116,0.8143,0,0,0,'Mage - Frost Bolt'),
(120,0.1357,0,0,0,'Mage - Cone of Cold'),
(133,1,0,0,0,'Mage - Fire Ball'),
(172,0,0.156,0,0,'Warlock - Corruption'),
(331,0.8571,0,0,0,'Shaman - Healing Wave'),
(339,0,0.1,0,0,'Druid - Entangling Roots'),
(348,0.2,0.2,0,0,'Warlock - Immolate'),
(379,0,0,0,0,'Shaman - Earth Shield Triggered'),
(403,0.7143,0,0,0,'Shaman - Lightning Bolt'),
(585,0.714,0,0,0,'Priest - Smite'),
(603,0,2,0,0,'Warlock - Curse of Doom'),
(686,0.8571,0,0,0,'Warlock - Shadow Bolt'),
(703,0,0,0,0.03,'Rogue - Garrote'),
(755,0,0.2857,0,0,'Warlock - Health Funnel'),
(774,0,0.16,0,0,'Druid - Rejuvenation'),
(879,0.15,0,0.15,0,'Paladin - Exorcism'),
(974,0.2857,0,0,0,'Shaman - Earth Shield'),
(980,0,0.1,0,0,'Warlock - Curse of Agony'),
(1120,0,0.4286,0,0,'Warlock - Drain Soul'),
(1454,0.8,0,0,0,'Warlock - Life Tap'),
(1463,0.8053,0,0,0,'Mage - Mana Shield'),
(1495,0,0,0.2,0,'Hunter - Mongoose Bite'),
(1822,0,0,0,0.02,'Druid - Rake'),
(1949,0,0.0946,0,0,'Warlock - Hellfire'),
(1978,0,0,0,0.02,'Hunter - Serpent Sting'),
(2120,0.2357,0.122,0,0,'Mage - Flamestrike'),
(2812,0.07,0,0.07,0,'Paladin - Holy Wrath'),
(3044,0,0,0.15,0,'Hunter - Arcane Shot'),
(3606,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 1'),
(5138,0,0,0,0,'Warlock - Drain Mana'),
(5176,0.5714,0,0,0,'Druid - Wrath'),
(5185,1,0,0,0,'Druid - Healing Touch'),
(5570,0,0.127,0,0,'Druid - Insect Swarm'),
(5672,0,0.045,0,0,'Shaman - Healing Stream Totem'),
(5707,0,0,0,0,'Item - Lifestone Regeneration'),
(5857,0.1428,0,0,0,'Warlock - Hellfire Effect on Enemy Rank 1'),
(6229,0.3,0,0,0,'Warlock - Shadow Ward'),
(6350,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 2'),
(6351,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 3'),
(6352,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 4'),
(6353,1.15,0,0,0,'Warlock - Soul Fire'),
(7268,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 1'),
(7269,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 2'),
(7270,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 3'),
(8026,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 1'),
(8028,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 2'),
(8029,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 3'),
(8034,0.1,0,0,0,'Shaman - Frostbrand Attack Rank 1'),
(8042,0.3858,0,0,0,'Shaman - Earth Shock'),
(8050,0.2142,0.1,0,0,'Shaman - Flame Shock'),
(8056,0.3858,0,0,0,'Shaman - Frost Shock'),
(8129,0,0,0,0,'Priest - Mana Burn'),
(8188,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 1'),
(8418,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 5'),
(8419,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 4'),
(8443,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 1'),
(8504,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 2'),
(8505,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 3'),
(8921,0.1515,0.13,0,0,'Druid - Moonfire'),
(8936,0.3,0.1,0,0,'Druid - Regrowth'),
(9007,0,0,0,0.03,'Druid - Pounce Bleed'),
(10273,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 6'),
(10274,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 7'),
(10435,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 5'),
(10436,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 6'),
(10444,0,0,0,0,'Shaman - Flametongue Attack'),
(10445,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 4'),
(10582,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 2'),
(10583,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 3'),
(10584,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 4'),
(11113,0.1357,0,0,0,'Mage - Blast Wave Rank'),
(11310,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 4'),
(11311,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 5'),
(11538,0,0,0,0,'Item - Six Demon Bag - Frostbolt'),
(11681,0.1428,0,0,0,'Warlock - Hellfire Effect on Enemy Rank 2'),
(11682,0.1428,0,0,0,'Warlock - Hellfire Effect on Enemy Rank 3'),
(13797,0,0,0,0.02,'Hunter - Immolation Trap'),
(13812,0,0,0.1,0.1,'Hunter - Explosive Trap'),
(14914,0.5711,0.024,0,0,'Priest - Holy Fire'),
(15237,0.1606,0,0,0,'Priest - Holy Nova Damage'),
(15407,0,0.19,0,0,'Priest - Mind Flay'),
(15662,0,0,0,0,'Item - Six Demon Bag - Fireball'),
(16343,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 5'),
(16344,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 6'),
(17712,0,0,0,0,'Item - Lifestone Healing'),
(18220,0.96,0,0,0,'Warlock - Dark Pact'),
(18562,0,0,0,0,'Druid - Swiftmend'),
(18790,0,0,0,0,'Warlock - Fel Stamina'),
(20167,0.25,0,0.16,0,'Paladin - Seal of Light Proc'),
(20424,0.25,0,0.16,0,'Paladin - Seal of Command Proc'),
(20925,0.09,0,0.056,0,'Paladin - Holy Shield'),
(21179,0,0,0,0,'Item - Six Demon Bag - Chain Lightning'),
(23455,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 1'),
(23458,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 2'),
(23459,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 3'),
(24275,0.15,0,0.15,0,'Paladin - Hammer of Wrath'),
(25329,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 7'),
(25346,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 8'),
(25488,0.1,0,0,0,'Shaman - Flametongue Weapon Proc Rank 7'),
(25530,0.1667,0,0,0,'Shaman - Searing Totem Attack Rank 7'),
(25538,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 6'),
(25539,0.2142,0,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 7'),
(25551,0.1,0,0,0,'Shaman - Magma Totam Passive Rank 5'),
(25742,0.07,0,0.039,0,'Paladin - Seal of Righteousness Dummy Proc'),
(26363,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 7'),
(26364,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 1'),
(26365,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 2'),
(26366,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 3'),
(26367,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 4'),
(26369,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 5'),
(26370,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 6'),
(26371,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 8'),
(26372,0.33,0,0,0,'Shaman - Lightning Shield Proc Rank 9'),
(26573,0,0.04,0,0.04,'Paladin - Consecration'),
(27076,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 9'),
(27214,0.1428,0,0,0,'Warlock - Hellfire Effect on Enemy Rank 4'),
(27243,0.22,0.25,0,0,'Warlock - Seed of Corruption'),
(27803,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 4'),
(27804,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 5'),
(27805,0.1606,0,0,0,'Priest - Holy Nova Heal Rank 6'),
(28176,0,0,0,0,'Warlock - Fel Armor'),
(30108,0,0.24,0,0,'Warlock - Unstable Affliction'),
(30455,0.1429,0,0,0,'Mage - Ice Lance'),
(31024,0,0,0,0,'Item - Living Ruby Pedant'),
(31117,1.8,0,0,0,'Warlock - Unstable Affliction Dispell'),
(31661,0.1357,0,0,0,'Mage - Dragons Breath'),
(31803,0,0.013,0,0.15,'Paladin - Holy Vengeance'),
(31893,0.25,0,0.16,0,'Paladin - Seal of Blood Enemy Proc'),
(31935,0.07,0,0.07,0,'Paladin - Avengers Shiled'),
(32221,0.25,0,0.16,0,'Paladin - Seal of Blood Self Proc'),
(33745,0,0,0.01,0.01,'Druid - Lacerate'),
(33763,0.3429,0.0742,0,0,'Druid - Lifebloom'),
(34433,0.65,0,0,0,'Priest - Shadowfiend'),
(34913,0,0,0,0,'Mage - Molten Armor Triggered'),
(34914,0,0.4,0,0,'Priest - Vampiric Touch'),
(38395,0,0,0,0,'Item - Siphon Essence'),
(38700,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 10'),
(38703,0.2857,0,0,0,'Mage - Arcane Missiles Triggered Spell Rank 11'),
(40293,0,0,0,0,'Item - Siphon Essence'),
(42198,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 7'),
(42208,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 1'),
(42209,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 2'),
(42210,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 3'),
(42211,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 4'),
(42212,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 5'),
(42213,0.0952,0,0,0,'Mage - Blizzard Triggered Spell Rank 6'),
(42218,0.952,0,0,0,'Warlock - Rain of Fire Triggered Rank 5'),
(42223,0.952,0,0,0,'Warlock - Rain of Fire Triggered Rank 1'),
(42224,0.952,0,0,0,'Warlock - Rain of Fire Triggered Rank 2'),
(42225,0.952,0,0,0,'Warlock - Rain of Fire Triggered Rank 3'),
(42226,0.952,0,0,0,'Warlock - Rain of Fire Triggered Rank 4'),
(42231,0.12898,0,0,0,'Druid - Hurricane Triggered'),
(43733,0,0,0,0,'Item - Lightning Zap'),
(44203,0.1825,0,0,0,'Druid - Tranquility Triggered'),
(44459,0.4,0,0,0,'Mage - Living Bomb'),
(44461,0.4,0,0,0,'Mage - Living Bomb'),
(46567,0,0,0,0,'Item - Goblin Rocket Launcher');
/*!40000 ALTER TABLE `spell_bonus_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

