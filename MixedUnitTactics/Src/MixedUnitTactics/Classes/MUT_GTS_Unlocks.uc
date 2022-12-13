class MUT_GTS_Unlocks extends X2StrategyElement;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(MUT_Armiger_Unlock1());
	Templates.AddItem(MUT_Armiger_Unlock2());

	Templates.AddItem(MUT_Vulcan_Unlock1());
	Templates.AddItem(MUT_Vulcan_Unlock2());

	return Templates;
}

function bool IsClassEnabled(name ClassName)
{
	local X2SoldierClassTemplateManager		SoldierClassManager;
	local X2SoldierClassTemplate			SoldierClassTemplate;

	SoldierClassManager = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
	SoldierClassTemplate = SoldierClassManager.FindSoldierClassTemplate(ClassName);

	if (SoldierClassTemplate.NumInForcedDeck > 0 && SoldierClassTemplate.NumInDeck > 0)
		return true;

	return false;
}

//
//	Armiger
//

function bool IsArmigerEnabled()
{
	return IsClassEnabled('MUT_Armiger');
}

function bool IsArmigerUnlock1Purchased()
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	if (IsArmigerEnabled() && XComHQ.SoldierUnlockTemplates.Find('MUT_Armiger_Unlock1') != INDEX_NONE)
	{
		return true;
	}
		
	return false;
}

static function X2SoldierAbilityUnlockTemplate MUT_Armiger_Unlock1()
{
	local X2SoldierAbilityUnlockTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'MUT_Armiger_Unlock1');

	// Requirements
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1";
	Template.Requirements.SpecialRequirementsFn = IsArmigerEnabled;

	Template.Requirements.RequiredHighestSoldierRank = 3;
	Template.Requirements.RequiredSoldierClass = 'MUT_Armiger';
	Template.Requirements.RequiredSoldierRankClassCombo = true;

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';

	return Template;
}

static function X2SoldierAbilityUnlockTemplate MUT_Armiger_Unlock2()
{
	local X2SoldierAbilityUnlockTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'MUT_Armiger_Unlock2');

	// Requirements
	Template.bAllClasses = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = IsArmigerUnlock1Purchased;

	Template.Requirements.RequiredHighestSoldierRank = 6;
	Template.Requirements.RequiredSoldierClass = 'MUT_Armiger';
	Template.Requirements.RequiredSoldierRankClassCombo = true;

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize2";
	
	return Template;
}


//
//	Vulcan
//

function bool IsVulcanEnabled()
{
	return IsClassEnabled('MUT_Vulcan');
}

function bool IsVulcanUnlock1Purchased()
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	if (IsVulcanEnabled() && XComHQ.SoldierUnlockTemplates.Find('MUT_Vulcan_Unlock1') != INDEX_NONE)
	{
		return true;
	}
		
	return false;
}

static function X2SoldierAbilityUnlockTemplate MUT_Vulcan_Unlock1()
{
	local X2SoldierAbilityUnlockTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'MUT_Vulcan_Unlock1');

	// Requirements
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1";
	Template.Requirements.SpecialRequirementsFn = IsVulcanEnabled;

	Template.Requirements.RequiredHighestSoldierRank = 3;
	Template.Requirements.RequiredSoldierClass = 'MUT_Vulcan';
	Template.Requirements.RequiredSoldierRankClassCombo = true;

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';

	return Template;
}

static function X2SoldierAbilityUnlockTemplate MUT_Vulcan_Unlock2()
{
	local X2SoldierAbilityUnlockTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'MUT_Vulcan_Unlock2');

	// Requirements
	Template.bAllClasses = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = IsVulcanUnlock1Purchased;

	Template.Requirements.RequiredHighestSoldierRank = 6;
	Template.Requirements.RequiredSoldierClass = 'MUT_Vulcan';
	Template.Requirements.RequiredSoldierRankClassCombo = true;

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize2";
	
	return Template;
}

