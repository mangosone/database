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
    SET @cOldContent = '019';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '09';
    SET @cNewContent = '020';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Quest_gossip_support';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Quest_gossip_support';

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

    DELETE FROM `db_scripts` WHERE `id` IN (7976,7762); 
INSERT INTO `db_scripts` (`script_type`, `id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2,7976,0,7,10172,5,0,0,0,0,0,0,0,0,0,0,0,'quest complete 10172'),
(2,7762,0,7,10044,5,0,0,0,0,0,0,0,0,0,0,0,'quest complete 10044');

DELETE fROM `conditions` WHERE `condition_entry` IN (162,511) OR `value1` IN (10172,10044);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES
(162,9,10172),
(511,9,10044);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7762,7763,7765,7766,7767,7764,7768,7974,7979,7978,7977,7976);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
(7762,0,0,'Is there anything I can do for you, Greatmother?',1,1,-1,0,7762,0,0,NULL,0),
(7763,0,0,'What is this duty?',1,1,7762,0,0,0,0,NULL,0),
(7764,0,0,'Left? How can you choose to leave?',1,1,7763,0,0,0,0,NULL,0),
(7765,0,0,'What can be done? I have tried many different things. I have done my best to help the people of Nagrand. Each time I have approached Garrosh, he has dismissed me.',1,1,7764,0,0,0,0,NULL,0),
(7766,0,0,'Do you believe that?',1,1,7765,0,0,0,0,NULL,0),
(7767,0,0,'You raised all of the orcs here, Greatmother?',1,1,7766,0,0,0,0,NULL,0),
(7768,0,0,'Hello, Greatmother. Garrosh told me that you wanted to speak with me.',1,1,7767,0,0,0,0,NULL,511),
(7768,1,0,'Garrosh is beyond redemption, Greatmother. I fear that in helping the Mag\har, I have convinced Garrosh that he is unfit to lead.',1,1,7974,0,0,0,0,NULL,162),
(7974,0,0,'I have done all that I could, Greatmother. I thank you for your kind words.',1,1,7979,0,0,0,0,NULL,0),
(7976,0,0,'I will return to Azeroth at once, Greatmother.',1,1,-1,0,7976,0,0,NULL,0),
(7977,0,0,'It is my Warchief, Greatmother. The leader of my people. From my world. He... He is the son of Durotan. He is your grandchild.',1,1,7976,0,0,0,0,NULL,0),
(7978,0,0,'Greatmother, I never had the honor. Durotan died long before my time, but his heroics are known to all on my world. The orcs of Azeroth reside in a place known as Durotar, named after your son. And... (You take a moment to breathe and think through what you are about to tell the Greatmother.)',1,1,7977,0,0,0,0,NULL,0),
(7979,0,0,'Greatmother, you are the mother of Durotan?',1,1,7978,0,0,0,0,NULL,0);

DELETE FROM `gossip_menu` WHERE `entry` IN (7762,7763,7765,7766,7767,7764,7768,7974,7979,7978,7977,7976);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(7762,9513,0,0),
(7763,9512,0,0),
(7764,9511,0,0),
(7765,9510,0,0),
(7766,9509,0,0),
(7767,9508,0,0),
(7768,9507,0,0),
(7768,9819,0,162),
(7974,9821,0,0),
(7976,9825,0,0),
(7977,9824,0,0),
(7978,9823,0,0),
(7979,9822,0,0);

DELETE FROM `npc_text` WHERE `ID` IN (9819,9821,9825,9824,9823,9822);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(9819,'','What did Garrosh tell you, $N?',0,1,0,1,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0),
(9821,'','<Greatmother Geyah nods, accepting your answer.>$B$BI can no longer fight the spirits, $N. My time has long since passed. Once again, I must thank you for all that you have done. While Garrosh may be unmovable, many of my people have been lifted by your accomplishments. They are now willing to fight for our rights as a united clan.',0,1,0,273,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0),
(9822,'','<Greatmother Geyah smiles at you.>$B$BYou remind me of my son, $N.$B$BHe was an immovable mountain: A pillar of strength and honor.$B$B<Geyah\s eyes well up with tears.>$B$BHe sacrificed himself so that we could survive. So that generations of orcs after him could be born into a world without the blood curse... Without Gul\dan and his dark Horde...$B$B<Geyah stares into the distance, lost in thought.>$B$BOh Durotan, how I wish you could be here. Your people so desperately need you...',0,1,0,1,0,0,0,18,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0),
(9823,'','<Greatmother Geyah nods.>$B$BDid you know my son?',0,1,0,273,0,6,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0),
(9824,'','Greatmother Geyah\s violet eyes lock onto yours.>$B$BYes...',0,1,0,6,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0),
(9825,'','<Tears stream down Greatmother Geyah\s face.>$B$BI... I... Durotan survived to have a child? The child Draka told me of before they left... It was their greatest fear... To raise a child in this world. On the other side of that gate was their only hope. I dared not tell Durotan, but secretly, I begged the spirits to watch over them - to protect their child and to give them strength.$B$BI... I must see my grandchild. I must see him. Please, I am too weak. You must tell him. Before I leave this world...$B$B',0,1,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,0,0);

UPDATE `creature_template` SET `GossipMenuId` = 7768 WHERE `Entry` = 18141;
    

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

