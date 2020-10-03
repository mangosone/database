-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '15'; 
    SET @cOldContent = '032';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '033';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = '';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = '';

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

DELETE FROM `creature_linking_template` WHERE `entry` OR `master_entry` IN (SELECT `id` FROM `creature` WHERE `map` = 429);
INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
(1725,36,644,1,0),
(2532,0,2533,656,0),
(2946,1,2433,3,0),
(5277,109,5709,1,0),
(5280,109,5709,1,0),
(5283,109,5709,1,0),
(5719,109,5709,1,0),
(5722,109,5709,1,0),
(7077,70,2748,20,0),
(7076,70,2748,20,0),
(7268,209,7267,1,0),
(10120,70,2748,20,0),
(8120,209,7267,1,0),
(8319,109,5709,1,0),
(7309,70,2748,20,0),
(10316,229,10316,3,0),
(10814,229,10363,7,0),
(11373,309,14507,7,0),
(11661,409,12259,1159,0),
(11662,409,12098,1159,0),
(11663,409,12018,7,0),
(11664,409,12018,7,0),
(11672,409,11988,1191,0),
(11673,409,11982,1024,0),
(12099,409,12057,1159,0),
(12119,409,12118,1671,0),
(12557,469,12435,135,0),
(14456,469,12557,143,0),
(14892,1,14857,512,0),
(14988,309,11382,4096,0),
(15117,309,11382,4096,0),
(15276,531,15275,143,0),
(15316,531,15276,132,0),
(15317,531,15276,132,0),
(15334,531,15727,4128,0),
(15428,509,15339,4112,0),
(15514,509,15370,1030,0),
(15544,531,15511,1167,0),
(15543,531,15511,1167,0),
(15546,509,15369,4112,0),
(15589,531,15727,4,0),
(15725,531,15589,4096,0),
(15726,531,15727,4128,0),
(15728,531,15727,4128,0),
(15802,531,15727,4128,0),
(15904,531,15727,4128,0),
(15910,531,15727,4128,0),
(15934,509,15369,4096,0),
(15984,531,15516,519,0),
(16063,533,16062,143,0),
(16064,533,16062,143,0),
(16065,533,16062,143,0),
(16360,533,15932,4112,0),
(16505,533,15953,7,0),
(16506,533,15953,7,0),
(16573,533,15956,1034,0),
(16803,533,16061,7,0),
(17647,0,17635,515,10),
(17996,0,17995,515,10),
(5668,0,5670,518,20),
(5707,0,5706,518,20),
(5701,0,5706,518,20),
(14349,429,14327,515,0),
(2738,0,2612,515,0),
(2721,0,2714,515,0),
(390,0,330,515,0),
(15262,531,15263,1024,0),
(15264,531,15263,1024,0),
(11459,429,11489,1,0),
(10475,289,10433,1,0),
(10433,289,10432,1,0),
(15277,531,15276,1025,0),
(15250,531,15252,1679,7),
(15246,531,15252,1679,7),
(15229,531,15510,1024,0),
(15343,509,15348,1024,0),
(15338,509,15340,1024,0),
(15355,509,15339,1024,0),
(1755,0,1754,3,100),
(15235,531,15509,1024,0),
(15236,531,15235,1667,8),
(15249,531,15235,1667,8),
(15461,509,15340,1024,0),
(15462,509,15340,1024,0),
(15318,509,15369,1024,0),
(15319,509,15369,1024,0),
(15336,509,15369,1024,0),
(4063,0,2611,515,0),
(2764,0,2611,515,0),
(2765,0,2611,515,0),
(12101,409,12057,1024,0),
(7386,0,8666,8832,0),
(15922,531,15299,4112,0),
(8421,0,8400,3,50),
(8391,0,8400,3,50),
(2331,0,2330,656,20),
(3504,0,2330,656,20),
(1414,0,1413,656,30),
(1415,0,1413,656,30),
(15542,1,15541,8323,0),
(13743,349,12225,23,0),
(11783,349,11784,515,15),
(9178,230,9156,4112,0),
(14324,429,11501,3,0),
(9445,230,9438,515,20),
(8900,230,8983,1,100),
(8906,230,8920,1,12),
(8907,230,8983,1,0),
(8920,230,8983,1,100),
(9541,230,9537,3,0),
(10604,1,2151,515,0),
(10606,1,2151,515,0),
(11671,409,11982,1024,0),
(4250,1,5933,513,0),
(5615,1,7847,513,15),
(5798,1,5797,3,15),
(5799,1,5797,3,15),
(5800,1,5797,3,15);
    

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


