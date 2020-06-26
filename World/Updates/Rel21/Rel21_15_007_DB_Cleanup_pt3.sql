-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '15'; 
    SET @cOldContent = '006';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '007';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'DB_Cleanup_pt3';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'DB_Cleanup_pt3';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
		
UPDATE `quest_template` SET `offerrewardtext`='Hiccup! Ho Ho!' WHERE `entry`='49';
UPDATE `quest_template` SET `offerrewardtext`='Hiccup! Ho Ho!' WHERE `entry`='50';
UPDATE `quest_template` SET `offerrewardtext`='Hiccup! Ho Ho!' WHERE `entry`='51';

UPDATE `quest_template` SET `RequestItemsText`='Welcome to Camp Narache, $N. I hear good things about you. Your bloodline is strong, and many of the elders consider you skilled already. But that we will test.$B$BThe plains of Mulgore will be your home for sometime--you should do your best to learn it very well. One day you will travel to unfamilar lands to master greater skills. You must be ready.' WHERE `entry`='3092';
UPDATE `quest_template` SET `offerrewardtext`='I see you found me, young $R. Melithar is a wise druid to have sent you.' WHERE `entry`='458';
UPDATE `quest_template` SET `objectives`='Gather 5 Lightforge Ingots, then return to Glorin Steelbrow in the Wetlands.' WHERE `entry`='526';
UPDATE `quest_template` SET `offerrewardtext`='Now it is time for the great Bartolo to work his magic! I require no wizard\'s staff, no mage\'s rod. For I, the great Bartolo, work magic with a mere needle and thread!' WHERE `entry`='565';
UPDATE `quest_template` SET `RequestItemsText`='Along with the druids, the Oracle Tree and the Arch Druid have been carefully monitoring the growth of Teldrassil. But though we have a new home, our immortal lives have not been restored.' WHERE `entry`='934';
UPDATE `quest_template` SET `RequestItemsText`='Hmm... You come with the spirit of the forest strongly within you, $C. What business do you have with the Arch Druid of the Kaldorei?' WHERE `entry`='940';
UPDATE `quest_template` SET `offerrewardtext`='Ah. Thank you, $N. It is strange, though. The Arch Druid always seems in such a hurry. The forest knows that all shall come to pass in the appointed time. Shan\'do Stormrage understood that.' WHERE `entry`='952';
UPDATE `quest_template` SET `title`='BETA Dealing with Zeth\'Gor' WHERE `entry`='10059';

UPDATE `quest_template` SET `details`='Hi, $N!$B$BSpeak with me friend Witch Doctor Unbagwa.' WHERE `entry`='349';

UPDATE `quest_template` SET `details`='$N, can you take one of the seeds you brought me to my friend, Rellian Greenspyre?  He is a druid in Darnassus, and when last we spoke he revealed his interest in my work with the Timberlings. He had some ideas himself, and he will appreciate a specimen seed to work with.$B$BThank you, $N. You have been a great help to me. I hope that, some day, you will see the fruit of my labors.$B$BYou will usually find Rellian walking the pathways of the Cenarion Enclave in Darnassus.' WHERE `entry`='922';
UPDATE `quest_template` SET `details`='A glint of light on the ground catches your eye from underneath the rubble. Brushing away debris and ash caked onto the object reveals the insignia of a gold anchor on white enameled on the surface: the sign of Theramore.$B$BUnderneath the anchor is embossed the name "Lieutenant Paval Reethe".' WHERE `entry`='1269';

UPDATE `quest_template` SET `details`='The embrace of death had all but overcome my being when he intervened. He breathed only once upon my maimed body and then waited patiently for the sands of time to cleanse my wounds.$B$B"Forever you will remain if you must," he said, and with those words I was bound as a Watcher.$B$BLook now to the desert. The second war is upon us. You must seek out the resting place of the Bronze. Venture to the Caverns of Time and see if the master has returned. I must be sure before I am able to proceed.' WHERE `entry`='8286';
UPDATE `quest_template` SET `details`='Back so soon? Stop making me re-evaluate my low opinion of you, $C, you\'re making me feel all gooey inside. So, as you can tell we still don\'t have enough iron bars for all of the weapons, armor, steam tanks and whatnot that need building for the bug hunt. Think you have it in you to bring back another stack of twenty iron bars in between all of those trips to Zul\'Gurub, or wherever it is that you kids hang out these days?' WHERE `entry`='8495';
UPDATE `quest_template` SET `details`='It is so good to see you again, $N. I hope that you\'ve been doing well. It\'s true that we are still in need of thorium bars. If you have them to spare I am collecting them for the Ahn\'Qiraj war effort.' WHERE `entry`='8500';
UPDATE `quest_template` SET `details`='What! You again? Well I\'ll be a monkey\'s uncle... except that I\'m a gnome. Slicky Gastronome to be precise! So you\'re back to help out again, eh? Well, I can\'t say as I blame you. Don\'t you just love the smell of all of that food? <drool>$B$BEnough loitering! Get out there and bring me back more rainbow fin albacore!' WHERE `entry`='8525';
UPDATE `quest_template` SET `details`='Back so soon? You\'ll be a real miner in no time, $C. So, you already know the drill; I need you to go out, mine up a mess of copper ore, smelt it into bars and bring it back to me here. I know that\'s something you\'re capable of, the question is, are you willing?' WHERE `entry`='8533';
UPDATE `quest_template` SET `details`='There\'s trouble in Winterspring!$B$BWhy, sure, I spend some time out in the wilds and know about these things... I\'m always mighty proud to say it. I consider the hours I spend out there in the hills to be golden. Help you cultivate quick reflexes, a cool head and a keen eye...$B$BIt takes judgement, brains and maturity to appreciate the wilderness in the way that I do.$B$BNow, what was I talking about?$B$BAh yes, trouble. See Donova Snowden at the hot springs and she can tell you more.' WHERE `entry`='6603';

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
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
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


