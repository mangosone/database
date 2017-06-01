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
    SET @cOldStructure = '07'; 
    SET @cOldContent = '031';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '032';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Bristlelimb_Village_update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Bristlelimb_Village_update';

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
-- Bristlelimb Village
-- missing added
SET @GUID := (SELECT MAX(guid) FROM `gameobject`);
INSERT INTO gameobject (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
(@GUID+1, 181788, 530, 1, -4507.2, -11618.6, 11.3237, 2.11482, 0, 0, 0.871085, 0.491132, 180, 255, 1),
(@GUID+2, 2066, 530, 1, -4507.2, -11618.6, 11.3237, 2.11482, 0, 0, 0.871085, 0.491132, 180, 255, 1);

-- Creatures
-- Duplicates
DELETE FROM creature WHERE guid IN (60682,60707,60694,60701,60686,60685,60679);
DELETE FROM creature_addon WHERE guid IN (60682,60707,60694,60701,60686,60685,60679);
DELETE FROM creature_movement WHERE id IN (60682,60707,60694,60701,60686,60685,60679);

-- Bristlelimp Ursa
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (60709,60710,60716,60713,60692);
UPDATE creature SET movementType = 1, spawndist = 10 WHERE guid IN (60715,60700);
UPDATE creature SET position_x = -4458.438477, position_y = -11585.770508, position_z = 13.495013, movementType = 1, spawndist = 10 WHERE guid = 60715;
UPDATE creature SET position_x = -4569.044922, position_y = -11523.156250, position_z = 19.308250, movementType = 1, spawndist = 10 WHERE guid = 60704;
UPDATE creature SET position_x = -4597.735840, position_y = -11637.797852, position_z = 17.977051, movementType = 2, spawndist = 0 WHERE guid = 60717;
UPDATE creature SET position_x = -4606.25, position_y = -11526.4, position_z = 18.5548, orientation = 3.0803, movementType = 0, spawndist = 0 WHERE guid = 60699;
UPDATE creature SET position_x = -4615.88, position_y = -11653.5, position_z = 20.9106, orientation = 0.446076, movementType = 0, spawndist = 0 WHERE guid = 60714;
DELETE FROM creature_movement WHERE id = 60717;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #60717
(60717,1,-4602.9,-11637.7,16.9502, 0, 0,2.89653, 0, 0),
(60717,2,-4609.3,-11634,18.0795, 0, 0,2.27451, 0, 0),
(60717,3,-4615.78,-11621.7,17.1809, 0, 0,1.9038, 0, 0),
(60717,4,-4619.52,-11605.2,19.252, 0, 0,1.60535, 0, 0),
(60717,5,-4618.49,-11574,18.9034, 0, 0,1.49932, 0, 0),
(60717,6,-4620.83,-11556.5,18.5442, 0, 0,1.93914, 0, 0),
(60717,7,-4629.16,-11531.3,17.4068, 45000, 0,1.79385, 0, 0),
(60717,8,-4615.55,-11556.7,18.4992, 0, 0,5.53705, 0, 0),
(60717,9,-4599.21,-11574.4,16.427, 0, 0,5.52134, 0, 0),
(60717,10,-4584.34,-11586.1,15.6658, 0, 0,5.74518, 0, 0),
(60717,11,-4568.34,-11595.4,15.6812, 0, 0,5.83157, 0, 0),
(60717,12,-4547.8,-11604,15.9444, 0, 0,5.9376, 0, 0),
(60717,13,-4523.85,-11613.2,12.6548, 0, 0,5.27001, 0, 0),
(60717,14,-4518.96,-11624.2,12.2437, 0, 0,5.52212, 0, 0),
(60717,15,-4513.26,-11629.9,12.4238, 0, 0,6.21719, 0, 0),
(60717,16,-4503.99,-11628.7,11.8213, 0, 0,0.49164, 0, 0),
(60717,17,-4498.48,-11622.6,11.0167, 0, 0,1.53936, 0, 0),
(60717,18,-4503.03,-11618.3,11.182, 45000, 0,3.09445, 0, 0),
(60717,19,-4498.47,-11622,11.0191, 0, 0,4.44298, 0, 0),
(60717,20,-4503.46,-11631.6,12.2401, 0, 0,4.10762, 0, 0),
(60717,21,-4512.68,-11643.2,13.7138, 0, 0,3.7699, 0, 0),
(60717,22,-4525.09,-11647.6,14.5677, 0, 0,3.31437, 0, 0),
(60717,23,-4550.08,-11650.1,17.6439, 0, 0,3.18085, 0, 0),
(60717,24,-4566.87,-11649.8,17.7181, 0, 0,3.07875, 0, 0),
(60717,25,-4579.83,-11648.2,20.3516, 0, 0,2.83763, 0, 0),
(60717,26,-4587.14,-11644.7,20.1722, 0, 0,2.56667, 0, 0),
(60717,27,-4597.27,-11636.8,18.0125, 45000, 0,2.2957, 0, 0);

-- Bristlelimp Furbolg
UPDATE creature SET position_x = -4607.912598, position_y = -11484.048828, position_z = 16.616718, movementType = 1, spawndist = 10 WHERE guid = 60676;

-- Bristlelimp Windcaller
UPDATE creature SET position_x = -4630.879883, position_y = -11498.740234, position_z = 20.169975, orientation = 4.116247, movementType = 0, spawndist = 0 WHERE guid = 60687;
UPDATE creature SET position_x = -4580.271973, position_y = -11622.231445, position_z = 17.764271, movementType = 1, spawndist = 10 WHERE guid = 60691;
UPDATE creature SET position_x = -4682.245117, position_y = -11560.536133, position_z = 21.263739, movementType = 1, spawndist = 10 WHERE guid = 60688;
UPDATE creature SET position_x = -4453.588379, position_y = -11616.245117, position_z = 10.615470, movementType = 1, spawndist = 10 WHERE guid = 60695;
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid IN (60697,60693);
DELETE FROM creature_movement WHERE id IN (60697,60693);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #60697
(60697,1,-4468.77,-11601,13.2403, 0, 0,2.13473, 0, 0),
(60697,2,-4487.57,-11585.4,14.3304, 0, 0,2.50386, 0, 0),
(60697,3,-4509.89,-11567,16.0096, 0, 0,2.43318, 0, 0),
(60697,4,-4535.08,-11545.3,18.7831, 0, 0,2.51957, 0, 0),
(60697,5,-4564.96,-11528.3,19.5167, 0, 0,2.63345, 0, 0),
(60697,6,-4591.85,-11514.8,19.5458, 0, 0,2.67272, 0, 0),
(60697,7,-4601.63,-11508.2,20.1562, 0, 0,2.44496, 0, 0),
(60697,8,-4616.16,-11483.2,18.4137, 0, 0,2.49994, 0, 0),
(60697,9,-4627.8,-11477.4,21.0099, 0, 0,3.03087, 0, 0),
(60697,10,-4642.43,-11481.8,18.7053, 0, 0,3.84218, 0, 0),
(60697,11,-4652.1,-11496.2,18.7587, 0, 0,4.32127, 0, 0),
(60697,12,-4656.56,-11518.4,20.0137, 0, 0,4.60793, 0, 0),
(60697,13,-4657.66,-11541.2,18.8246, 0, 0,4.77287, 0, 0),
(60697,14,-4653.34,-11561.7,17.7991, 0, 0,5.09095, 0, 0),
(60697,15,-4640.26,-11590.5,18.5207, 0, 0,4.93858, 0, 0),
(60697,16,-4639.96,-11611.3,21.8179, 0, 0,4.70689, 0, 0),
(60697,17,-4642.11,-11630.2,20.5675, 0, 0,4.5773, 0, 0),
(60697,18,-4642.46,-11645.4,22.4452, 0, 0,5.00848, 0, 0),
(60697,19,-4636.21,-11657,23.5999, 0, 0,5.36976, 0, 0),
(60697,20,-4621.79,-11667.1,24.0038, 0, 0,6.00592, 0, 0),
(60697,21,-4600.12,-11669.4,19.9336, 0, 0,0.0408235, 0, 0),
(60697,22,-4582.94,-11667.1,20.9832, 0, 0,0.166487, 0, 0),
(60697,23,-4563.28,-11663.5,20.2341, 0, 0,0.288224, 0, 0),
(60697,24,-4547.35,-11658.7,17.6129, 0, 0,0.288224, 0, 0),
(60697,25,-4527.07,-11652.1,15.7348, 0, 0,0.0997283, 0, 0),
(60697,26,-4501.26,-11652.3,13.9548, 0, 0,0.199474, 0, 0),
(60697,27,-4485.83,-11647.6,11.0906, 0, 0,0.446874, 0, 0),
(60697,28,-4469.37,-11636.8,12.7157, 0, 0,0.968379, 0, 0),
(60697,29,-4462.74,-11623.1,11.035, 0, 0,1.53151, 0, 0),
-- #60693
(60693,1,-4526.59,-11581.4,14.3595, 0, 0,3.09601, 0, 0),
(60693,2,-4557.73,-11579.9,12.0175, 0, 0,3.09994, 0, 0),
(60693,3,-4583.24,-11581.5,15.2593, 0, 0,2.91537, 0, 0),
(60693,4,-4611.75,-11574.6,18.375, 0, 0,2.3114, 0, 0),
(60693,5,-4616.2,-11551.8,18.3543, 0, 0,1.6281, 0, 0),
(60693,6,-4616.7,-11528.5,18.1637, 0, 0,1.80089, 0, 0),
(60693,7,-4620.87,-11517.4,19.6602, 0, 0,2.47555, 0, 0),
(60693,8,-4629.84,-11514.5,19.7675, 0, 0,3.49578, 0, 0),
(60693,9,-4633.46,-11517.6,19.328, 0, 0,4.63932, 0, 0),
(60693,10,-4633.03,-11521.3,18.8427, 45000, 0,5.12234, 0, 0),
(60693,11,-4633.5,-11517.9,19.2858, 0, 0,1.28174, 0, 0),
(60693,12,-4630.11,-11514.6,19.7538, 0, 0,0.454715, 0, 0),
(60693,13,-4621.58,-11517.3,19.6709, 0, 0,5.42786, 0, 0),
(60693,14,-4616.88,-11528.7,18.1379, 0, 0,5.01239, 0, 0),
(60693,15,-4618.66,-11564.2,18.853, 0, 0,4.30868, 0, 0),
(60693,16,-4627.28,-11593.6,17.5008, 0, 0,4.43827, 0, 0),
(60693,17,-4628.04,-11608,20.1151, 0, 0,4.95663, 0, 0),
(60693,18,-4617.29,-11620,17.4996, 0, 0,5.57709, 0, 0),
(60693,19,-4606.24,-11628.6,17.0751, 45000, 0,5.71453, 0, 0),
(60693,20,-4590.4,-11620.4,17.7527, 0, 0,0.479849, 0, 0),
(60693,21,-4562.62,-11606.5,17.1862, 0, 0,0.256011, 0, 0),
(60693,22,-4548.61,-11603.8,15.9482, 0, 0,6.17006, 0, 0),
(60693,23,-4530.53,-11606.1,14.5098, 0, 0,5.92659, 0, 0),
(60693,24,-4520.91,-11608.7,12.1951, 0, 0,5.71061, 0, 0),
(60693,25,-4512.05,-11614.2,11.5539, 45000, 0,5.40431, 0, 0);
    
    

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

