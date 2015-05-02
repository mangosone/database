-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_29_creature_equip_template'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_30_start_up_error_fixes';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

  -- Set friendly Version Text
  SET @cThisVersion = 'MaNGOSOne Database Rev 20000_30';

 
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

	-- === START UP ERROR FIXES === --

	-- ScriptDev.log error
	-- wrong script name was in use
	UPDATE creature_template SET ScriptName = 'boss_netherspite' WHERE Entry BETWEEN 17367 AND 17369;

	-- event_ai.log error
	-- Appears to be for Two, not One
	-- Exists on Two in the db_script_string table, entry: 2000000018
	DELETE FROM creature_ai_texts WHERE entry = -673;

	-- database.log error
	-- no corresponding gameobject_template record
	-- this could be due to the object only being spawned when needed and removed when not, therefore not requiring a gameobject entry
	DELETE FROM gameobject WHERE guid IN (48900, 48882, 48880, 48879, 48877, 48898, 48896, 48894, 48892, 48890, 48888, 48886, 48884, 48899, 48875, 48874, 48873, 18207, 48897, 48895, 48893, 48891, 48887, 48885, 48883, 48889);

	-- These two NPCs do not need to have this set to anything
	-- Equipment is assigned by default it seems (see in-game)
	UPDATE creature_template SET EquipmentTemplateId = 0 WHERE entry = 16579;

	-- Wrong id used
	-- Now set up as per Zero
	DELETE FROM gossip_menu WHERE entry=100 and text_id=8499 and script_id=0;
	DELETE FROM gossip_menu WHERE entry=100 and text_id=8500 and script_id=0;
	DELETE FROM gossip_menu WHERE entry=100 and text_id=8502 and script_id=0;
	DELETE FROM gossip_menu WHERE entry=100 and text_id=8503 and script_id=0;
	INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (100, 8499, 0, 0);
	INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (100, 8500, 0, 0);
	INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (100, 8502, 0, 0);
	INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (100, 8503, 0, 0);
	UPDATE gossip_menu_option SET action_menu_id = 100 WHERE menu_id = 3461 AND id = 2;

	-- Search range needed to be greater than 0
	-- Now set up as per Zero
	UPDATE creature_linking_template SET search_range=10 WHERE entry IN (17647, 17996) and map=0;



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
