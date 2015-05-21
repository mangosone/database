-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_34_BGAV_Snowfall_grave_issue_fix'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_35_BGAV_Creature_Template_Classlevelstats_Fixes';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

  -- Set friendly Version Text
  SET @cThisVersion = 'MaNGOSOne Database Rev 20000_35';

 
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

	
	-- == BaseHealthExp1 and BaseDamageExp1 should not be at default value for bc expansion == --
	
	DELETE FROM creature_template_classlevelstats where Class = 1;
	INSERT INTO creature_template_classlevelstats (Level, Class, BaseHealthExp0, BaseHealthExp1, BaseMana, BaseDamageExp0, BaseDamageExp1, BaseMeleeAttackPower, BaseRangedAttackPower, BaseArmor) 
	VALUES 
	(1,1,42,42,0,0.1321,0.1321,9,0,7),
	(2,1,55,55,0,0.2888,0.2888,11,0,8),
	(3,1,71,71,0,0.5547,0.5547,13,0,33),
	(4,1,86,86,0,0.9435,0.9435,15,0,68),
	(5,1,102,102,0,1.3708,1.3708,18,0,111),
	(6,1,120,120,0,2.0661,2.0661,20,0,165),
	(7,1,137,137,0,2.7669,2.7669,24,0,230),
	(8,1,156,156,0,3.1993,3.1993,28,0,306),
	(9,1,176,176,0,3.7038,3.7038,31,0,387),
	(10,1,198,198,0,4.1084,4.1084,34,0,463),
	(11,1,222,222,0,4.6996,4.6996,38,0,528),
	(12,1,247,247,0,5.4601,5.4601,42,0,562),
	(13,1,273,273,0,5.9359,5.9359,46,1,596),
	(14,1,300,300,0,6.5895,6.5895,50,1,630),
	(15,1,328,328,0,7.1981,7.1981,54,2,665),
	(16,1,356,356,0,7.6697,7.6697,56,2,700),
	(17,1,386,386,0,8.2225,8.2225,60,2,734),
	(18,1,417,417,0,8.5452,8.5452,64,3,768),
	(19,1,449,449,0,8.9384,8.9384,68,3,802),
	(20,1,484,484,0,9.6823,9.6823,70,4,836),
	(21,1,521,521,0,9.9677,9.9677,74,4,872),
	(22,1,562,562,0,10.4218,10.4218,78,4,906),
	(23,1,605,605,0,10.8099,10.8099,80,5,940),
	(24,1,651,651,0,11.2419,11.2419,84,6,975),
	(25,1,699,699,0,11.7485,11.7485,86,6,1008),
	(26,1,750,750,0,12.0453,12.0453,90,7,1043),
	(27,1,800,800,0,12.6213,12.6213,92,7,1078),
	(28,1,853,853,0,12.795,12.795,96,8,1111),
	(29,1,905,905,0,13.3432,13.3432,100,8,1145),
	(30,1,955,955,0,13.9264,13.9264,102,9,1179),
	(31,1,1006,1006,0,14.1954,14.1954,106,9,1213),
	(32,1,1057,1057,0,14.696,14.696,108,10,1249),
	(33,1,1110,1110,0,14.9914,14.9914,112,10,1281),
	(34,1,1163,1163,0,15.4944,15.4944,114,11,1317),
	(35,1,1220,1220,0,15.8617,15.8617,118,11,1349),
	(36,1,1277,1277,0,16.2984,16.2984,120,12,1456),
	(37,1,1336,1336,0,16.7962,16.7962,124,12,1568),
	(38,1,1395,1395,0,17.1865,17.1865,128,13,1684),
	(39,1,1459,1459,0,17.7286,17.7286,132,13,1808),
	(40,1,1524,1524,0,18.2971,18.2971,136,14,1938),
	(41,1,1585,1585,0,19.1997,19.1997,142,15,2074),
	(42,1,1651,1651,0,20.3431,20.3431,152,15,2218),
	(43,1,1716,1716,0,21.7088,21.7088,162,16,2369),
	(44,1,1782,1782,0,23.5881,23.5881,174,16,2528),
	(45,1,1848,1848,0,24.6797,24.6797,184,17,2695),
	(46,1,1919,1919,0,25.1735,25.1735,188,17,2750),
	(47,1,1990,1990,0,25.7137,25.7137,192,18,2804),
	(48,1,2062,2062,0,26.209,26.209,196,19,2857),
	(49,1,2138,2138,0,26.9952,26.9952,200,19,2912),
	(50,1,2215,2215,0,27.5899,27.5899,206,20,2966),
	(51,1,2292,2292,0,28.128,28.128,210,20,3018),
	(52,1,2371,2371,0,28.8795,28.8795,214,21,3074),
	(53,1,2453,2453,0,29.4381,29.4381,218,22,3128),
	(54,1,2533,2533,0,30.0501,30.0501,224,22,3180),
	(55,1,2614,2614,0,30.7177,30.7177,228,23,3234),
	(56,1,2699,2699,0,31.2387,31.2387,234,23,3289),
	(57,1,2784,2784,0,31.945,31.945,238,24,3342),
	(58,1,2871,3989,0,32.5967,40.2143,242,25,3396),
	(59,1,2961,4142,0,33.2007,43.2857,248,25,3449),
	(60,1,3052,4979,0,33.9625,53.4755,252,26,3750),
	(61,1,3144,5158,0,34.5714,61.2729,258,28,4047),
	(62,1,3237,5341,0,35.2381,67.4442,262,30,4344),
	(63,1,3331,5527,0,35.9047,71.4361,268,32,4641),
	(64,1,3427,5715,0,36.5714,75.9334,272,33,4937),
	(65,1,3524,5914,0,37.2381,80.3794,278,35,5234),
	(66,1,3624,6116,0,37.9047,84.8941,282,37,5531),
	(67,1,3728,6326,0,38.5714,89.6211,288,39,5829),
	(68,1,3834,6542,0,39.2381,94.4934,292,41,6126),
	(69,1,3942,6761,0,39.9047,99.5328,298,43,6423),
	(70,1,4050,6986,0,40.5714,104.527,304,44,6719),
	(71,1,4163,7181,0,41.2381,106.357,308,48,7018),
	(72,1,4278,7380,0,41.9047,108.071,314,53,7318),
	(73,1,4399,7588,0,42.5714,118.643,320,58,7618);
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