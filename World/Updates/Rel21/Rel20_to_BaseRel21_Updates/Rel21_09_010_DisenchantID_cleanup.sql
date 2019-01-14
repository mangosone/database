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
    SET @cOldContent = '009';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '010';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'DisenchantID cleanup';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'DisenchantID cleanup';

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

    UPDATE `item_template` SET `DisenchantID` = 7 WHERE `entry` = 9149;
	UPDATE `item_template` SET `DisenchantID` = 44 WHERE `entry` = 34227;
	UPDATE `item_template` SET `DisenchantID` = 48 WHERE `entry` = 17982;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34228;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34231;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34232;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34241;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34242;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34247;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34329;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34331;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34333;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34335;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34336;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34337;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34340;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34341;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34343;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34344;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34355;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34372;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34374;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34376;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34378;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34427;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 34430;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 35514;
	UPDATE `item_template` SET `DisenchantID` = 67 WHERE `entry` = 37597;
	UPDATE `item_template` SET `DisenchantID` = 52 WHERE `entry` = 38506;

	-- Correct displayid
	UPDATE `item_template` SET `displayid` = 47504 WHERE `entry` = 37011;
    

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

