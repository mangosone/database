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
    SET @cOldContent = '009';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '15';
    SET @cNewContent = '010';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'DB_Cleanup_pt6';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'DB_Cleanup_pt6';

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

UPDATE `quest_template` SET `objectives`='The Winterfall are known to carry spirit beads to ward against foul spirits. These beads have clearly failed in their purpose, as the Winterfall themselves are the agents of corruption. Bring to me these spirit beads from fallen Winterfall furbolgs; for every set of five you bring me, you will earn recognition amongst the Timbermaw.' WHERE `entry`='8469';
UPDATE `quest_template` SET `objectives`='Narain Soothfancy wants you to find his ex-best friend forever (BFF),$B$BStewvul, and take back the scrying goggles that Stewvul stole from him.' WHERE `entry`='8577';
UPDATE `quest_template` SET `offerrewardtext`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the protector will offer superior protection against the forces of evil.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8747';
UPDATE `quest_template` SET `RequestItemsText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the defender will offer superior protection against the forces of evil.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8747';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the protector!' WHERE `entry`='8748';
UPDATE `quest_template` SET `RequestItemsText`='Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE `entry`='8748';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the protector!' WHERE `entry`='8749';
UPDATE `quest_template` SET `RequestItemsText`='You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$B$BYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE `entry`='8749';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the protector!' WHERE `entry`='8750';
UPDATE `quest_template` SET `RequestItemsText`='Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$B$BHand me your signet ring so that I may strengthen its enchantment.' WHERE `entry`='8750';
UPDATE `quest_template` SET `offerrewardtext`='Rise, Protector of Kalimdor! Rise and be recognized!' WHERE `entry`='8751';
UPDATE `quest_template` SET `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$B$BHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`='8751';
UPDATE `quest_template` SET `offerrewardtext`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the conqueror will greatly enhance your physical attacks.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8752';
UPDATE `quest_template` SET `RequestItemsText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the conqueror will greatly enhance your physical attacks.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8752';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the conqueror!' WHERE `entry`='8753';
UPDATE `quest_template` SET `RequestItemsText`='Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE `entry`='8753';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the conqueror!' WHERE `entry`='8754';
UPDATE `quest_template` SET `RequestItemsText`='You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$B$BYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE `entry`='8754';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the conqueror!' WHERE `entry`='8755';
UPDATE `quest_template` SET `RequestItemsText`='Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$B$BHand me your signet ring so that I may strengthen its enchantment.' WHERE `entry`='8755';
UPDATE `quest_template` SET `offerrewardtext`='Rise, Qiraji Conqueror! Rise and be recognized!' WHERE `entry`='8756';
UPDATE `quest_template` SET `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$B$BHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`='8756';
UPDATE `quest_template` SET `offerrewardtext`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the invoker will greatly enhance your magical and natural abilities.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8757';
UPDATE `quest_template` SET `RequestItemsText`='Impressive, little one. You have gone through much trouble to gain the favor of the Bronze Flight. Your dedication is noted.$B$BThe signet ring of the invoker will greatly enhance your magical and natural abilities.$B$BBe warned, once you have chosen your path, you will have no recourse should you change your mind.' WHERE `entry`='8757';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the invoker!' WHERE `entry`='8758';
UPDATE `quest_template` SET `RequestItemsText`='Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE `entry`='8758';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the invoker!' WHERE `entry`='8759';
UPDATE `quest_template` SET `RequestItemsText`='You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$B$BYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE `entry`='8759';
UPDATE `quest_template` SET `offerrewardtext`='Your rise amongst the rank of the Brood is most impressive, $N. May you never stray from the path of the invoker!' WHERE `entry`='8760';
UPDATE `quest_template` SET `RequestItemsText`='Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$B$BHand me your signet ring so that I may strengthen its enchantment.' WHERE `entry`='8760';
UPDATE `quest_template` SET `offerrewardtext`='Rise, Grand Invoker! Rise and be recognized!' WHERE `entry`='8761';
UPDATE `quest_template` SET `RequestItemsText`='Never have I seen such tenacity! The Bronze Flight grants you one final enchantment. The Timeless One himself has requested it so!$B$BHand me your signet ring so that I may make the necessary adjustments.' WHERE `entry`='8761';
UPDATE `quest_template` SET `offerrewardtext`='The machine lets off a little rumble and a small amount of steam as it starts working. It is not too long thereafter until it stops, heralded by another small jet of steam erupting from it. A door hatch opens, revealing a batch of preserved holly!' WHERE `entry`='8763';
UPDATE `quest_template` SET `RequestItemsText`='The "Holly Preserver" machine looks like some sort of still at first, but a careful examination of it reveals some goblin-esque changes to it. Still, your skill at cooking seems to allow you to understand how the machine works. $B$BThere is already fresh holly in the machine - you simply need to provide some deeprock salt and five gold coins to get the machine working.' WHERE `entry`='8763';
UPDATE `quest_template` SET `offerrewardtext`='Why, yes... these will be of tremendous aid!  These materials are awfully hard to come by in the desert, $N. Thank you.' WHERE `entry`='8779';
UPDATE `quest_template` SET `offerrewardtext`='Thanks, I\'ll hand these out to the lads.' WHERE `entry`='8780';
UPDATE `quest_template` SET `offerrewardtext`='Ah, we were in need of these. Your work is appreciated, $N.' WHERE `entry`='8782';
UPDATE `quest_template` SET `offerrewardtext`='Ah, yes. These materials are of excellent quality. Thank you, $N.' WHERE `entry`='8783';
UPDATE `quest_template` SET `offerrewardtext`='This present looks like it has been shaken a few times. The tag on it reads:$B$BTo a very special $R $C.' WHERE `entry`='8788';
UPDATE `quest_template` SET `offerrewardtext`='The machine lets off a little rumble and a small amount of steam as it starts working. It is not too long thereafter until it stops, heralded by another small jet of steam erupting from it. A door hatch opens, revealing a batch of preserved holly!' WHERE `entry`='8799';
UPDATE `quest_template` SET `RequestItemsText`='The "Holly Preserver" machine looks like some sort of still at first, but a careful examination of it reveals some goblin-esque changes to it. Still, your skill at cooking seems to allow you to understand how the machine works. $B$BThere is already fresh holly in the machine - you simply need to provide some deeprock salt and five gold coins to get the machine working.' WHERE `entry`='8799';
UPDATE `quest_template` SET `offerrewardtext`='Ah, we were in need of these. Your work is appreciated, $N.' WHERE `entry`='8808';
UPDATE `quest_template` SET `offerrewardtext`='Ah, yes. These materials are of excellent quality. Thank you, $N.' WHERE `entry`='8809';
UPDATE `quest_template` SET `offerrewardtext`='Just in time. These supplies will save lives, $N. Your work is appreciated. Here\'s your next assignment.' WHERE `entry`='8810';
UPDATE `quest_template` SET `offerrewardtext`='Yes, I believe these shall suffice. I shall craft these into the colors worn by the Twilight Hammer\'s emissaries. I pray to Elune that my skills will be able to fool our enemies once more.$B$BBut do not be concerned with that, you\'ve done your part and for that you will be appropriately rewarded. You are a loyal and worthy ally, $N.' WHERE `entry`='8829';
UPDATE `quest_template` SET `offerrewardtext`='Very well done, $N. Defeating Omen sent his spirit back to the waters of Elune\'ara. Although the beast himself is blessed by Elune and so cannot die, his anger will subside for another year.$B$BYour victory is a celebration, $N--a celebration of the might of Omen, of you and your allies, and of the peace you have given this tragic hero of our past.' WHERE `entry`='8868';
UPDATE `quest_template` SET `offerrewardtext`='May you bash in many a brain, $N!' WHERE `entry`='8869';
UPDATE `quest_template` SET `RequestItemsText`='His apron! Where is it?' WHERE `entry`='8869';
UPDATE `quest_template` SET `offerrewardtext`='Excellent work, $N. With the shadows destroyed, our hope of victory against the Lich King survives.' WHERE `entry`='9085';
UPDATE `quest_template` SET `offerrewardtext`='In all my days of living I would have never expected to see this...$B$B<Father Montoy appears to be salivating.>$B$BOh yes, you will be rewarded dear $G. You will be greatly rewarded. Give it here. Now!' WHERE `entry`='9120';
UPDATE `quest_template` SET `offerrewardtext`='This will do, for now. If you get more, you know where to find me.' WHERE `entry`='9131';
UPDATE `quest_template` SET `offerrewardtext`='Hmm. From what you\'ve told me, the voices within the circles... they must be used for communication of some kind. I shudder to think what unnatural minds are contacted through such magic. Regardless, you seem to have emerged whole and sane. The Argent Dawn appreciates your service.' WHERE `entry`='9265';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9295';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9299';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9300';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9301';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9302';
UPDATE `quest_template` SET `offerrewardtext`='How tragic. These words, clearly meant for someone the soldier loved, never made it to their destination. The events detailed happened years ago; I\'m not sure if the intended recipient still lives.$B$BThere is hope yet, however. With the names and information he gives, I might be able to locate the family! It will take some research, but the librarian in Stormwind owes me a favor...$B$BThank you for bringing this to me. With your help, we may be able to grant someone peace of mind at last.' WHERE `entry`='9304';
UPDATE `quest_template` SET `offerrewardtext`='You say this was taken from a wight attacking the city?$B$BWe have received word of the necropolis base camps that are being summoned by the Scourge. I suspect they were trying to create one in the Undercity. We will have to be vigilant in the future.' WHERE `entry`='9310';
UPDATE `quest_template` SET `offerrewardtext`='Excellent news, $C! If our tactical deployments continue to be this successful, the Horde will be in full retreat before long.' WHERE `entry`='11335';
UPDATE `quest_template` SET `RequestItemsText`='Tell me, $N. What news do you bring from the front?' WHERE `entry`='11335';
UPDATE `quest_template` SET `offerrewardtext`='Just what I wanted to hear!  A victory in Alterac Valley - even a temporary one - is crucial to our overall strategy against the Horde.' WHERE `entry`='11336';
UPDATE `quest_template` SET `RequestItemsText`='Tell me, $N. What news do you bring from the front?' WHERE `entry`='11336';
UPDATE `quest_template` SET `offerrewardtext`='We\'ve come one step closer to achieving total victory over the Horde. We cannot allow the enemy to obtain a foothold in this world or any other.' WHERE `entry`='11337';
UPDATE `quest_template` SET `RequestItemsText`='Tell me, $N. What news do you bring from the front?' WHERE `entry`='11337';
UPDATE `quest_template` SET `offerrewardtext`='Excellent work, $N. The integrity of our borders must be preserved at all costs!' WHERE `entry`='11338';
UPDATE `quest_template` SET `RequestItemsText`='Tell me, $N. What news do you bring from the front?' WHERE `entry`='11338';
UPDATE `quest_template` SET `offerrewardtext`='You\'ve brought great honor to the Horde, $N. Your victory today will ensure a thousand victories tomorrow!' WHERE `entry`='11339';
UPDATE `quest_template` SET `offerrewardtext`='There is no greater honor than driving invaders from Horde territories. We salute your great courage in aiding our forces today!' WHERE `entry`='11340';
UPDATE `quest_template` SET `offerrewardtext`='You bring honor to us all, $N. We must show the enemy that we will fight them wherever we find them.' WHERE `entry`='11341';
UPDATE `quest_template` SET `RequestItemsText`='You\'re back already. Do you bring news of victory?' WHERE `entry`='11341';
UPDATE `quest_template` SET `offerrewardtext`='The Horde is in your debt, $N. You\'ve made your people proud with your courage in defending our lands.' WHERE `entry`='11342';
UPDATE `quest_template` SET `RequestItemsText`='You\'re back already. Do you bring news of victory?' WHERE `entry`='11342';
UPDATE `quest_template` SET `offerrewardtext`='The spirits are one step closer to resting in peace. It is good to incur their favor, especially when waging war so close to their place of rest.' WHERE `entry`='11505';
UPDATE `quest_template` SET `offerrewardtext`='The spirits are closer to finding peace and have bestowed their favor onto us.$B$BA humiliating blow to our enemy that their own ancestors would side against them, even if only temporarily.' WHERE `entry`='11506';
UPDATE `quest_template` SET `ObjectiveText1`='Emissary of Hate impaled' WHERE `entry`='11538';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Alliance\'s Westfall bonfire!' WHERE `entry`='11581';
UPDATE `quest_template` SET `offerrewardtext`='Torch catching is a lot of fun, don\'t you think?  But have care!  You don\'t want to get singed!' WHERE `entry`='11657';
UPDATE `quest_template` SET `offerrewardtext`='The magma totem bursts into three separate flames as it is brought near the ice stone. The stone shimmers, then is gone...' WHERE `entry`='11691';
UPDATE `quest_template` SET `offerrewardtext`='The cold of Ahune spreads through these caverns, $N; a seed of the frigid death that awaits us if he gains his full strength. I thank the Earthmother for sending you.' WHERE `entry`='11696';
UPDATE `quest_template` SET `offerrewardtext`='Quick! There\'s no time to waste!' WHERE `entry`='11731';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Alliance\'s Arathi Highlands bonfire!' WHERE `entry`='11732';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Alliance\'s Elwynn Forest bonfire!' WHERE `entry`='11745';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Alliance\'s Loch Modan bonfire!' WHERE `entry`='11749';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Alliance\'s Hinterlands bonfire!' WHERE `entry`='11755';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Horde\'s Badlands bonfire!' WHERE `entry`='11766';
UPDATE `quest_template` SET `offerrewardtext`='Desecrate the Horde\'s Tirisfal Glades bonfire!' WHERE `entry`='11786';
UPDATE `quest_template` SET `offerrewardtext`='Honor the Blade\'s Edge Mountains flame.' WHERE `entry`='11807';
UPDATE `quest_template` SET `RequestItemsText`='Honor the Blade\'s Edge Mountains flame!' WHERE `entry`='11807';
UPDATE `quest_template` SET `offerrewardtext`='Honor the Nagrand flame.' WHERE `entry`='11821';
UPDATE `quest_template` SET `RequestItemsText`='Honor the Nagrand flame!' WHERE `entry`='11821';
UPDATE `quest_template` SET `offerrewardtext`='Honor the Tanaris flame.' WHERE `entry`='11838';
UPDATE `quest_template` SET `RequestItemsText`='Honor the Tanaris flame!' WHERE `entry`='11838';
UPDATE `quest_template` SET `offerrewardtext`='Honor the Blade\'s Edge Mountains flame.' WHERE `entry`='11843';
UPDATE `quest_template` SET `RequestItemsText`='Honor the Blade\'s Edge Mountains flame!' WHERE `entry`='11843';
UPDATE `quest_template` SET `offerrewardtext`='Well met. You\'ve come to learn some new ways to handle fire?' WHERE `entry`='11882';
UPDATE `quest_template` SET `offerrewardtext`='This is worrisome, friend. It hints at a much larger plot beyond simple agitation of the local fire and water elements, and something here bears investigation...' WHERE `entry`='11886';
UPDATE `quest_template` SET `RequestItemsText`='What have you uncovered?' WHERE `entry`='11886';
UPDATE `quest_template` SET `offerrewardtext`='They seek to summon a frost lord into our world? No! They cannot tip the balance!' WHERE `entry`='11891';
UPDATE `quest_template` SET `RequestItemsText`='Have you learned their secrets?' WHERE `entry`='11891';
UPDATE `quest_template` SET `offerrewardtext`='You have done well. It may seem a small act, but even this can aid the fight as a whole. Take this with my blessing, and return later, as I may have more for you to do.' WHERE `entry`='11917';
UPDATE `quest_template` SET `RequestItemsText`='You have returned victorious?' WHERE `entry`='11917';
UPDATE `quest_template` SET `offerrewardtext`='Well done!  You\'ll be a fire juggler faster than the fuse on a ground flower!  Now gird yourself!  The next test is when things really heat up...' WHERE `entry`='11921';
UPDATE `quest_template` SET `RequestItemsText`='Quick! There\'s no time to waste!' WHERE `entry`='11921';
UPDATE `quest_template` SET `RequestItemsText`='Quick! There\'s no time to waste!' WHERE `entry`='11922';
UPDATE `quest_template` SET `offerrewardtext`='Torch catching is a lot of fun, don\'t you think?  But have care!  You don\'t want to get singed!' WHERE `entry`='11923';
UPDATE `quest_template` SET `offerrewardtext`='Torch catching is a lot of fun, don\'t you think?  But have care!  You don\'t want to get singed!' WHERE `entry`='11924';
UPDATE `quest_template` SET `offerrewardtext`='Torch catching is a lot of fun, don\'t you think?  But have care!  You don\'t want to get singed!' WHERE `entry`='11925';
UPDATE `quest_template` SET `offerrewardtext`='Well done!  You\'ll be a fire juggler faster than the fuse on a ground flower!  Now gird yourself!  The next test is when things really heat up...' WHERE `entry`='11926';
UPDATE `quest_template` SET `RequestItemsText`='Quick! There\'s no time to waste!' WHERE `entry`='11926';
UPDATE `quest_template` SET `offerrewardtext`='This fire seems new... Yet, you say it came from the Exodar? Fascinating! To make your way into that ship... Of course, I\'ll pay you for this. If you find anything else like this, be sure to speak with me again.' WHERE `entry`='11933';
UPDATE `quest_template` SET `RequestItemsText`='You\'re practically glowing, $R. What do you have there?' WHERE `entry`='11933';
UPDATE `quest_template` SET `offerrewardtext`='What a glorious fire! You received this from Silvermoon, you say? Unbelievable! With the flames of all four cities, who knows what we could accomplish?' WHERE `entry`='11935';
UPDATE `quest_template` SET `RequestItemsText`='You\'re practically glowing, $R. What do you have there?' WHERE `entry`='11935';
UPDATE `quest_template` SET `offerrewardtext`='Thank the spirits you\'re here! We must summon Ahune quickly before it\'s too late...' WHERE `entry`='11955';
UPDATE `quest_template` SET `offerrewardtext`='Ah, and what is this?  Such a delightful aroma!  I am sure it will burn with a flame pure and bright!$B$BTake this blossom, $N. Take it, and leave me be... I must attend to this precious fuel...' WHERE `entry`='11964';
UPDATE `quest_template` SET `RequestItemsText`='A fiery salutations to you, honored $C. Welcome to this hallowed ground of the Midsummer Fire Festival.' WHERE `entry`='11964';
UPDATE `quest_template` SET `offerrewardtext`='I\'ll be happy to tell you what I know.' WHERE `entry`='11970';
UPDATE `quest_template` SET `offerrewardtext`='Yes, these shards hold the final essence of the Frost Lord in this land. We will dispose of them and banish Ahune to the nether regions of cold.$B$BThank you, $N. Your name will echo in the chants of the Earthen Ring for days without end. Please honor us by accepting this vestige, a symbol of your kinship with warmth and light.' WHERE `entry`='11972';
UPDATE `quest_template` SET `RequestItemsText`='Greetings, $N. You look worried, but you shoud rejoice. The Frost Lord is defeated!' WHERE `entry`='11972';
UPDATE `quest_template` SET `offerrewardtext`='Did you see that?  They were cheering for me!!$B$BNow I know how they feel when they are up on stage singing!  I felt the power and the energy!$B$BJust like they say in their song!$B$BMy mind is made up, I am going to be a rock star when I grow up!' WHERE `entry`='11975';
UPDATE `quest_template` SET `offerrewardtext`='This is grave news indeed. We must do everything in our power to stop this war from coming to pass.' WHERE `entry`='12012';
UPDATE `quest_template` SET `RequestItemsText`='What troubles you, my child?' WHERE `entry`='12012';
UPDATE `quest_template` SET `RequestItemsText`='What\'s happening hot stuff?  Got something for me?' WHERE `entry`='12193';
UPDATE `quest_template` SET `RequestItemsText`='What\'s happening hot stuff?  Got something for me?' WHERE `entry`='12194';
UPDATE `quest_template` SET `offerrewardtext`='Hmph, you\'re my sponsor?  I\'m Salandria!  I\'ve been here ever since I was a little baby. My parents were taken by the war, so I have to live here at the orphanage.$B$BIt\'s not that bad, but I always wanted to go places -- I haven\'t ever stepped foot outside of the city. I\'ve already made a list of all the cool places that I want to go, and the awesome things that I want to do.$B$BI\'m ready to go when you are!' WHERE `entry`='10942';
UPDATE `quest_template` SET `offerrewardtext`='You must be the adventurer who\'s going to be my big brother for Children\'s Week!  I\'m Dornaa, pleased to meet you.$B$B<She looks sad for a moment.>$B$BMother and father were killed in the war, and I\'ve lived in the orphanage all my life. It\'s nice, actually, but I\'ve always wanted to go places and see things.$B$BI\'ve already made a list of places we could visit, if that\'s okay?  I just know that we\'re going to have a great time together!$B$BI\'m ready to go when you are!' WHERE `entry`='10943';
UPDATE `quest_template` SET `offerrewardtext`='Thank you for this chance to once again see Salandria. I have missed her so much this past year, but we are still good friends.$B$BWe agreed that when we grow up, we\'re both going to be brave adventurers, just like you!' WHERE `entry`='10945';
UPDATE `quest_template` SET `offerrewardtext`='Oh, it\'s just wonderful!  I mean, it looks pretty old... and yeah, someone sure did blow it up. But just look at it!$B$BOoh, and did you look up at the sky?$B$BNeato!' WHERE `entry`='10950';
UPDATE `quest_template` SET `offerrewardtext`='The stories don\'t even come close to how cool this place is. It\'s amazing!$B$BIs it true that a powerful wizard named Medivh created it?$B$BI wonder what\'s on the other side?  You\'ve been there, right?  Hmm, we should definitely go someplace on the other side of the Dark Portal!' WHERE `entry`='10951';
UPDATE `quest_template` SET `offerrewardtext`='The orphan matron\'s stories don\'t even come close to how cool this place is. It\'s amazing!  She said that it was created by a powerful wizard named Medivh.$B$BWhat\'s on the other side of it?  You\'ve been there, right?  We should most definitely go someplace on the other side of the Dark Portal!' WHERE `entry`='10952';
UPDATE `quest_template` SET `offerrewardtext`='You bring a child here?  Foolhardy, but I promise that she will come to no harm, at least as long as she doesn\'t get too close to Incineratus.$B$BHmm, unfortunate that she\'s a blood elf. Were she capable of a deep connection to the world, we could teach her some things so that she might aid us to heal its wounds. But, perhaps her exposure to the elements here will give her some insight into their workings.$B$BGo in peace and see to it that you take good care of her.' WHERE `entry`='10953';
UPDATE `quest_template` SET `offerrewardtext`='Oh, I\'ve missed Dornaa so much. Thank you for bringing her to visit. It gets lonely here with only the ethereal around. And they\'re so serious all the time with this Oshu\'gun business.$B$BBut I get to go back and visit the orphanage after I pass my gemcutting exams. I almost passed them last week, but I\'m sure that I\'ll do better on the test tomorrow!' WHERE `entry`='10954';
UPDATE `quest_template` SET `offerrewardtext`='<You feel, more than hear, the musical voice of O\'ros chiming in your mind.>$B$BThank you for bringing this child to me, $N. She is very special indeed, and will grow up one day to be an important figure amongst the draenei. This is in no small part due to the kindness that you have shown her, and the impression that you have made.' WHERE `entry`='10956';
UPDATE `quest_template` SET `offerrewardtext`='There are so few that are gifted enough to be able to channel such power from M\'uru. To see this in a child is truly amazing!$B$BIt was wise of you to bring her before me.$B$BYou say that she\'s an orphan in Shattrath City?  I shall see to it that a petition is submitted to the orphan matron there so that she might be remanded to our custody for proper training. She belongs with us, here.$B$BSee to it that you keep her safe until then.' WHERE `entry`='10960';


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


