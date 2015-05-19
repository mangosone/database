ALTER TABLE db_version CHANGE COLUMN `required_21000_02_warden_checks` `required_21000_03_Blades_Edge_Ogre_Brew` BIT;

-- version
INSERT IGNORE INTO `db_version` SET `Version` = 'MaNGOSOne Database Rev 21000_03';

-- Ogre brew can only be used in Blades Edge (see SD2 script by SylvainNeau)

UPDATE item_template SET ScriptName = 'item_ogre_brew' WHERE entry IN (32783, 32784);