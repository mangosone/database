-- ----------------------------------------------------------------
-- Add the exact Traditional Chinese TBC 2.4.3.8606 Warden profile.
-- Existing profiles and operator-added rows remain untouched.
-- Stop mangosd and deploy this update with the matching server revision;
-- strict module/profile coverage rejects either half deployed on its own.
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`;

DELIMITER $$

CREATE PROCEDURE `update_mangos`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SHOW ERRORS;
        SELECT '* UPDATE FAILED *' AS `===== Status =====`,
               @cCurResult AS `===== DB is on Version: =====`;
        RESIGNAL;
    END;

    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);

    SET @cOldVersion = '22';
    SET @cOldStructure = '09';
    SET @cOldContent = '001';

    SET @cNewVersion = '22';
    SET @cNewStructure = '09';
    SET @cNewContent = '002';
    SET @cNewDescription = 'Warden_zhTW_Profile';
    SET @cNewComment = 'Add exact TBC 2.4.3.8606 Traditional Chinese Warden profile';

    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version` = @cOldVersion AND `structure` = @cOldStructure AND `content` = @cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version` = @cNewVersion AND `structure` = @cNewStructure AND `content` = @cNewContent);

    IF (@cCurResult = @cOldResult) THEN
        START TRANSACTION;

        IF EXISTS (
            SELECT 1 FROM `warden_checks`
            WHERE `build` = 8606 AND `platform` = 0x57696E
              AND `locale` = 0x7A685457
        ) THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Existing 8606/Win/zhTW Warden rows conflict; back up and reconcile them, then re-run';
        END IF;

        INSERT INTO `warden_checks`
        (`build`,`platform`,`locale`,`check_id`,`type`,`enabled`,`sort_order`,
         `evidence_class`,`module`,`address`,`length`,`request`,`expected`,`comment`)
        VALUES
        (8606,0x57696E,0x7A685457,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x7A685457,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x41602044B1EA722C6798036AF787D8E9DD508A6A,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x7A685457,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xE7A2BAE5AE9A,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x7A685457,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant');

        IF (SELECT COUNT(*) FROM `warden_checks`
            WHERE `build` = 8606 AND `platform` = 0x57696E
              AND `locale` = 0x7A685457) <> 4
           OR (SELECT COUNT(*) FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E
                 AND `locale` = 0x7A685457 AND `enabled` = 1) <> 4
           OR (SELECT COUNT(DISTINCT `check_id`) FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E
                 AND `locale` = 0x7A685457) <> 4
           OR (SELECT COUNT(DISTINCT `sort_order`) FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E
                 AND `locale` = 0x7A685457) <> 4 THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Warden zhTW profile validation failed';
        END IF;

        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure,
            @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT `description` FROM `db_version`
            WHERE `version` = @cNewVersion AND `structure` = @cNewStructure
              AND `content` = @cNewContent);
        COMMIT;
        SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,
               @cNewResult AS `===== DB is now on Version =====`;
    ELSE
        IF (@cCurResult = @cNewResult) THEN
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,
                   @cCurResult AS `===== DB is already on Version =====`;
        ELSEIF (@cCurResult IS NULL) THEN
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,
                   'Unable to locate DB Version Information' AS `============= Error Message =============`;
        ELSE
            SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure,
                '_', @cCurContent, ' - ', @cCurResult);
            SET @cOldOutput = CONCAT(@cOldVersion, '_', @cOldStructure,
                '_', @cOldContent, ' - ', COALESCE(@cOldResult, 'IS NOT APPLIED'));
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,
                   @cOldOutput AS `=== Expected ===`,
                   @cCurOutput AS `===== Found Version =====`;
        END IF;
    END IF;
END $$

DELIMITER ;

CALL update_mangos();
DROP PROCEDURE IF EXISTS `update_mangos`;
