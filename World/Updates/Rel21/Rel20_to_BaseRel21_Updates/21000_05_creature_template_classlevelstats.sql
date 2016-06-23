-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_04_script_binding'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_05_creature_template_classlevelstats';

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
          
    -- TBC entries added - records (Level) 64 to 73 
    DELETE FROM creature_template_classlevelstats WHERE Level > 63;
    INSERT INTO `creature_template_classlevelstats` (`Level`, `Class`, `BaseHealthExp0`, `BaseHealthExp1`, `BaseMana`, `BaseDamageExp0`, `BaseDamageExp1`, `BaseMeleeAttackPower`, `BaseRangedAttackPower`, `BaseArmor`) VALUES (73,8,3098,5311,7654,36.1353,100.617,143,37,6126),
    (72,8,2995,5166,7500,35.5693,96.5068,140,34,5886),
    (71,8,2914,5027,7332,35.0025,92.4034,137,31,5645),
    (70,8,2835,4890,7196,34.4369,88.3402,135,28,5404),
    (69,8,2759,4733,7031,33.8695,84.2722,133,28,5167),
    (68,8,2684,4580,6882,33.3048,80.1061,130,27,4928),
    (67,8,2610,4429,6749,32.736,75.9676,128,27,4710),
    (66,8,2552,4281,6588,32.1734,72.0499,125,27,4460),
    (65,8,2467,4140,6443,31.6015,68.0244,124,26,4214),
    (64,8,2399,4002,6299,31.0435,64.089,121,26,3977),
    (73,2,3519,6070,3387,39.6048,101.451,302,44,7604),
    (72,2,3422,5903,3309,38.9492,99.8571,296,40,7305),
    (71,2,3330,5744,3231,38.2899,98.3977,290,37,7007),
    (70,2,3240,5589,3155,37.6361,96.7364,286,33,6708),
    (69,2,3153,5409,3080,36.974,91.8916,282,32,6412),
    (68,2,3067,5233,2991,36.3244,87.2677,276,31,6116),
    (67,2,2982,5060,2933,35.656,82.7944,272,31,5821),
    (66,2,2899,4892,2846,35.0158,78.472,266,29,5523),
    (65,2,2819,4731,2790,34.3333,74.3252,262,29,5228),
    (64,2,2740,4572,2705,33.7143,70.2568,256,28,4932),
    (73,1,4399,7588,0,42.5714,118.643,320,58,7618),
    (72,1,4278,7380,0,41.9047,108.071,314,53,7318),
    (71,1,4163,7181,0,41.2381,106.357,308,48,7018),
    (70,1,4050,6986,0,40.5714,104.527,304,44,6719),
    (69,1,3942,6761,0,39.9047,99.5328,298,43,6423),
    (68,1,3834,6542,0,39.2381,94.4934,292,41,6126),
    (67,1,3728,6326,0,38.5714,89.6211,288,39,5829),
    (66,1,3624,6116,0,37.9047,84.8941,282,37,5531),
    (65,1,3524,5914,0,37.2381,80.3794,278,35,5234),
    (64,1,3427,5715,0,36.5714,75.9334,272,33,4937);
     
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
