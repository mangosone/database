-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_13_Garments_of__targets_disable_regen';

  -- Set the new revision string
  SET @cNewRev = 'required_20000_15_Tree_s_Company_quest';

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

    -- next free ID in db_script_string
    SET @STRING_ID=2000005418;
    -- the item is defined now in SrcItemId, but can also be created by the spell (.quest add needs fix before this)
    -- UPDATE `quest_template` SET `SrcSpell`=30353,`SrcItemId`=0,`SrcItemCount`=0 WHERE `entry`=9531;

    DELETE FROM `dbscripts_on_event` WHERE `id`=10675;
    INSERT INTO `dbscripts_on_event` (`id`,`delay`,`command`,`data_flags`,`buddy_entry`,`search_radius`,`datalong`,`datalong2`,`dataint`,`dataint2`,`x`,`y`,`z`,`o`,`comments`) VALUES
    (10675, 0, 10, 0, 0, 0, 17243, 150000, 0, 0, -5052.76,-11247.859,0.1626,3.287,'Summon Engineer Overgrind'),
    (10675, 0, 32, 3, 17318, 50, 1, 0, 0, 0, 0, 0, 0, 0, 'Geezle pause WP movement'),
    (10675, 1,  3, 3, 17243, 50, 200, 0, 0, 0, -5086.87,-11252.8,016256, 3.361,'Overgrind walk to meeting place'),
    (10675,12,  0, 3, 17243, 50, 0, 0, @STRING_ID, 0, 0, 0, 0, 0, 'Overgrind emote - flag pickup'),
    (10675,14,  0, 3, 17318, 50, 0, 0, @STRING_ID+1, 0, 0, 0, 0, 0, 'Geezle say1'),
    (10675,20,  0, 3, 17243, 50, 0, 0, @STRING_ID+2, 0, 0, 0, 0, 0, 'Overgrind say2'),
    (10675,28,  0, 3, 17243, 50, 0, 0, @STRING_ID+3, 0, 0, 0, 0, 0, 'Overgrind say3'),
    (10675,36,  0, 3, 17318, 50, 0, 0, @STRING_ID+4, 0, 0, 0, 0, 0, 'Geezle say4'),
    (10675,44,  0, 3, 17243, 50, 0, 0, @STRING_ID+5, 0, 0, 0, 0, 0, 'Overgrind say5'),
    (10675,52,  0, 3, 17243, 50, 0, 0, @STRING_ID+6, 0, 0, 0, 0, 0, 'Overgrind say6'),
    (10675,60,  0, 3, 17318, 50, 0, 0, @STRING_ID+7, 0, 0, 0, 0, 0, 'Geezle say7'),
    (10675,66, 18, 7, 17243, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Despawn Engineer Overgrind'),
    (10675,67, 32, 3, 17318, 50, 0, 0, 0, 0, 0, 0, 0, 0, 'Geezle restore WP movement'),
    (10675,67,  8, 0, 0, 0, 17243, 0, 0, 0, 0, 0, 0, 0, 'Quest 9531 Kill Credit 17243');
    
    DELETE FROM `db_script_string` WHERE `entry` BETWEEN @STRING_ID AND @STRING_ID+7;
    INSERT INTO `db_script_string` (`entry`,`content_default`,`type`,`emote`,`comment`) VALUES
    (@STRING_ID, '%s picks up the naga flag.', 2, 0, 'Event 10675 Overgrind emote0'),
    (@STRING_ID+1, 'What\'s the big idea, Spark? Why\'d you call for this meeting?', 0, 3, 'Event 10675 Geezle say1'),
    (@STRING_ID+2, 'What\'s the big idea? You nearly blew my cover, idiot! I told you to put the compass and navigation maps somewhere safe - not out in the open for any fool to discover.', 0, 14, 'Event 10675 Overgrind say2'),
    (@STRING_ID+3, 'The Master has gone to great lengths to secure information about the whereabouts of the Exodar. You could have blown the entire operation, including the cover of our spy on the inside.', 0, 1, 'Event 10675 Overgrind say3'),
    (@STRING_ID+4, 'Relax, Spark! I have it all under control. We\'ll strip mine the Exodar right out from under \'em - making both you and I very, very rich in the process.', 0, 1, 'Event 10675 Geezle say4'),
    (@STRING_ID+5, 'Relax? Do you know what Kael\'thas does to those that fail him, Geezle? Eternal suffering and pain... Do NOT screw this up, fool.', 0, 14, 'Event 10675 Overgrind say5'),
    (@STRING_ID+6, 'Our Bloodmyst scouts have located our contact. The fool, Velen, will soon leave himself open and defenseless -- long enough for us to strike! Now get out of my sight before I vaporize you...', 0, 1, 'Event 10675 Overgrind say6'),
    (@STRING_ID+7, 'Yes, sir. It won\'t happen again...', 0, 66, 'Event 10675 Geezle say7');
    
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
