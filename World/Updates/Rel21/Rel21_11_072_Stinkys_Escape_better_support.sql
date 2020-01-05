-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldContent = '071';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '072';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Stinkys Escape better support';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Stinkys Escape better support';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Update correct script text.
DELETE FROM `script_texts` WHERE entry IN (-1000958,-1000959,-1001141,-1001142,-1001143,-1001144,-1001145,-1000962,-1000960,-1000961,-1001146,-1001147);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1001147,'Look out! The $N attacks!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_AGGRO_4'),
(-1001146,'I\'m glad you\'re here! Because I need your help!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_AGGRO_3'),
(-1001145,'Ok, let\'s get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_PLANT_GATHERED'),
(-1001144,'Come, $N! Let\'s go over there and collect it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_THIRD_STOP_3'),
(-1001143,'Ah, there\'s one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_THIRD_STOP_2'),
(-1001142,'There must be one around here somewhere...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_THIRD_STOP_1'),
(-1001141,'Nope, not here...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_SECOND_STOP'),
(-1000962,'I can make it from here. Thanks, $N! And talk to my employer about a reward!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_STINKY_END'),
(-1000961,'Help! I\'m under attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_AGGRO_2'),
(-1000960,'Help! The beast is on me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_AGGRO_1'),
(-1000959,'Now let\'s look for the herb.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_STINKY_FIRST_STOP'),
(-1000958,'Ok, let\'s get started.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'stinky ignatz SAY_STINKY_BEGIN');
-- Update correct script waypoints
DELETE FROM `script_waypoint` WHERE `entry` =4880;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
(4880,0,-2670.22,-3446.19,34.085,0,''),
(4880,1,-2683.96,-3451.09,34.707,0,''),
(4880,2,-2703.24,-3454.82,33.395,0,''),
(4880,3,-2721.61,-3457.41,33.626,0,''),
(4880,4,-2739.98,-3459.84,33.329,0,''),
(4880,38,-2882.68,-3534.17,34.844,0,''),
(4880,6,-2764.52,-3472.71,33.75,0,''),
(4880,7,-2773.68,-3482.91,32.84,0,''),
(4880,8,-2781.39,-3490.61,32.598,0,''),
(4880,9,-2788.31,-3492.9,30.761,0,''),
(4880,37,-2877.78,-3538.37,37.274,0,''),
(4880,11,-2789.43,-3498.04,31.05,0,''),
(4880,12,-2786.97,-3508.17,31.983,0,''),
(4880,13,-2786.77,-3519.95,31.079,0,''),
(4880,14,-2789.36,-3525.02,31.831,0,''),
(4880,15,-2797.95,-3523.69,31.697,0,''),
(4880,16,-2812.97,-3519.84,29.864,0,''),
(4880,17,-2818.33,-3521.4,30.563,0,''),
(4880,18,-2824.77,-3528.73,32.399,0,''),
(4880,19,-2830.7,-3539.88,32.505,0,''),
(4880,20,-2836.24,-3549.96,31.18,0,''),
(4880,21,-2837.58,-3561.05,30.74,0,''),
(4880,22,-2834.45,-3568.26,30.751,0,''),
(4880,23,-2827.35,-3569.81,31.316,0,''),
(4880,36,-2869.54,-3545.58,40.701,0,''),
(4880,35,-2861.78,-3552.9,41.243,0,''),
(4880,34,-2855.72,-3565.18,39.39,0,''),
(4880,27,-2818.81,-3579.42,28.525,0,''),
(4880,28,-2820.21,-3590.64,30.269,0,''),
(4880,29,-2820.85,-3593.94,31.15,3000,''),
(4880,33,-2847.49,-3576.42,37.66,0,''),
(4880,31,-2834.21,-3592.04,33.79,0,''),
(4880,32,-2840.31,-3586.21,36.288,0,''),
(4880,40,-2888.57,-3534.12,34.298,0,''),
(4880,30,-2820.85,-3593.94,31.15,3000,'SAY_PLANT_GATHERED'),
(4880,10,-2794.58,-3489.19,31.119,5000,'SAY_SECOND_STOP'),
(4880,39,-2888.57,-3534.12,34.298,4000,'SAY_STINKY_END'),
(4880,5,-2756.24,-3460.52,32.037,5000,'SAY_STINKY_FIRST_STOP'),
(4880,24,-2817.38,-3566.96,30.947,5000,'SAY_THIRD_STOP_1'),
(4880,25,-2817.38,-3566.96,30.947,2000,'SAY_THIRD_STOP_2'),
(4880,26,-2817.38,-3566.96,30.947,0,'SAY_THIRD_STOP_3');
    

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


