-- ----------------------------------------
-- Added to prevent timeout's while loading
-- ----------------------------------------
SET GLOBAL net_read_timeout=30;
SET GLOBAL net_write_timeout=60;
SET GLOBAL net_buffer_length=1000000; 
SET GLOBAL max_allowed_packet=1000000000;
SET GLOBAL connect_timeout=10000000;

-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.3)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '07'; 
    SET @cOldContent = '034';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '035';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Blood_Watch_Updates';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Blood_Watch_Updates';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- Blood Watch
-- Duplicates
DELETE FROM creature WHERE guid IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM creature_addon WHERE guid IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM creature_movement WHERE id IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM game_event_creature WHERE guid IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM game_event_creature_data WHERE guid IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM creature_battleground WHERE guid IN (63576,63578,86579,86578,86576,86580,86577);
DELETE FROM creature_linking WHERE guid IN (63576,63578,86579,86578,86576,86580,86577) 
OR master_guid IN (63576,63578,86579,86578,86576,86580,86577);

-- Texts corrected.
DELETE FROM page_text WHERE entry BETWEEN 2923 AND 2927;
INSERT INTO page_text (entry, text, next_page) VALUES
(2923,'Esteemed leaders of the Horde,$B$BIt is with great pleasure that I - Lor\'themar Theron, Regent Lord of Quel\'Thalas - announce the fall of the Scourge commander known to us as Dar\'Khan Drathir.$B$BDar\'Khan\'s foothold in our lands was brought up by critics of the sin\'dorei race at numerous previous negotiations.  We hope this event addresses any and all previous objections your graces might have harbored.$B$B<Signed>Lor\'themar Theron',2927),
(2924,'Esteemed leaders of the Horde,$B$BIt is with great pleasure that I - Lor\'themar Theron, Regent Lord of Quel\'Thalas - announce the fall of the Scourge commander known to us as Dar\'Khan Drathir.$B$BDar\'Khan\'s foothold in our lands was brought up by critics of the sin\'dorei race at numerous previous negotiations.  We hope this event addresses any and all previous objections your graces might have harbored.$B$B<Signed>Lor\'themar Theron',2926),
(2925,'Trans-dimensional Ship Repair for Simpletons, by Jamus Kaesi$B$B<The thin pages of this book are made from a shimmering material and are filled with highly technical diagrams of how to maintain and repair a trans-dimensional ship. This particular copy is open to a chapter entitled \'Vector Coil Breaches and How to Avoid Them.\'>',0),
(2926,'$B$BPS - Our grand magister has received word back from Outland regarding Thrall\'s question.  The answer is, with great certainty, yes.',0),
(2927,'PS - Our grand magister has received word back from Outland regarding Thrall\'s question.  The answer is, with great certainty, yes.$B$B<This letter bears the additional seal of Lady Sylvanas Windrunner>',0);

-- Wanted Poster 
-- gossip corrected
UPDATE gossip_menu SET text_id = 9246 WHERE entry = 7595;

-- Messenger Hermesius
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 63450;
DELETE FROM creature_movement WHERE id = 63450;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17703;
DELETE FROM creature_movement_template WHERE entry = 17703;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17703,1,-1939.8,-11890.1,47.6737, 0, 0,1.0423, 0, 0),
(17703,2,-1937.66,-11880.9,47.6091, 0, 0,1.78057, 0, 0),
(17703,3,-1941.24,-11870.3,48.9653, 0, 0,2.13872, 0, 0),
(17703,4,-1950.12,-11860.2,50.3512, 0, 0,2.49529, 0, 0),
(17703,5,-1962.11,-11853.4,50.0351, 0, 0,2.23453, 0, 0),
(17703,6,-1966.07,-11850,50.381, 0, 0,1.88896, 0, 0),
(17703,7,-1965.73,-11837.5,53.4118, 0, 0,0.876581, 0, 0),
(17703,8,-1954.83,-11826.2,56.824, 0, 0,0.666072, 0, 0),
(17703,9,-1935.92,-11811,62.2933, 0, 0,0.54355, 0, 0),
(17703,10,-1930.37,-11808.7,63.4987, 0, 0,0.457156, 0, 0),
(17703,11,-1939.44,-11813.6,61.2716, 0, 0,3.70871, 0, 0),
(17703,12,-1954.3,-11825.9,56.9095, 0, 0,3.90682, 0, 0),
(17703,13,-1965.28,-11837.4,53.5192, 0, 0,4.2351, 0, 0),
(17703,14,-1966.09,-11849.9,50.3832, 0, 0,4.42517, 0, 0),
(17703,15,-1970.05,-11856.2,48.8027, 0, 0,3.75601, 0, 0),
(17703,16,-1991.82,-11861.3,47.1468, 0, 0,3.02638, 0, 0),
(17703,17,-2020.19,-11855,46.9196, 0, 0,2.9447, 0, 0),
(17703,18,-2040.32,-11853,47.327, 0, 0,3.05465, 0, 0),
(17703,19,-2060.31,-11850.6,49.4443, 0, 0,3.01067, 0, 0),
(17703,20,-2088.95,-11843.8,51.8441, 0, 0,2.9397, 0, 0),
(17703,21,-2060.44,-11850.5,49.4641, 0, 0,6.12212, 0, 0),
(17703,22,-2040.46,-11852.7,47.3362, 0, 0,6.21637, 0, 0),
(17703,23,-2020.3,-11855,46.9165, 0, 0,6.09856, 0, 0),
(17703,24,-2001.77,-11857.9,47.101, 0, 0,5.67131, 0, 0),
(17703,25,-1994.06,-11865.5,47.187, 0, 0,4.98881, 0, 0),
(17703,26,-1990.53,-11880.2,47.8559, 0, 0,4.65738, 0, 0),
(17703,27,-1989.67,-11894.6,49.4233, 0, 0,5.1294, 0, 0),
(17703,28,-1982.99,-11904.6,50.2055, 0, 0,5.67288, 0, 0),
(17703,29,-1976.12,-11907.8,50.2666, 0, 0,0.0588515, 0, 0),
(17703,30,-1957.46,-11899.6,49.1617, 0, 0,0.470879, 0, 0),
(17703,31,-1943.12,-11892,48.12, 0, 0,1.00731, 0, 0),
(17703,32,-1937.52,-11880.3,47.5945, 0, 0,1.67802, 0, 0),
(17703,33,-1941.24,-11870,49.0296, 0, 0,2.07858, 0, 0),
(17703,34,-1950.64,-11859.9,50.3644, 0, 0,2.59537, 0, 0),
(17703,35,-1962.34,-11853.3,50.0376, 0, 0,2.42415, 0, 0),
(17703,36,-1966.47,-11848.7,50.6134, 0, 0,1.87752, 0, 0),
(17703,37,-1965.33,-11837.3,53.5354, 0, 0,0.98587, 0, 0),
(17703,38,-1954.73,-11826.3,56.8275, 0, 0,0.765385, 0, 0),
(17703,39,-1935.48,-11810.4,62.4902, 0, 0,0.557255, 0, 0),
(17703,40,-1930.1,-11808.6,63.5774, 0, 0,0.376613, 0, 0),
(17703,41,-1940.09,-11813.9,61.1199, 0, 0,3.9706, 0, 0),
(17703,42,-1954.36,-11826,56.8904, 0, 0,3.88027, 0, 0),
(17703,43,-1965.29,-11837.1,53.5715, 0, 0,4.25255, 0, 0),
(17703,44,-1966.67,-11850.3,50.2039, 0, 0,4.33021, 0, 0),
(17703,45,-1970.19,-11856.5,48.768, 0, 0,3.61236, 0, 0),
(17703,46,-1993.29,-11860.6,47.1204, 0, 0,2.99975, 0, 0),
(17703,47,-2002.14,-11857.7,47.1022, 0, 0,2.88587, 0, 0),
(17703,48,-2020.35,-11855,46.9188, 0, 0,3.04295, 0, 0),
(17703,49,-2040.83,-11852.7,47.3419, 0, 0,3.29585, 0, 0),
(17703,50,-2046.88,-11856.7,47.584, 0, 0,4.16921, 0, 0),
(17703,51,-2047.56,-11865.3,47.1421, 0, 0,4.93576, 0, 0),
(17703,52,-2045.9,-11874.1,46.7172, 8000, 1770301,4.64909, 0, 0),
(17703,53,-2047.4,-11865,47.1604, 0, 0,1.90726, 0, 0),
(17703,54,-2047.55,-11856.5,47.6353, 0, 0,2.42327, 0, 0),
(17703,55,-2056.26,-11851.1,48.8093, 0, 0,2.84739, 0, 0),
(17703,56,-2072.15,-11846.1,51.3344, 0, 0,2.8356, 0, 0),
(17703,57,-2089.34,-11843.7,51.8299, 0, 0,3.08693, 0, 0),
(17703,58,-2072.16,-11846.2,51.3413, 0, 0,5.95442, 0, 0),
(17703,59,-2055.56,-11850.9,48.6765, 0, 0,6.15529, 0, 0),
(17703,60,-2040.3,-11852.8,47.3301, 0, 0,6.16314, 0, 0),
(17703,61,-2019.99,-11854.9,46.919, 0, 0,6.19063, 0, 0),
(17703,62,-2001.51,-11858.1,47.0941, 0, 0,5.62829, 0, 0),
(17703,63,-1993.95,-11866,47.2079, 0, 0,5.16491, 0, 0),
(17703,64,-1990.61,-11880.9,47.9337, 0, 0,4.83505, 0, 0),
(17703,65,-1989.55,-11895.5,49.5601, 0, 0,5.12407, 0, 0),
(17703,66,-1982.89,-11904.6,50.2064, 0, 0,5.6974, 0, 0),
(17703,67,-1975.93,-11907.7,50.255, 0, 0,0.0865124, 0, 0),
(17703,68,-1957.14,-11899.5,49.141, 0, 0,0.485241, 0, 0),
(17703,69,-1942.66,-11891.2,48.061, 0, 0,0.952553, 0, 0),
(17703,70,-1937.83,-11879.8,47.7193, 0, 0,1.52275, 0, 0),
(17703,71,-1941.58,-11869.5,49.1904, 0, 0,2.23032, 0, 0),
(17703,72,-1950.28,-11860.3,50.3426, 0, 0,2.58925, 0, 0),
(17703,73,-1962.34,-11853.2,50.0505, 0, 0,2.48086, 0, 0),
(17703,74,-1966.23,-11849.1,50.5532, 0, 0,1.97585, 0, 0),
(17703,75,-1965.4,-11837.1,53.568, 0, 0,0.999185, 0, 0),
(17703,76,-1954.74,-11826.2,56.8305, 0, 0,0.758363, 0, 0),
(17703,77,-1939.77,-11813.6,61.2297, 0, 0,0.675896, 0, 0),
(17703,78,-1930.12,-11808.4,63.6093, 0, 0,0.4874, 0, 0),
(17703,79,-1940.27,-11813.9,61.0996, 0, 0,3.84498, 0, 0),
(17703,80,-1954.4,-11825.9,56.9055, 0, 0,3.85676, 0, 0),
(17703,81,-1965.5,-11837.3,53.5019, 0, 0,4.44973, 0, 0),
(17703,82,-1966.22,-11850,50.3387, 0, 0,4.41832, 0, 0),
(17703,83,-1970.82,-11856.5,48.7264, 0, 0,3.3816, 0, 0),
(17703,84,-1992.86,-11860.6,47.1382, 0, 0,3.15776, 0, 0),
(17703,85,-2002.43,-11857.4,47.1098, 0, 0,2.90643, 0, 0),
(17703,86,-2020.43,-11854.9,46.9173, 0, 0,3.02031, 0, 0),
(17703,87,-2040.46,-11852.8,47.3315, 0, 0,3.00853, 0, 0),
(17703,88,-2060.71,-11850.5,49.5087, 0, 0,2.84595, 0, 0),
(17703,89,-2072.57,-11845.9,51.3754, 0, 0,3.03602, 0, 0),
(17703,90,-2089.53,-11843.7,51.824, 0, 0,3.11063, 0, 0),
(17703,91,-2072.56,-11846.1,51.3865, 0, 0,6.07944, 0, 0),
(17703,92,-2055.45,-11851.2,48.6734, 0, 0,6.07551, 0, 0),
(17703,93,-2040.35,-11852.8,47.3337, 0, 0,6.17761, 0, 0),
(17703,94,-2019.79,-11854.8,46.9228, 0, 0,6.19332, 0, 0),
(17703,95,-2001.15,-11858.3,47.0921, 0, 0,5.7802, 0, 0),
(17703,96,-1993.74,-11866.4,47.2185, 0, 0,5.16367, 0, 0),
(17703,97,-1990.59,-11881.2,47.9759, 0, 0,4.74741, 0, 0),
(17703,98,-1989.42,-11896,49.6509, 0, 0,5.23514, 0, 0),
(17703,99,-1982.55,-11905,50.2406, 0, 0,5.65375, 0, 0),
(17703,100,-1975.17,-11907.5,50.2488, 0, 0,0.278481, 0, 0);
DELETE FROM db_scripts WHERE id = 1770301; 
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1770301,1,0,0,0,0,0,0,2000000827,2000000828,2000000829,2000000830,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry IN (2000000827,2000000828,2000000829,2000000830);
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000827,'Don\'t you people ever check the mail?',0,0,0,0,NULL),
(2000000828,'How am I expected to deliver all of these messages?',0,0,0,0,NULL),
(2000000829,'I need to be re-assigned. This job is pushing me over the edge...',0,0,0,0,NULL),
(2000000830,'He thinks he\'s so damned important. Always pushing me around... I\'ll show him. I\'ll show all of them!',0,0,0,0,NULL);

-- Jessera of Mac'Aree
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 63386;
DELETE FROM creature_movement WHERE id = 63386;
UPDATE creature_template SET MovementType = 2 WHERE entry = 17663;
DELETE FROM creature_movement_template WHERE entry = 17663;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(17663,1,-1994.23,-11915.8,51.5202, 360000, 1766301,5.35816, 0, 0);
DELETE FROM db_scripts WHERE id = 1766301; 
INSERT INTO db_scripts (script_type, id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3,1766301,40,0,0,0,0,0,0,2000000831,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry = 2000000831;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000831,'If only I could get back to the mushroom thicket. I have not seen such a mature cluster in my lifetime!',0,0,0,0,NULL);

-- Blood Watch Peacekeeper
UPDATE creature SET MovementType = 2, spawndist = 0 WHERE guid IN (63146,63147);
DELETE FROM creature_movement WHERE id IN (63146,63147);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #1
(63146,1,-2004.89,-11827.2,52.7889, 0, 0,1.85012, 0, 0),
(63146,2,-2010.94,-11817.2,53.5181, 0, 0,1.98364, 0, 0),
(63146,3,-1995.52,-11818.5,54.305, 0, 0,5.88078, 0, 0),
(63146,4,-1987.02,-11821.7,54.069, 0, 0,5.57841, 0, 0),
(63146,5,-1973.4,-11837,52.6277, 0, 0,5.32552, 0, 0),
(63146,6,-1967.59,-11850.1,50.1557, 0, 0,4.3964, 0, 0),
(63146,7,-1971.02,-11856.1,48.7404, 0, 0,3.75474, 0, 0),
(63146,8,-1994.5,-11860.6,47.1244, 0, 0,2.97405, 0, 0),
(63146,9,-2019.02,-11854.3,46.9397, 0, 0,2.8476, 0, 0),
(63146,10,-2041.13,-11846.2,47.6536, 0, 0,2.13132, 0, 0),
(63146,11,-2050.24,-11833.5,47.9015, 0, 0,1.85879, 0, 0),
(63146,12,-2057.16,-11811.9,46.3185, 0, 0,1.79124, 0, 0),
(63146,13,-2050.33,-11833.1,47.904, 0, 0,5.24856, 0, 0),
(63146,14,-2041.12,-11845.8,47.6779, 0, 0,5.66717, 0, 0),
(63146,15,-2030.62,-11851.6,47.0815, 0, 0,6.02767, 0, 0),
(63146,16,-1994.65,-11860.4,47.1376, 0, 0,0.0374328, 0, 0),
(63146,17,-1973.18,-11858.2,48.3472, 0, 0,0.507885, 0, 0),
(63146,18,-1967.89,-11852.3,49.5556, 0, 0,1.29959, 0, 0),
(63146,19,-1969.35,-11841.2,52.1706, 0, 0,2.23971, 0, 0),
(63146,20,-1986.43,-11822.7,54.0158, 0, 0,2.58759, 0, 0),
(63146,21,-1994.98,-11818.9,54.2684, 0, 0,3.04155, 0, 0),
(63146,22,-2010.66,-11816.3,53.5686, 0, 0,4.81969, 0, 0),
(63146,23,-2005.05,-11827.6,52.7647, 0, 0,4.77142, 0, 0),
(63146,24,-2005.21,-11850.6,47.7719, 0, 0,4.1219, 0, 0),
(63146,25,-2012.78,-11853.6,47.2376, 0, 0,3.01763, 0, 0),
(63146,26,-2032.21,-11855,46.9908, 0, 0,4.18238, 0, 0),
(63146,27,-2032.05,-11861.5,46.4347, 0, 0,4.9285, 0, 0),
(63146,28,-2027.61,-11874.6,45.5528, 0, 0,5.00311, 0, 0),
(63146,29,-2037.59,-11859.6,46.8116, 0, 0,2.5511, 0, 0),
(63146,30,-2044.27,-11860.2,47.3245, 0, 0,3.59725, 0, 0),
(63146,31,-2047.83,-11868.1,46.965, 0, 0,4.38657, 0, 0),
(63146,32,-2051.65,-11878.7,46.1505, 0, 0,4.31981, 0, 0),
(63146,33,-2057.88,-11893.9,46.1474, 0, 0,4.32374, 0, 0),
(63146,34,-2050.23,-11874.8,46.5373, 0, 0,1.21749, 0, 0),
(63146,35,-2049.23,-11855.5,47.7568, 0, 0,2.20632, 0, 0),
(63146,36,-2052.46,-11852.3,48.1841, 0, 0,2.81107, 0, 0),
(63146,37,-2085.65,-11841.8,51.8941, 0, 0,2.8205, 0, 0),
(63146,38,-2068.5,-11847.3,50.8557, 0, 0,5.97779, 0, 0),
(63146,39,-2053.5,-11852.2,48.3142, 0, 0,5.46729, 0, 0),
(63146,40,-2047.99,-11865.3,47.1717, 0, 0,4.80756, 0, 0),
(63146,41,-2049.96,-11874.5,46.5559, 0, 0,4.32455, 0, 0),
(63146,42,-2057.81,-11893.8,46.1485, 0, 0,4.34811, 0, 0),
(63146,43,-2047.83,-11868.7,46.9312, 0, 0,1.13426, 0, 0),
(63146,44,-2045.68,-11861.8,47.2953, 0, 0,0.636319, 0, 0),
(63146,45,-2040.69,-11859.4,46.974, 0, 0,0.0237542, 0, 0),
(63146,46,-2035.78,-11860.1,46.6971, 0, 0,5.7768, 0, 0),
(63146,47,-2031.73,-11863,46.2854, 0, 0,5.15712, 0, 0),
(63146,48,-2027.66,-11874.4,45.5554, 0, 0,5.0079, 0, 0),
(63146,49,-2032.22,-11856,46.9169, 0, 0,1.35423, 0, 0),
(63146,50,-2028.57,-11853.6,46.9184, 0, 0,0.191051, 0, 0),
(63146,51,-2006.1,-11853,47.4563, 0, 0,0.896338, 0, 0),
-- #2
(63147,1,-1959.7,-11855.1,50.0547, 0, 0,3.34713, 0, 0),
(63147,2,-1989.64,-11863.8,47.24, 0, 0,4.88101, 0, 0),
(63147,3,-1991.4,-11880.4,47.8851, 0, 0,4.65403, 0, 0),
(63147,4,-1984.44,-11904.3,50.2479, 0, 0,5.4088, 0, 0),
(63147,5,-1959.1,-11932.7,54.9912, 0, 0,5.57376, 0, 0),
(63147,6,-1933.98,-11953.9,57.2017, 0, 0,5.62481, 0, 0),
(63147,7,-1948.55,-11942,56.5236, 0, 0,2.45966, 0, 0),
(63147,8,-1966.15,-11926.8,53.9526, 0, 0,2.23739, 0, 0),
(63147,9,-1983.98,-11904.8,50.2805, 0, 0,1.8926, 0, 0),
(63147,10,-1991.42,-11881.3,48, 0, 0,1.57922, 0, 0),
(63147,11,-1989.31,-11864.2,47.2738, 0, 0,0.709788, 0, 0),
(63147,12,-1960.68,-11855.3,49.8999, 0, 0,5.87928, 0, 0),
(63147,13,-1936.25,-11867.6,49.3489, 0, 0,5.73278, 0, 0),
(63147,14,-1930.3,-11871.2,48.1187, 0, 0,5.9904, 0, 0),
(63147,15,-1917.12,-11876,43.5839, 0, 0,6.10584, 0, 0),
(63147,16,-1890.37,-11879,36.3178, 0, 0,0.123462, 0, 0),
(63147,17,-1878.57,-11878.9,33.9151, 0, 0,0.0841922, 0, 0),
(63147,18,-1902,-11879.2,39.2331, 0, 0,3.13154, 0, 0),
(63147,19,-1921.07,-11878.8,44.2356, 0, 0,3.53602, 0, 0),
(63147,20,-1943.43,-11893.5,48.1698, 0, 0,3.5211, 0, 0),
(63147,21,-1967.61,-11901.2,49.7776, 0, 0,3.31218, 0, 0),
(63147,22,-1988.35,-11877.2,47.832, 0, 0,1.76102, 0, 0),
(63147,23,-1989.49,-11867.9,47.3265, 0, 0,1.30156, 0, 0),
(63147,24,-1984.56,-11861.4,47.3579, 0, 0,0.606481, 0, 0),
(63147,25,-1976.55,-11857.8,48.0708, 0, 0,0.272687, 0, 0),
(63147,26,-1968.46,-11855,49.0565, 0, 0,0.849432, 0, 0),
(63147,27,-1967.06,-11839.2,52.8383, 0, 0,0.902053, 0, 0),
(63147,28,-1950.87,-11823.5,57.8799, 0, 0,0.688425, 0, 0),
(63147,29,-1928.95,-11805.6,64.0772, 0, 0,0.657009, 0, 0),
(63147,30,-1950.39,-11823.1,58.0416, 0, 0,3.84965, 0, 0),
(63147,31,-1964.23,-11839.1,53.4519, 0, 0,4.34052, 0, 0),
(63147,32,-1966.2,-11853,49.6308, 0, 0,3.96274, 0, 0),
(63147,33,-1973.72,-11858,48.3068, 0, 0,3.42946, 0, 0),
(63147,34,-1984.52,-11861.2,47.3638, 0, 0,3.93211, 0, 0),
(63147,35,-1990.49,-11869.9,47.3204, 0, 0,5.10078, 0, 0),
(63147,36,-1973.81,-11898.6,49.8689, 0, 0,6.07152, 0, 0),
(63147,37,-1963.78,-11900.6,49.5592, 0, 0,0.0310172, 0, 0),
(63147,38,-1947.56,-11896.5,48.5305, 0, 0,0.498329, 0, 0),
(63147,39,-1935.44,-11885.1,47.0506, 0, 0,0.462986, 0, 0),
(63147,40,-1920.92,-11878.9,44.2023, 0, 0,6.2176, 0, 0),
(63147,41,-1878.32,-11879,33.8674, 0, 0,0.00352812, 0, 0),
(63147,42,-1902.5,-11879.5,39.3971, 0, 0,2.92364, 0, 0),
(63147,43,-1922.19,-11876.4,44.5864, 0, 0,2.56393, 0, 0),
(63147,44,-1935.23,-11868.2,49.1821, 0, 0,2.57178, 0, 0);

-- <Hand of Argus>
DELETE FROM creature_template_addon WHERE entry IN (18020,18021,18022,18023,18024,18025,18026,18027,18028,18029,18030,18031,18032,18033,18034);
INSERT INTO creature_template_addon VALUES
(18020, 0, 0, 1, 1, 0, 0, NULL),
(18021, 0, 0, 1, 1, 0, 0, NULL),
(18022, 0, 0, 1, 1, 0, 0, NULL),
(18023, 0, 0, 1, 1, 0, 0, NULL),
(18024, 0, 0, 1, 1, 0, 0, NULL),
(18025, 0, 0, 1, 1, 0, 0, NULL),
(18026, 0, 0, 1, 1, 0, 0, NULL),
(18027, 0, 0, 1, 1, 0, 0, NULL),
(18028, 0, 0, 1, 1, 0, 0, NULL),
(18029, 0, 0, 1, 1, 0, 0, NULL),
(18030, 0, 0, 1, 1, 0, 0, NULL),
(18031, 0, 0, 1, 1, 0, 0, NULL),
(18032, 0, 0, 1, 1, 0, 0, NULL),
(18033, 0, 0, 1, 1, 0, 0, NULL),
(18034, 0, 0, 1, 1, 0, 0, NULL);
-- pools
-- Pool Templates -- Pool 1
DELETE FROM pool_template WHERE entry = 25524;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25524, 1, 'Blood Watch - Defender Auston/Defender Katroi - Pool 1');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25524;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(63727, 25524, 0, 'Blood Watch - Defender Auston'),
(84428, 25524, 0, 'Blood Watch - Defender Katroi');
-- Pool Templates -- Pool 2
DELETE FROM pool_template WHERE entry = 25525;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25525, 1, 'Blood Watch - Defender Kadithuul/Defender Kranos - Pool 2');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25525;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(84397, 25525, 0, 'Blood Watch - Defender Kadithuul'),
(63725, 25525, 0, 'Blood Watch - Defender Kranos');
-- Pool Templates -- Pool 3
DELETE FROM pool_template WHERE entry = 25526;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25526, 1, 'Blood Watch - Defender Ashoon/Defender Ursi - Pool 3');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25526;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(84396, 25526, 0, 'Blood Watch - Defender Ashoon'),
(63724, 25526, 0, 'Blood Watch - Defender Ursi');
-- Pool Templates -- Pool 4
DELETE FROM pool_template WHERE entry = 25527;
INSERT INTO pool_template (entry, max_limit, description) VALUES
(25527, 1, 'Blood Watch - Defender Zaibah/Defender Sorli - Pool 4');
-- Individual Creature Spawn Pools
DELETE FROM pool_creature WHERE pool_entry = 25527;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES
(84395, 25527, 0, 'Blood Watch - Defender Zaibah'),
(63726, 25527, 0, 'Blood Watch - Defender Sorli');    
    

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;



        ELSE
            COMMIT;
            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
		IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
		ELSE
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;

