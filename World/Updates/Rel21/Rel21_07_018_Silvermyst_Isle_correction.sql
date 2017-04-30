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
    SET @cOldContent = '017';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '018';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Silvermyst_Isle_correction';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Silvermyst_Isle_correction';

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
-- Silvermyst Isle

-- Missing spawns 
-- missing added
SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
-- Barbed Crawler
(@GUID+1,17217,530,1,0,0,-5271.14,-11285.8,-13.7946,1.02375,300,10,0,156,0,0,1),
(@GUID+2,17217,530,1,0,0,-5217.56,-11325.3,-15.3765,0.81954,300,10,0,156,0,0,1),
(@GUID+3,17217,530,1,0,0,-5397.64,-11052.9,-8.02784,0.84702,300,10,0,156,0,0,1),
-- Siltfin Oracle
(@GUID+4,17191,530,1,0,0,-5350.68,-11012.52,0.1205,5.7322,300,10,0,160,350,0,1),
(@GUID+5,17191,530,1,0,0,-5319.11,-10882.1,2.57135,0.473957,300,10,0,178,382,0,1),
(@GUID+6,17191,530,1,0,0,-5266.64,-10825.6,-3.16786,4.5855,300,0,0,160,350,0,2),
-- Siltfin Murloc
(@GUID+7,17190,530,1,0,0,-5339.35,-10896.7,0.552626,6.21914,300,10,0,198,0,0,1),
(@GUID+8,17190,530,1,0,0,-5340.93,-10836.1,-2.37934,4.74261,300,10,0,177,0,0,1),
(@GUID+9,17190,530,1,0,0,-5358.43,-10986.5,-2.387661,5.63088,300,10,0,177,0,0,1),
(@GUID+10,17190,530,1,0,0,-5309.9,-10837.8,-2.44382,4.49913,300,10,0,177,0,0,1),
(@GUID+11,17190,530,1,0,0,-5113.09,-10742,-2.14469,4.94678,300,10,0,156,0,0,1),
(@GUID+12,17190,530,1,0,0,-4891.64,-10784.9,-2.44864,3.90096,300,5,0,198,0,0,1),
(@GUID+13,17190,530,1,0,0,-4913.64,-10769.5,-1.97272,3.90881,300,5,0,156,0,0,1),
-- Siltfin Hunter
(@GUID+14,17192,530,1,0,0,-5286.12,-10856.5,0.242065,5.02142,300,5,0,186,191,0,1);

-- Updates
-- Barbed Crawler
UPDATE creature SET position_x = -4847.405273, position_y = -11110.643555, position_z = 3.427485, spawndist = 15, MovementType = 1 WHERE guid = 61936;
UPDATE creature SET position_x = -4879.224121, position_y = -11240.330078, position_z = 0.719157, spawndist = 10, MovementType = 1 WHERE guid = 61934;
UPDATE creature SET position_x = -4966.186035, position_y = -11324.856445, position_z = 0.840532 WHERE guid = 61952;

-- Siltfin Oracle
UPDATE creature SET position_x = -4775.208008, position_y = -10953.052734, position_z = 1.312195, spawndist = 10, MovementType = 1 WHERE guid = 60879;
UPDATE creature SET position_x = -4782.757813, position_y = -10874.424805, position_z = -2.183508, spawndist = 10, MovementType = 1 WHERE guid = 60881;
UPDATE creature SET position_x = -4877.993164, position_y = -10858.015625, position_z = 0.108805, spawndist = 10, MovementType = 1 WHERE guid = 60885;
UPDATE creature SET position_x = -5339.156250, position_y = -10945.920898, position_z = -2.216311, spawndist = 10, MovementType = 1 WHERE guid = 60899;
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (60882,60883,60884,60886,60887,60888,60889,60891,60894,60895,60898,61437);
DELETE FROM creature_movement WHERE id IN (60882,60883,60884,60886,60887,60888,60889,60891,60894,60895,60898,61437);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(60882,1,-4813.15,-10910,3.0337, 5000, 1719101,100, 0, 0),
(60883,1,-4820.36,-10846.1,-1.92257, 5000, 1719101,100, 0, 0),
(60884,1,-4882.76,-10880.8,0.990339, 5000, 1719101,100, 0, 0),
(60886,1,-4920.86,-10871.1,1.62593, 5000, 1719101,100, 0, 0),
(60887,1,-4950.16,-10769.6,0.0996473, 5000, 1719101,100, 0, 0),
(60888,1,-4939.19,-10788.2,0.682786, 5000, 1719101,100, 0, 0),
(60889,1,-5074.41,-10769.1,0.0676479, 5000, 1719101,100, 0, 0),
(60891,1,-4917.93,-10816.1,0.245816, 5000, 1719101,100, 0, 0),
(60894,1,-5155.12,-10744.8,-2.00715, 5000, 1719101,100, 0, 0),
(60895,1,-5256.39,-10842.3,0.44511, 5000, 1719101,100, 0, 0),
(60898,1,-5276.51,-10835.4,-2.31271, 5000, 1719101,100, 0, 0),
(61437,1,-5254.1,-10812.2,-1.99515, 5000, 1719101,100, 0, 0);
DELETE FROM db_scripts WHERE id = 1719101;
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1719101,1,20,1,10,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,'Movement chenged to 1:random');

-- Siltfin Murloc
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (60846,60847,60848,60849,60850,60851,60852,60853);
UPDATE creature SET position_x = -5339.156250, position_y = -10945.920898, position_z = -2.216311, spawndist = 0, MovementType = 2 WHERE guid = 60854;
DELETE FROM creature_movement WHERE id IN (60846,60847,60848,60849,60850,60851,60852,60853,60854);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(60846,1,-4853.95,-10849.8,-1.97873, 5000, 1719001,100, 0, 0),
(60847,1,-5026.19,-10783.7,0.102897, 5000, 1719001,100, 0, 0),
(60848,1,-5029.72,-10756.3,-1.93855, 5000, 1719001,100, 0, 0),
(60849,1,-4979.17,-10757.1,0.356481, 5000, 1719001,100, 0, 0),
(60850,1,-4948.66,-10830.8,1.99957, 5000, 1719001,100, 0, 0),
(60851,1,-5206.03,-10775,-2.15568, 5000, 1719001,100, 0, 0),
(60852,1,-5129.66,-10775.1,3.43569, 5000, 1719001,100, 0, 0),
(60853,1,-5219.79,-10813.6,1.81111, 5000, 1719001,100, 0, 0),
(60854,1,-5318.87,-10944.5,0.13705, 5000, 1719001,100, 0, 0);
DELETE FROM db_scripts WHERE id = 1719001;
INSERT INTO db_scripts (script_type,id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1719001,1,20,1,10,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,'Movement chenged to 1:random');

-- Siltfin Hunter
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (60912,60913,60916,60917,60918);
UPDATE creature SET position_x = -5339.156250, position_y = -10945.920898, position_z = -2.216311, spawndist = 0, MovementType = 2 WHERE guid = 60920;
DELETE FROM creature_movement WHERE id IN (60912,60913,60916,60917,60918,60920);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(60912,1,-4777.1,-10919.5,0.0651447, 5000, 1719202,100, 0, 0),
(60913,1,-4905.73,-10846.1,1.48977, 5000, 1719202,100, 0, 0),
(60916,1,-4972.14,-10785,3.93521, 5000, 1719201,100, 0, 0),
(60917,1,-5003.66,-10737.3,-2.00573, 5000, 1719201,100, 0, 0),
(60918,1,-5153.42,-10780.5,0.315748, 5000, 1719201,100, 0, 0),
(60920,1,-5326.15,-10922.2,0.0874448, 5000, 1719201,100, 0, 0);
DELETE FROM db_scripts WHERE id IN (1719201,1719202);
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1719201,1,20,1,10,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,'Movement chenged to 1:random'),
(3,1719202,1,20,1,5,0,0,0x04 | 0x08,0,0,0,0,0,0,0,0,'Movement chenged to 1:random');

-- Deranged/Abberant Owlbeast
UPDATE creature SET position_x = -5016.637695, position_y = -11168.589844, position_z = 17.446472 WHERE guid = 60769;
UPDATE creature SET position_x = -5057.160645, position_y = -11183.455078, position_z = 22.471573 WHERE guid = 60743;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (60735,60724,60753,60742,60762,60741,60739,60733);

    
    

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

