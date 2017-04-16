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
    SET @cOldContent = '008';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '009';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Bloodmyst_Isle_Part_1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Bloodmyst_Isle_Part_1';

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

-- Bloodmyst Isle Part_1.

-- missing objects 

SET @GUID := (SELECT MAX(guid) FROM `gameobject`);
INSERT INTO gameobject (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- campfire
(@GUID+1, 181887, 530, 1,-2518.31, -12292.8, 13.7125, 1.570796, 0, 0, 0.7071066, 0.7071069, 300, 255, 1),
(@GUID+2, 181829, 530, 1,-2425.21, -12169, 32.5557, 0.1745302, 0, 0, 0.08715439, 0.9961948, 300, 255, 1);
-- Correct position for 'Princess Stillpine's Cage'
UPDATE gameobject SET position_x = -2519.795, position_y = -12302.22, position_z = 14.15483, orientation = 1.553341, rotation0 = 0, rotation1 = 0, rotation2 = 0.7009087, rotation3 = 0.7132511, spawntimesecs = 60 WHERE id = 181928; 


-- creatures
-- duplicates removed + missing added
DELETE FROM creature WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM creature_addon WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM creature_movement WHERE id IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM game_event_creature WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM game_event_creature_data WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM creature_battleground WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);
DELETE FROM creature_linking WHERE guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074)
OR master_guid IN (60840,63064,63056,63059,63060,63068,63067,63058,63073,63090,63089,63079,63075,63083,63074);


SET @GUID := (SELECT MAX(guid) FROM `creature`);
INSERT INTO creature (guid, id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
-- Blue Flutterer
(60840,17349,530,1,0,0,-2337.49,-12083.1,30.9244,2.0638,300,0,0,176,0,0,2),
-- Wrathscale Screamer & Shorestalker
(@GUID+1,17333,530,1,0,0,-2260.35,-12261.7,35.653,3.22982,300,5,0,241,601,0,1),
(@GUID+2,17331,530,1,0,412,-2234.92,-12275.2,49.4182,5.09514,300,5,0,247,0,0,1);

-- Updates
-- Blue Flutterer
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (62659,62660,62661,60840);
DELETE FROM creature_movement WHERE id IN (62659,62660,62661,60840);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(62659,1,-2384.16,-12379,17.7857, 0, 0,3.62944, 0, 0),
(62659,2,-2418.83,-12397.7,13.1066, 0, 0,3.27209, 0, 0),
(62659,3,-2443.01,-12401.4,11.7346, 0, 0,3.0129, 0, 0),
(62659,4,-2477.96,-12399.6,13.5833, 0, 0,3.10322, 0, 0),
(62659,5,-2516.7,-12396,12.0505, 0, 0,2.44428, 0, 0),
(62659,6,-2549.29,-12372.9,10.5789, 0, 0,2.31334, 0, 0),
(62659,7,-2572.14,-12345.1,6.91616, 0, 0,3.19691, 0, 0),
(62659,8,-2602.97,-12346.9,3.03405, 0, 0,2.72174, 0, 0),
(62659,9,-2625.4,-12336.4,3.03546, 0, 0,2.69033, 0, 0),
(62659,10,-2636.4,-12330.7,5.79983, 0, 0,2.6432, 0, 0),
(62659,11,-2670.15,-12310,7.34026, 0, 0,2.57644, 0, 0),
(62659,12,-2698.87,-12290.6,7.32651, 0, 0,2.31726, 0, 0),
(62659,13,-2721.77,-12267.7,6.3447, 0, 0,2.38795, 0, 0),
(62659,14,-2732.25,-12255.5,6.9703, 0, 0,2.21909, 0, 0),
(62659,15,-2745.42,-12238.2,9.50965, 0, 0,2.24658, 0, 0),
(62659,16,-2727.43,-12261.7,6.69029, 0, 0,5.38031, 0, 0),
(62659,17,-2708.39,-12280.4,7.93744, 0, 0,5.50597, 0, 0),
(62659,18,-2693.54,-12295.7,6.89882, 0, 0,5.6552, 0, 0),
(62659,19,-2653.58,-12320.4,7.6235, 0, 0,5.74944, 0, 0),
(62659,20,-2628.79,-12335.2,3.62454, 0, 0,5.8751, 0, 0),
(62659,21,-2603.31,-12347,2.9764, 0, 0,0.0278132, 0, 0),
(62659,22,-2571.93,-12345.2,6.93127, 0, 0,5.33868, 0, 0),
(62659,23,-2549.12,-12372.8,10.5828, 0, 0,5.59785, 0, 0),
(62659,24,-2531.29,-12385.4,10.1535, 0, 0,5.68032, 0, 0),
(62659,25,-2516.42,-12395.9,12.0831, 0, 0,6.19475, 0, 0),
(62659,26,-2478,-12399.1,13.6621, 0, 0,6.22224, 0, 0),
(62659,27,-2451.15,-12400.7,11.0609, 0, 0,6.23402, 0, 0),
(62659,28,-2436.55,-12401.2,12.6639, 0, 0,0.139331, 0, 0),
(62659,29,-2418.73,-12398.3,13.0283, 0, 0,0.575227, 0, 0),
(62659,30,-2384.31,-12379.1,17.7898, 0, 0,1.48629, 0, 0),
(62659,31,-2382.4,-12364.1,17.9175, 0, 0,1.49022, 0, 0),
(62659,32,-2383.5,-12350.5,20.2406, 0, 0,1.4588, 0, 0),
(62659,33,-2378.48,-12313.5,23.1655, 0, 0,1.44701, 0, 0),
(62659,34,-2382.79,-12357.9,18.9643, 0, 0,4.72605, 0, 0),
-- #2
(62660,1,-2691.79,-12016.7,15.6688, 0, 0,2.79422, 0, 0),
(62660,2,-2721.94,-12006.6,10.5067, 0, 0,2.19496, 0, 0),
(62660,3,-2727.7,-11996,9.24821, 0, 0,2.01432, 0, 0),
(62660,4,-2733.93,-11983.6,9.4894, 0, 0,1.76771, 0, 0),
(62660,5,-2738.36,-11970.9,10.3774, 0, 0,2.02296, 0, 0),
(62660,6,-2743.09,-11962.1,8.31357, 0, 0,2.75338, 0, 0),
(62660,7,-2757.22,-11957.5,4.20615, 0, 0,2.81621, 0, 0),
(62660,8,-2771.52,-11952.6,2.9789, 0, 0,2.79265, 0, 0),
(62660,9,-2757.27,-11957.1,4.16655, 0, 0,5.93032, 0, 0),
(62660,10,-2743.1,-11962.3,8.36629, 0, 0,5.29022, 0, 0),
(62660,11,-2735.78,-11976.3,10.2538, 0, 0,4.89124, 0, 0),
(62660,12,-2731.72,-11989.2,9.28181, 0, 0,5.29651, 0, 0),
(62660,13,-2721.7,-12006.6,10.5247, 0, 0,5.82036, 0, 0),
(62660,14,-2691.62,-12016.7,15.6822, 0, 0,5.93817, 0, 0),
(62660,15,-2670.26,-12024.7,16.7216, 0, 0,5.90676, 0, 0),
(62660,16,-2644.78,-12036.9,20.9511, 0, 0,5.7968, 0, 0),
(62660,17,-2625.31,-12045.7,25.852, 0, 0,5.91853, 0, 0),
(62660,18,-2600.46,-12054.3,28.4015, 0, 0,0.2189, 0, 0),
(62660,19,-2579.6,-12048.2,29.8126, 0, 0,0.283301, 0, 0),
(62660,20,-2554.67,-12040.4,29.6492, 0, 0,0.31079, 0, 0),
(62660,21,-2531.69,-12029.9,30.6551, 0, 0,0.290369, 0, 0),
(62660,22,-2502.58,-12020,28.4393, 0, 0,0.329639, 0, 0),
(62660,23,-2473.71,-12006.4,28.4928, 0, 0,0.41996, 0, 0),
(62660,24,-2463.36,-12002.7,26.53, 0, 0,0.44902, 0, 0),
(62660,25,-2433.21,-11994.3,22.4339, 0, 0,0.0107675, 0, 0),
(62660,26,-2406.36,-11995.6,27.2137, 0, 0,6.22327, 0, 0),
(62660,27,-2432.97,-11994.4,22.4748, 0, 0,3.28195, 0, 0),
(62660,28,-2473.65,-12006.1,28.4303, 0, 0,3.66523, 0, 0),
(62660,29,-2502.47,-12020,28.4346, 0, 0,3.50736, 0, 0),
(62660,30,-2531.91,-12029.9,30.6577, 0, 0,3.527, 0, 0),
(62660,31,-2556.92,-12041.3,29.7289, 0, 0,3.4084, 0, 0),
(62660,32,-2577.95,-12047.8,29.9765, 0, 0,3.44333, 0, 0),
(62660,33,-2600.42,-12054.4,28.3958, 0, 0,3.08205, 0, 0),
(62660,34,-2632.36,-12043,24.5629, 0, 0,2.74825, 0, 0),
(62660,35,-2645.61,-12036.6,20.7164, 0, 0,2.69328, 0, 0),
(62660,36,-2668.11,-12025.5,16.7668, 0, 0,2.68633, 0, 0),
-- #3
(62661,1,-2585.18,-11965.6,22.7161, 0, 0,0.616802, 0, 0),
(62661,2,-2577.24,-11957.4,22.2605, 0, 0,1.21999, 0, 0),
(62661,3,-2563.34,-11933.9,20.2493, 0, 0,0.442444, 0, 0),
(62661,4,-2528.55,-11925.2,19.2173, 0, 0,0.250082, 0, 0),
(62661,5,-2563.77,-11934.7,20.2574, 0, 0,3.95716, 0, 0),
(62661,6,-2577.31,-11957.1,22.2335, 0, 0,3.97994, 0, 0),
(62661,7,-2586.13,-11965.4,22.5537, 0, 0,3.37125, 0, 0),
(62661,8,-2614.95,-11971.9,23.8941, 0, 0,3.22026, 0, 0),
(62661,9,-2630.92,-11973,19.6761, 0, 0,3.19046, 0, 0),
(62661,10,-2656.02,-11975.2,16.8761, 0, 0,3.6829, 0, 0),
(62661,11,-2674.06,-11990,16.5889, 0, 0,4.04497, 0, 0),
(62661,12,-2679.94,-11999.3,14.752, 0, 0,4.16278, 0, 0),
(62661,13,-2691.21,-12017,15.7208, 0, 0,4.14707, 0, 0),
(62661,14,-2697.95,-12027,14.499, 0, 0,3.6562, 0, 0),
(62661,15,-2711.01,-12035.9,11.0296, 0, 0,3.76223, 0, 0),
(62661,16,-2720.58,-12042.4,10.61, 0, 0,2.82839, 0, 0),
(62661,17,-2734.31,-12034.1,12.361, 0, 0,2.57706, 0, 0),
(62661,18,-2752.79,-12023.5,9.00248, 0, 0,2.1176, 0, 0),
(62661,19,-2775.84,-11996.3,4.08091, 0, 0,2.27482, 0, 0),
(62661,20,-2752.17,-12024.2,9.16063, 0, 0,5.77377, 0, 0),
(62661,21,-2734.59,-12033.9,12.3502, 0, 0,5.78947, 0, 0),
(62661,22,-2719.82,-12042,10.5647, 0, 0,0.550864, 0, 0),
(62661,23,-2696.93,-12026.2,14.7602, 0, 0,0.920787, 0, 0),
(62661,24,-2691.33,-12017,15.7084, 0, 0,0.990687, 0, 0),
(62661,25,-2680.43,-12000.3,14.7066, 0, 0,1.00247, 0, 0),
(62661,26,-2673.66,-11989.1,16.7064, 0, 0,0.982833, 0, 0),
(62661,27,-2655.01,-11974.8,17.0985, 0, 0,0.0639174, 0, 0),
(62661,28,-2639.8,-11973.5,18.5824, 0, 0,0.0639174, 0, 0),
(62661,29,-2615.12,-11971.9,23.8789, 0, 0,0.237491, 0, 0),
(62661,30,-2598.21,-11968.4,22.8049, 0, 0,0.202148, 0, 0),
-- #4
(60840,1,-2354.88,-12049.2,29.1002, 0, 0,2.06772, 0, 0),
(60840,2,-2347.63,-12062.6,31.8446, 0, 0,5.19361, 0, 0),
(60840,3,-2338.62,-12081,30.9971, 0, 0,5.16219, 0, 0),
(60840,4,-2334.76,-12089,31.7895, 0, 0,4.58728, 0, 0),
(60840,5,-2333.36,-12118.8,30.3367, 0, 0,5.37817, 0, 0),
(60840,6,-2326.36,-12126,31.8092, 0, 0,5.75289, 0, 0),
(60840,7,-2301.66,-12139.8,31.6714, 0, 0,5.75446, 0, 0),
(60840,8,-2276.09,-12157.9,31.0037, 0, 0,5.39082, 0, 0),
(60840,9,-2264.62,-12170.1,32.7418, 0, 0,5.45241, 0, 0),
(60840,10,-2252.42,-12183.4,29.7786, 0, 0,5.46027, 0, 0),
(60840,11,-2244.95,-12192.2,30.547, 0, 0,5.3778, 0, 0),
(60840,12,-2251.9,-12183.9,29.7598, 0, 0,2.29904, 0, 0),
(60840,13,-2275.13,-12158.6,30.8636, 0, 0,2.78677, 0, 0),
(60840,14,-2297.88,-12142.6,31.4913, 0, 0,2.51974, 0, 0),
(60840,15,-2327.08,-12125.7,31.6311, 0, 0,2.40978, 0, 0),
(60840,16,-2333.4,-12118.5,30.3005, 0, 0,1.89613, 0, 0),
(60840,17,-2334.97,-12088.2,31.6734, 0, 0,2.04379, 0, 0);

-- Brown Bear
UPDATE creature SET MovementType = 1, spawndist = 15 WHERE id = 17345;
UPDATE creature SET position_x = -2743.129150, position_y = -12153.516602, position_z = 7.622957 WHERE guid = 62555;
UPDATE creature SET position_x = -2716.848877, position_y = -12253.462891, position_z = 7.408563 WHERE guid = 62556;
UPDATE creature SET position_x = -2668.269531, position_y = -12249.446289, position_z = 13.364254 WHERE guid = 62557;
UPDATE creature SET position_x = -2434.797607, position_y = -12419.379883, position_z = 10.584228 WHERE guid = 62564;
UPDATE creature SET position_x = -2348.457764, position_y = -12380.643555, position_z = 16.991001 WHERE guid = 62567;
UPDATE creature SET position_x = -2368.188721, position_y = -12313.368164, position_z = 22.596729 WHERE guid = 62570;
UPDATE creature SET position_x = -2323.888672, position_y = -12077.543945, position_z = 32.521488 WHERE guid = 62575;
UPDATE creature SET position_x = -2344.363525, position_y = -12118.871094, position_z = 31.731777 WHERE guid = 62574;
UPDATE creature SET position_x = -2591.869873, position_y = -12040.542969, position_z = 28.711868 WHERE guid = 62561;

-- Bloodmyst Hatchling
UPDATE creature SET position_x = -2740.675781, position_y = -12290.670898, position_z = 2.404743 WHERE guid = 63062;
UPDATE creature SET position_x = -2689.658203, position_y = -12312.978516, position_z = 5.160772 WHERE guid = 63065;
UPDATE creature SET position_x = -2588.625244, position_y = -12478.833008, position_z = 1.810126 WHERE guid = 63076;

-- Wrathscale Screamer & Shorestalker
UPDATE creature SET position_x = -2325.175293, position_y = -12250.950195, position_z = 23.465427 WHERE guid = 62306;
UPDATE creature SET position_x = -2203.168457, position_y = -12321.615234, position_z = 54.555943 WHERE guid = 62297;
UPDATE creature SET position_x = -2220.247559, position_y = -12215.977539, position_z = 32.171543, MovementType = 1, spawndist = 15 WHERE guid = 62303;

-- Lord Xiz
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 63448;
DELETE FROM creature_movement WHERE id = 63448;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17701;
DELETE FROM creature_movement_template WHERE entry = 17701;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17701,1,-2257.03,-12321.4,57.2947, 0, 0,3.14737, 0, 0),
(17701,2,-2216.75,-12321.5,57.3022, 0, 0,6.24969, 0, 0);

-- Bristlelimb Warrior & Shaman
UPDATE creature SET position_x = -2578.408447, position_y = -12189.558594, position_z = 27.447445 WHERE guid = 62091;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (62118,62102,62117,62105,62124,62120,62094,62098,62112);
    
    

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

