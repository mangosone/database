-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.4)
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
    SET @cOldStructure = '11'; 
    SET @cOldContent = '052';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '11';
    SET @cNewContent = '053';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'the gossip update';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'the gossip update';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

 SET @gossipmenu := (SELECT MAX(entry) FROM `gossip_menu`);
SET @condition := (SELECT MAX(condition_entry) FROM `conditions`);

UPDATE `gameobject_template` SET `type` = 2, `data0` = 93, `data2` = 0, `data3` = 1045 WHERE `entry` = 142345;

UPDATE `creature_template` SET `GossipMenuId` = 6036 WHERE `Entry` = 14729;
UPDATE `creature_template` SET `GossipMenuId` = 6035 WHERE `Entry` = 14726;
UPDATE `creature_template` SET `GossipMenuId` = 5741 WHERE `Entry` = 14374;
UPDATE `creature_template` SET `GossipMenuId` = 5108 WHERE `Entry` = 4613;
UPDATE `creature_template` SET `GossipMenuId` = 4578 WHERE `Entry` = 4578;
UPDATE `creature_template` SET `GossipMenuId` = 4646 WHERE `Entry` = 8142;
UPDATE `creature_template` SET `GossipMenuId` = 4644 WHERE `Entry` = 3060;
UPDATE `creature_template` SET `GossipMenuId` = 3923 WHERE `Entry` = 3602;
UPDATE `creature_template` SET `GossipMenuId` = 4692 WHERE `Entry` = 3595;
UPDATE `creature_template` SET `GossipMenuId` = 4574 WHERE `Entry` = 4090;
UPDATE `creature_template` SET `GossipMenuId` = 4573 WHERE `Entry` = 4091;
UPDATE `creature_template` SET `GossipMenuId` = 4572 WHERE `Entry` = 4092;
UPDATE `creature_template` SET `GossipMenuId` = 85 WHERE `Entry` = 2122;
UPDATE `creature_template` SET `GossipMenuId` = 1017 WHERE `Entry` = 2998;
UPDATE `creature_template` SET `GossipMenuId` = 4546 WHERE `Entry` = 4594;
UPDATE `creature_template` SET `GossipMenuId` = 4547 WHERE `Entry` = 4595;
UPDATE `creature_template` SET `GossipMenuId` = 4548 WHERE `Entry` = 4593;
UPDATE `creature_template` SET `GossipMenuId` = 4548 WHERE `Entry` = 2119;
UPDATE `creature_template` SET `GossipMenuId` = 1914 WHERE `Entry` = 9299;
UPDATE `creature_template` SET `GossipMenuId` = 1922 WHERE `Entry` = 7879;
UPDATE `creature_template` SET `GossipMenuId` = 2189 WHERE `Entry` = 8659;
UPDATE `creature_template` SET `GossipMenuId` = 2501 WHERE `Entry` = 10136;
UPDATE `creature_template` SET `GossipMenuId` = 2748 WHERE `Entry` = 10278;
UPDATE `creature_template` SET `GossipMenuId` = 2941 WHERE `Entry` = 10781;
UPDATE `creature_template` SET `GossipMenuId` = 3662 WHERE `Entry` = 11835;
UPDATE `creature_template` SET `GossipMenuId` = 3645 WHERE `Entry` = 2123;
UPDATE `creature_template` SET `GossipMenuId` = 3645 WHERE `Entry` = 2129;
UPDATE `creature_template` SET `GossipMenuId` = 4533 WHERE `Entry` = 3044;
UPDATE `creature_template` SET `GossipMenuId` = 4531 WHERE `Entry` = 3045;
UPDATE `creature_template` SET `GossipMenuId` = 4532 WHERE `Entry` = 3046; 
UPDATE `creature_template` SET `GossipMenuId` = 4544 WHERE `Entry` = 4606;
UPDATE `creature_template` SET `GossipMenuId` = 4545 WHERE `Entry` = 4607;
UPDATE `creature_template` SET `GossipMenuId` = 4543 WHERE `Entry` = 4608;
UPDATE `creature_template` SET `GossipMenuId` = 4016 WHERE `Entry` = 7954;
UPDATE `creature_template` SET `GossipMenuId` = 4121 WHERE `Entry` = 11044;
UPDATE `creature_template` SET `GossipMenuId` = 4132 WHERE `Entry` = 4611;
UPDATE `creature_template` SET `GossipMenuId` = 4144 WHERE `Entry` = 4586;
UPDATE `creature_template` SET `GossipMenuId` = 4147 WHERE `Entry` = 11029;
UPDATE `creature_template` SET `GossipMenuId` = 4149 WHERE `Entry` = 11031;
UPDATE `creature_template` SET `GossipMenuId` = 4150 WHERE `Entry` = 5174;
UPDATE `creature_template` SET `GossipMenuId` = 4157 WHERE `Entry` = 11067;
UPDATE `creature_template` SET `GossipMenuId` = 4160 WHERE `Entry` = 5157;
UPDATE `creature_template` SET `GossipMenuId` = 4166 WHERE `Entry` = 4616;
UPDATE `creature_template` SET `GossipMenuId` = 4188 WHERE `Entry` = 223;
UPDATE `creature_template` SET `GossipMenuId` = 4210 WHERE `Entry` = 4588;
UPDATE `creature_template` SET `GossipMenuId` = 4008 WHERE `Entry` = 4146;
UPDATE `creature_template` SET `GossipMenuId` = 4264 WHERE `Entry` = 1703;
UPDATE `creature_template` SET `GossipMenuId` = 4265 WHERE `Entry` = 2855;
UPDATE `creature_template` SET `GossipMenuId` = 4268 WHERE `Entry` = 11048;
UPDATE `creature_template` SET `GossipMenuId` = 4307 WHERE `Entry` = 2858;
UPDATE `creature_template` SET `GossipMenuId` = 4282 WHERE `Entry` = 4551;
UPDATE `creature_template` SET `GossipMenuId` = 4308 WHERE `Entry` = 12656;
UPDATE `creature_template` SET `GossipMenuId` = 4325 WHERE `Entry` = 8359;
UPDATE `creature_template` SET `GossipMenuId` = 4347 WHERE `Entry` = 3363;
UPDATE `creature_template` SET `GossipMenuId` = 4352 WHERE `Entry` = 11049;
UPDATE `creature_template` SET `GossipMenuId` = 4354 WHERE `Entry` = 4576;
UPDATE `creature_template` SET `GossipMenuId` = 2384 WHERE `Entry` = 3326;
UPDATE `creature_template` SET `TrainerClass` = 9 WHERE `Entry` = 23534;
UPDATE `creature_template` SET `GossipMenuId` = 4665 WHERE `Entry` = 375;
UPDATE `creature_template` SET `GossipMenuId` = 4466 WHERE `Entry` = 376;
UPDATE `creature_template` SET `GossipMenuId` = 4467 WHERE `Entry` = 5489;
UPDATE `creature_template` SET `GossipMenuId` = 523 WHERE `Entry` = 985;
UPDATE `creature_template` SET `GossipMenuId` = 523 WHERE `Entry` = 3153;
UPDATE `creature_template` SET `GossipMenuId` = 4509 WHERE `Entry` = 3353;
UPDATE `creature_template` SET `GossipMenuId` = 4511 WHERE `Entry` = 3354;
UPDATE `creature_template` SET `GossipMenuId` = 4515 WHERE `Entry` = 3403;
UPDATE `creature_template` SET `GossipMenuId` = 85 WHERE `Entry` = 2122;
UPDATE `creature_template` SET `GossipMenuId` = 85 WHERE `Entry` = 2130;
UPDATE `creature_template` SET `GossipMenuId` = 4542 WHERE `Entry` = 4582;
UPDATE `creature_template` SET `GossipMenuId` = 4540 WHERE `Entry` = 4583;
UPDATE `creature_template` SET `GossipMenuId` = 4541 WHERE `Entry` = 4584;
UPDATE `creature_template` SET `GossipMenuId` = 4007 WHERE `Entry` = 1231;
UPDATE `creature_template` SET `GossipMenuId` = 4473 WHERE `Entry` = 5516;
UPDATE `creature_template` SET `GossipMenuId` = 4472 WHERE `Entry` = 5517;
UPDATE `creature_template` SET `GossipMenuId` = 4674 WHERE `Entry` = 10930;
UPDATE `creature_template` SET `GossipMenuId` = 4566 WHERE `Entry` = 5173;
UPDATE `creature_template` SET `GossipMenuId` = 4569 WHERE `Entry` = 1801;
UPDATE `creature_template` SET `GossipMenuId` = 4578 WHERE `Entry` = 4089;
UPDATE `creature_template` SET `GossipMenuId` = 4679 WHERE `Entry` = 837;
UPDATE `creature_template` SET `GossipMenuId` = 4558 WHERE `Entry` = 5142;
UPDATE `creature_template` SET `GossipMenuId` = 4560 WHERE `Entry` = 5143;
UPDATE `creature_template` SET `GossipMenuId` = 3642 WHERE `Entry` = 11406;
UPDATE `creature_template` SET `GossipMenuId` = 6563 WHERE `Entry` = 15177;
UPDATE `creature_template` SET `GossipMenuId` = 6620 WHERE `Entry` = 15433;
UPDATE `creature_template` SET `GossipMenuId` = 6645 WHERE `Entry` = 15503;
UPDATE `creature_template` SET `GossipMenuId` = 6655 WHERE `Entry` = 15504;
UPDATE `creature_template` SET `GossipMenuId` = 6647 WHERE `Entry` IN (16275,16679,16680,16681,23128);
UPDATE `creature_template` SET `GossipMenuId` = 6648 WHERE `Entry` IN (15279,16269,16651,16652,16653);
UPDATE `creature_template` SET `GossipMenuId` = 6649 WHERE `Entry` IN (15284,16276,16658,16659,16660);
UPDATE `creature_template` SET `GossipMenuId` = 6649 WHERE `Entry` IN (15285,16279,16684,16685,16686);
UPDATE `creature_template` SET `GossipMenuId` = 6652 WHERE `Entry` IN (15513,16270,16672,16673,16674);
UPDATE `creature_template` SET `GossipMenuId` = 7243 WHERE `Entry` = 16442;
UPDATE `creature_template` SET `GossipMenuId` = 7265 WHERE `Entry` IN (16756,17482,17510,17511);
UPDATE `creature_template` SET `GossipMenuId` = 7335 WHERE `Entry` = 16576;
UPDATE `creature_template` SET `GossipMenuId` = 7346 WHERE `Entry` = 17056;


DELETE FROM `conditions` WHERE `condition_entry` IN (92,965,79,523,161,544,332,333,567,530,93,82,542,103,543,566,77,169,74,157,107,108,75,73,72,814,823,833,841,853,80);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(@condition+1,-2,1744,93),
(@condition+2,9,9067,0),
(92,14,0,2),
(@condition+3,-1,1744,169),
(965,8,3785,0), 
(79,14,0,128),
(523,-1,79,169),
(544,-1,74,169),
(332,24,17126,1),
(333,19,6881,0),
(567,-1,333,332),
(530,-1,73,169),
(93,14,0,64),
(80,14,0,1279),
(814,5,54,7),
(823,14,1037,0),
(833,-1,814,823),
(841,14,64,0),
(853,-2,833,841),
(73,14,0,8),
(72,14,0,1527),
(74,14,0,1),
(157,9,3909,0),
(107,16,9279,1),
(108,2,9279,1),
(75,14,0,511), -- 
(77,14,0,16),
(169,15,10,1),
(566,-1,77,169),
(82,14,0,4),
(542,-1,82,169),
(103,14,0,256),
(543,-1,103,169);

UPDATE `gossip_menu` SET `entry` = 6341, `condition_id` = @condition+1 WHERE `entry` = 6441 AND `text_id` = 7634 AND `script_id` = 0;
UPDATE `gossip_menu` SET `entry` = 6186 WHERE `entry` = 6189 AND `text_id` = 7393 AND `script_id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 107 WHERE `entry` = 1045 AND `text_id` = 1643 AND `script_id` = 0;
UPDATE `gossip_menu` set `condition_id` = 108 WHERE `entry` = 1045 AND `text_id` = 1753 AND `script_id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 75 WHERE entry = 4041 AND text_id = 4913 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `condition_id` = 1746 WHERE entry = 4041 AND text_id = 4915 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `condition_id` = 1745 WHERE entry = 4041 AND text_id = 4914 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `condition_id` = 75 WHERE entry = 4042 AND text_id = 4916 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `condition_id` = 1746 WHERE entry = 4042 AND text_id = 4918 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `condition_id` = 1745 WHERE entry = 4042 AND text_id = 4917 AND `script_id` = 0; -- Cross check conditions with Rel21_11_044
UPDATE `gossip_menu` SET `entry` = @gossipmenu+1 WHERE `entry` = 1802 AND `text_id` = 2434 AND `script_id` = 0;
UPDATE `gossip_menu` SET `condition_id` = 853 WHERE `entry` = 3186 AND `text_id` = 3945 AND `script_id` = 0;


DELETE FROM `gossip_menu` WHERE `entry` IN (2189,5711,5710,7265,7243,6652,6650,6649,4696,655,4525,4526,4527,4568,4645,4649,4650,7263,4010,4011,4012,4017,4023,4506,4524,4647,4648,4657,7262,1403,3921,3923,3924,3925,3926,4507,4508,4571,4605,4606,4607,4644,4646,4687,4688,7567,4552,4553,4685,3642,4558,4560,4679,4680,3643,4572,4573,4574,4691,4692,4569,4570,4578,4683,4684,4697,4007,4472,4473,4474,4549,4550,4551,4674,4675,4540,4541,4542,4690,85,441,348,1582,1801,2352,4545,4544,4543,4533,4532,4531,3645,4009,4695,4013,4016,2384,1503,1522,4503,4504,4505,4667,4682,4466,4467,4468,4665,4666,523,4509,4511,161,4686,4689,5712,5713,6442,20000,11431,11422,11384,6648,4463); -- 11194,11211
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) values
(5711,6879,0),
(5710,6879,0),
(7265,8591,77),
(7265,8592,0),
(7243,8549,0),
(7243,8550,@condition+2),
(6652,9189,0),
(6652,9190,82),
(6650,9187,0),
(6650,9188,73),
(6649,9007,77),
(6649,9186,0),
(6647,7904,92),
(655,1218,74),
(655,4973,0),
(4525,1218,74),
(4525,4973,0),
(4526,1218,74),
(4526,4973,0),
(4527,1218,74),
(4527,4973,0),
(4568,4988,0),
(4568,4989,74),
(4645,1218,74),
(4645,4973,0),
(4649,1216,74),
(4649,5721,0),
(4650,1216,74),
(4650,5721,0),
(7263,8587,74),
(7263,8588,0),
(4010,4866,82),
(4010,5003,0),
(4011,4867,82),
(4011,4998,0),
(4012,4868,82),
(4012,4998,0),
(4017,4888,82),
(4017,4998,0),
(4023,4868,82),
(4023,4996,0),
(4506,4987,82),
(4506,5004,0),
(4524,4997,82),
(4524,4998,0),
(4647,4997,82),
(4647,4998,0),
(4648,4987,82),
(4648,5004,0),
(4657,5001,82),
(4657,5002,0),
(7262,8585,82),
(7262,8586,0),
(1403,2037,0),
(1403,4782,1744),
(3921,4774,0),
(3921,4775,1744),
(3923,4780,0),
(3923,4779,1744),
(3924,4781,0),
(3924,4782,1744),
(3925,4783,0),
(3925,4784,1744),
(3926,4785,0),
(3926,4786,1744),
(4507,4783,0),
(4507,5694,1744),
(4508,4783,0),
(4508,5694,1744),
(4571,4781,0),
(4571,4782,1744),
(4605,5717,0),
(4605,5716,1744),
(4606,5717,0),
(4606,5716,1744),
(4607,5717,0),
(4607,5716,1744),
(4644,5717,0),
(4644,5716,1744),
(4646,5717,0),
(4646,5716,1744),
(4687,4783,0),
(4687,4784,1744),
(4688,4783,0),
(4688,4784,1744),
(7567,9194,0),
(4552,560,79),
(4552,561,0),
(4553,560,79),
(4553,561,0),
(4685,559,79),
(4685,561,0),
(3642,4436,77),
(3642,4437,0),
(4558,4436,77),
(4558,4437,0),
(4560,4436,77),
(4560,4437,0),
(4679,4435,0),
(4679,4436,77),
(4680,4435,0),
(4680,4436,77),
(3643,4437,77),
(3643,4438,0),
(4572,4437,77),
(4572,4438,0),
(4573,4437,77),
(4573,4438,0),
(4574,4437,77),
(4574,4438,0),
(4691,4437,77),
(4691,4438,0),
(4692,4437,77),
(4692,4438,0),
(4566,2193,103),
(4569,1215,74),
(4569,5724,0),
(4570,1217,74),
(4570,5724,0),
(4578,1217,74),
(4578,5725,0),
(4683,1215,74),
(4683,5724,0),
(4684,1215,74),
(4684,5724,0),
(4697,1217,74),
(4697,5725,0),
(4007,4999,82),
(4007,5000,0),
(4472,4893,82),
(4472,5000,0),
(4473,4893,82),
(4473,5000,0),
(4474,4893,82),
(4474,5000,0),
(4549,4999,82),
(4549,5000,0),
(4550,4890,82),
(4550,5000,0),
(4551,4999,82),
(4551,5000,0),
(4674,4999,82),
(4674,5000,0),
(4675,4999,82),
(4675,5000,0), 
(85,581,73),
(85,4796,0),
(4540,581,73),
(4540,4796,0),
(4541,581,73),
(4541,4796,0),
(4542,581,73),
(4542,4796,0),
(4690,4795,73),
(4690,4796,72),
(4515,5007,93),
(4016, 4878,0),
(4009,4316,82),
(4009,4993,0),
(4695,4863,82),
(4695,4993,0),
(4546,1219,74),
(4547,1219,74),
(4548,1219,74),
(2189,2823,0),
(3645,4439,0),
(3645,4442,77),
(4531,4439,0),
(4531,4442,77),
(4532,4439,0),
(4532,4442,77),
(4533,4439,0),
(4533,4442,77),
(4543,4439,0),
(4543,4442,77),
(4544,4439,0),
(4544,4442,77),
(4545,4439,0),
(4545,4442,77),
(2384,2193,103),
(2384,5722,0),
(1503,2175,103),
(1503,5722,80),
(1522,5693,103),
(1522,5722,0),
(4503,5693,103),
(4503,5722,0),
(4504,5693,103),
(4504,5722,0),
(4505,5693,103),
(4505,5722,0),
(4667,2193,103),
(4667,5722,80),
(4682,2193,103),
(4682,5722,0),
(4466,4433,77),
(4466,4434,0),
(4467,4433,77),
(4467,4434,0),
(4468,4433,77),
(4468,4434,0),
(4665,4433,77),
(4665,4434,0),
(4666,4433,77),
(4666,4434,0),
(523,1040,74),
(523,4985,0),
(4509,1040,74),
(4509,4985,0),
(4511,1040,74),
(4511,4985,0),
(6648,9190,79),
(6648,9191,0);

UPDATE `gossip_menu_option` SET `action_menu_id` = 4461 WHERE `menu_id` = 9794 AND `id` = 1;
UPDATE `gossip_menu_option` SET `action_menu_id` = 5716 WHERE `menu_id` = 5667 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 542 WHERE `menu_id` = 7368 AND `id` = 3;
UPDATE `gossip_menu_option` SET `condition_id` = 543 WHERE `menu_id` IN (4505,1503,4682,1522,4667,4503,4504) AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 169 WHERE `menu_id` = 4680 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 542 WHERE `menu_id` IN (4695,4009,4010,4011,4012,4017,4023,4506,4524,4647,4648,4657,7262) AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 544 WHERE `menu_id` IN (523,655,4525,4526,4527,4568,4645,4649,4650,7263,4569,4570,4683,4684,4697) AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 566 WHERE `menu_id` = 3643 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 566 WHERE `menu_id` = 4691 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id` = 965, action_menu_id = 4461 WHERE `menu_id` = 1403 AND `id` = 1;
UPDATE `gossip_menu_option` SET `action_menu_id` = 4461 WHERE `menu_id` = 1403 AND `id` = 2;
UPDATE `gossip_menu_option` SET `condition_id` = @condition+3 WHERE `menu_id` = 1403 AND `id` = 2;
UPDATE `gossip_menu_option` SET `condition_id` = @condition+3 WHERE `menu_id` IN (3921,3924,3925,3926,4507,4508,4571,4605,4606,4607,4644,4687,4688,7567) AND `id` = 1;
UPDATE `gossip_menu_option` SET `action_menu_id` = 6585 WHERE `menu_id` = 6586;



DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6652,6650,6649,3923,4644,4646,3642,4558,4560,4679,4680,4578,4007,4472,4473,4474,4549,4550,4551,4674,4675,85,4540,4541,4542,4690,1802,1915,1017,441,348,1582,2352,3645,4531,4532,4533,4543,4544,4545,3186,4016,2384,20000,6648,15615,15578,4463,7265);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES
(7265,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'',0),
(7265,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(6652,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',82),
(6652,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(6650,0,3,'I require rogue training.',5,16,0,0,0,0,0,'',73),
(6650,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(6649,0,3,'I require priest training.',5,16,0,0,0,0,0,'',77),
(6649,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(3923,0,3,'I seek training as a druid.',5,16,0,0,0,0,0,'',0),
(3923,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',@condition+3),
(4644,0,3,'I seek training as a druid.',5,16,0,0,0,0,0,'',0),
(4644,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',@condition+3),
(4646,0,3,'I seek training as a druid.',5,16,0,0,0,0,0,'',0),
(4646,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',@condition+3),
(3642,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',77),
(3642,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4558,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4558,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4560,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4560,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4679,0,3,'I seek more training in the priestly ways.',5,16,0,0,0,0,0,'',0),
(4679,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4680,0,3,'Train me',5,16,0,0,0,0,0,'',0),
(4680,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4578,0,3,'I require warrior training.',5,16,0,0,0,0,0,'',0),
(4578,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',544),
(4007,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4007,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4472,0,3,'I\d like to train.',5,16,0,0,0,0,0,'',0),
(4472,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4473,0,3,'I\d like to train.',5,16,0,0,0,0,0,'',0),
(4473,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4474,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4474,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4549,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4549,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4550,0,3,'I am here for training.',5,16,0,0,0,0,0,'',0),
(4550,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4551,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4551,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4674,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4674,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(4675,0,3,'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0,'',0),
(4675,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',542),
(85,0,3,'Can you train me how to use rogue skills?',5,16,0,0,0,0,0,'',0),
(85,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(4540,0,3,'Can you train me how to use rogue skills?',5,16,0,0,0,0,0,'',0),
(4540,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(4541,0,3,'Can you train me how to use rogue skills?',5,16,0,0,0,0,0,'',0),
(4541,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(4542,0,3,'Can you train me how to use rogue skills?',5,16,0,0,0,0,0,'',0),
(4542,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(4690,0,3,'I seek training.',5,16,0,0,0,0,0,'',0),
(4690,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',530),
(4690,4,0,'<Take the letter>',1,1,-1,0,5,0,0,'',567),
(1802,0,0,'Can you tell me how I can get a Videre Elixir?',1,128,@gossipmenu+1,0,0,0,0,'',157),
(1802,1,1,'Buy somethin\', will ya?',3,128,0,0,0,0,0,'',0),
(@gossipmenu+1,0,0,'How can I get Evoroot?', 1, 128, 1915,0,0,0,0,'',0),
(1017,0,0,'Train me.', 5, 16,0,0,0,0,0,'',0),
(2189,0,0,'Where is Un\'Goro Crater?',1,3,2823,0,0,0,0,'',0),
(3645,0,3,'Train me.',5,16,0,0,0,0,0,'',0),
(3645,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4531,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4531,2,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4532,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4532,2,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4533,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4533,2,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4543,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4544,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4544,2,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(4545,1,3,'Train me.',5,16,0,0,0,0,0,'',0),
(4545,2,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',566),
(3186,0,1,'I would like to buy from you.',3,128,0,0,0,0,0,'',853),
(4016,0,3,'I seek training to ride a steed.',5,16,0,0,0,0,0,'',0),
(2384,0,3,'I am interested in warlock training.',5,16,0,0,0,0,0,'',0),
(2384,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',543),
(6648,0,3,'I am interested in mage training.',5,16,0,0,0,0,0,'',79),
(6648,1,0,'I wish to unlearn my talents.',1,1,4461,0,0,0,0,'',523);

DELETE FROM `npc_text` WHERE `ID` IN (5740,15921,15906,15855,5674);
UPDATE `npc_text` SET `text0_0` = 'In the Light we all cast shadows, my $g brother : sister;.  Do you seek further guidance today?', `text0_1` = '' WHERE `ID` = 8591;
UPDATE `npc_text` SET `text0_1` = '' WHERE `ID` = 8592;

   

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
            SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

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


