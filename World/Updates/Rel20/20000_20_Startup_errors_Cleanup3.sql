-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_19_Populate_Classlevelstats_Levels_1_to_60'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_20_Startup_errors_Cleanup3';

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
    
    
    -- World-database.log start up error fixes
        
    UPDATE creature_template SET RegenerateStats=1 WHERE UnitClass IN (1, 4) AND RegenerateStats != 0;
    UPDATE creature_template SET RegenerateStats=RegenerateStats|2 WHERE UnitClass IN (2, 8);

    UPDATE creature SET curhealth=8352 WHERE guid=45758;
    UPDATE creature SET curhealth=8613 WHERE guid IN (45760, 45812);
    UPDATE creature SET curhealth=2699 WHERE guid=45818;

    -- invalid level
    UPDATE creature_template SET MinLevel=75, MaxLevel=75 WHERE Entry=23703;
    UPDATE creature_template SET MinLevel=75, MaxLevel=75 WHERE Entry=23808;
    UPDATE creature_template SET MinLevel=75, MaxLevel=75 WHERE Entry=24109;

    -- max level < min level
    UPDATE creature_template SET MaxLevel=69 WHERE Entry=21860;
    UPDATE creature_template SET MaxLevel=60 WHERE Entry=14302;
    UPDATE creature_template SET MinLevel=25, MaxLevel=27 WHERE Entry=10760;
    UPDATE creature_template SET MaxLevel=73 WHERE Entry=15936;
    UPDATE creature_template SET MaxLevel=69 WHERE Entry=19799;
    UPDATE creature_template SET MaxLevel=68 WHERE Entry=19821;

    -- change of spell IDs
    UPDATE dbscripts_on_creature_death SET datalong = 10072 WHERE id IN (15355, 15338, 15264);
    UPDATE dbscripts_on_creature_death SET datalong = 10061 WHERE id IN (15340, 15277);

    -- incorrect class 
    UPDATE creature_template SET UnitClass = 1 WHERE entry IN (17416, 17626, 17814, 23186, 25546);
    UPDATE creature_template SET UnitClass = 2 WHERE entry IN (18327, 20319, 20537, 20691, 22166, 22300, 25545, 25565, 25576, 25579);
    UPDATE creature_template SET UnitClass = 8 WHERE entry IN (18319, 18499, 18934, 18994, 18995, 20322, 20525, 20697, 20868, 21062, 21104, 21136, 21139, 21148, 22168, 21535, 21593, 23185);

    -- MoP introduced creature!
    DELETE FROM creature_template WHERE entry IN (17396);
    DELETE FROM creature_template_spells WHERE entry IN (17396);

    -- non existent zone
    DELETE FROM game_graveyard_zone WHERE id=969 AND ghost_zone=3459;

    -- not linked to correct loot entry
    UPDATE gameobject_template SET data1=3239 WHERE entry=3239;
    DELETE FROM gameobject_loot_template WHERE entry = 2483;

    UPDATE item_template SET displayid=7016, sheath=3 WHERE entry=17;

-- unused entries - direct copy of Vanilla, but not used in TBC
-- ======= Copied Rows ======= --
-- '7278', '11', '2', '8', '21330', '27', '0'
-- '7371', '11', '2', '8', '21322', '27', '0'
-- '8217', '11', '2', '8', '21331', '27', '0'
-- '11362', '11', '2', '8', '21329', '27', '0'
-- '18714', '11', '2', '8', '31162', '27', '0'
-- '19319', '11', '2', '8', '21712', '27', '0'
-- '34100', '11', '2', '8', '21712', '27', '0'
DELETE FROM creature_item_template WHERE entry IN (7278, 7371, 8217, 11362, 18714, 19319, 34100);
    
    
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
