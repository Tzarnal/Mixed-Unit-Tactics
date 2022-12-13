class UIStrategyScreenListener_MUT_GTS_Unlocks extends UIStrategyScreenListener;

event OnInit(UIScreen Screen)
{
    if (IsInStrategy())
    {
		// Try to add the GTS perk
		AddSoldierUnlockTemplate('OfficerTrainingSchool', 'MUT_Armiger_Unlock1');
		AddSoldierUnlockTemplate('OfficerTrainingSchool', 'MUT_Armiger_Unlock2');

		AddSoldierUnlockTemplate('OfficerTrainingSchool', 'MUT_Vulcan_Unlock1');
		AddSoldierUnlockTemplate('OfficerTrainingSchool', 'MUT_Vulcan_Unlock2');
	}
}

static function AddSoldierUnlockTemplate(name FacilityName, name UnlockGTSName)
{
	local X2FacilityTemplate FacilityTemplate;

	// Find the GTS facility template
	FacilityTemplate = X2FacilityTemplate(class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager().FindStrategyElementTemplate(FacilityName));
	if (FacilityTemplate == none)
		return;

	if (FacilityTemplate.SoldierUnlockTemplates.Find(UnlockGTSName) != INDEX_NONE)
		return;

	// Update the GTS template with the specified soldier unlock
	FacilityTemplate.SoldierUnlockTemplates.AddItem(UnlockGTSName);
}

static function RemoveSoldierUnlockTemplate(name FacilityName, name UnlockGTSName)
{
	local X2FacilityTemplate FacilityTemplate;

	// Find the GTS facility template
	FacilityTemplate = X2FacilityTemplate(class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager().FindStrategyElementTemplate(FacilityName));
	if (FacilityTemplate == none)
		return;

	if (FacilityTemplate.SoldierUnlockTemplates.Find(UnlockGTSName) != INDEX_NONE)
		FacilityTemplate.SoldierUnlockTemplates.RemoveItem(UnlockGTSName);
		
	return;
}