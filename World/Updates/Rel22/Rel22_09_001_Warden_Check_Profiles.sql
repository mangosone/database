-- ----------------------------------------------------------------
-- Seed the exact TBC 2.4.3.8606 Warden check profiles.
-- The typed schema was created by Rel22_08_001; this update changes data only.
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
    SET @cOldStructure = '08';
    SET @cOldContent = '001';

    SET @cNewVersion = '22';
    SET @cNewStructure = '09';
    SET @cNewContent = '001';
    SET @cNewDescription = 'Warden_Check_Profiles';
    SET @cNewComment = 'Seed exact TBC 2.4.3.8606 Warden check profiles';

    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `structure` DESC, `content` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version` = @cOldVersion AND `structure` = @cOldStructure AND `content` = @cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version` = @cNewVersion AND `structure` = @cNewStructure AND `content` = @cNewContent);

    IF (@cCurResult = @cOldResult) THEN
        START TRANSACTION;

        -- Replace only this exact build/platform seed. Unrelated operator or
        -- future-profile rows remain untouched and outside the validation
        -- scope below.
        DELETE FROM `warden_checks`
        WHERE `build` = 8606 AND `platform` = 0x57696E;

        INSERT INTO `warden_checks`
        (`build`,`platform`,`locale`,`check_id`,`type`,`enabled`,`sort_order`,
         `evidence_class`,`module`,`address`,`length`,`request`,`expected`,`comment`)
        VALUES
        (8606,0x57696E,0x656E5553,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x656E5553,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xD65D59D2E57792A13E8EDF78A574B8F81D0D3CF0,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x656E5553,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F6B6179,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x656E5553,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x656E4742,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x656E4742,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xD65D59D2E57792A13E8EDF78A574B8F81D0D3CF0,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x656E4742,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F6B6179,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x656E4742,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x64654445,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x64654445,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x002ECF12A5B297DACE7955E5971E4F68BF8A8DAB,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x64654445,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F4B,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x64654445,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x65734553,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x65734553,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xDBE1DBADE50F3A616B48F8909D3C8EF75C0D9220,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x65734553,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x41636570746172,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x65734553,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x66724652,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x66724652,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xC7C50539F79BD77E28A6328CB13FCFFA596F1F7B,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x66724652,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0x4F4B,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x66724652,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x6B6F4B52,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x6B6F4B52,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x7AD1756C8A4BD449698A98FDC58775EE2F0FBD6E,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x6B6F4B52,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xED9995EC9DB8,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x6B6F4B52,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x72755255,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x72755255,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0xFF75C74BDCF685D3ED6A7E00DCAF5DA54E75F436,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x72755255,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xD09ED09A,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x72755255,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant'),

        (8606,0x57696E,0x7A68434E,65536,87,1,10,0,X'',0,0,X'',X'',
         'Delivered-module timing health'),
        (8606,0x57696E,0x7A68434E,1,152,1,20,3,X'',0,0,
         0x444246696C6573436C69656E745C417265615461626C652E646263,
         0x3D71F5D1E2BB4147FD6E2587C0D7E0167180DAC0,
         'Effective AreaTable baseline; corroboration only'),
        (8606,0x57696E,0x7A68434E,2,139,1,30,3,X'',0,0,0x4F4B4159,
         0xE7A1AEE5AE9A,'Localized OKAY callback; corroboration only'),
        (8606,0x57696E,0x7A68434E,3,243,1,40,1,0x576F572E657865,
         0x002D0C10,40,X'',
         0xB9EC18E100E88687F7FFE821FBFFFF68CCDDBB00B9B3120000BA18CBBB00E8BDFCFFFFA3D018E100,
         'Exact 8606 Warden bootstrap invariant');

        IF (SELECT COUNT(*) FROM `warden_checks`
            WHERE `build` = 8606 AND `platform` = 0x57696E) <> 32
           OR (SELECT COUNT(*) FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E
                 AND `enabled` = 1) <> 32
           OR (SELECT COUNT(DISTINCT `build`,`platform`,`locale`)
               FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E) <> 8
           OR EXISTS (
               SELECT 1 FROM `warden_checks`
               WHERE `build` = 8606 AND `platform` = 0x57696E
               GROUP BY `build`,`platform`,`locale`
               HAVING COUNT(*) <> 4 OR SUM(`enabled` = 1) <> 4
           ) THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Warden check profile validation failed';
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
