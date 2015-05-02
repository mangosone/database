-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_22_ACID_Updates_for_TBC_WoW'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_23_Startup_errors_Cleanup4';

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

-- ---------- Last of the start up errors, as of the 5th of February 2015    

-- Missing weapon entries for creatures
DELETE FROM creature_item_template WHERE entry = 23051;
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (23051, 2, 7, 1, 24925, 13, 0);
UPDATE creature_equip_template SET equipentry1=23051, equipentry2=23051, equipentry3=0 WHERE entry=5029;

-- entry unused as creatures are equipped via another means
DELETE FROM creature_equip_template WHERE entry = 5030;
UPDATE creature_template SET EquipmentTemplateId = 0 WHERE entry = 16679;

DELETE FROM creature_item_template WHERE entry IN (23889, 28023, 32826, 31083, 29626, 23907, 24038, 1219);
-- missing entry for Flight Master's weapon
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (23889, 2, 2, 2, 36600, 15, 0);
-- missing entry for axe throwers at portal
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (28023, 2, 16, 1, 38576, 25, 0);
-- missing weapon entry for Sanctum Defender
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (32826, 2, 2, 2, 43383, 15, 0);
-- missing weapon entry for Val'zareq the Conqueror
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (31083, 2, 2, 2, 43386, 15, 0);
UPDATE item_template SET name='Monster - Bow, Val\'zareq\'s' WHERE entry=31083;
-- missing weapon entry for Netherstorm Agen
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (29626, 2, 3, 1, 44573, 26, 0);
UPDATE item_template SET name='Monster - Gun, Draenei A01' WHERE entry=29626;
-- missing weapon entry for Blade of Argus - [COLOR="#FF0000"]
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (23907, 4, 6, 1, 36637, 14, 4);
UPDATE item_template SET name='Monster - Shield, Draenei A02 Purple' WHERE entry=23907;
-- missing weapon entry for Gatewatcher Aendor - [COLOR="#FF0000"]
INSERT INTO creature_item_template (entry, class, subclass, material, displayid, inventory_type, sheath_type) VALUES (24038, 4, 6, 1, 36726, 14, 4);
UPDATE item_template SET name='Monster - Shield, Blood Elf A01' WHERE entry=24038;
-- missing entry
INSERT INTO creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES (1219, 13061, 0, 0);
-- non existent entry was set for weapon ID
UPDATE creature_template SET EquipmentTemplateId=5244 WHERE Entry=14733;
 
 
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
