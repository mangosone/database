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
    SET @cOldContent = '006';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '007';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'creatureai_startup_error_fix';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'creatureai_startup_error_fix';

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

    delete FROM `creature_ai_scripts` WHERE creature_id IN (16905);
	insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values
	(1690501,16905,1,0,100,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Prevent Combat Movement on Spawn'),
	(1690502,16905,4,0,100,0,0,0,0,0,11,9053,1,0,22,1,0,0,0,0,0,0,'Unyielding Sorcerer - Cast Fireball and Set Phase 1 on Aggro'),
	(1690503,16905,9,13,100,1,0,40,2400,3800,11,9053,1,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Cast Fireball (Phase 1)'),
	(1690504,16905,3,13,100,1,15,0,1000,1000,21,1,0,0,23,1,0,0,0,0,0,0,'Unyielding Sorcerer - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
	(1690505,16905,9,13,100,1,25,80,1000,1000,21,1,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Start Combat Movement at 35 Yards (Phase 1)'),
	(1690506,16905,9,13,100,1,5,15,1000,1000,21,0,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Prevent Combat Movement at 15 Yards (Phase 1)'),
	(1690507,16905,9,13,100,1,0,5,1000,1000,21,1,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Start Combat Movement Below 5 Yards'),
	(1690508,16905,0,13,100,1,5000,9000,12000,15000,11,11829,1,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Cast Flamestrike (Phase 1)'),
	(1690509,16905,9,0,100,1,0,5,1000,1000,29,10,150,0,11,11831,0,1,0,0,0,0,'Unyielding Sorcerer - Ranged Movement at 5 Yards to Avoid Melee Combat'),
	(1690510,16905,3,11,100,1,100,30,1000,1000,22,1,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Set Phase 1 when Mana is above 30% (Phase 2)'),
	(1690511,16905,2,0,100,0,15,0,0,0,11,11831,0,1,22,3,0,0,0,0,0,0,'Unyielding Sorcerer - Cast Frost Nova and Set Phase 3 at 15% HP'),
	(1690512,16905,2,7,100,0,15,0,0,0,21,1,0,0,25,0,0,0,1,-47,0,0,'Unyielding Sorcerer - Start Combat Movement and Flee at 15% HP (Phase 3)'),
	(1690513,16905,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0,0,'Unyielding Sorcerer - Set Phase to 0 on Evade');
	update `creature_ai_scripts` set `action1_type` = 11 , `action1_param1` = 34080 , `action1_param3` = 1 where `id` = 1696401;
	update `creature_ai_scripts` set `action1_param2` = 6, `comment` = 'Apprentice Tedon - change targets unitFlag on Receive AI Event' where `id` = 2022701;

	-- Bonus fix, Volatile Mutation Cage rotation fixed.
	update `gameobject` set `rotation2` = -0.857167 , `rotation3` = 0.515038 where `guid` = 21645;
	-- Delete unused guid from creature_addon (Clean up from Rel21_09_003)
	delete from `creature_addon` where `guid` = 96996;
    

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

