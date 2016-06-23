-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_08_Rathis_Tomber_vendor'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_09_Caretaker_Dilandrus';

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
          
    -- ================ Caretaker Dilandrus - missing text - scripted visits to graves ================ --
          
    -- correct text
    -- http://wowwiki.wikia.com/Caretaker_Dilandrus
    UPDATE npc_text SET text0_0 = 'I was born here, $r. This is my world - all that I know... As a boy, my mother and father would regale me with tales of your world and the splendor it held. How I longed to leave this place.$B$BAlas, fate is a cruel mistress. My mother and father have long since passed, buried in this graveyard. I remain to uphold their honor and the honor of my family - The Sons of Lothar.' WHERE ID = 8676;

    -- Move NPC to same location as in Two
    UPDATE creature SET `position_x`='-807.327', `position_y`='2739.82', `position_z`='115.447', `orientation`='4.18481' WHERE `guid`='58021';

    -- Change MovementType so that it will take the path set out in the creature_movement_template table
    UPDATE creature_template SET `MovementType`='2' WHERE `Entry`='16856';
    UPDATE creature SET `MovementType`='2' WHERE `guid`='58021';

    -- Define the path the NPC is to take
    DELETE FROM creature_movement_template WHERE entry = 16856;
    INSERT INTO creature_movement_template (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES 
    (16856,1,-807.327,2739.82,115.447,60000,0,0,0,0,0,0,0,0,4.18481,0,0),
    (16856,2,-798.86,2719.21,111.628,0,0,0,0,0,0,0,0,0,5.48986,0,0),
    (16856,3,-785.502,2706.21,107.293,0,0,0,0,0,0,0,0,0,5.46463,0,0),
    (16856,4,-785.546,2702.16,106.208,0,0,0,0,0,0,0,0,0,4.17889,0,0),
    (16856,5,-787.652,2700.58,105.792,12000,1685601,0,0,0,0,0,0,0,3.3349,0,0),
    (16856,6,-791.771,2694.26,104.589,0,0,0,0,0,0,0,0,0,3.84755,0,0),
    (16856,7,-793.482,2693.76,104.592,10000,1685602,0,0,0,0,0,0,0,3.13126,0,0),
    (16856,8,-794.696,2691.44,104.35,0,0,0,0,0,0,0,0,0,3.7887,0,0),
    (16856,9,-797.951,2691.02,104.535,0,0,0,0,0,0,0,0,0,2.95382,0,0),
    (16856,10,-798.984,2693.63,104.891,0,0,0,0,0,0,0,0,0,1.64928,0,0),
    (16856,11,-797.778,2697.53,105.43,12000,1685603,0,0,0,0,0,0,0,3.13126,0,0),
    (16856,12,-792.678,2705.64,106.948,0,0,0,0,0,0,0,0,0,1.6532,0,0),
    (16856,13,-792.409,2708.46,107.754,0,0,0,0,0,0,0,0,0,2.0399,0,0),
    (16856,14,-794.25,2710.38,108.384,0,0,0,0,0,0,0,0,0,3.14966,0,0),
    (16856,15,-799.924,2706.66,107.387,10000,1685602,0,0,0,0,0,0,0,4.01203,0,0),
    (16856,16,-807.92,2692.9,104.856,12000,1685604,0,0,0,0,0,0,0,3.58948,0,0),
    (16856,17,-811.612,2690.9,104.36,0,0,0,0,0,0,0,0,0,3.33756,0,0),
    (16856,18,-814.837,2692.26,104.736,0,0,0,0,0,0,0,0,0,2.3079,0,0),
    (16856,19,-814.33,2696.03,105.773,0,0,0,0,0,0,0,0,0,1.17929,0,0),
    (16856,20,-809.779,2704.45,107.63,10000,1685602,0,0,0,0,0,0,0,1.13373,0,0),
    (16856,21,-801.425,2715.06,109.679,12000,1685605,0,0,0,0,0,0,0,0.966449,0,0),
    (16856,22,-801.359,2718.11,110.676,0,0,0,0,0,0,0,0,0,1.97582,0,0),
    (16856,23,-804.433,2720.69,111.13,0,0,0,0,0,0,0,0,0,3.4021,0,0),
    (16856,24,-810.324,2717.67,110.329,10000,1685602,0,0,0,0,0,0,0,4.00607,0,0),
    (16856,25,-814.433,2712.14,109.487,0,0,0,0,0,0,0,0,0,4.15529,0,0),
    (16856,26,-820.17,2701.35,107.506,12000,1685606,0,0,0,0,0,0,0,4.41448,0,0),
    (16856,27,-823.067,2699.77,107.458,0,0,0,0,0,0,0,0,0,3.02746,0,0),
    (16856,28,-824.921,2701.38,107.939,0,0,0,0,0,0,0,0,0,2.213,0,0),
    (16856,29,-824.739,2706.05,108.591,0,0,0,0,0,0,0,0,0,1.32158,0,0),
    (16856,30,-820.185,2714.8,110.056,12000,1685607,0,0,0,0,0,0,0,1.05768,0,0),
    (16856,31,-814.476,2725.61,111.567,0,0,0,0,0,0,0,0,0,1.07653,0,0),
    (16856,32,-807.327,2739.82,115.447,0,0,0,0,0,0,0,0,0,1.07653,0,0),
    (16856,33,-807.327,2739.82,115.447,300000,0,0,0,0,0,0,0,0,4.18481,0,0);

    -- AI scripts for use during the visit to the grave - saluting, kneeling, etc
    INSERT INTO dbscripts_on_creature_movement (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
    (1685601,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685601,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685601,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685601,7,9,21211,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
    (1685602,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.76949,''),
    (1685602,3,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685602,7,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685602,8,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685603,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685603,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685603,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685603,7,9,21212,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
    (1685604,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685604,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685604,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685604,7,9,21213,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
    (1685605,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685605,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685605,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685605,7,9,21214,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
    (1685606,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685606,3,1,18,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685606,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685606,7,9,21215,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject'),
    (1685607,1,3,0,0,0,0,0,0,0,0,0,0,0,0,2.75976,''),
    (1685607,3,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685607,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
    (1685607,7,9,21210,180,0,0,0,0,0,0,0,0,0,0,0,'respawn gobject');


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
