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
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '15'; 
    SET @cOldContent = '054';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '055';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Jessel db_script';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Jessel db_script';

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

-- Jessel Emote and conversation script.
DELETE FROM `db_scripts` WHERE `id` = 2010001;
INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(3,2010001,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - Set to Active'),
(3,2010001,2,15,14915,0,0,0,4,0,0,0,0,0,0,0,0,'Jessel - Cast: Self Visual - Sleep Until Cancelled'),
(3,2010001,3,28,3,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - State: Sleeping'),
(3,2010001,14,14,14915,0,0,0,4,0,0,0,0,0,0,0,0,'Jessel - Remove Aura: Self Visual - Sleep Until Cancelled'),
(3,2010001,15,28,1,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - State: Sitting'),
(3,2010001,16,0,0,0,0,0,0,2000000467,0,0,0,0,0,0,0,'Jessel - Text Emote: Wakes up startled.'),
(3,2010001,21,0,0,0,0,0,0,2000000468,0,0,0,0,0,0,0,'Jessel - Say: Was it all a dream?'),
(3,2010001,26,1,22,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - Emote: ONESHOT_SHOUT'),
(3,2010001,32,0,0,0,20098,71601,23,2000000469,0,0,0,0,0,0,0,'Jane - Say: I\m right here'),
(3,2010001,37,0,0,0,0,0,0,2000000470,0,0,0,0,0,0,0,'Jessel - Say: It was all a dream'),
(3,2010001,40,0,0,0,20098,71601,23,2000000471,0,0,0,0,0,0,0,'Jane - Text Emote: Resumes playing on beach'),
(3,2010001,43,15,14915,0,0,0,4,0,0,0,0,0,0,0,0,'Jessel - Cast: Self Visual - Sleep Until Cancelled'),
(3,2010001,44,28,3,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - State: Sleeping'),
(3,2010001,46,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Jessel - Set to Inactive');

-- Strings for Jessel's Script.
DELETE FROM `db_script_string` WHERE `entry` IN (2000000467,2000000468,2000000469,2000000470,2000000471);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(2000000467,'%s wakes up, startled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,NULL),
(2000000468,'Was... Was it all a dream? Azuremyst, Bloodmyst, Zangarmarsh, Shadowmoon... even Zul\'Aman... Jane! Jane where are you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,6,NULL),
(2000000469,'I\'m right here, daddy. You\'ve been asleep all day long. You sure must be tired!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,1,NULL),
(2000000470,'Ah, wonderful. It was all just a dream...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10,1,NULL),
(2000000471,'%s resumes playing on the beach.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,NULL);

-- Waypoint to support Jessel's script.
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 71602;
DELETE FROM `creature_movement_template` WHERE `entry` = 20100;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) values
(20100,1,10520.5,-6504.38,1.28933,50000,2010001,0,0,0,0,0,0,0,5.48033,0,0),
(20100,2,10520.5,-6504.38,1.28933,120000,0,0,0,0,0,0,0,0,5.48033,0,0);

-- Update position and movement for  Manny, Nove, Jane and Kitty.
UPDATE `creature` SET `position_x` = 10509.5, `position_y` = -6503.36, `position_z` = 3.39121, `spawndist` = 8, `MovementType` = 1 WHERE guid = 71601;
UPDATE `creature` SET `position_x` = 10516.9, `position_y` = -6494.79, `position_z` = 3.60547, `spawndist` = 8, `MovementType` = 1 WHERE guid = 71940;
UPDATE `creature` SET `position_x` = 10516.9, `position_y` = -6494.79, `position_z` = 3.60547, `spawndist` = 8, `MovementType` = 1 WHERE guid = 71941;
UPDATE `creature` SET `position_x` = 10509.5, `position_y` = -6503.36, `position_z` = 3.39121, `spawndist` = 8, `MovementType` = 1 WHERE guid = 71942;
  

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
