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
    SET @cOldContent = '008';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '009';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'DB_Cleanup_pt5';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'DB_Cleanup_pt5';

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

UPDATE `quest_template` SET `details`='Brave traveler, the centaurs have increased their attacks in this area. Freewind Post must know about this renewed harassment immediately! Seek Cliffwatcher Longhorn at Freewind Post to the southeast and give him this urgent message.$B$BBe warned, avoid the Grimtotem Clan nearby... they have been acting strange toward us lately.' WHERE `entry`='4542';
UPDATE `quest_template` SET `details`='You are to meet with Windsor at the gates of Stormwind.$B$BWhat Windsor is about to unveil will shake the very foundation of the kingdom!$B$BDo not attempt to venture there alone, $N. You must amass an army! Gather your compatriots. To arms! ' WHERE `entry`='6402';
UPDATE `quest_template` SET `details`='The Grimtotem Clan raided my village and killed most everyone. I killed all I could, but barely escaped with my life.$B$B$N, all I wish now is that more of them are dead. You will find them just to the west of here.' WHERE `entry`='6548';
UPDATE `quest_template` SET `details`='Hey, can you do Great-father Winter a favor, um, little $G boy : girl;?$B$BNot to needlessly talk about myself in the third person, but Great-father Winter has been at this all day and he could use a treat himself. Some gingerbread cookies and ice cold milk to wash them down with would really hit the spot. Think you could be a friend to the Great-father and fetch some for me?' WHERE `entry`='6962';
UPDATE `quest_template` SET `details`='Zanza can create the ancient troll enchantments with the right components. The first is a primal Hakkari idol that must be taken from the most powerful of the Hakkari lieutenants: Jin\'do and the Bloodlord.$B$BThe second is a punctured voodoo doll. These can be found in the piles of refuse that litter this foul place. Look inside the jinxed hoodoo.$B$BBring me these things and I will create a powerful enchantment for you!' WHERE `entry`='8184';
UPDATE `quest_template` SET `ObjectiveText1`='Remember your talents' WHERE `entry`='1';
UPDATE `quest_template` SET `ObjectiveText1`='Morbent Fel slain' WHERE `entry`='55';
UPDATE `quest_template` SET `offerrewardtext`='So these bandanas -- filthy tokens of corruption -- are what my Mac had to die for? Such a waste. Such a tragic sacrifice. $B$BBut alas, I cannot return to the past. Just know, $N, that you have brought my family justice through your deeds.' WHERE `entry`='388';
UPDATE `quest_template` SET `offerrewardtext`='Your service to the creatures of Shadowglen is worthy of reward, $N.$B$BYou confirmed my fears, however. If the grells have become tainted by the Fel Moss, one can only imagine what has become of the Gnarlpine tribe of furbolgs who once lived here.$B$BShould you find yourself in Dolanaar, able $C, seek out the knowledgeable druid, Athridas Bearmantle. He shares our concern for the well being of the forest.' WHERE `entry`='459';
UPDATE `quest_template` SET `RequestItemsText`='Sergeant Yohwa tells me you are skilled and brave, $C. Do you have something to report?' WHERE `entry`='574';
UPDATE `quest_template` SET `objectives`='Speak with Hemet Nesingwary' WHERE `entry`='583';
UPDATE `quest_template` SET `offerrewardtext`='We survived the attack!$B$BWe could not have done it without you, $N.$B$BWe\'ll be heading out as soon as the tide rises. If you weren\'t such a promising hero I\'d offer you a place on my crew. But I can tell you have bigger fish to fry.$B$BEven if you are a puny $R....' WHERE `entry`='667';
UPDATE `quest_template` SET `RequestItemsText`='The burning in my blood... it grows by the day. The warlock must be stopped.' WHERE `entry`='673';
UPDATE `quest_template` SET `RequestItemsText`='I wouldn\'t wait too long to get that bracer, $N.$B$BWho knows what\'s going to happen next?' WHERE `entry`='716';
UPDATE `quest_template` SET `offerrewardtext`='The Tauren of Narache thank you, $N. You show much promise.' WHERE `entry`='747';
UPDATE `quest_template` SET `offerrewardtext`='The Tauren of Narache thank you for these provisions, $N. With your skill in the ways of the hunt you will surely be revered in Thunder Bluff someday.' WHERE `entry`='750';
UPDATE `quest_template` SET `offerrewardtext`='The Horde would surely prevail if the Kolkar centaurs were to attack. But by preventing such an attack. we have spared our mighty warriors unnecessary bloodshed.$B$BAnd as sure as there is sand in the Tanaris desert, we know that there will be blood spilled before these trying times are through.$B$BYou have served your people well, $C.' WHERE `entry`='786';
UPDATE `quest_template` SET `RequestItemsText`='Bhag\'thera can prove to be an elusive beast. How fares the hunt?' WHERE `entry`='191';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve done well, $N!' WHERE `entry`='192';
UPDATE `quest_template` SET `offerrewardtext`='Greetings, $C.$B$BI am pleased to see the likes of you taking an interest in the well being of nature; tales of your mighty deeds precede you, and you are welcomed here. Seeing you before me instills the feeling of confidence that the Cenarion Circle will get the proper aid it needs.$B$BOur connection with the Cenarion Circle in Moonglade transcends racial and political divides. Remember this as you work on behalf of the Circle, and you will do well.' WHERE `entry`='1004';
UPDATE `quest_template` SET `offerrewardtext`='Greetings, $C.$B$BI am pleased to see the likes of you taking an interest in the well being of nature; tales of your mighty deeds precede you, and you are welcomed here. Seeing you before me instills the feeling of confidence that the Cenarion Circle will get the proper aid it needs.$B$BOur connection with the Cenarion Circle in Moonglade transcends racial and political divides. Remember this as you work on behalf of the Circle, and you will do well.' WHERE `entry`='1018';
UPDATE `quest_template` SET `offerrewardtext`='What makes you think I wish to be pestered by the likes of you, $C? Wait - let me stop the important duties I attend to on a daily basis so I can help you locate a doodad somewhere. By all means, the welfare of Darnassus - nay, all of Teldrassil - should come second to the acquisition of a bauble for your collection.$B$BThe fools in Moonglade waste my time with their call for assistance, and now I must endure this?' WHERE `entry`='1019';
UPDATE `quest_template` SET `offerrewardtext`='What makes you think I wish to be pestered by the likes of you, $C? Wait - let me stop the important duties I attend to on a daily basis so I can help you locate a doodad somewhere. By all means, the welfare of Darnassus - nay, all of Teldrassil - should come second to the acquisition of a bauble for your collection.$B$BThe fools in Moonglade waste my time with their call for assistance, and now I must endure this?' WHERE `entry`='1047';
UPDATE `quest_template` SET `offerrewardtext`='For the time being. I shall give you what you need to focus your spells and to call upon the spirits of air. Take this totem, and when you are ready, train with me some more.' WHERE `entry`='1532';
UPDATE `quest_template` SET `offerrewardtext`='So you\'re an engineer, eh? Well, for your help in getting me those pearls, here\'s the recipe for flash bombs.$B$BGood luck, and try not to blind yourself!' WHERE `entry`='1559';
UPDATE `quest_template` SET `offerrewardtext`='Very good, very good! You\'ve done well, $N. Perhaps the interest that is being shown in you is deserved, after all.$B$BThat\'ll be for the others to decide--assuming your imp doesn\'t overpower you and nip your career in the bud. For now, I\'m satisfied that you\'ll probably survive your first few months as a $C.$B$BA word about the imp, $N. As a $R knows, don\'t let its size fool you, its magic can be very dangerous.' WHERE `entry`='1599';
UPDATE `quest_template` SET `offerrewardtext`='Ah, you wish to petition me for a test of valor. Splendid.$B$BThere are many tasks throughout the city and surrounding lands that hold much challenge, and they could use a $G man:woman; with your skills.$B$BThis test should not be taken lightly, $N. This, like many things along our path, could take our lives. The Church always wishes to bolster its ranks, but it understands the sacrifices needed to ensure the paladins serving it are worthy.$B$BAre you prepared?' WHERE `entry`='1649';
UPDATE `quest_template` SET `offerrewardtext`='I can barely believe it! Furen\'s technique was a success, and this armor should withstand tremendous levels of stress.$B$BHere you are, $N. And thank you. I wouldn\'t have believed Furen\'s discovery if you hadn\'t gathered the materials I needed to test it myself.' WHERE `entry`='1706';
UPDATE `quest_template` SET `offerrewardtext`='Very good, I\'m glad Kaplak was able to get a hold of you.$B$BWe have some things to speak of, not the least of which is your future with the Hand.' WHERE `entry`='1859';
UPDATE `quest_template` SET `offerrewardtext`='You have been sent to aid me in my task, $N? Good. It is heartening to see young mages eager to help in our cause...$B$BWhat cause, you ask? In time, young one. You shall know... in time.' WHERE `entry`='1860';
UPDATE `quest_template` SET `offerrewardtext`='Oh, I can see you have promise, yes you do! But it takes more than promise to be a good $C. And if you\'re not a good $C, then you\'re a bad $C. And bad $Cs are part of the problem, yes they are!$B$BOops, I\'m getting ahead of things. Let\'s begin at the start!' WHERE `entry`='1879';
UPDATE `quest_template` SET `offerrewardtext`='Greetings, $N. You were wise to answer my call, and wiser still if you heed what I next say...' WHERE `entry`='1881';
UPDATE `quest_template` SET `offerrewardtext`='Hail, $N. Praise to you, for my call for aid is now answered. Let us hope you are up to the task...' WHERE `entry`='1883';
UPDATE `quest_template` SET `offerrewardtext`='I\'m glad you\'ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we\'ll begin discussing some of those now.' WHERE `entry`='5634';
UPDATE `quest_template` SET `offerrewardtext`='I\'m glad you\'ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we\'ll begin discussing some of those now.' WHERE `entry`='5635';
UPDATE `quest_template` SET `offerrewardtext`='Thanks for the done work!' WHERE `entry`='5636';
UPDATE `quest_template` SET `offerrewardtext`='I\'m glad you\'ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we\'ll begin discussing some of those now.' WHERE `entry`='5637';
UPDATE `quest_template` SET `offerrewardtext`='Thanks for the done work!' WHERE `entry`='5638';
UPDATE `quest_template` SET `offerrewardtext`='I\'m glad you\'ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we\'ll begin discussing some of those now.' WHERE `entry`='5639';
UPDATE `quest_template` SET `offerrewardtext`='I received reports of your exploits in Arathi Basin, $N. Well done!  With those like you joining the struggles here, I have faith that we will one day retake our homelands.' WHERE `entry`='8105';
UPDATE `quest_template` SET `offerrewardtext`='Very good work, $N!  An excited scout came to me with a report of your exploits. We in the League of Arathor are very pleased!$B$BYou are swiftly becoming a local hero among the soldiers in the League, and today\'s deed once again proves your sterling reputation.' WHERE `entry`='8114';
UPDATE `quest_template` SET `offerrewardtext`='You did it!  You took all of the bases!  Well done, $N!$B$BThere were those who doubted your chances, but I knew you could do it. Thank you, and know that the League of Arathor holds you in high regard, just as the Defilers of the Forsaken must fear the very mention of your name!' WHERE `entry`='8115';
UPDATE `quest_template` SET `offerrewardtext`='A Defiler scout came to me with a report of your success, $N. Well done.$B$BAs you will learn, to win the battle for Arathi Basin, we must be ever vigilant and crush any attempts at Alliance expansion. Do this, and our victory here is ensured.' WHERE `entry`='8120';
UPDATE `quest_template` SET `offerrewardtext`='Good work, $N!  Your latest actions in Arathi Basin were quite difficult, and so their successes are quite praiseworthy. The League of Arathor must be reeling from the last skirmishes in the basin, licking their wounds and, let us hope, rethinking their choice to fight here.' WHERE `entry`='8121';
UPDATE `quest_template` SET `offerrewardtext`='The cries of the Alliance as you and your compatriots attacked them could be heard even from here, $N. I can almost pity them for the pain and fear you delivered to their ranks. Almost, but not quite.$B$BYour value to the Defilers is without question. Your deeds in Arathi Basin have been most impressive, and have echoed among the chambers of Varimathras... and the Dark Lady herself.' WHERE `entry`='8122';
UPDATE `quest_template` SET `EndText`='Place a tribute at Uther\'s Tomb' WHERE `entry`='8149';
UPDATE `quest_template` SET `EndText`='Place a tribute at Grom\'s Monument' WHERE `entry`='8150';
UPDATE `quest_template` SET `offerrewardtext`='I received reports of your exploits in Arathi Basin, $N. Well done!  With those like you joining the struggles here, I have faith that we will one day retake our homelands.' WHERE `entry`='8166';
UPDATE `quest_template` SET `offerrewardtext`='I received reports of your exploits in Arathi Basin, $N. Well done!  With those like you joining the struggles here, I have faith that we will one day retake our homelands.' WHERE `entry`='8167';
UPDATE `quest_template` SET `offerrewardtext`='I received reports of your exploits in Arathi Basin, $N. Well done!  With those like you joining the struggles here, I have faith that we will one day retake our homelands.' WHERE `entry`='8168';
UPDATE `quest_template` SET `offerrewardtext`='A Defiler scout came to me with a report of your success, $N. Well done.$B$BAs you will learn, to win the battle for Arathi Basin, we must be ever vigilant and crush any attempts at Alliance expansion. Do this, and our victory here is ensured.' WHERE `entry`='8169';
UPDATE `quest_template` SET `offerrewardtext`='A Defiler scout came to me with a report of your success, $N. Well done.$B$BAs you will learn, to win the battle for Arathi Basin, we must be ever vigilant and crush any attempts at Alliance expansion. Do this, and our victory here is ensured.' WHERE `entry`='8170';
UPDATE `quest_template` SET `RequestItemsText`='With your increased status amongst the tribe comes access to some of our more potent potables. Behold... these brews are strong in the mojo - blessed by Zanza and fit for adventurers from all walks of life!$B$BI will allow you to choose one from the three I offer; in exchange, I require three Zandalar Honor Tokens. Note that only the effects of a single one may course through your spirit at any given time.' WHERE `entry`='8243';
UPDATE `quest_template` SET `RequestItemsText`='$N - for someone as exalted among the Zandalar as you are, I have something very special for you. Direct from our home in the South Seas... the Signets of the Zandalar! These signets are used to enhance any shoulder item you may possess. Should you seek might, mojo, or serenity - I have what you need!$B$BI ask for fifteen Zandalar Honor Tokens in exchange for your choice of one signet. If you have the tokens ready, then I\'m ready to make a deal!' WHERE `entry`='8246';
UPDATE `quest_template` SET `offerrewardtext`='<Sanath sneers at you.>$B$BArchmage Xylem awaits your arrival.' WHERE `entry`='8250';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8260';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8261';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8262';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8263';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8264';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve certainly begun to prove yourself to us, $N. As a reward, please take this care package! Inside it you\'ll find rations and bandages that are usable only inside Arathi Basin. $B$BAs you continue to prove yourself inside the Basin, you\'ll find that these items will become available to you for purchase. Rations become available when you are Honored with us, and bandages when you are Revered.' WHERE `entry`='8265';
UPDATE `quest_template` SET `offerrewardtext`='As a hero of the Stormpike, you may choose one item from these recently plun... er, recovered treasures.' WHERE `entry`='8271';
UPDATE `quest_template` SET `offerrewardtext`='How does it feel, $N? How does it feel to crush your enemies and watch their lines break apart? It feels good, doesn\'t it?$B$BYou should be rewarded for this heroic deed, soldier.' WHERE `entry`='8272';
UPDATE `quest_template` SET `offerrewardtext`='Welcome to the Sunspire, young $C!  Mastery of weapons and battle tactics begins here and now - all I ask of my pupils is that they cover payment for training costs that may come up, and that they are as good of a listener as they are an aspiring $C. The lessons I have to teach are extensive, and I don\'t like to repeat myself unnecessarially. Let\'s get to it then!' WHERE `entry`='8329';
UPDATE `quest_template` SET `EndText`='Cluck like a chicken for Innkeeper Firebrew' WHERE `entry`='8353';
UPDATE `quest_template` SET `EndText`='Cluck like a chicken for Innkeeper Norman' WHERE `entry`='8354';
UPDATE `quest_template` SET `EndText`='Do the "train" for Talvash' WHERE `entry`='8355';
UPDATE `quest_template` SET `EndText`='Flex for Innkeeper Allison' WHERE `entry`='8356';
UPDATE `quest_template` SET `EndText`='Dance for Innkeeper Saelienne' WHERE `entry`='8357';
UPDATE `quest_template` SET `EndText`='Do the "train" for Kali Remik' WHERE `entry`='8358';
UPDATE `quest_template` SET `EndText`='Flex for Innkeeper Gryshka' WHERE `entry`='8359';
UPDATE `quest_template` SET `EndText`='Dance for Innkeeper Pala' WHERE `entry`='8360';
UPDATE `quest_template` SET `offerrewardtext`='It\'s about time this troll got a full night\'s rest! The spirit totem will watch over me.$B$BI been a long time collectin\' things, maybe you want somethin\' for all your trouble?' WHERE `entry`='8413';
UPDATE `quest_template` SET `objectives`='Some of the Deadwood furbolgs wear a distinctive headdress that may be used as a means of proof in thinning their numbers. Bring me a feather from any headdresses you acquire; for every set of five you bring me, you will earn recognition amongst the Timbermaw.' WHERE `entry`='8466';
UPDATE `quest_template` SET `objectives`='Some of the Deadwood furbolgs wear a distinctive headdress that may be used as a means of proof in thinning their numbers. Bring me a feather from any headdresses you acquire; for every set of five you bring me, you will earn recognition amongst the Timbermaw.' WHERE `entry`='8467';

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


