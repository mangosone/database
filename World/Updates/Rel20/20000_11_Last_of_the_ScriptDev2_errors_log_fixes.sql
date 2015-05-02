-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_10_Felwood_Corrupted_Plant_fix_update';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_11_Last_of_the_ScriptDev2_errors_log_fixes';

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
    
    -- go_table_theka (Zero and One!!!!!)
    UPDATE creature_template SET ScriptName='go_table_theka' WHERE Entry='7272';

    -- boss_tethyr
    UPDATE creature_template SET ScriptName='boss_tethyr' WHERE Entry=23899;

    -- npc_piznik
    UPDATE creature_template SET ScriptName='npc_piznik' WHERE Entry=4276;

    -- npc_anchorite_barada
    UPDATE creature_template SET ScriptName='npc_anchorite_barada' WHERE Entry=22431;

    -- ncp_colonel_jules
    UPDATE creature_template SET ScriptName='npc_colonel_jules' WHERE Entry='22432';

    -- npc_rethhedron
    UPDATE creature_template SET ScriptName='npc_rethhedron' WHERE Entry='23416';

    -- npc_drijya
    UPDATE creature_template SET ScriptName='npc_drijya' WHERE Entry='20281';

    -- npc_cenarion_sparrowhawk
    UPDATE creature_template SET ScriptName='npc_cenarion_sparrowhawk' WHERE Entry='22972';

    -- npc_skyguard_prisoner
    UPDATE creature_template SET ScriptName='npc_skyguard_prisoner' WHERE Entry='23383';

    -- npc_fhwoor
    UPDATE creature_template SET ScriptName='npc_fhwoor' WHERE Entry='17877';
    
    -- boss_head_of_horseman (yes, his head is an NPC/creature!)
    UPDATE creature_template SET ScriptName='boss_head_of_horseman' WHERE Entry='23775';
    
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
