ALTER TABLE db_version CHANGE COLUMN required_19005_03_creature_model_race required_19005_04_gossip_menu_option bit;

-- This adds a missing Text to an Option in Hunter Pet Trainer Menu.
UPDATE `gossip_menu_option` SET `option_text`='I wish to train my pet.' WHERE `menu_id`=4783 AND `ID`=3;

-- This removes an unused/doubled Option in Shaman Trainer Menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4516 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5123 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4103 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4104 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4528 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4529 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4530 AND `id`=2;

-- This removes an unused/doubled Option in Paladin Trainer Menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4469 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4470 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4471 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7260 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4663 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4677 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4678 AND `id`=2;

-- This removes an unused/doubled Option in Rogue Trainer Menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4659 AND `id`=2;

-- This removes an unused/doubled Option in Mage Trainer Menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4660 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4661 AND `id`=2;
