-- ----------------------------------------
-- Added to prevent timeout's while loading
-- ----------------------------------------
SET GLOBAL net_read_timeout=30;
SET GLOBAL net_write_timeout=60;
SET GLOBAL net_buffer_length=1000000; 
SET GLOBAL max_allowed_packet=1000000000;
SET GLOBAL connect_timeout=10000000;

-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.3)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '09'; 
    SET @cOldContent = '008';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '009';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'item_loot_template cleanup';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'item_loot_template cleanup';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    -- The following items now contain proper loot.
	-- Quartermaster Zigris,' Footlocker, Followup Combat Assignment, Bloated Oily Blackmouth, Bloated Rockscale Cod, Bloated Mightfish, Gently Shaken Gift, Small Rocket Recipes, Cluster Rocket Recipes, Large Rocket Recipes, Large Cluster Rocket Recipes, Bundle of Nether Spikes, Dertrok,'s Wand Case, Tier 5 Druid Test Gear Box 2, Large Iron Metamorphosis Geode, Small Iron Metamorphosis Geode, Large Copper Metamorphosis Geode, Small Copper Metamorphosis Geode, Large Silver Metamorphosis Geode, Large Gold Metamorphosis Geode, Small Gold Metamorphosis Geode, Small Silver Metamorphosis Geode, Crudely Wrapped Gift, Pocket Full of Snow.
	DELETE FROM `item_loot_template` WHERE entry IN (21271,21740,21741,21742,21743,30320,30650,32624,32625,32626,32627,32628,32629,32630,32631,34077,35512,13247,32544,21243,21164,21162,21131);
	INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
	(21131,20943,10,1,1,1,0),
	(21131,20944,10,1,1,1,0),
	(21131,20945,10,1,1,1,0),
	(21131,20947,10,1,1,1,0),
	(21131,20948,10,1,1,1,0),
	(21131,21165,10,1,1,1,0),
	(21131,21166,10,1,1,1,0),
	(21131,21167,10,1,1,1,0),
	(21131,21245,10,1,1,1,0),
	(21131,21751,10,1,1,1,0),
	(21162,774,9,0,1,3,0),
	(21162,818,40,0,1,3,0),
	(21162,1206,11,0,1,2,0),
	(21162,1210,40,0,1,2,0),
	(21164,1529,43,1,1,2,0),
	(21164,1705,14,1,1,3,0),
	(21164,3864,28,1,1,3,0),
	(21164,5009,1,0,1,1,0),
	(21164,7909,5,1,1,1,0),
	(21164,11986,1.7,0,1,1,0),
	(21164,12009,1,0,1,1,0),
	(21164,12029,0.3,0,1,1,0),
	(21243,7553,4,0,1,1,0),
	(21243,7909,48,0,1,3,0),
	(21243,7910,30,0,1,3,0),
	(32544,30216,100,0,1,1,0),
	(32544,30217,100,0,1,1,0),
	(32544,30219,100,0,1,1,0),
	(32544,30220,100,0,1,1,0),
	(32544,30222,100,0,1,1,0),
	(32544,30223,100,0,1,1,0),
	(32544,30228,100,0,1,1,0),
	(32544,30229,100,0,1,1,0),
	(32544,30230,100,0,1,1,0),
	(32544,30231,100,0,1,1,0),
	(32544,30232,100,0,1,1,0),
	(32544,30233,100,0,1,1,0),
	(32544,30234,100,0,1,1,0),
	(32544,30235,100,0,1,1,0),
	(13247,16252,50,0,1,1,0),
	(13247,13252,50,0,1,1,0),
	(21271,21241,100,0,5,5,0),
	(21740,21724,100,0,1,1,0),
	(21740,21725,100,0,1,1,0),
	(21740,21726,100,0,1,1,0),
	(21741,21730,100,0,1,1,0),
	(21741,21731,100,0,1,1,0),
	(21741,21732,100,0,1,1,0),
	(21742,21727,100,0,1,1,0),
	(21742,21728,100,0,1,1,0),
	(21742,21729,100,0,1,1,0),
	(21743,21733,100,0,1,1,0),
	(21743,21734,100,0,1,1,0),
	(21743,21735,100,0,1,1,0),
	(30320,10007,100,0,-10007,6,0),
	(30650,30651,100,0,1,1,0),
	(30650,30652,100,0,1,1,0),
	(30650,30653,100,0,1,1,0),
	(30650,30654,100,0,1,1,0),
	(32624,31576,100,0,1,1,0),
	(32625,31583,100,0,1,1,0),
	(32626,31568,100,0,1,1,0),
	(32627,31575,100,0,1,1,0),
	(32628,31560,100,0,1,1,0),
	(32629,31552,100,0,1,1,0),
	(32630,31559,100,0,1,1,0),
	(32631,31567,100,0,1,1,0),
	(34077,34068,100,0,3,3,0),
	(34077,36877,25,0,1,1,0),
	(34077,37011,32,0,1,1,0),
	(34077,37586,95,0,1,1,0),
	(35512,17202,100,0,2,5,0),
	(37586,37582,0,1,1,1,0),
	(37586,37583,100,0,1,1,0),
	(37586,37584,0,1,1,1,0),
	(37586,37585,0,1,1,1,0);

	DELETE FROM `reference_loot_template` WHERE `entry` = 10007;
	INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES(10007,30319,100,0,200,200,0);

	-- Add Quartermaster Zigris' Footlocker
	DELETE FROM `creature_loot_template` WHERE `entry` = 9736 AND `item` IN (16252,13247,13252);
	INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (9736, 13247, 46);

	-- Curmudgeon's Payoff now contains 5 gold.
	UPDATE `item_template` SET `minMoneyLoot` = 5 , `maxMoneyLoot` = 5 WHERE `entry` = 23022;

	-- Add missing page text.
	DELETE FROM `page_text` WHERE `entry` = 3075;
	INSERT INTO `page_text` (`entry`, `text`) VALUES 
	(3075, 'Hi!\r\n\r\nI\'m not good at letters and so the matron helped me write this down for you.  I just want to say THANKS because you\'re a hero and maybe someday I can save people like you do.\r\n\r\nOk, I have to go play so THANKS AGAIN for being good and strong and and you\'re $ghandsome:pretty; too!\r\n\r\n--Your secret admirer');

	-- Add missing item to support this update.
	-- Removed in patch 1.5 (18636,6715,10595)
	DELETE FROM `item_template` WHERE `entry` IN (31575,36877,37011,37586,18636,6715,10595,37582,37583,37584,37585);
	INSERT INTO `item_template` (`entry`, `class`, `subclass`, `unk0`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`) VALUES
	(31575,4,3,-1,'Mistshroud Gauntlets',44201,3,0,1,26944,134722,10,-1,-1,115,70,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,407,0,0,0,0,0,0,0,0,0,0,1,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,5,0,0,203,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,275,0,52,0,0,0,0,0),
	(36877,0,0,-1,'Folded Letter',8927,1,0,1,0,0,0,-1,-1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,'',3075,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0),
	(37011,15,5,-1,'Magic Broom',56954,3,65728,1,0,0,0,-1,-1,1,20,762,75,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,500,0,0,47977,0,0,0,-1,330,3000,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,1209600,2),
	(37586,15,0,-1,'Handful of Candy',49839,1,131078,1,0,0,0,-1,-1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,'',0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0);

	INSERT INTO `item_template` (`entry`, `name`, `displayid`, `flags`, `itemlevel`, `delay`, `stackable`, `spellid_1`, `spellcooldown_1`, `description`, `material`, `Duration`) VALUES
	(37582,'Pyroblast Cinnamon Ball',29722,1,1,0,20,48889,1500,'',4,1209600),
	(37583,'G.N.E.R.D.S.',50455,1,1,0,20,48890,1500,'Gnomish Nutritional Effervescent Remarkably Delicious Sweets',4,1209600),
	(37584,'Soothing Spearmint Candy',37659,1,1,0,20,48891,1500,'',4,1209600),
	(37585,'Chewy Fel Taffy',13715,1,1,0,20,48892,1500,'Note: Contains no actual demonic energy.',4,1209600);


    

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;



        ELSE
            COMMIT;
            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
		IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
		ELSE
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;

