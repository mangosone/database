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
    SET @cOldContent = '041';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '042';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Dungeon_Entrance_Portals';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Dungeon_Entrance_Portals';

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

    -- https://github.com/antisocial89/RealTBC_Issue_tracker/issues/102
-- The Botanica and The Mechanar exit areatriggers (for end of instance portals)
DELETE FROM areatrigger_teleport WHERE id IN (4612,4614);
INSERT INTO areatrigger_teleport (id,NAME,target_map,target_position_x,target_position_y,target_position_z,target_orientation) VALUES
(4612,'The Botanica',530,3407.110107,1488.479980,182.837753,2.501119),
(4614,'The Mechanar',530,2869.885742,1552.755249,252.158997,0.733993);

-- Deletes all TBC instance portals, we will start clean.
DELETE FROM gameobject WHERE id IN (184225,184226,184227,184228,184220,184219,184213,184214,184221,184222,184215,184216,184129,184130,184180,184179,184132,184131,184176,184175,184128,184127,184178,184177,184188,184187,184196,184195,184183,184184,184181,184182,184194,184193,184190,184189,184206,184207,184201,184202,184198,184197,184211,184210,184209,184208,184199,184200);

-- Updates data0 and data1 to correct values
UPDATE gameobject_template SET data0=553 WHERE entry IN (184221,184222,184225,184226,184227,184228,184220,184219,184213,184214,184221,184222,184215,184216,184129,184130,184180,184179,184132,184131,184176,184175,184128,184127,184178,184177,184188,184187,184196,184195,184183,184184,184181,184182,184194,184193,184190,184189,184206,184207,184201,184202,184198,184197,184211,184210,184209,184208,184199,184200);
UPDATE gameobject_template SET data1=1 WHERE entry IN (184128,184129,184132,184176,184180,184182,184184,184187,184189,184193,184195,184197,184199,184202,184207,184209,184210,184214,184226,184216,184222,184178,184218,184219,184228);

-- Adds the exit portals to Botanica and Mechanar
DELETE FROM gameobject WHERE guid IN (233,236,237,242);
INSERT INTO gameobject (guid,id,map,spawnMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(233,184222,553,2,158.952,391.653,-35.5291,0.0494656,0,0,0.0247303,0.999694,300,0,1),
(236,184222,554,2,71.1997,149.657,25.5811,3.17222,0,0,0.999883,-0.0153126,300,0,1),
(237,184221,553,1,158.952,391.653,-35.5291,0.0494656,0,0,0.0247303,0.999694,300,0,1),
(242,184221,554,1,71.1997,149.657,25.5811,3.17222,0,0,0.999883,-0.0153126,300,0,1);

-- Inserts all the instance portals
DELETE FROM gameobject WHERE guid IN (150017,150016,150015,150014,150013,150012,150011,150010,150009,150008,150007,150006,150005,150004,150003,150002,150018,150019,150020,150021,150022,150023,150024,150025,150026,150027,150028,150029,150030,150031,150032,150033,150034,150035,150036,150037,150038,150039,150040,150041,150042,150043,150044,150045,150046,150047,150048,150049,150050,150051,150052,150053);
INSERT INTO gameobject (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
(150017, 184199, 546, 2, 6.033, -12.38, -2.7533, 5.3513, 0, 0, 0, 0, 1, 100, 0),
(150016, 184200, 546, 1, 6.033, -12.38, -2.7533, 5.3513, 0, 0, 0, 0, 1, 100, 0),
(150015, 184209, 530, 1, 781.97, 6745.99, -72.4238, 1.65806, 0, 0, 0, 0, 1, 100, 0),
(150014, 184208, 530, 1, 781.97, 6745.99, -72.4238, 1.65806, 0, 0, 0, 0, 1, 100, 0),
(150013, 184176, 542, 2, -1.196, 24.25, -44.7943, 4.3789, 0, 0, 0, 0, 1, 100, 0),
(150012, 184175, 542, 1, -1.196, 24.25, -44.7943, 4.3789, 0, 0, 0, 0, 1, 100, 0),
(150011, 184132, 530, 1, -305.589, 3167.3, 30.9894, 2.15615, 0, 0, 0, 0, 1, 100, 0),
(150010, 184131, 530, 1, -305.589, 3167.3, 30.9894, 2.15615, 0, 0, 0, 0, 1, 100, 0),
(150009, 184178, 540, 2, -41.968, -26.2, -13.5379, 1.48438, 0, 0, 0, 0, 1, 100, 0),
(150008, 184177, 540, 1, -41.968, -26.2, -13.5379, 1.48438, 0, 0, 0, 0, 1, 100, 0),
(150007, 184128, 530, 1, -310.208, 3087.48, -3.9506, 4.5037, 0, 0, 0, 0, 1, 100, 0),
(150006, 184127, 530, 1, -310.208, 3087.48, -3.9506, 4.5037, 0, 0, 0, 0, 1, 100, 0),
(150005, 184180, 543, 2, -1358.11, 1635.75, 68.513, 0.9965, 0, 0, 0, 0, 1, 100, 0),
(150004, 184179, 543, 1, -1358.11, 1635.75, 68.513, 0.9965, 0, 0, 0, 0, 1, 100, 0),
(150003, 184129, 530, 1, -364.488, 3081.89, -14.7177, 1.851, 0, 0, 0, 0, 1, 100, 0),
(150002, 184130, 530, 1, -364.488, 3081.89, -14.7177, 1.851, 0, 0, 0, 0, 1, 100, 0),
(150018, 184206, 530, 1, 818.37, 6946.88, -80.6298, 4.7595, 0, 0, 0, 0, 1, 100, 0),
(150019, 184207, 530, 1, 818.37, 6946.88, -80.6298, 4.7595, 0, 0, 0, 0, 1, 100, 0),
(150020, 184201, 545, 1, -23.7936, 4.42258, -2.84397, 0, 0, 0, 0, 0, 1, 100, 0),
(150021, 184202, 545, 2, -23.7936, 4.42258, -2.84397, 0, 0, 0, 0, 0, 1, 100, 0),
(150022, 184198, 530, 1, 737.96, 7014.63, -72.3248, 3.2923, 0, 0, 0, 0, 1, 100, 0),
(150023, 184197, 530, 1, 737.96, 7014.63, -72.3248, 3.2923, 0, 0, 0, 0, 1, 100, 0),
(150024, 184211, 547, 1, 119.609, -137.113, -0.704, 1.4757, 0, 0, 0, 0, 1, 100, 0),
(150025, 184210, 547, 2, 119.609, -137.113, -0.704, 1.4757, 0, 0, 0, 0, 1, 100, 0),
(150026, 184188, 530, 1, -3649.83, 4943.11, -101.048, 0, 0, 0, 0, 0, 1, 100, 0),
(150027, 184187, 530, 1, -3649.83, 4943.11, -101.048, 0, 0, 0, 0, 0, 1, 100, 0),
(150028, 184196, 555, 1, 7.309, -0.098, -1.128, 3.1588, 0, 0, 0, 0, 1, 100, 0),
(150029, 184195, 555, 2, 7.309, -0.098, -1.128, 3.1588, 0, 0, 0, 0, 1, 100, 0),
(150030, 184181, 530, 1, -3073.89, 4943.17, -101.047, 3.1643, 0, 0, 0, 0, 1, 100, 0),
(150031, 184182, 530, 1, -3073.89, 4943.17, -101.047, 3.1643, 0, 0, 0, 0, 1, 100, 0),
(150032, 184194, 557, 1, 6.657, 1.041, -2.005, 0, 0, 0, 0, 0, 1, 100, 0),
(150033, 184193, 557, 2, 6.657, 1.041, -2.005, 0, 0, 0, 0, 0, 1, 100, 0),
(150034, 184190, 530, 1, -3361.93, 4655.23, -102.056, -1.5708, 0, 0, 0, 0, 1, 100, 0),
(150035, 184189, 530, 1, -3361.93, 4655.23, -102.056, -1.5708, 0, 0, 0, 0, 1, 100, 0),
(150036, 184190, 556, 1, -7.825, -0.204, 0.0062, 0.03534, 0, 0, 0, 0, 1, 100, 0),
(150037, 184189, 556, 2, -7.825, -0.204, 0.0062, 0.03534, 0, 0, 0, 0, 1, 100, 0),
(150038, 184183, 530, 1, -3362.01, 5230.92, -101.049, 4.7378, 0, 0, 0, 0, 1, 100, 0),
(150039, 184184, 530, 1, -3362.01, 5230.92, -101.049, 4.7378, 0, 0, 0, 0, 1, 100, 0),
(150040, 184183, 558, 1, -28.117, -0.0599, -0.1206, 0.03534, 0, 0, 0, 0, 1, 100, 0),
(150041, 184184, 558, 2, -28.117, -0.0599, -0.1206, 0.03534, 0, 0, 0, 0, 1, 100, 0),
(150042, 184221, 530, 1, 3415.27, 1481.96, 182.74, 2.4958, 0, 0, 0, 0, 1, 100, 0),
(150043, 184222, 530, 1, 3415.27, 1481.96, 182.74, 2.4958, 0, 0, 0, 0, 1, 100, 0),
(150044, 184215, 553, 1, 47.5461, -35.5614, 1.41111, 2.35619, 0, 0, 0, 0, 1, 100, 0),
(150045, 184216, 553, 2,  47.5461, -35.5614, 1.41111, 2.35619, 0, 0, 0, 0, 1, 100, 0),
(150046, 184220, 530, 1,3312.93, 1329.56, 505.56, 1.9855, 0, 0, 0, 0, 1, 100, 0),
(150047, 184219, 530, 1,3312.93, 1329.56, 505.56, 1.9855, 0, 0, 0, 0, 1, 100, 0),
(150048, 184213, 552, 1,-3.77762, 0.178076, -1.55146, 3.14159, 0, 0, 0, 0, 1, 100, 0),
(150049, 184214, 552, 2, -3.77762, 0.178076, -1.55146, 3.14159, 0, 0, 0, 0, 1, 100, 0),
(150050, 184225, 530, 1,2862.44, 1546.04, 250.16, 0.7202, 0, 0, 0, 0, 1, 100, 0),
(150051, 184226, 530, 1,2862.44, 1546.04, 250.16, 0.7202, 0, 0, 0, 0, 1, 100, 0),
(150052, 184227, 554, 1,-38.3715, 0.2876, -1.8128, 6.2643, 0, 0, 0, 0, 1, 100, 0),
(150053, 184228, 554, 2, -38.3715, 0.2876, -1.8128, 6.2643, 0, 0, 0, 0, 1, 100, 0);
    

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

