-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional update
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

  SET @cOldRev = 'required_20000_35_BGAV_Creature_Template_Classlevelstats_Fixes'; 

  -- Set the new revision string
  SET @cNewRev = 'required_20000_36_BGAV_Icewing_Marshal_Faction_Fix';

  -- Set thisRevision to the column name of db_version in the currently selected database
  SET @cThisRev := ((SELECT column_name FROM information_schema.`COLUMNS` WHERE table_name='db_version' AND table_schema=(SELECT DATABASE() AS thisDB FROM DUAL) AND column_name LIKE 'required%'));

  -- Set friendly Version Text
  SET @cThisVersion = 'MaNGOSOne Database Rev 20000_36';

 
  -- Only Proceed if the old values match
  IF @cThisRev = @cOldRev THEN
    -- Make this all a single transaction
    START TRANSACTION;

    -- Apply the Version Change from Old Version to New Version
    SET @query = CONCAT('ALTER TABLE db_version CHANGE COLUMN ',@cOldRev, ' ' ,@cNewRev,' bit;');
    PREPARE stmt1 FROM @query;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
    -- The Above block is required for making table changes

    -- -- -- -- Normal Update / Insert / Delete statements will go here  -- -- -- -- --

	
	-- == Faction should be 1534 and not 32 == --
	
	DELETE FROM creature_template WHERE Entry=14764;
	INSERT INTO creature_template (Entry,Name,SubName,IconName,MinLevel,MaxLevel,HeroicEntry,ModelId1,ModelId2,ModelId3,ModelId4,FactionAlliance,FactionHorde,Scale,Family,CreatureType,InhabitType,RegenerateStats,RacialLeader,NpcFlags,UnitFlags,DynamicFlags,ExtraFlags,CreatureTypeFlags,SpeedWalk,SpeedRun,UnitClass,Rank,Expansion,HealthMultiplier,PowerMultiplier,DamageMultiplier,DamageVariance,ArmorMultiplier,ExperienceMultiplier,MinLevelHealth,MaxLevelHealth,MinLevelMana,MaxLevelMana,MinMeleeDmg,MaxMeleeDmg,MinRangedDmg,MaxRangedDmg,Armor,MeleeAttackPower,RangedAttackPower,MeleeBaseAttackTime,RangedBaseAttackTime,DamageSchool,MinLootGold,MaxLootGold,LootId,PickpocketLootId,SkinningLootId,KillCredit1,KillCredit2,MechanicImmuneMask,ResistanceHoly,ResistanceFire,ResistanceNature,ResistanceFrost,ResistanceShadow,ResistanceArcane,PetSpellDataId,MovementType,TrainerType,TrainerSpell,TrainerClass,TrainerRace,TrainerTemplateId,VendorTemplateId,EquipmentTemplateId,GossipMenuId,AIName,ScriptName)
	VALUES (14764,'Icewing Marshal','','',60,70,0,14793,0,14793,0,1534,1534,1,0,7,3,1,0,0,32768,0,0,0,1,1.14286,1,1,-1,1,1,1,1,1,1,60000,140000,0,0,528,681,62.016,85.272,0,279,100,2000,1292,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'EventAI',''); 

	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    
    -- If we get here ok, commit the changes
    IF bRollback = TRUE THEN
      ROLLBACK;
      SELECT '* UPDATE FAILED *' AS 'Status',@cThisRev AS 'DB is on Version';
    ELSE
      COMMIT;
      SELECT '* UPDATE COMPLETE *' AS 'Status',@cNewRev AS 'DB is now on Version';
    END IF;
  ELSE
    SELECT '* UPDATE SKIPPED *' AS 'Status',@cOldRev AS 'Required Version',@cThisRev AS 'Found Version';
  END IF;

END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;