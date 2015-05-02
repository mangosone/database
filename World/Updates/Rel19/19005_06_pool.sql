ALTER TABLE db_version CHANGE COLUMN required_19005_04_gossip_menu_option required_19005_06_pool bit;

-- Fixing the massive spawns in Fargodeep-Mine, Elwynn Forest (Inner Section)

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES 
(12265, 18, 'Master Creature Pool - Fargodeep Mine (Inner Section)');

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES 
(12265, 12265,  0, 'Kobold Tunneler - Fargodeep Mine');

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
(80584, 12265, 25, 'Kobold Tunneler (Fargodeep Mine)'),
(80582, 12265, 40, 'Kobold Tunneler (Fargodeep Mine)'),
(80601, 12265, 10, 'Kobold Tunneler (Fargodeep Mine)'),
(80586, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80585, 12265, 9, 'Kobold Tunneler (Fargodeep Mine)'),
(80618, 12265, 19, 'Kobold Tunneler (Fargodeep Mine)'),
(80614, 12265, 34, 'Kobold Tunneler (Fargodeep Mine)'),
(80620, 12265, 22, 'Kobold Tunneler (Fargodeep Mine)'),
(80616, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80604, 12265, 29, 'Kobold Tunneler (Fargodeep Mine)'),
(80605, 12265, 30, 'Kobold Tunneler (Fargodeep Mine)'),
(80633, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80632, 12265, 15, 'Kobold Tunneler (Fargodeep Mine)'),
(80629, 12265, 9,  'Kobold Tunneler (Fargodeep Mine)'),
(80627, 12265, 10, 'Kobold Tunneler (Fargodeep Mine)'),
(80628, 12265, 30, 'Kobold Tunneler (Fargodeep Mine)'),
(80634, 12265, 33, 'Kobold Tunneler (Fargodeep Mine)'),
(80631, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80650, 12265, 34, 'Kobold Tunneler (Fargodeep Mine)'),
(80617, 12265, 25, 'Kobold Tunneler (Fargodeep Mine)'),
(80640, 12265, 11, 'Kobold Tunneler (Fargodeep Mine)'),
(80639, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80638, 12265, 40, 'Kobold Tunneler (Fargodeep Mine)'),
(80626, 12265, 45, 'Kobold Tunneler (Fargodeep Mine)'),
(80645, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80649, 12265, 32, 'Kobold Tunneler (Fargodeep Mine)'),
(80636, 12265, 35, 'Kobold Tunneler (Fargodeep Mine)'),
(80609, 12265, 19, 'Kobold Tunneler (Fargodeep Mine)'),
(80610, 12265, 25, 'Kobold Tunneler (Fargodeep Mine)'),
(80608, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80611, 12265, 19, 'Kobold Tunneler (Fargodeep Mine)'),
(80607, 12265, 35, 'Kobold Tunneler (Fargodeep Mine)'),
(80621, 12265, 45, 'Kobold Tunneler (Fargodeep Mine)'),
(80622, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)'),
(80591, 12265, 34, 'Kobold Tunneler (Fargodeep Mine)'),
(80588, 12265, 12, 'Kobold Tunneler (Fargodeep Mine)');
