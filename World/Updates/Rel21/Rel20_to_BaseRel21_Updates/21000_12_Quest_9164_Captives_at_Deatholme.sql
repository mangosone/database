-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_21000_11_Falcon_Watch_Quests_9472_9483'; 

  -- Set the new revision string
  SET @cNewRev = 'required_21000_12_Quest_9164_Captives_at_Deatholme';

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

    
    -- ============ Quest 9164 Captives at Deatholme ============ --
    -- ============ Missing records added (taken from MaNGOS Two) ============ --
    
    -- Apothecary Enith (16208)
    -- link gossip
    UPDATE creature_template SET GossipMenuId=7182 WHERE Entry=16208;
    DELETE FROM gossip_menu WHERE entry = 7182;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7182, 8459, 0, 0);
    DELETE FROM gossip_menu_option WHERE menu_id = 7182;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES (7182, 0, 0, '<Administer the restorative draught.>', 1, 1, 7179, 0, 0, 0, 0, 873);
    DELETE FROM gossip_menu WHERE entry = 7179;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7179, 8460, 0, 873);

    DELETE FROM dbscripts_on_gossip WHERE id = 7179;
    INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
    (7179,0,0,0,0,0,0,0,2000005543,0,0,0,0,0,0,0,'Enith chat'),
    (7179,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'Enith stand'),
    (7179,1,1,6,0,0,0,0,0,0,0,0,0,0,0,0,'Enith emote'),
    (7179,5,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Enith run 1'),
    (7179,5,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'Enith run 2'),
    (7179,10,8,16208,1,0,0,0,0,0,0,0,0,0,0,0,'Quest credit Enith'),
    (7179,0,29,1,2,0,0,0,0,0,0,0,0,0,0,0,'Enith gossip flag remove');

    DELETE FROM db_script_string WHERE entry = 2000005543;
    INSERT INTO db_script_string (entry, content_default, sound, type, language, emote) VALUES (2000005543, 'Thanks, I should\ve never left Silverpine Forest.', 0, 0, 0, 0);

    DELETE FROM gossip_menu_option WHERE menu_id = 7179;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES ('7179', '0', '0', 'A bit ungrateful, aren\'t we? The way out is clear, flee quickly!', '1', '1', '0', '0', '7179', '0', '0', '873');

    DELETE FROM creature_movement_template WHERE entry = 16208;
    INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
    (16208,1,6647.83,-6344.92,9.13345,0,0,0,0,0,0,0,0,0,0,0,0),
    (16208,2,6657.92,-6345.96,15.3468,0,0,0,0,0,0,0,0,0,0,0,0),
    (16208,3,6661.58,-6342.65,15.4309,0,0,0,0,0,0,0,0,0,0,0,0),
    (16208,4,6662.35,-6334.64,20.8803,0,0,0,0,0,0,0,0,0,0,0,0),
    (16208,5,6662.63,-6331.85,20.8924,0,0,0,0,0,0,0,0,0,0,0,0),
    (16208,6,6645.36,-6330.13,30.263,5000,1,0,0,0,0,0,0,0,3.05496,0,0);

    -- make sure the NPC is lying down when it spawns
    DELETE FROM creature_template_addon WHERE entry = 16208;
    INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags) VALUES (16208, 0, 7, 0, 0, 0, 0);


    -- Apprentice Varnis (16206)
    -- link gossip
    UPDATE creature_template SET GossipMenuId=7185 WHERE Entry=16206;
    DELETE FROM gossip_menu WHERE entry = 7185;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7185, 8461, 0, 0);
    DELETE FROM gossip_menu_option WHERE menu_id = 7185;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES (7185, 0, 0, '<Administer the restorative draught.>', 1, 1, 7186, 0, 0, 0, 0, 873);
    DELETE FROM gossip_menu WHERE entry = 7186;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7186, 8463, 0, 873);

    DELETE FROM dbscripts_on_gossip WHERE id = 7186;
    INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
    (7186,0,0,0,0,0,0,0,2000005545,0,0,0,0,0,0,0,'Varnis chat'),
    (7186,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'Varnis stand'),
    (7186,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'Varnis emote'),
    (7186,0,29,1,2,0,0,0,0,0,0,0,0,0,0,0,'Varnis gossip flag remove'),
    (7186,5,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Varnis prepare to run'),
    (7186,10,8,16206,1,0,0,0,0,0,0,0,0,0,0,0,'Quest credit Varnis'),
    (7186,5,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'Varnis run');

    DELETE FROM db_script_string WHERE entry = 2000005545;
    INSERT INTO db_script_string (entry, content_default, sound, type, language, emote) VALUES (2000005545, 'Thank you. I thought I was going to die.', 0, 0, 0, 0);

    DELETE FROM gossip_menu_option WHERE menu_id= 7186;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES ('7186', '0', '0', 'You\'re free to go now. The way out is safe.', '1', '1', '0', '0', '7186', '0', '0', '873');

    DELETE FROM creature_movement_template WHERE entry = 16206;
    INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
    (16206,1,6436.87,-6633.02,107.432,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,2,6435.63,-6620.86,107.436,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,3,6429.88,-6618.29,108.128,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,4,6426.7,-6614.82,110.159,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,5,6428.75,-6611.21,111.905,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,6,6432.83,-6606.89,112.126,0,0,0,0,0,0,0,0,0,0,0,0),
    (16206,7,6431.51,-6597.97,112.113,5000,1,0,0,0,0,0,0,0,1.76377,0,0);

    -- make sure the NPC is lying down when it spawns
    DELETE FROM creature_template_addon WHERE entry = 16206;
    INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags) VALUES (16206, 0, 7, 1, 16, 0, 0);


    -- Ranger Vedoran (16209)
    -- link gossip
    UPDATE creature_template SET GossipMenuId=7177 WHERE Entry=16209;
    DELETE FROM gossip_menu WHERE entry = 7177;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7177, 8457, 0, 0);
    DELETE FROM gossip_menu_option WHERE menu_id = 7177;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES (7177, 0, 0, '<Administer the restorative draught.>', 1, 1, 7176, 0, 0, 0, 0, 873);
    DELETE FROM gossip_menu WHERE entry = 7176;
    INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES (7176, 8456, 0, 873);

    DELETE FROM dbscripts_on_gossip WHERE id = 7176;
    INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
    (7176,0,0,0,0,0,0,0,2000005544,0,0,0,0,0,0,0,'Vedoran chat'),
    (7176,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'Vedoran stand'),
    (7176,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'Vedoran emote'),
    (7176,0,29,1,2,0,0,0,0,0,0,0,0,0,0,0,'Vedoran gossip flag remove'),
    (7176,5,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Vedoran prepare to run'),
    (7176,10,8,16209,1,0,0,0,0,0,0,0,0,0,0,0,'Quest credit Vedonar'),
    (7176,5,20,2,0,0,0,0,0,0,0,0,0,0,0,0,'Vedoran run');

    DELETE FROM db_script_string WHERE entry = 2000005544;
    INSERT INTO db_script_string (entry, content_default, sound, type, language, emote) VALUES (2000005544, 'You have my thanks!', 0, 0, 0, 0);

    DELETE FROM gossip_menu_option WHERE menu_id = 7176;
    INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, condition_id) VALUES ('7176', '0', '0', 'You\'re free to go now. The way out is safe.', '1', '1', '0', '0', '7176', '0', '0', '873');

    DELETE FROM creature_movement_template WHERE entry = 16209;
    INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
    (16209,1,6290.21,-6366.1,78.0195,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,2,6301.65,-6364.06,78.0238,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,3,6305.82,-6360.2,78.0782,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,4,6310.5,-6356.76,80.6154,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,5,6314.06,-6360.67,82.6096,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,6,6317.35,-6365.34,82.7124,0,0,0,0,0,0,0,0,0,0,0,0),
    (16209,7,6326.85,-6366.82,82.709,5000,1,0,0,0,0,0,0,0,0,0,0);

    -- make sure the NPC is lying down when it spawns
    DELETE FROM creature_template_addon WHERE entry = 16209;
    INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags) VALUES (16209, 0, 7, 1, 16, 0, 0);


    -- These conditions are used by all 3 NPCs
    DELETE FROM conditions WHERE condition_entry IN (871, 872, 873);
    -- quest is not currently completed
    INSERT INTO conditions (condition_entry, type, value1, value2) VALUES (871, 9, 9164, 0);
    -- item is in inventory
    INSERT INTO conditions (condition_entry, type, value1, value2) VALUES (872, 2, 22628, 1);
    -- at least of the above conditions is true
    INSERT INTO conditions (condition_entry, type, value1, value2) VALUES (873, -2, 871, 872);
          

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
