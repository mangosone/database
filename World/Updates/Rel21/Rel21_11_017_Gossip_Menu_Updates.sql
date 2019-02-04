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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '016';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '017';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Gossip Menu Updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Gossip Menu Updates';

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
-- Update gossip_menu, gossip_menu_option and adds conditions to NPC 16116 and 10304.
SET @gossipmenu := (SELECT MAX(entry) FROM `gossip_menu`);
DELETE FROM `gossip_menu` WHERE `text_id` IN (5796,5797);
INSERT INTO `gossip_menu` VALUES
(@gossipmenu+1,5796,0,0),
(@gossipmenu+2,5797,0,0);

-- Text0_0 Updat to bring core inline with others.
UPDATE `npc_text` SET `text0_0` = 'Please, leave this place, $N. You know nothing of what troubles us...', `text0_1` = '' WHERE `ID` = 5795;
UPDATE `npc_text` SET `text0_0` = 'Enchanted thorium is a highly sought-after metal. You best chance of finding some of it is to speak with an artisan blacksmith or miner.', `text0_1` = '' WHERE `ID` = 5796;
UPDATE `npc_text` SET `text0_0` = 'Crystal Restore is a difficult item to acquire, if you plan on finding it yourself.$B$BI believe that it comes from Un\'Goro Crater, so you\'d best head there. However, you might be able to find someone that is willing to part with their own supply...', `text0_1` = '' WHERE `ID` = 5797;
UPDATE `npc_text` SET `text0_0` = 'Why have you come here, $c?', `text0_1` = '' WHERE `ID` = 5816;
UPDATE `npc_text` SET `text0_0` = 'My people, they are as shattered as the relic you seek to repair.', `text0_1` = '' WHERE `ID` = 5817;
UPDATE `npc_text` SET `text0_0` = 'It is said that Kel\'Thuzad seeks the legendary Atiesh, greatstaff of the Guardian.$B$BYes, the very staff once held by Medivh.', `text0_1` = '' WHERE `ID` = 8350;
UPDATE `npc_text` SET `text0_0` = 'Like Kel\'Thuzad, I too was once a mage of the Kirin Tor. And like Kel\'Thuzad, I seek the legendary Atiesh, greatstaff of the Guardian. Our fates are intertwined as such, $c.', `text0_1` = '' WHERE `ID` = 8388;
UPDATE `npc_text` SET `text0_0` = 'Progeny of Aegwynn, he that would be the last Guardian of Tirisfal... Medivh.', `text0_1` = '' WHERE `ID` = 8389;
UPDATE `npc_text` SET `text0_0` = 'It is a story of legend and one that I do not have the time nor the inclination to retell. Just know that Medivh was the last of the Guardians. The greatstaff of Atiesh was a focal point of his power and a focal point of corruption.', `text0_1` = '' WHERE `ID` = 8390;
UPDATE `npc_text` SET `text0_0` = 'The corruption of a fallen titan. The corruption of the Destroyer. After all, the staff was forged from the seed of hate. That is, of course, what has brought me here...', `text0_1` = '' WHERE `ID` = 8391;
UPDATE `npc_text` SET `text0_0` = 'After the fall of Karazhan, the Kirin Tor dispatched an assembly of mages to search the tower and seize all items of import... for the purposes of "research." It was then that the fabled staff was discovered and brought back to Dalaran.', `text0_1` = '' WHERE `ID` = 8392;
UPDATE `npc_text` SET `text0_0` = 'What followed were a series of tragic events, leading to the death of every Kirin Tor mage that came into contact with Atiesh.$B$BYou see, it was an artifact with sentience. A sentience granted to it by Sargeras...', `text0_1` = '' WHERE `ID` = 8393;
UPDATE `npc_text` SET `text0_0` = '<Angela nods.>$B$BAfter the deaths, the Six decided that the best course of action was to seal the staff behind impenetrable barriers of magic and appoint a watcher: A guardian of the staff... I would be that watcher.', `text0_1` = '' WHERE `ID` = 8394;
UPDATE `npc_text` SET `text0_0` = 'There is not much more to tell. Dalaran was nearly wholly destroyed by Archimonde, the staff lost, presumably shattered by the barrier\'s fail-safe mechanisms.$B$BThere are those that believe the staff to be the cause of Archimonde\'s reprisal.', `text0_1` = '' WHERE `ID` = 8395;
UPDATE `npc_text` SET `text0_0` = 'After the fall of Dalaran, I took my leave from the Kirin Tor. I spent years watching over Atiesh, only to have my purpose amongst the Kirin Tor taken from me in one fell swoop. I would find the staff, though it might take a lifetime. That is how I came to join the Argent Dawn and why I am here now.', `text0_1` = '' WHERE `ID` = 8396;
UPDATE `npc_text` SET `text0_0` = 'Ah, a good question.$B$BIf you prefer hunting in the great outdoors, there are elementals here in the Plaguelands, Azshara, Burning Steppes, Felwood, Silithus, Winterspring, and even Un\'Goro Crater.$B$BIf you are the type that laughs in the face of danger, then perhaps you should visit Dire Maul. I have heard that a great many elemental abberations exist within its walls. You would also do well in seeking out the elementals employed by the Dark Iron dwarves of Blackrock Depths.', `text0_1` = '' WHERE `ID` = 8414;
UPDATE `gossip_menu` SET `condition_id` = 805 WHERE  entry = 4743 AND `text_id` = 5817;
-- Conditions
DELETE FROM `conditions` WHERE `condition_entry` IN (804,805);
INSERT INTO `conditions` VALUES
(804,9,5247,0,'Used in gossip_menu_option 4743'),
(805,8,5245,0,'Used in gossip_menu | text_id 4743 | 5817');
-- gossip menu option update to support new menu
UPDATE `gossip_menu_option` SET `action_menu_id` = @gossipmenu+1, `condition_id` = 804 WHERE `menu_id` = 4743 AND `id` = 0;
UPDATE `gossip_menu_option` SET `action_menu_id` = @gossipmenu+2, `condition_id` = 804 WHERE `menu_id` = 4743 AND `id` = 1;
    

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

