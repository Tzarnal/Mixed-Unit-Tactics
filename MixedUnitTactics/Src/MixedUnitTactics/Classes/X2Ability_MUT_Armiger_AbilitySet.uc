class X2Ability_MUT_Armiger_AbilitySet extends X2Ability config (GameData_SoldierSkills);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(MUT_ArmigerCore());

	return Templates;
}

static function X2AbilityTemplate MUT_ArmigerCore()
{
	
	local X2AbilityTemplate										Template;
	local X2Condition_WOTC_APA_TargetRankRequirement			RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_WOTC_APA_AddAbilitiesToTarget				RankAbilities1, RankAbilities2, RankAbilities3;
	local X2Effect_PersistentStatChange							RankStatChange1, RankStatChange2, RankStatChange3;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'MUT_ArmigerCore');
	Template.IconImage = "img:///UILibrary_MZChimeraIcons.ArmorMod_ExtraPadding";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	
	// Establish Rank conditions for each Proficiency Level effect:
	RankCondition1 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition1.iMinRank = 1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 7;	// Max rank is 1 below minimum rank for level 2 bonuses

	RankCondition2 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 7;
	RankCondition2.GiveProject = 'MUT_Armiger_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = 7;	// No max rank for level 3 bonuses
	RankCondition3.GiveProject = 'MUT_Armiger_Unlock2';
	
	RankAbilities1 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';
	RankAbilities1.ApplyToWeaponSlot = eInvSlot_PrimaryWeapon;
	RankAbilities1.AddAbilities.AddItem('MZRunningOnEmpty');	
	RankAbilities1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(RankAbilities1);

	RankStatChange1 = new class'X2Effect_PersistentStatChange';
	RankStatChange1.EffectName = 'ArmigerStat1';
	RankStatChange1.DuplicateResponse = eDupe_Ignore;
	RankStatChange1.BuildPersistentEffect(1, true, false, false);
	RankStatChange1.TargetConditions.AddItem(RankCondition1);
	RankStatChange1.AddPersistentStatChange(eStat_Offense, 5);
	Template.AddTargetEffect(RankStatChange1);

	RankAbilities2 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';
	RankAbilities2.AddAbilities.AddItem('NimbleHands');
	RankAbilities2.ApplyToWeaponSlot = eInvSlot_PrimaryWeapon;
	RankAbilities2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(RankAbilities2);

	RankStatChange2 = new class'X2Effect_PersistentStatChange';
	RankStatChange2.EffectName = 'ArmigerStat2';
	RankStatChange2.DuplicateResponse = eDupe_Ignore;
	RankStatChange2.BuildPersistentEffect(1, true, false, false);
	RankStatChange2.TargetConditions.AddItem(RankCondition2);
	RankStatChange2.AddPersistentStatChange(eStat_Offense, 5);
	Template.AddTargetEffect(RankStatChange2);

	RankAbilities3 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';
	RankAbilities3.AddAbilities.AddItem('WOTC_APA_WeaponSpecialist');	
	RankAbilities3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(RankAbilities3);

	RankStatChange3 = new class'X2Effect_PersistentStatChange';
	RankStatChange3.EffectName = 'ArmigerStat3';
	RankStatChange3.DuplicateResponse = eDupe_Ignore;
	RankStatChange3.BuildPersistentEffect(1, true, false, false);
	RankStatChange3.TargetConditions.AddItem(RankCondition3);
	RankStatChange3.AddPersistentStatChange(eStat_Offense, 5);
	Template.AddTargetEffect(RankStatChange3);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}