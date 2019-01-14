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
    SET @cOldContent = '007';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '008';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'gameobject_template_error_cle';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'gameobject_template_error_cleanup';

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

    
	DELETE FROM `gameobject_template` WHERE `entry` IN (12653,103575,128972,160842,175590,176592,176750,178188,177529,177493,178124,178248,178644,178963,179527,179530,179531,180525,181214,181290,181604,181831,181838,181840,181842,181844,183929,184718,178673,184958,184910,184981,185297,185305,185862,186471,188509,4,129);
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES
	(4,6,0,'Bonfire Damage','','',0,0,1,0,1,3,7902,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(129,6,0,'Naxx Teleporter trap','','',0,0,1,0,1,0,64446,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(12653,6,1287,'Cat Figurine Trap','','',14,0,1,0,0,0,5968,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(103575,6,327,'Containment Coffer TRAP','','',0,0,1,0,0,0,9012,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(128972,6,299,'TEMP Shallow Grave Trap','','',0,0,1,0,0,0,10247,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(160842,6,2770,'Gor\tesh\s Lopped Off Head','','',0,0,1,0,0,50,13488,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(175590,6,299,'TEMP Spire Spider Egg Trap','','',0,0,1,0,0,0,16453,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(176592,6,299,'TEMP Shellfish Trap','','',0,0,1,0,0,0,17679,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(176750,6,299,'Kodo Bones Trap','','',0,0,1,0,0,0,17960,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(177493,6,327,'Fire of Elune (Trap)','','',0,0,1,0,0,0,18955,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(177529,6,327,'Altar of Elune (Trap) (DND)','','',0,0,1,0,0,0,18993,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178124,6,327,'Resonite Crystal (Trap)','','',0,0,1,0,0,5,20492,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178188,6,410,'Molten Core Circle BARON','','',0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178248,6,327,'Naga Brazier (trap) (DND)','','',0,0,1,0,0,0,20863,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178644,6,299,'TEMP Ryson\s All Seeing Eye Trap','','',0,0,1,0,0,0,21546,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178673,6,5752,'Consuming Flames Trap','','',0,0,1.2,95,60,20,21650,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(178963,6,2770,'Incantion of Celebras Trap','','',0,0,1,0,0,0,21917,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(179527,6,299,'TEMP Warpwood Pod Trap','','',0,0,1,0,0,0,22800,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(179530,6,299,'TEMP Warpwood Pod Trap','','',0,0,1,0,0,0,22800,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(179531,6,299,'TEMP Warpwood Pod Trap','','',0,0,1,0,0,0,22800,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(180525,6,6424,'Tonk Control Console Trap','','',0,0,1,0,0,0,24935,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181214,6,327,'Necropolis critter spawner','','',0,0,1,0,0,0,27866,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181290,6,0,'Midsummer Bonfire Spawn Trap','','',0,0,1,0,0,0,28784,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181604,6,6771,'TEST Ribbon Pole TRAP','','',0,0,1,0,0,0,29708,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181831,6,299,'TEMP Sealed Tome Trap','','',0,0,1,0,0,0,30762,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181838,6,299,'TEMP Sealed Tome Trap','','',0,0,1,0,0,0,30763,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181840,6,299,'TEMP Sealed Tome Trap','','',0,0,1,0,0,0,30764,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181842,6,299,'TEMP Sealed Tome Trap','','',0,0,1,0,0,0,30765,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(181844,6,299,'TEMP Sealed Tome Trap','','',0,0,1,0,0,0,30766,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(183929,6,0,'','','',35,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(184718,6,327,'Cauldron Summoner','','',0,0,1,0,0,0,36549,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(184910,6,2373,'Power Converter','','',0,0,0.5,0,0,0,37278,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(184958,6,7247,'Nether Drake Egg','','',0,0,1.5,0,0,0,37574,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(184981,6,299,'TEMP Felhound Poo Trap','','',0,0,1,0,0,0,37695,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(185297,6,1310,'Lianthe\s Strongbox','','',0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(185305,6,7298,'Fumper Trap','','',0,0,1,0,0,0,39217,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(185862,6,0,'Fel Cannonball Stack Trap','','',0,0,1,0,0,0,40181,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(186471,6,6371,'Super Brew Stein','','',35,0,3,0,0,8,42696,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(188509,6,2770,'Dark Iron Mole Machine (Minion Summoner Trap)','','',0,0,1,0,0,0,47375,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);


	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 187882;
	UPDATE `gameobject_template` SET `size` = 1 WHERE `entry` = 188067;
	UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 188072;
	UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 188073;
	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 188077;
	UPDATE `gameobject_template` SET `size` = 2 WHERE `entry` = 188142;
	UPDATE `gameobject_template` SET `size` = .5 WHERE `entry` = 194752;
	UPDATE `gameobject_template` SET `size` = .17 WHERE `entry` =  202931;
    

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

