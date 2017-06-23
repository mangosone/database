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
    SET @cOldContent = '044';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '07';
    SET @cNewContent = '045';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Populate_missing_item_desc';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Populate_missing_item_descriptions';

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

-- Mangos1 - Item Description Updates from updated Mangos0
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=1132;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=2411;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=2414;
UPDATE item_template SET description='The initials are faded and unreadable.' WHERE entry=3985;
UPDATE item_template SET description='The words have washed away...' WHERE entry=4098;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=4401;
UPDATE item_template SET description='In remarkably good condition all things considered.' WHERE entry=5424;
UPDATE item_template SET description='The maple-like leaves glisten with the promise of new life and the potential for deadly misuse.' WHERE entry=5437;
UPDATE item_template SET description='A strange code is written upon the inside of the ring in the language of the night elves.' WHERE entry=5445;
UPDATE item_template SET description='There is something otherworldly about the wood.' WHERE entry=5461;
UPDATE item_template SET description='Minor imperfections on the bottom of the gem reinforce the idea that it used to be fitted to something else.' WHERE entry=5463;
UPDATE item_template SET description='Intricate, yet dormant, runes adorn this section of the rod.' WHERE entry=5464;
UPDATE item_template SET description='Vile like their former owner.' WHERE entry=5481;
UPDATE item_template SET description='Something doesn\'t seem quite right about the soot-covered stone.' WHERE entry=5493;
UPDATE item_template SET description='A brilliant sheen glistens upon the stolen moonstone with a hint of something powerful within.' WHERE entry=5508;
UPDATE item_template SET description='The final piece of Dartol\'s Rod.' WHERE entry=5519;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5655;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5656;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5665;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5668;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5864;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5872;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5873;
UPDATE item_template SET description='Like driven snow, but much warmer.' WHERE entry=6787;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8485;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8486;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8487;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8488;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8489;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8490;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8491;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8492;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8494;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8495;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8496;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8497;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8498;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8499;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8500;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=8501;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8563;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=8586;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8588;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8591;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8592;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8595;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8628;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8629;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8631;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8632;
UPDATE item_template SET description='It doesn\'t appear to work anymore.  Might as well sell it for scrap.' WHERE entry=9173;
UPDATE item_template SET description='An ancient, brittle horn.' WHERE entry=10000;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10360;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10361;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10392;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10393;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10394;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10398;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=10822;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11023;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11026;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11027;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11110;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11474;
UPDATE item_template SET description='Use to wake up Ringo.' WHERE entry=11804;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11825;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=11826;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=12264;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=12303;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=12330;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=12351;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=12353;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=12354;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=12529;
UPDATE item_template SET description='Looks great. Less filling.' WHERE entry=12947;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13086;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13317;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=13321;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=13322;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13327;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13328;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13329;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=13331;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=13332;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=13333;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=13334;
UPDATE item_template SET description='Teaches you how to summon Baron Rivendare\'s steed.  This is a very fast mount.' WHERE entry=13335;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=13582;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=13583;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=13584;
UPDATE item_template SET description='Not to be confused with gloom weed, womb weed, or broom weed.  Or doom seed.' WHERE entry=13702;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=15277;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=15290;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=15292;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=15293;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=15996;
UPDATE item_template SET description='The aura permeating the charm\'s wood makes your skin crawl.' WHERE entry=16602;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18241;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18242;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18243;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18244;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18245;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18246;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18247;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18248;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18766;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18767;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18772;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18773;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18774;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18776;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18777;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18778;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18785;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18786;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18787;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18788;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18789;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18790;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18791;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18793;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18794;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18795;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18796;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18797;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18798;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=18902;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=19029;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=19030;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=19450;
UPDATE item_template SET description='Teaches you how to summon Bloodlord Mandokir\'s raptor.  This is a very fast mount.' WHERE entry=19872;
UPDATE item_template SET description='Teaches you how to summon High Preist Thekal\'s tiger.  This is a very fast mount.' WHERE entry=19902;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=20371;
UPDATE item_template SET description='Only ONE May Rise... (and consequently, only ONE may loot this head)' WHERE entry=20383;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=20769;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=21176;
UPDATE item_template SET description='Teaches you how to summon this mount.  This mount may only be summoned in the Temple of Ahn\'Qiraj.' WHERE entry=21218;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=21277;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=21301;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=21305;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=21308;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=21309;
UPDATE item_template SET description='Teaches you how to summon this mount.  This mount may only be summoned in the Temple of Ahn\'Qiraj.' WHERE entry=21321;
UPDATE item_template SET description='Teaches you how to summon this mount.  This mount may only be summoned in the Temple of Ahn\'Qiraj.' WHERE entry=21323;
UPDATE item_template SET description='Teaches you how to summon this mount.  This mount may only be summoned in the Temple of Ahn\'Qiraj.' WHERE entry=21324;
UPDATE item_template SET description='Teaches you how to summon Peddlefeet.' WHERE entry=22235;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=22345;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=22395;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=22396;
UPDATE item_template SET description='Someone has been holding onto this for a VERY long time.' WHERE entry=22520;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=23002;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=23005;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=23007;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=23015;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=23083;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=23199;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=23200;

-- Mangos1 - Item Description Updates from updated Mangos2
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=22114;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=23713;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=23720;
UPDATE item_template SET description='Though the urn now appears to be empty, it might still be worth something to a vendor.' WHERE entry=24140;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=24413;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be used in Outland or Northrend.' WHERE entry=25470;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be used in Outland or Northrend.' WHERE entry=25471;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.' WHERE entry=25472;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=25473;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=25527;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=25528;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=25529;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=25535;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=25645;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=27445;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=27544;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=27815;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=27947;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=27984;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=28066;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=28248;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=28357;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=28481;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=28523;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=28915;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=28927;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=28936;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29102;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29103;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29104;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29105;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29220;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29221;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29222;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29223;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29224;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29227;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29228;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29229;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29230;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29231;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29363;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29364;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=29389;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29465;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29466;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29467;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29468;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29469;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29470;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29471;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29472;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29743;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=29744;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29745;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29746;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=29747;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29901;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29902;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29903;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29904;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29953;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29956;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29957;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=29958;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=30023;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=30360;
UPDATE item_template SET description='Teaches you how to summon Attumen the Huntsman\'s steed.  This is a very fast mount.' WHERE entry=30480;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is an extremely mount.' WHERE entry=30609;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=31031;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=31760;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31829;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31830;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31831;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31832;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31833;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31834;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31835;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=31836;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=32233;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32314;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32316;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32317;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32318;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32319;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=32330;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=32588;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=32616;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=32617;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=32622;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=32768;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32857;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32858;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32859;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32860;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32861;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=32862;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33078;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=33154;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=33224;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=33225;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33505;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33506;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33507;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=33809;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=33816;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=33818;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33843;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33939;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33940;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33941;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33951;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33952;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=33953;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=33976;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=33977;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=33993;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=33999;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=34092;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=34129;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34425;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34478;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34492;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34493;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34535;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=34955;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=35104;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=35105;
UPDATE item_template SET description='Counts as an Air, Earth, Fire, and Water totem.' WHERE entry=35106;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be used in Outland or Northrend.' WHERE entry=35225;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is a very fast mount.' WHERE entry=35226;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=35349;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=35350;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=35504;
UPDATE item_template SET description='Teaches you how to summon the mount of Kael\'thas Sunstrider.  This is a very fast mount.' WHERE entry=35513;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=35906;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=37297;
UPDATE item_template SET description='Teaches you how to summon this mount.  Can only be summoned in Outland or Northrend.  This is an extremely fast mount.' WHERE entry=37676;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=37719;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=37828;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=38050;
UPDATE item_template SET description='Teaches you how to summon this mount.  This is a very fast mount.' WHERE entry=38576;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=38628;
UPDATE item_template SET description='Teaches you how to summon this companion.' WHERE entry=39656;

-- Mangos1 - Item Description Updates from Mangos3
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5663;
UPDATE item_template SET description='Open for a prize!' WHERE entry=5858;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5874;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=5875;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8583;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8589;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8590;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8630;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=8633;
UPDATE item_template SET description='Teaches you how to summon this mount.' WHERE entry=14062;
UPDATE item_template SET description='Return to the iCoke redemption vendor to receive a virtual prize' WHERE entry=19642;
UPDATE item_template SET description='They look heavily worn, yet still remain razor sharp.' WHERE entry=23687;
UPDATE item_template SET description='Bears the mark of the Shattered Hand.' WHERE entry=23881;
UPDATE item_template SET description='It smells of death and fear.' WHERE entry=23886;
UPDATE item_template SET description='His eyes are full of hatred.' WHERE entry=23901;
UPDATE item_template SET description='Softer than any material found on Azeroth.' WHERE entry=28490;
UPDATE item_template SET description='Also serves as a mining pick.' WHERE entry=30855;
UPDATE item_template SET description='Wearing this would be a bad idea, as it would severely hinder your vision.' WHERE entry=31529;
UPDATE item_template SET description='Cut cleanly off at the shoulders.' WHERE entry=31706;

    

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

