ALTER TABLE db_version CHANGE COLUMN required_19005_07_mangos_command required_19005_08_mangos_string bit;

INSERT INTO `mangos_string` VALUES
(1510,'Closed ticket for player %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1511,'Ticket system is globally on, accepting all tickets',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1512,'Ticket system is globally off, not accepting tickets at all',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
