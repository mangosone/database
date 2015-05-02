ALTER TABLE db_version CHANGE COLUMN required_19002_creature_equip_template required_19003_spell_proc_event bit;

DELETE FROM `spell_proc_event` WHERE `entry` = 6346;
INSERT INTO `spell_proc_event` VALUES
( 6346, 0x7F, 0, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000, 0x00000000, 0x00000100, 0.000000, 0.000000, 0);