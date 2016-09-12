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
    SET @cOldStructure = '03'; 
    SET @cOldContent = '065';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '066';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Neltharaku_gossip_path';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Neltharaku_gossip_path';

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

    -- Requires quest: 10814 to show gossip option
DELETE FROM `conditions` WHERE `condition_entry`=1737;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(1737, 9, 10814, 0);

-- Add condition to gossip_menu_option
UPDATE `gossip_menu_option` SET `condition_id`=1737 WHERE `menu_id`=8397;

-- Adds sniffed pathing by Malcrom
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4147.188,`position_y`=852.9213,`position_z`=112.449 WHERE `guid`=75654;
DELETE FROM `creature_movement` WHERE `id`=75654;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(75654,1,-4149.083,816.8467,102.0771,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,2,-4148.741,817.7864,102.0771,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,3,-4150.894,819.7193,112.4489,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,4,-4147.188,852.9213,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,5,-4126.215,897.6987,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,6,-4113.534,926.0124,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,7,-4098.13,963.6712,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,8,-4063.067,1046.515,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,9,-4008.534,1081.363,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,10,-3926.171,1057.316,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,11,-3914.31,958.3683,114.7823,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,12,-3930.769,894.2169,114.2545,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,13,-3991.642,763.9112,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,14,-4060.605,579.9987,112.449,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,15,-4085.638,468.8222,173.4489,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,16,-4097.893,416.0321,177.8378,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,17,-4110.39,374.4871,174.2545,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,18,-4135.225,331.1968,174.7545,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,19,-4203.078,269.2113,172.4767,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,20,-4239.532,280.7727,169.0878,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,21,-4278.137,304.6405,169.1989,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,22,-4295.682,340.7838,173.9212,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,23,-4297.044,383.0331,169.0878,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,24,-4267.532,404.9037,169.0878,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,25,-4225.749,416.8825,169.0878,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,26,-4193.994,418.2155,169.0878,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,27,-4176.15,444.5788,158.2545,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,28,-4163.389,480.9925,149.6712,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,29,-4157.379,548.4786,145.2823,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,30,-4178.163,628.6951,101.0601,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,31,-4182.795,656.5566,97.31005,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,32,-4184.389,678.5916,98.50452,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,33,-4182.358,726.181,102.5323,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,34,-4175.015,753.1885,103.2545,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,35,-4160.292,781.7564,107.8656,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,36,-4150.894,819.7193,112.4489,0,0,0,0,0,0,0,0,0,0,0,0),
(75654,37,-4147.188,852.9213,112.449,0,0,0,0,0,0,0,0,0,0,0,0);

-- Blizzlike value is 1, changed because he flies at walk speed, and that is way too slow.
UPDATE `creature_template` SET `SpeedWalk`=2.85714 WHERE `entry`=21657;

    

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

