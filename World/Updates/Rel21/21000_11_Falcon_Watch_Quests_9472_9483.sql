-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_10_Terl_Arakor_Wetlands_gossip_text'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_11_Falcon_Watch_Quests_9472_9483';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --

    
    -- ============ Missing records added (taken from MaNGOS Two) related to the quests 9472 and 9483 in Falcon Watch, Hellfire ============ --
    -- ============ Also added Missing records for Twinkle (17230) the cat (spoken and scripted movement) ============ --
    
    -- **************** PROBLEM PROBLEM PROBLEM PROBLEM PROBLEM ** Quest 9472 is not completable  ** PROBLEM PROBLEM PROBLEM PROBLEM PROBLEM **************** --
    -- The scroll, Carinda's Scroll of Retribution (23693) is not usable. It always gives the message: "Requires Discreet Location"
    -- For details, see https://www.getmangos.eu/issue.php?issueid=229

        
    -- Spoken text for the creatures/NPCs involved in the quests, plus ones for Twinkle the cat (2000000404, 2000000405, 2000000406) 
    -- In MaNGOS Two Twinkle uses script IDs 2000000011, 2000000012, and 2000000013, but these are used for something else in MaNGOS One, so for One and Two they have
    -- been changed to 2000000404, 2000000405, and 2000000406, which are the next free numbers available in MaNGOS Two
    DELETE FROM db_script_string WHERE entry IN (2000000388, 2000000389, 2000000390, 2000000391, 2000000404, 2000000405, 2000000406);
    INSERT INTO db_script_string (entry, content_default, sound, type, language, emote) VALUES 
    ('2000000388', 'Ok, let\'s go. I know just the perfect spot!', '0', '0', '0', '0'),
    ('2000000389', 'What... is happening... to me? Get this cat away from me!', '0', '0', '0', '0'),
    ('2000000390', 'Twinkle looks at Viera Sunwhisper with very hungry eyes.', '0', '2', '0', '0'),
    ('2000000391', '%s scurries away, attempting to flee from Twinkle.', '0', '2', '0', '0'),
    ('2000000404', 'Did you find something fun to chase around, Twinkle? I bet you did!', '0', '0', '0', '1'),
    ('2000000405', 'It\'s just you and me, Twinkle. Daddy\'s not going to be coming home.', '0', '0', '0', '1'),
    ('2000000406', 'I wonder how far this would launch that white cat...', '0', '0', '0', '0');

    -- On Quest Complete script (Quest 9483)
    DELETE FROM dbscripts_on_quest_end WHERE id = 9483;
    INSERT INTO dbscripts_on_quest_end (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
    (9483,0,29,3,2,0,0,0,0,0,0,0,0,0,0,0,'npc_flag removed'),
    (9483,1,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'Viera Sunwhisper - active'),
    (9483,3,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND'),
    (9483,6,0,0,0,0,0,0,2000000388,0,0,0,0,0,0,0,''),
    (9483,6,32,1,0,17230,61963,23,0,0,0,0,0,0,0,0,'wp pause'),
    (9483,7,25,1,0,17230,61963,23,0,0,0,0,0,0,0,0,'RUN ON'),
    (9483,8,3,0,0,0,0,0,0,0,0,0,-656.13,4146.6,64.128,2.16845,''),
    (9483,8,3,0,0,17230,61963,23,0,0,0,0,-656.13,4146.6,64.128,2.16845,''),
    (9483,11,3,0,0,0,0,0,0,0,0,0,-682.265,4148.52,63.9026,1.87414,''),
    (9483,18,3,0,0,17230,61963,23,0,0,0,0,-682.265,4148.52,63.9026,1.87414,''),
    (9483,19,3,0,0,0,0,0,0,0,0,0,-699.983,4184.54,57.9007,2.85353,''),
    (9483,20,25,0,0,17230,61963,23,0,0,0,0,0,0,0,0,'RUN OFF'),
    (9483,21,3,0,0,17230,61963,23,0,0,0,0,-699.983,4184.54,57.9007,2.85353,''),
    (9483,30,3,0,0,0,0,0,0,0,0,0,-718.249,4174.95,51.9827,4.24132,''),
    (9483,31,3,0,0,17230,61963,23,0,0,0,0,-718.249,4174.95,51.9827,4.24132,''),
    (9483,37,3,0,0,0,0,0,0,0,0,0,-719.781,4168.6,51.2242,4.51228,''),
    (9483,38,3,0,0,17230,61963,23,0,0,0,0,-718.649,4170.65,51.8661,4.50951,''),
    (9483,36,32,1,0,0,0,0,0,0,0,0,0,0,0,0,'wp pause'),
    (9483,93,31,17230,220,0,0,0,0,0,0,0,0,0,0,0,''),
    (9483,94,18,0,0,17230,61963,23,0,0,0,0,0,0,0,0,''),
    (9483,94,18,0,0,17226,61961,23,0,0,0,0,0,0,0,0,'');

    -- link to the On Quest Complete script
    UPDATE quest_template SET CompleteScript=9483 WHERE entry=9483;

    -- make the same as in MaNGOS Two
    UPDATE creature_ai_scripts SET action2_type = 47 WHERE id = 1722601;

    -- missing from MaNGOS One
    DELETE FROM creature_movement_template WHERE entry = 17226;
    INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
    (17226,1,-719.781,4168.6,51.2242,7000,1722601,0,0,0,0,0,0,0,4.51228,0,0),
    (17226,2,-723.602,4123.29,49.3491,1000,1722602,0,0,0,0,0,0,0,4.60652,0,0);

    -- missing from MaNGOS One
    DELETE FROM dbscripts_on_creature_movement WHERE id IN (1722601,1722602);
    INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
    (1722601,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
    (1722601,1,25,1,0,17230,61963,23,0,0,0,0,0,0,0,0,'RUN ON'),
    (1722601,1,0,0,0,0,0,0,2000000389,0,0,0,0,0,0,0,''),
    (1722601,5,0,0,0,0,0,0,2000000390,0,0,0,0,0,0,0,''),
    (1722601,7,0,0,0,0,0,0,2000000391,0,0,0,0,0,0,0,''),
    (1722601,11,3,0,0,17230,61963,23,0,0,0,0,-723.602,4123.29,49.3491,4.60652,''),
    (1722601,9,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'Viera Sunwhisper - inactive'),
    (1722601,17,18,0,0,17230,61963,23,0,0,0,0,0,0,0,0,''),
    (1722602,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'');

    -- TWINKLE (cat)
    -- missing records
    -- creature_ai_scripts, creature_movement_template, dbscripts_on_creature_movement

    -- Twinkle's movement
    DELETE FROM creature_movement_template WHERE entry = 17230;
    INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
    (17230,1,-603.059,4166.03,64.3336,0,0,0,0,0,0,0,0,0,4.63706,0,0),
    (17230,2,-600.881,4161.52,64.9931,0,0,0,0,0,0,0,0,0,5.42795,0,0),
    (17230,3,-595.116,4157.8,65.2767,0,0,0,0,0,0,0,0,0,5.75546,0,0),
    (17230,4,-590.633,4155.53,67.8345,0,0,0,0,0,0,0,0,0,5.82222,0,0),
    (17230,5,-576.829,4149.44,68.1243,5000,1723001,0,0,0,0,0,0,0,5.86542,0,0),
    (17230,6,-591.253,4155.71,67.667,0,0,0,0,0,0,0,0,0,2.71597,0,0),
    (17230,7,-594.879,4158.15,65.2685,0,0,0,0,0,0,0,0,0,2.23766,0,0),
    (17230,8,-599.785,4161.72,65.0972,0,0,0,0,0,0,0,0,0,1.9667,0,0),
    (17230,9,-601.114,4164.75,64.754,0,0,0,0,0,0,0,0,0,1.20172,0,0),
    (17230,10,-597.099,4176,64.9199,240000,0,0,0,0,0,0,0,0,0.944113,0,0),
    (17230,11,-597.099,4176,64.9199,1000,1723002,0,0,0,0,0,0,0,0.944113,0,0),
    (17230,12,-602.987,4163.88,64.5397,0,0,0,0,0,0,0,0,0,3.80201,0,0),
    (17230,13,-605.388,4162.12,64.4036,0,0,0,0,0,0,0,0,0,3.27186,0,0),
    (17230,14,-618.198,4162.71,63.1639,0,0,0,0,0,0,0,0,0,2.73779,0,0),
    (17230,15,-620.134,4163.85,63.0323,0,0,0,0,0,0,0,0,0,2.11968,0,0),
    (17230,16,-621.806,4167.84,62.6762,0,0,0,0,0,0,0,0,0,1.72384,0,0),
    (17230,17,-623.2,4175.55,61.4847,0,0,0,0,0,0,0,0,0,1.74602,0,0),
    (17230,18,-628.983,4190.44,58.1583,0,0,0,0,0,0,0,0,0,1.95808,0,0),
    (17230,19,-623.776,4177.94,60.921,0,0,0,0,0,0,0,0,0,5.28581,0,0),
    (17230,20,-613.522,4175.35,62.6926,1000,1723003,0,0,0,0,0,0,0,0.0464096,0,0),
    (17230,21,-597.789,4176.94,64.7764,240000,0,0,0,0,0,0,0,0,0.186996,0,0);

    --
    DELETE FROM dbscripts_on_creature_movement WHERE id IN (1723001, 1723002, 1723003);
    INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
    (1723001,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
    (1723002,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
    (1723002,0,31,16793,20,0,0,0,0,0,0,0,0,0,0,0,''),
    (1723002,1,0,0,0,16793,20,7,2000000404,2000000405,0,0,0,0,0,0,'force buddy to: say random text'),
    (1723003,0,31,17282,20,0,0,0,0,0,0,0,0,0,0,0,''),
    (1723003,1,0,0,0,17282,62075,23,2000000406,0,0,0,0,0,0,0,'force buddy to: say random text');
        
    -- make the cat follow the scripted movement
    UPDATE creature_template SET MovementType=2 WHERE Entry=17230;
    UPDATE creature SET MovementType=2 WHERE guid=61963;
      

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
