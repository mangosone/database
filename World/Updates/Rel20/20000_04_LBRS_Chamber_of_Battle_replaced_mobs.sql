-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_03_spell_template';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_04_LBRS_Chamber_of_Battle_replaced_mobs';

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

    -- Chamber of Battle (LBRS) was populated by the wrong mobs

    -- Delete unwanted creatures
    DELETE FROM creature WHERE guid IN (45813, 45814);

    -- Replace incorrect creatures with the correct ones
    UPDATE creature SET id = 9268, modelid = 7803, curhealth = 8355 WHERE guid = 45816;
    UPDATE creature SET id = 9216, modelid = 11582, curhealth = 13936 WHERE guid = 45815;
    UPDATE creature SET id = 9216, modelid = 11582, curhealth = 13936, orientation = 1.346 WHERE guid = 45809;
    UPDATE creature SET id = 9268, modelid = 7803, curhealth = 8355, position_x = -64.069, position_y = -480.389, position_z = 77.914, orientation = 6.275 WHERE guid = 45817;
    UPDATE creature SET id = 9583, modelid = 9633, curhealth = 8569, position_x = -58.001, position_y = -480.241, position_z = 77.914, orientation = 3.18 WHERE guid = 45760;
    UPDATE creature SET id = 9693, modelid = 9625, curhealth = 6893, curmana = 2289, position_x = -61.127, position_y = -474.629, position_z = 77.914, orientation = 4.35 WHERE guid = 45761;
    UPDATE creature SET id = 9216, modelid = 11582, curhealth = 13936, position_x = -75.999, position_y = -515.288, position_z = 80.924, orientation = 3.125 WHERE guid = 45811;
    UPDATE creature SET id = 9268, modelid = 7803, curhealth = 8355, position_x = -83.476, position_y =-515.33, position_z = 81.578, orientation = 6.192 WHERE guid = 45821;
    UPDATE creature SET id = 9693, modelid = 9625, curhealth = 6893, curmana = 2289, position_x = -37.378, position_y =-501.373, position_z = 79.999, orientation = 2.252 WHERE guid = 45810;
    UPDATE creature SET id = 9693, modelid = 9625, curhealth = 6893, curmana = 2289, position_x = -79.694, position_y =-510.697, position_z = 80.464, orientation = 4.7 WHERE guid = 45819;
    UPDATE creature SET id = 9583, modelid = 9633, curhealth = 8569, position_x = -46.917, position_y = -516.565, position_z = 88.245, orientation = 3.804 WHERE guid = 45812;
    UPDATE creature SET id = 9693, modelid = 9625, curhealth = 6893, curmana = 2289, position_x = -48.936, position_y = -515.33, position_z = 88.293, orientation = 4.786 WHERE guid = 45822;
    UPDATE creature SET id = 9268, modelid = 7803, curhealth = 8355, position_x = -49.719, position_y = -519.474, position_z = 87.595, orientation = 1.028 WHERE guid = 45759;
    UPDATE creature SET id = 9692, modelid = 9602, curhealth = 8227, position_x = -40.012, position_y = -519.474, position_z = 87.546, orientation = 2.685 WHERE guid = 45758;
    UPDATE creature SET id = 9696, modelid = 741, curhealth = 2660, position_x = -41.648, position_y = -525.099, position_z = 87.115, orientation = 2.622 WHERE guid = 45818;

    -- Overlord Wyrmthalak corrected position and orientation
    UPDATE creature SET position_x = -24.533, position_y = -486.672, position_z = 90.633, orientation = 3.87 WHERE guid = 45757;

    -- Patrolling Smolderthorn Berserker
    UPDATE creature SET id = 9268, modelid = 7803, curhealth = 8355, position_x = -41.031, position_y = -514.179, position_z = 88.564, orientation = 4.205, MovementType = 2 WHERE guid = 45820;
    -- make sure the movement data does not already exist for this creature
    DELETE FROM creature_movement WHERE id = 45820;
    -- add new movement data for the Smolderthorn Berserker
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 1, -41.031502, -514.179016, 88.564003, '5000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4.205', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 2, -47.218548, -523.655396, 87.124512, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 3, -51.244236, -527.463501, 85.626396, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 4, -57.651527, -528.472656, 84.152359, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 5, -74.393326, -524.992676, 82.137222, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 6, -78.573311, -522.337830, 82.403702, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 7, -82.644424, -507.925446, 80.220604, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 8, -81.849724, -494.280884, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 9, -79.042076, -489.494568, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 10, -59.774261, -487.756592, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 11, -50.267139, -490.083221, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 12, -40.455597, -498.022491, 79.569664, '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5.725', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 13, -50.267139, -490.083221, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 14, -59.774261, -487.756592, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 15, -79.042076, -489.494568, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 16, -81.849724, -494.280884, 77.915787, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 17, -82.644424, -507.925446, 80.220604, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 18, -78.573311, -522.337830, 82.403702, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 19, -74.393326, -524.992676, 82.137222, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 20, -57.651527, -528.472656, 84.152359, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 21, -51.244236, -527.463501, 85.626396, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 22, -47.218548, -523.655396, 87.124512, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
    INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (45820, 23, -41.031502, -514.179016, 88.564003, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
        
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