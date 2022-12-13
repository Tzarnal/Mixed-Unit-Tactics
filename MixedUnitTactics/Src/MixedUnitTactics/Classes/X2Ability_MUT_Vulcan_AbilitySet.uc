class X2Ability_MUT_Vulcan_AbilitySet extends X2Ability config (GameData_SoldierSkills);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(MUT_VulcanCore());

	return Templates;
}

static function X2AbilityTemplate MUT_VulcanCore()
{
	
	local X2AbilityTemplate										Template;
	local X2Condition_WOTC_APA_TargetRankRequirement			RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_WOTC_APA_AddAbilitiesToTarget				RankAbilities1, RankAbilities2, RankAbilities3;

	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'MUT_VulcanCore');
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
	RankCondition1.iMaxRank = -1;	

	RankCondition2 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = -1;
	RankCondition2.GiveProject = 'MUT_Vulcan_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	
	RankCondition3.GiveProject = 'MUT_Vulcan_Unlock2';

	RankAbilities1 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';	
	RankAbilities1.AddAbilities.AddItem('CoolUnderPressure');
	RankAbilities1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(RankAbilities1);

	RankAbilities2 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';
	RankAbilities2.ApplyToWeaponSlot = eInvSlot_PrimaryWeapon;
	RankAbilities2.AddAbilities.AddItem('Shredder');
	RankAbilities2.AddAbilities.AddItem('ShadowOps_ReadyForAnything');	
	RankAbilities2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(RankAbilities2);

	RankAbilities3 = new class'X2Effect_WOTC_APA_AddAbilitiesToTarget';
	RankAbilities3.AddAbilities.AddItem('LW2WotC_RapidReaction');	
	RankAbilities3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(RankAbilities3);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}