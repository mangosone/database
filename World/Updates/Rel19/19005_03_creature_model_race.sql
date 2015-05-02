ALTER TABLE db_version CHANGE COLUMN required_19005_02_gameobject_loot_template required_19005_03_creature_model_race bit;

-- Fixes wrong Totem Display for Horde (no error, working sql that definetly not crashing other entry's! I swear... :D)
INSERT INTO `creature_model_race` (`modelid`, `racemask`, `creature_entry`, `modelid_racial`) VALUES 
(19071, 690, 0, 4590),
(19073, 690, 0, 4588),
(19074, 690, 0, 4589),
(19075, 690, 0, 4587);
