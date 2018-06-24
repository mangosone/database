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
    SET @cOldContent = '024';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '025';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Pusillin fully scripted';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Pusillin fully scripted';

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

    -- Updates to Pusillin to support script and waypoints.
	UPDATE `creature_template` SET `FactionAlliance` = 35, `FactionHorde` = 35, `SpeedWalk` = 1, `SpeedRun` = 2.57143, `MovementType` = 2 WHERE `Entry` = 14354;
	UPDATE `creature` SET `spawntimesecs` = 7200, `MovementType` = 2 WHERE `id` = 14354;

	-- Scripts added and script strings.
	DELETE FROM `db_scripts` WHERE id IN (570901,570902,570903,570904,570905,1435401,1435402);
	INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(2,570901,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,'UNPAUSE'),
	(2,570901,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
	(2,570901,1,0,0,0,0,0,0,2000005460,0,0,0,0,0,0,0,''),
	(2,570902,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,'UNPAUSE'),
	(2,570902,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
	(2,570902,1,0,0,0,0,0,0,2000005461,0,0,0,0,0,0,0,''),
	(2,570903,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,'UNPAUSE'),
	(2,570903,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
	(2,570903,1,0,0,0,0,0,0,2000005462,0,0,0,0,0,0,0,''),
	(2,570904,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,'UNPAUSE'),
	(2,570904,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
	(2,570904,1,0,0,0,0,0,0,2000005463,0,0,0,0,0,0,0,''),
	(2,570905,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
	(2,570905,1,0,0,0,0,0,0,2000005464,0,0,0,0,0,0,0,''),
	(2,570905,3,10,13276,120000,0,0,0,0,0,0,0,14.7965,-696.322,-12.6426,4.4823,'summon - Wildspawn Imp'),
	(2,570905,3,10,13276,120000,0,0,0,0,0,0,0,18.8891,-697.389,-12.6426,4.35271,'summon - Wildspawn Imp'),
	(2,570905,3,10,13276,120000,0,0,0,0,0,0,0,21.4274,-700.227,-12.6426,4.06997,'summon - Wildspawn Imp'),
	(2,570905,3,10,13276,120000,0,0,0,0,0,0,0,22.2017,-705.459,-12.6426,3.48092,'summon - Wildspawn Imp'),
	(2,570905,4,15,22735,0,0,0,0,0,0,0,0,0,0,0,0,'TRANSFORM'),
	(2,570905,4,22,90,1,0,0,0,0,0,0,0,0,0,0,0,'set DemonFaction'),
	(3,1435401,0,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'PAUSE ON'),
	(3,1435401,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
	(3,1435402,0,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'PAUSE ON'),
	(3,1435402,0,29,3,1,0,0,0,0,0,0,0,0,0,0,0,'npc_flag added');

	DELETE FROM `db_script_string` WHERE ENTRY IN (2000005460,2000005461,2000005462,2000005463,2000005464);
	INSERT INTO `db_script_string` (`entry`, `content_default`) VALUES
	(2000005460,'If you want the key, you\'ll have to catch me!'),
	(2000005461,'Chase me if you dare! I run without a care!'),
	(2000005462,'Why would you ever want to harm me!? Come. Friends we can be!'),
	(2000005463,'DIE?! You make Pusillin cry!'),
	(2000005464,'Say hello to my little friends!');

	-- Conditions.
	DELETE FROM conditions WHERE condition_entry IN (719,720,721,722,723);
	INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
	(719,33,1,0),
	(720,33,3,0),
	(721,33,10,0),
	(722,33,22,0),
	(723,33,28,0);

	-- Add correct gossip support.
	DELETE FROM `gossip_menu` WHERE `text_id` IN (6877,6878,6879,6880,6881);
	INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
	(5709,6877,719),
	(5709,6878,720),
	(5709,6879,721),
	(5709,6880,722),
	(5709,6881,723);

	DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (5709,5712,5713);
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
	(5709,0,0,'Game? Are you crazy?',1,1,-1,0,570901,0,0,NULL,719),
	(5709,1,0,'Why you little...',1,1,-1,0,570902,0,0,NULL,720),
	(5709,2,0,'Mark my words, I will catch you, imp. And when I do!',1,1,-1,0,570903,0,0,NULL,721),
	(5709,3,0,'DIE!',1,1,-1,0,570904,0,0,NULL,722),
	(5709,4,0,'Prepare to meet your maker.',1,1,-1,0,570905,0,0,NULL,723);

	-- Waypoints added.
	DELETE FROM `creature_movement_template` WHERE `entry` = 14354;
	INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
	(14354,1,87.6813,-198.631,-4.13498,1000,1435401,5.82043),
	(14354,2,-161.902,-199.74,-4.15296,0,0,0),
	(14354,3,-150.171,-278.348,-4.14787,1000,1435402,0),
	(14354,4,-153.059,-302.431,-4.14555,0,0,0),
	(14354,5,-139.489,-315.995,-4.08367,0,0,0),
	(14354,6,-153.976,-350.542,-4.15124,0,0,0),
	(14354,7,-78.3584,-348.637,-4.06238,0,0,0),
	(14354,8,-22.424,-353.666,-4.10318,0,0,0),
	(14354,9,82.9147,-348.141,-4.0564,0,0,0),
	(14354,10,110.87,-358.995,-4.14949,1000,1435402,0),
	(14354,11,111.679,-468.421,-2.71884,0,0,0),
	(14354,12,111.693,-485.157,-6.84356,0,0,0),
	(14354,13,111.718,-515.394,-6.91479,0,0,0),
	(14354,14,111.73,-529.729,-10.8699,0,0,0),
	(14354,15,106.518,-539.857,-11.0802,0,0,0),
	(14354,16,92.8557,-545.29,-11.0808,0,0,0),
	(14354,17,79.3301,-544.812,-15.0739,0,0,0),
	(14354,18,67.4017,-548.451,-15.2879,0,0,0),
	(14354,19,55.4995,-557.068,-19.2782,0,0,0),
	(14354,20,50.3342,-566.387,-19.4475,0,0,0),
	(14354,21,50.0126,-585.944,-23.5729,0,0,0),
	(14354,22,51.0541,-633.703,-25.1224,1000,1435402,0),
	(14354,23,30.5916,-688.038,-25.1611,0,0,0),
	(14354,24,3.28358,-700.483,-25.1611,0,0,0),
	(14354,25,2.90135,-668.58,-12.6426,0,0,0),
	(14354,26,16.8739,-671.39,-12.6426,0,0,0),
	(14354,27,16.4463,-703.771,-12.6426,0,0,0),
	(14354,28,8.53742,-704.414,-12.6426,1000,1435402,0);


    

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

