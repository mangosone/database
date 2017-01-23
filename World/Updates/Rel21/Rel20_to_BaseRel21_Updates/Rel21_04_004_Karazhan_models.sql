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
    SET @cOldStructure = '04'; 
    SET @cOldContent = '03';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '04';
    SET @cNewContent = '04';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Karazhan_models';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Karazhan_models';

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
-- Thanks to saben, This code is also in TWO
-- Spectral Servant
UPDATE `creature_template` SET `modelid2`=16465, `modelid3`=16466, `modelid4`=16467 WHERE `entry`=16409;
-- Phantom Guest
UPDATE `creature_template` SET `modelid2`=16486, `modelid3`=16487, `modelid4`=16488 WHERE `entry`=16407;
-- Ghostly Steward
UPDATE `creature_template` SET `modelid2`=16536, `modelid3`=16537, `modelid4`=16538 WHERE `entry`=16414;
-- Spectral Chef
UPDATE `creature_template` SET `modelid2`=16525, `modelid3`=16526, `modelid4`=16527 WHERE `entry`=16411;
-- Ghostly Baker
UPDATE `creature_template` SET `modelid2`=16530, `modelid3`=16531, `modelid4`=16532 WHERE `entry`=16412;
-- Phantom Valet
UPDATE `creature_template` SET `modelid2`=16495, `modelid3`=16496, `modelid4`=16497 WHERE `entry`=16408;
-- Spectral Sentry
UPDATE `creature_template` SET `modelid2`=16459, `modelid3`=16460, `modelid4`=16461 WHERE `entry`=16424;
-- Wanton Hostess
UPDATE `creature_template` SET `modelid2`=16544, `modelid3`=16545, `modelid4`=16546 WHERE `entry`=16459;
-- Concubine
UPDATE `creature_template` SET `modelid2`=16552, `modelid3`=16553, `modelid4`=16554 WHERE `entry`=16461;
-- Night Mistress
UPDATE `creature_template` SET `modelid2`=16548, `modelid3`=16549, `modelid4`=16550 WHERE `entry`=16460;
-- Spectral Patron
UPDATE `creature_template` SET `modelid2`=16556, `modelid3`=16557, `modelid4`=16558 WHERE `entry`=16468;
-- Spectral Performer
UPDATE `creature_template` SET `modelid2`=16568, `modelid3`=16569, `modelid4`=18979 WHERE `entry`=16473;
-- Phantom Stagehand
UPDATE `creature_template` SET `modelid2`=16564, `modelid3`=16565, `modelid4`=16566 WHERE `entry`=16472;
-- Ghostly Philanthropist
UPDATE `creature_template` SET `modelid2`=16560, `modelid3`=16561, `modelid4`=16562 WHERE `entry`=16470;
-- Shadow Pillager
UPDATE `creature_template` SET `modelid2`=16905, `modelid3`=16906, `modelid4`=16907 WHERE `entry`=16540;
-- Phantom Attendant
UPDATE `creature_template` SET `modelid2`=16515, `modelid3`=16516, `modelid4`=16517 WHERE `entry`=16406;
-- Spectral Retainer
UPDATE `creature_template` SET `modelid2`=16510, `modelid3`=16511, `modelid4`=16512 WHERE `entry`=16410;
-- Spectral Stable Hand
UPDATE `creature_template` SET `modelid2`=16398, `modelid3`=16399, `modelid4`=16400 WHERE `entry`=15551;
-- Spectral Apprentice
UPDATE `creature_template` SET `modelid2`=16437, `modelid3`=16440, `modelid4`=16441 WHERE `entry`=16389;
    

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

