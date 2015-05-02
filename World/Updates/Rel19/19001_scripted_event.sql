ALTER TABLE  `db_version` CHANGE `required_19000_Release_019_Initial` `required_19001_scripted_event` BIT(1) NULL DEFAULT NULL;

RENAME TABLE  `scripted_event_id` TO  `scripted_event` ;
