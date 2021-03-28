-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '01'; 
    SET @cOldContent = '024';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '01';
    SET @cNewContent = '025';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Greater Wind Stone rework';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Greater Wind Stone rework';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    -- Add missing text to Greater Wind Stone.
	DELETE FROM `npc_text` WHERE `ID` IN (7754,7774,7775,7776);
	INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`) VALUES
	(7754,'What bug comes before the lords of the Council?  A bug, no doubt, wishing to be squashed!','What bug comes before the lords of the Council?  A bug, no doubt, wishing to be squashed!',0,1),
	(7774,'A thunderous voice bellows from the stone...$B$BGreetings, commander. What news of Silithus do you bring the Lords of the Council?','A thunderous voice bellows from the stone...$B$BGreetings, commander. What news of Silithus do you bring the Lords of the Council?',0,1),
	(7775,'A thunderous voice bellows from the stone...$B$BI sense your Medallion of Station, cultist, but you have no ring of lordship?  Are you truly a commander of the Twilight\'s Hammer, or do you merely run errands for your betters?','A thunderous voice bellows from the stone...$B$BI sense your Medallion of Station, cultist, but you have no ring of lordship?  Are you truly a commander of the Twilight\'s Hammer, or do you merely run errands for your betters?',0,1),
	(7776,'A thunderous voice bellows from the stone...$B$BWhat is this?  I sense a little cultist scurrying about!  Run along, vermin, or face the wrath of the lords of the Council!','A thunderous voice bellows from the stone...$B$BWhat is this?  I sense a little cultist scurrying about!  Run along, vermin, or face the wrath of the lords of the Council!',0,1);

	-- Missing gossip menu added for Greater Wind Stone.
	DELETE FROM `gossip_menu` WHERE `entry` = 6543;
	INSERT INTO `gossip_menu` VALUES
	(6543,7754,6540,887),
	(6543,7774,0,894),
	(6543,7775,0,892),
	(6543,7776,0,888);

	-- Conditions for Greater Wind Stone gossip and gossip options added.
	DELETE FROM `conditions` WHERE `condition_entry` IN (894,915,916,917,918,887,892,888,914,913,912,911,893,891);
	INSERT INTO `conditions` (`condition_entry`,`type`,`value1`,`value2`,`comments`) VALUES
	(887,11,24746,0,'Greater Wind Stone GO gossip'),
	(888,1,24746,0,'Greater Wind Stone GO gossip'),
	(891,1,24748,0,'Greater Wind Stone GO gossip'),
	(892,-1,888,891,'Greater Wind Stone GO gossip'),
	(893,1,24782,0,'Greater Wind Stone GO gossip'),
	(894,-1,892,893,'Greater Wind Stone GO gossip'),
	(911,2,20447,1,'Greater Wind Stone GO gossip'),
	(912,2,20449,1,'Greater Wind Stone GO gossip'),
	(913,2,20448,1,'Greater Wind Stone GO gossip'),
	(914,2,20450,1,'Greater Wind Stone GO gossip'),
	(915,-1,894,911,'Greater Wind Stone GO gossip'),
	(916,-1,894,912,'Greater Wind Stone GO gossip'),
	(917,-1,894,913,'Greater Wind Stone GO gossip'),
	(918,-1,894,914,'Greater Wind Stone GO gossip');

	-- Added missing scripts for Greater Wind Stone.
	DELETE FROM `db_scripts` WHERE `id` IN (654301,654302,654303,654304,654305,6540);
	INSERT INTO `db_scripts` (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
	(2,654301,0,15,24785,0,0,0,4,0,0,0,0,0,0,0,0,'greater wind stone - random'),
	(2,654302,0,15,24787,0,0,0,4,0,0,0,0,0,0,0,0,'greater wind stone - fire'),
	(2,654303,0,15,24792,0,0,0,4,0,0,0,0,0,0,0,0,'greater wind stone - earth'),
	(2,654304,0,15,24791,0,0,0,4,0,0,0,0,0,0,0,0,'greater wind stone - air'),
	(2,654305,0,15,24793,0,0,0,4,0,0,0,0,0,0,0,0,'greater wind stone - water'),
	(2,6540,1,13,0,0,180502,10,1,0,0,0,0,0,0,0,0,'use Wind Stone trap'); -- Script buddy target?

	-- Update misplaced trap.
	UPDATE `gameobject` SET `position_x` = -7898.39, `position_y` = 1891.27, `position_z` = 9.22634, `orientation` = -2.87979, `rotation2` = 0.991445, `rotation3` = -0.130526 WHERE `guid` = 49299;

	-- gossip_menu_option added for Greater Wind Stone.
	DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6543;
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
	(6543,0,0,'The day of the judgement has come, fiend! I challenge you to battle!',1,1,-1,0,654301,0,0,NULL,894),
	(6543,1,0,'Prince Skaldrenox! I hold your signet! Heed my call!',1,1,-1,0,654302,0,0,NULL,915),
	(6543,2,0,'Baron Kazum! I hold your signet! Heed my call!',1,1,-1,0,654303,0,0,NULL,916),
	(6543,3,0,'High Marshal Whirlaxis! I hold your signet! Heed my call!',1,1,-1,0,654304,0,0,NULL,917),
	(6543,4,0,'Lord Skwol! I hold your signet! Heed my call!',1,1,-1,0,654305,0,0,NULL,918);

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
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


