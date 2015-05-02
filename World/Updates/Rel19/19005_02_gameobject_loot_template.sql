ALTER TABLE db_version CHANGE COLUMN required_19005_01_spell_template required_19005_02_gameobject_loot_template bit;

-- Removes (if exists) the entry for the chest
DELETE FROM gameobject_loot_template WHERE entry=3239;

-- Add the chest-loot with correct loot (Quest-Item, part of a Quest). :)
INSERT INTO gameobject_loot_template VALUES (3239, 4883, 100, 0, 1, 1, 0);
