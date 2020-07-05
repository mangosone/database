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
    SET @cOldContent = '007';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '008';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'DB_Cleanup_pt4';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'DB_Cleanup_pt4';

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
		
UPDATE `quest_template` SET `details`='I can\'t believe that Anilia is gone... We used to play together in the forests all the time. I almost feel... sad.$B$BI know something that might make me feel better. Please, slay the satyrs that took Anilia from me! Bring me their horns as proof of your actions and you will forever have my gratitude.' WHERE `entry`='1032';

UPDATE `quest_template` SET `details`='Let\'s not waste more of my precious time with jibber jabber, $N. It\'s time to focus on replenishing our dwindling fiery flux supply.$BWhat I\'m gonna need from you is the following:$B$B*2 Incendosaur scales.$B*4 Kingsblood.$B*1 Coal.$B$BI\'ll take all that you can offer!$BAnd you\'ll do it fast if you wanna get in good with the Brotherhood.' WHERE `entry`='7736';

UPDATE `quest_template` SET `details`='Zanza can create the ancient troll enchantments with the right components. $BThe first is a primal Hakkari idol that must be taken from the most powerful of the Hakkari lieutenants: Jin\'do and the Bloodlord.$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter $B$Bthis foul place. Look inside the jinxed hoodoo. Bring me these things and I will create a powerful enchantment for you!' WHERE `entry`='8184';

UPDATE `quest_template` SET `details`='Let\'s not waste more of my precious time with jibber jabber, $R. It\'s time to focus on replenishing our dwindling fiery flux supply.$B$BWhat I\'m gonna need from you is the following:$B$B*Incendosaur scales.$B$B*Iron bars.$B$B*Coal.$B$BI\'ll take all that you can offer!$B$BAnd you\'ll do it fast if you wanna get in good with the Brotherhood.' WHERE `entry`='8241';

UPDATE `quest_template` SET `details`='Let\'s not waste more of my precious time with jibber jabber, $R. It\'s time to focus on replenishing our dwindling fiery flux supply.$B$BWhat I\'m gonna need from you is the following:$B$B*Incendosaur scales.$B$B*Heavy Leather.$B$B*Coal.$B$BI\'ll take all that you can offer!$B$BAnd you\'ll do it fast if you wanna get in good with the Brotherhood.' WHERE `entry`='8242';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Arathi Basin.' WHERE `entry`='8565';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Arathi Basin.' WHERE `entry`='8566';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Warsong Gulch.' WHERE `entry`='8567';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Warsong Gulch.' WHERE `entry`='8568';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Warsong Gulch.' WHERE `entry`='8569';

UPDATE `quest_template` SET `details`='Ah, yes! Of course we wouldn\'t forget about your past accomplishments in Warsong Gulch.' WHERE `entry`='8570';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create Icebane bracers. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9235';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create an Icebane breastplate. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9236';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create Polar bracers. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9241';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create Polar gloves. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9242';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create Icy Scale gauntlets. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9245';

UPDATE `quest_template` SET `details`='Thanks to you and Omarion (May he rest in peace),$B$BI am now able to create an Icy Scale breastplate. All you need to do is bring me the materials and pay a small crafting fee.' WHERE `entry`='9246';

UPDATE `quest_template` SET `details`='The documents you found on Kargath\'s body detail plans on what appears to be a massive invasion on Honor Hold.' WHERE `entry`='9511';

UPDATE `quest_template` SET `details`='$N, we have reason to believe that the easternmost forge camp is not yet complete. The Legion\'s gan\'arg servants are working \'round the clock to get the facility up and running. We can\'t allow that to happen. $B$BHead east to Forge Camp: Mageddon and slay 10 gan\'arg. Bring me the head of their master - Razorsaw - and the Legion\'s fel reaver production will grind to a halt!   ' WHERE `entry`='10390';

UPDATE `quest_template` SET `details`='The text on the note is written in some dark, indecipherable scrawl. The more you stare at them, the more the symbols seem to twist and burn before your eyes. There is only one in Thrallmar that can transcribe such vile script - the blood elf Magister Bloodhawk.' WHERE `entry`='10393';

UPDATE `quest_template` SET `details`='Pay close attention, $N. We\'ve been surveying the Legion camps that lie along the ridge ahead. We have reason to believe that these so-called \'Forge Camps\' are where the demons are constructing those blasted Fel Reavers. $B$BYou can see the closest target, Forge Camp: Mageddon, to the west. Our intelligence suggests that it\'s still under construction. If you can slay the Gan\'arg Servants and their master - Razorsaw - we can bring the Legion\'s Fel Reaver production to a grinding halt!   ' WHERE `entry`='10394';

UPDATE `quest_template` SET `details`='You\'ve made your pledge, $C. Now it is up to you to see it through.$B$BServe the Scale of the Sands well and you will be rewarded.$B$BFail and the timeline as we know it will be unravelled!' WHERE `entry`='10465';

UPDATE `quest_template` SET `details`='You\'ve made your pledge, $C. Now it is up to you to see it through.$B$BServe the Scale of the Sands well and you will be rewarded.$B$BFail and the timeline as we know it will be unravelled!' WHERE `entry`='10466';

UPDATE `quest_template` SET `details`='You\'ve made your pledge, $C. Now it is up to you to see it through.$B$BServe the Scale of the Sands well and you will be rewarded.$B$BFail and the timeline as we know it will be unravelled!' WHERE `entry`='10467';

UPDATE `quest_template` SET `details`='$N, I\'m a scientist, but also a treasure hunter at heart!$B$BLong ago, when trolls used to occupy this land, they created large amounts of ornaments modeled after Gahz\'rilla, a hydra they worshipped as a deity. These ornaments are carved out of an element that I call "Gahz\'ridian," after the hydra god.$B$BI did find some myself, but I\'d like to have some more to study -- maybe you can find some?$B$BI even invented a detector that makes finding the Gahz\'ridian a snap! Just put it on, and the search begins!' WHERE `entry`='3161';

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


