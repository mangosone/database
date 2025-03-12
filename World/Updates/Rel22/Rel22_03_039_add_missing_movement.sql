-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
CREATE PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '03'; 
    SET @cOldContent = '038';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '039';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Add_Missing_Movement';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Add_Missing_Movement_scripts';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
		
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` IN (362701,362702,362703,362704,362705,362706,362707,362708,362709,362710,362711,362712,362713,362714,362715);
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` = 667001;
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` = 667002;
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` = 5683901;
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` IN (3801,3802,3803,3804,3805,3806,3807);
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` = 1091901;
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` = 1119601;
        DELETE FROM `db_scripts` WHERE `script_type`= 3 AND `id` IN (137001,137002,137003,137004,137005,137006,137007,137008,137009);

        INSERT INTO `db_scripts` (`script_guid`, `script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
        (1901,3,362701,0,0,0,0,0,0,0,2000005185,0,0,0,0,0,0,0,''),
        (1902,3,362702,0,0,0,0,0,0,0,2000005186,0,0,0,0,0,0,0,''),
        (1903,3,362703,0,0,0,0,0,0,0,2000005187,0,0,0,0,0,0,0,''),
        (1904,3,362704,0,0,0,0,0,0,0,2000005188,0,0,0,0,0,0,0,''),
        (1905,3,362705,0,0,0,0,0,0,0,2000005189,0,0,0,0,0,0,0,''),
        (1906,3,362706,0,0,0,0,0,0,0,2000005190,0,0,0,0,0,0,0,''),
        (1907,3,362707,0,0,0,0,0,0,0,2000005191,0,0,0,0,0,0,0,''),
        (1908,3,362708,0,0,0,0,0,0,0,2000005192,0,0,0,0,0,0,0,''),
        (1909,3,362709,0,0,0,0,0,0,0,2000005193,0,0,0,0,0,0,0,''),
        (1910,3,362710,0,0,0,0,0,0,0,2000005194,0,0,0,0,0,0,0,''),
        (1911,3,362711,0,0,0,0,0,0,0,2000005195,0,0,0,0,0,0,0,''),
        (1912,3,362712,0,0,0,0,0,0,0,2000005196,0,0,0,0,0,0,0,''),
        (1913,3,362713,0,0,0,0,0,0,0,2000005197,0,0,0,0,0,0,0,''),
        (1914,3,362714,0,0,0,0,0,0,0,2000005198,0,0,0,0,0,0,0,''),
        (1915,3,362715,0,0,0,0,0,0,0,2000005199,0,0,0,0,0,0,0,''),
        (1938,3,667001,3,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1939,3,667001,87,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1940,3,667002,3,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1950,3,5683901,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Lava Surger - Run'),

        (1960,3,3801,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Defias Thug - RUN ON'),
        (1961,3,3802,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'Defias Thug - RUN OFF'),
        (1962,3,3803,0,20,1,5,0,0,0,0,0,0,0,0,0,0,0,'Defias Thug - movement chenged to 1:random'),
        (1963,3,3803,20,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'Defias Thug - movement chenged to 2:waypoint'),
        (1964,3,3804,1,31,38,10,0,0,0,0,0,0,0,0,0,0,0,'search for 38'),
        (1965,3,3804,2,1,1,0,38,80151,23,0,0,0,0,0,0,0,0,''),
        (1966,3,3804,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1967,3,3805,1,31,38,10,0,0,0,0,0,0,0,0,0,0,0,'search for 38'),
        (1968,3,3805,2,1,1,0,38,80185,23,0,0,0,0,0,0,0,0,''),
        (1969,3,3805,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1970,3,3806,1,31,38,10,0,0,0,0,0,0,0,0,0,0,0,'search for 38'),
        (1971,3,3806,2,1,1,0,38,80189,23,0,0,0,0,0,0,0,0,''),
        (1972,3,3806,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1973,3,3807,1,31,38,10,0,0,0,0,0,0,0,0,0,0,0,'search for 38'),
        (1974,3,3807,2,1,1,0,38,80200,23,0,0,0,0,0,0,0,0,''),
        (1975,3,3807,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1980,3,1091901,0,1,10,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (1990,3,1119601,0,1,36,0,0,0,0,0,0,0,0,0,0,0,0,''),
        (2000,3,137001,0,0,0,0,0,0,0,2000005123,0,0,0,0,0,0,0,''),
        (2001,3,137002,0,0,0,0,0,0,0,2000005124,0,0,0,0,0,0,0,''),
        (2002,3,137003,0,0,0,0,0,0,0,2000005125,0,0,0,0,0,0,0,''),
        (2003,3,137004,0,0,0,0,0,0,0,2000005126,0,0,0,0,0,0,0,''),
        (2004,3,137005,0,0,0,0,0,0,0,2000005127,0,0,0,0,0,0,0,''),
        (2005,3,137006,0,0,0,0,0,0,0,2000005128,0,0,0,0,0,0,0,''),
        (2006,3,137007,0,0,0,0,0,0,0,2000005129,0,0,0,0,0,0,0,''),
        (2007,3,137008,0,0,0,0,0,0,0,2000005130,0,0,0,0,0,0,0,''),
        (2008,3,137009,0,0,0,0,0,0,0,2000005131,0,0,0,0,0,0,0,'');

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
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


