-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_11_Last_of_the_ScriptDev2_errors_log_fixes';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_12_Bladespire_Ogres_creature_ai_scripts_added';

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
    
    -- Bladespire Shaman: Entry: 19998
    -- http://www.wowhead.com/npc=19998/bla...aman#abilities
    -- enable script
    UPDATE creature_template SET AIName='EventAI' WHERE Entry='19998';
    -- add new script(s)
    DELETE FROM creature_ai_scripts WHERE creature_id = 19998;
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('1999801', '19998', '1', '0', '100', '1', '500', '800', '600000', '600000', '11', '35240', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Shamen - Cast Bloodmaul Intoxication');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('1999802', '19998', '0', '0', '100', '1', '4000', '8000', '30000', '45000', '11', '32062', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Shamen - Cast Fire Nova Totem');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('1999804', '19998', '9', '13', '100', '1', '0', '40', '2400', '3800', '11', '26098', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Shamen - Cast Lightning Bolt (Phase 1)');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('1999805', '19998', '1', '0', '100', '1', '1000', '1000', '600000', '600000', '11', '12550', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Shamen - Cast Lightning Shield on Aggro');

    -- Bladespire Cook: Entry: 20334
    -- http://www.wowhead.com/npc=20334#abilities
    -- enable script
    UPDATE creature_template SET AIName='EventAI' WHERE Entry='20334';
    -- add new script(s)
    DELETE FROM creature_ai_scripts WHERE creature_id = 20334;
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2033401', '20334', '1', '0', '100', '1', '500', '800', '600000', '600000', '11', '35240', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Cook - Cast Bloodmaul Intoxication');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2033402', '20334', '0', '0', '100', '1', '2100', '6100', '14100', '20100', '11', '37597', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Cook - Cast Meat Slap');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2033403', '20334', '0', '0', '100', '1', '1000', '5000', '40000', '45000', '11', '37596', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Cook - Cast Tenderize');

    -- Bladespire Champion: Entry: 21296
    -- http://www.wowhead.com/npc=21296#abilities
    -- enable script
    UPDATE creature_template SET AIName='EventAI' WHERE Entry='21296';
    -- add new script(s)
    DELETE FROM creature_ai_scripts WHERE creature_id = 21296;
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2129601', '21296', '1', '0', '100', '1', '500', '800', '600000', '600000', '11', '35240', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Champion - Cast Bloodmaul Intoxication');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2129602', '21296', '4', '0', '15', '0', '0', '0', '0', '0', '11', '37777', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Champion - Cast Mighty Charge');
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2129603', '21296', '9', '0', '100', '1', '0', '8', '16000', '21000', '11', '8078', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Champion - Cast Thunderclap');

    -- Bladespire Sober Defender: Entry: 21975
    -- http://www.wowhead.com/npc=21975#abilities
    -- enable script
    UPDATE creature_template SET AIName='EventAI' WHERE Entry='21975';
    -- add new script(s)
    DELETE FROM creature_ai_scripts WHERE creature_id = 21975;
    INSERT INTO creature_ai_scripts (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('2197501', '21975', '9', '0', '100', '1', '0', '5', '8000', '12000', '11', '15496', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bladespire Sober Defender - Cast Cleave');
        
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
