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
    SET @cOldContent = '012';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '013';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest_updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest_updates';

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

	SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);

	UPDATE `creature_template` SET `GossipMenuId` = 7999 WHERE `Entry` = 19606;

	DELETE FROM `gossip_menu` WHERE `entry` = 7999;
	INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
	(7999,9853,0,0);

	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
	(@condition+1,9,10201,0),
	(@condition+2,1,32756,0);

	DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7999;
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
	(7999,0,0,'Grek, will you try out this new weapon oil Rakoria made?',1,1,-1,0,7999,0,0,NULL,@condition+1);

	DELETE FROM `db_scripts` WHERE `id` IN (7999,7761,7758,7755,11424);
	INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(2,7999,0,0,0,0,19606,10,0,2000000310,0,0,0,0,0,0,0,'Grek say 1'),
	(2,7999,5,1,15,0,19606,10,0,0,0,0,0,0,0,0,0,'Grek emote OneShotRoar'),
	(2,7999,6,0,0,0,19606,10,0,2000000311,0,0,0,0,0,0,0,'Grek say 2'),
	(2,7999,6,8,19606,1,0,0,0,0,0,0,0,0,0,0,0,'killcredit for quest 10201'),
	(2,7761,0,8,26466,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Advisor Kill Credit'),
	(2,7758,0,8,26464,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Initiate Kill Credit'),
	(2,7755,0,8,26465,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Laborer Kill Credit'),
	(8,11424,1,9,6781,180,0,0,0,0,0,0,0,0,0,0,0,'quest 9816'),
	(8,11424,5,8,18152,0,0,0,0,0,0,0,0,0,0,0,0,'quest 9816'),
	(8,11424,5,10,18152,10800,0,0,0,0,0,0,0,1176.53,8130.83,20.13,1.86,'quest 9816'),
	(8,11424,5,10,18152,10800,0,0,0,0,0,0,0,1176.53,8130.83,20.13,1.86,'quest 9816'),
	(8,11424,5,10,18152,10800,0,0,0,0,0,0,0,1176.53,8130.83,20.13,1.86,'quest 9816'),
	(8,11424,5,10,18152,10800,0,0,0,0,0,0,0,1176.53,8130.83,20.13,1.86,'quest 9816');

	UPDATE `db_scripts` SET `comments` = 1 WHERE `script_guid` = 1457;
	UPDATE `db_scripts` SET `comments` = 1 WHERE `script_guid` = 1458;

	DELETE FROM `db_script_string` WHERE `entry` IN (2000000310,2000000311);
	INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
	(2000000310,'Grek try!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL),
	(2000000311,'This oil no good for Grek! What Grek look like to you, some weakling in robes?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL);

	UPDATE `gossip_menu_option` SET `action_script_id` = 7755, `condition_id` = @condition+2 WHERE `menu_id` = 7757 AND `id` = 0;
	UPDATE `gossip_menu_option` SET `action_script_id` = 7758, `condition_id` = @condition+2 WHERE `menu_id` = 7759 AND `id` = 0;
	UPDATE `gossip_menu_option` SET `action_script_id` = 7761, `condition_id` = @condition+2 WHERE `menu_id` = 7760 AND `id` = 0;

	UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 26464, `ReqCreatureOrGOId2` = 26465, `ReqCreatureOrGOId3` = 26466 WHERE `entry` = 10041;
	UPDATE `gameobject` SET `orientation` = 5.56941 , `rotation2` = 0.23 , `rotation3` = -0.936989 WHERE `guid` = 6781;
    
    

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

