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
    SET @cOldContent = '021';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '022';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest_10310_updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest_10310_updates';

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
	-- Add scripted waypoints for Drijya.
    DELETE FROM `script_waypoint` WHERE `entry` = 20281;
	INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
	(20281,0,3096.42,2801.41,118.149,7000,'SAY_DRIJYA_START'),
	(20281,1,3096.52,2801.06,118.128,0,'SAY_DRIJYA_1'),
	(20281,2,3100,2796.67,118.118,0,''),
	(20281,3,3098.76,2786.17,117.125,0,''),
	(20281,4,3087.79,2754.6,115.441,0,''),
	(20281,5,3080.72,2730.79,115.93,9000,'SAY_DRIJYA_2'),
	(20281,6,3060.24,2731.31,115.122,0,''),
	(20281,7,3050.86,2727.39,114.054,0,''),
	(20281,8,3050.86,2727.39,114.054,8000,'SAY_DRIJYA_4'),
	(20281,9,3055.01,2724.97,113.687,0,''),
	(20281,10,3053.78,2718.43,113.684,0,''),
	(20281,11,3028.62,2693.38,114.67,0,''),
	(20281,12,3022.43,2695.3,113.406,0,''),
	(20281,13,3022.43,2695.3,113.406,8000,'SAY_DRIJYA_5'),
	(20281,14,3025.46,2700.75,113.514,0,''),
	(20281,15,3011.34,2716.78,113.691,0,''),
	(20281,16,3010.88,2726.99,114.239,0,''),
	(20281,17,3009.18,2729.08,114.324,0,''),
	(20281,18,3009.18,2729.08,114.324,15000,'SAY_DRIJYA_6'),
	(20281,19,3009.18,2729.08,114.324,6000,'SPELL_EXPLOSION_VISUAL'),
	(20281,20,3009.18,2729.08,114.324,8000,'SAY_DRIJYA_7'),
	(20281,21,3033.89,2736.44,114.369,0,''),
	(20281,22,3071.49,2741.5,116.462,0,''),
	(20281,23,3087.79,2754.6,115.441,0,''),
	(20281,24,3094.5,2770.2,115.744,0,''),
	(20281,25,3103.51,2784.36,116.857,0,''),
	(20281,26,3100,2796.67,118.118,0,''),
	(20281,27,3096.29,2801.03,118.096,0,'SAY_DRIJYA_COMPLETE');
	-- Script text added.
	DELETE FROM `script_texts` WHERE entry IN (-1000968,-1000969,-1000970,-1000971,-1000972,-1000973,-1000974,-1000975,-1000976);
	INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
	(-1000976,'Thank you, $n! I couldn\'t have done it without you. You\'ll let Gahruj know?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_COMPLETE'),
	(-1000975,'Ok, let\'s get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_7'),
	(-1000974,'That should do it. The teleporter should blow any second now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,5,'drijya SAY_DRIJYA_6'),
	(-1000973,'Alright, pylon two down. Now for the heat mainfold.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_5'),
	(-1000972,'I\'m done with this pylon. On to the next.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_4'),
	(-1000971,'Keep them off me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'drijya SAY_DRIJYA_3'),
	(-1000970,'We\'ll start at that first energy pylon, straight ahead. Remember, try to keep them off of me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_2'),
	(-1000969,'Let\'s proceed at a brisk pace.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'drijya SAY_DRIJYA_1'),
	(-1000968,'Very well. Before we head down there, take a moment to prepare yourself.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'drijya SAY_DRIJYA_START');
	-- Update faction for NPCs summoned during quest.
	UPDATE `creature_template` SET `FactionAlliance` = 90, `FactionHorde` = 90 WHERE `entry` = 20399;
	UPDATE `creature_template` SET `FactionAlliance` = 90, `FactionHorde` = 90 WHERE `entry` = 20402;
	UPDATE `creature_template` SET `FactionAlliance` = 90, `FactionHorde` = 90 WHERE `entry` = 20403;
    

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

