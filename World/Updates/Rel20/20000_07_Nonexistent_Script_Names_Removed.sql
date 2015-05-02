-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_06_Felwood_Corrupted_Plant_Quests';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_07_Nonexistent_Script_Names_Removed';

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

    -- These delete script names from the creature_template table due to the scripts no longer existing (AI now dealt with by the creature_ai_scripts table)
    
    -- Shade of Taerar
    -- script boss_shade_of_taerar
    UPDATE creature_template SET ScriptName='' WHERE Entry='15302';

    -- Demented Druid Spirit
    -- script mob_dementeddruids
    UPDATE creature_template SET ScriptName='' WHERE Entry='15260';
    
    -- Ogres in Blade's Edge Mountains (at this time the ogres are not scripted at all, but there is a post in the tracker for this issue)
    -- script mobs_bladespire_ogre
    UPDATE creature_template SET ScriptName='' WHERE Entry='19998';
    UPDATE creature_template SET ScriptName='' WHERE Entry='20334';
    UPDATE creature_template SET ScriptName='' WHERE Entry='21296';
    UPDATE creature_template SET ScriptName='' WHERE Entry='21975';
    
    -- Mount vendors
    -- script npc_mount_vendor
    UPDATE creature_template SET ScriptName='' WHERE Entry='384';
    UPDATE creature_template SET ScriptName='' WHERE Entry='1261';
    UPDATE creature_template SET ScriptName='' WHERE Entry='1460';
    UPDATE creature_template SET ScriptName='' WHERE Entry='2357';
    UPDATE creature_template SET ScriptName='' WHERE Entry='3362';
    UPDATE creature_template SET ScriptName='' WHERE Entry='3685';
    UPDATE creature_template SET ScriptName='' WHERE Entry='4730';
    UPDATE creature_template SET ScriptName='' WHERE Entry='4731';
    UPDATE creature_template SET ScriptName='' WHERE Entry='4885';
    UPDATE creature_template SET ScriptName='' WHERE Entry='7952';
    UPDATE creature_template SET ScriptName='' WHERE Entry='7955';
    UPDATE creature_template SET ScriptName='' WHERE Entry='16264';
    UPDATE creature_template SET ScriptName='' WHERE Entry='17584';
    
    -- script npc_prof_alchemy
    UPDATE creature_template SET ScriptName='' WHERE Entry='17909';
    UPDATE creature_template SET ScriptName='' WHERE Entry='19052';
    UPDATE creature_template SET ScriptName='' WHERE Entry='22427';

    -- script npc_sayge
    UPDATE creature_template SET ScriptName='' WHERE Entry='14822';
    
    -- script npc_sergeant_bly
    UPDATE creature_template SET ScriptName='' WHERE Entry='7604';
    
    -- this guy also is missing a script (same as for the ogres), not even in creature_ai_scripts, and has had a thread made in the tracker for this
    -- script npc_weegli_blastfuse
    UPDATE creature_template SET ScriptName='' WHERE Entry='7607';
    
    -- Possibly missing scripts for the Druid flight form quest?
    -- script go_shrine_of_the_birds
    UPDATE gameobject_template SET ScriptName='' WHERE entry='185547';
    UPDATE gameobject_template SET ScriptName='' WHERE entry='185551';
    UPDATE gameobject_template SET ScriptName='' WHERE entry='185553';
       
    -- The script name was changed for this one, from npc_magher_captive to npc_nagrand_captive
    UPDATE creature_template SET ScriptName='npc_nagrand_captive' WHERE Entry='18210';
    
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
