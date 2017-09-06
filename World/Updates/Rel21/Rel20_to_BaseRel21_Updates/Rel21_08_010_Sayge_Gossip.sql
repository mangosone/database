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
    SET @cOldStructure = '08'; 
    SET @cOldContent = '009';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '08';
    SET @cNewContent = '010';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Sayge_Gossip';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Sayge_Gossip';

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

    -- npc_sayge

	DELETE FROM conditions WHERE condition_entry IN (855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870);
	INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
	(855, 1, 23768, 0),
	(856, 1, 23769, 0),
	(857, 1, 23767, 0),
	(858, 1, 23738, 0),
	(859, 1, 23766, 0),
	(860, 1, 23737, 0),
	(861, 1, 23736, 0),
	(862, 1, 23735, 0),
	(863, -2, 855, 856),
	(864, -2, 857, 858),
	(865, -2, 859, 860),
	(866, -2, 861, 862),
	(867, -2, 863, 864),
	(868, -2, 865, 866),
	(869, -2, 867, 868),
	(870, -3, 869, 0);
	UPDATE gossip_menu SET condition_id = 870 WHERE entry = 6186 AND text_id = 7339;
	DELETE FROM gossip_menu WHERE entry = 6189 AND text_id = 7393;
	INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
	(6189, 7393, 0, 869);
	UPDATE gossip_menu_option SET condition_id = 870 WHERE menu_id = 6186 AND id = 0;
	DELETE FROM db_scripts WHERE id IN (618701, 618702, 618703, 620801, 620802, 620901, 620902, 620903, 6211);
	INSERT INTO db_scripts (id, script_type, command, datalong, comments) VALUES
	(618701, 2, 15, 23768, 'cast Sayge\'s Dark Fortune of Damage'),
	(618702, 2, 15, 23769, 'cast Sayge\'s Dark Fortune of Resistance'),
	(618703, 2, 15, 23767, 'cast Sayge\'s Dark Fortune of Armor'),
	(620801, 2, 15, 23738, 'cast Sayge\'s Dark Fortune of Spirit'),
	(620802, 2, 15, 23766, 'cast Sayge\'s Dark Fortune of Intelligence'),
	(620901, 2, 15, 23737, 'cast Sayge\'s Dark Fortune of Stamina'),
	(620902, 2, 15, 23735, 'cast Sayge\'s Dark Fortune of Strength'),
	(620903, 2, 15, 23736, 'cast Sayge\'s Dark Fortune of Agility'),
	(6211, 2, 15, 23765, 'cast Sayge\'s Darkmoon Faire Fortune');
	UPDATE gossip_menu_option SET action_script_id = 618701 WHERE menu_id = 6187 AND id = 0;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 618702 WHERE menu_id = 6187 AND id = 1;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 618703 WHERE menu_id = 6187 AND id = 2;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620801 WHERE menu_id = 6208 AND id = 0;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620802 WHERE menu_id = 6208 AND id = 1;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 618702 WHERE menu_id = 6208 AND id = 2;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620901 WHERE menu_id = 6209 AND id = 0;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620902 WHERE menu_id = 6209 AND id = 1;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620903 WHERE menu_id = 6209 AND id = 2;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620802 WHERE menu_id = 6210 AND id = 0;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 620801 WHERE menu_id = 6210 AND id = 1;
	UPDATE gossip_menu_option SET action_menu_id = 6211, action_script_id = 618703 WHERE menu_id = 6210 AND id = 2;
	UPDATE gossip_menu_option SET action_script_id = 6211 WHERE menu_id = 6211 AND id = 0;

    

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

