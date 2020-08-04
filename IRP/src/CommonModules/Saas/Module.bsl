﻿Function SeparationUsed() Export
	Return Constants.SaasMode.Get();
EndFunction

Function isAreaActive() Export
	AreaMode = NOT Saas.SeparationUsed() OR (Saas.SeparationUsed() AND SessionParameters.IDUse);
	Return AreaMode;
EndFunction

Procedure SetSeparationParameters(Separators) Export
	For Each DataSeparation In Separators Do
		SessionParameters[DataSeparation.Key + "Value"] = DataSeparation.Value;
		SessionParameters[DataSeparation.Key + "Use"] = ValueIsFilled(DataSeparation.Value);
	EndDo;
EndProcedure

Function CurrentAreaStatus() Export
	Answer = New Structure("isError, Status", False, "");
	If SessionParameters.IDUse Then
		Area = Catalogs.DataAreas.FindByCode(SessionParameters.IDValue);
		If Area.IsEmpty() Then
			Answer.isError = True;
			Answer.Status = StrTemplate(R().Saas_001, SessionParameters.IDValue);
		Else
			If Not Area.DataAreaStatus = Enums.DataAreaStatus.Working Then
				Answer.isError = True;
				Answer.Status = StrTemplate(R().Saas_002, Area.DataAreaStatus);
			EndIf;
		EndIf;
	EndIf;
	Return Answer;
EndFunction

Procedure AreaUpdate() Export
	
	If Not SeparationUsed() Then 
		Return;
	EndIf;
	
	Query = New Query;
	Query.Text =
	"SELECT TOP 1
	|	DataAreas.Ref AS Ref,
	|	DataAreas.Code AS Code,
	|	DataAreas.AdminLogin AS AdminLogin,
	|	DataAreas.AdminPassword AS AdminPassword,
	|	DataAreas.AdminLocalization AS AdminLocalization,
	|	DataAreas.CompanyName AS CompanyName,
	|	DataAreas.CompanyLocalization AS CompanyLocalization,
	|	DataAreas.Extensions.(
	|		Extension) AS Extensions
	|FROM
	|	Catalog.DataAreas AS DataAreas
	|WHERE
	|	DataAreas.DataAreaStatus = VALUE(Enum.DataAreaStatus.AreaPreparation)";
	
	QueryResult = Query.Execute();
	
	CurrentArea = QueryResult.Select();
	
	While CurrentArea.Next() Do
		// Change area
		AreaSettings = New Structure("ID", CurrentArea.Code);
		SetSeparationParameters(AreaSettings);
		
		// User group
		UserGroup = Catalogs.UserGroups.CreateItem();
		UserGroup.Description_en = "Main group";
		UserGroup.Write();
		
		// User
		User = Catalogs.Users.CreateItem();
		DescriptionStructure = FillingFromClassifiers.DescriptionStructure(CurrentArea.AdminLogin);
		FillPropertyValues(User, DescriptionStructure);
		If ValueIsFilled(CurrentArea.AdminLocalization) Then
			User.LocalizationCode = CurrentArea.AdminLocalization;
		Else
			User.LocalizationCode = Metadata.DefaultLanguage.LanguageCode;
		EndIf;
		User.InterfaceLocalizationCode = User.LocalizationCode;
		User.ShowInList = True;
		User.UserGroup = UserGroup.Ref;
		User.AdditionalProperties.Insert("Password", CurrentArea.AdminPassword);
		User.Write();
		
		// install localization default extension
		For Each DefaultExtension In CurrentArea.Extensions.Unload() Do
			If ValueIsFilled(DefaultExtension.Extension) Then
				Catalogs.Extensions.SetupExtentionInCurrentArea(DefaultExtension.Extension, False);
			EndIf;
		EndDo;
				
		// logout area
		AreaSettings = New Structure("ID", 0);
		SetSeparationParameters(AreaSettings);
		
		CurrentAreaObject = CurrentArea.Ref.GetObject();
		CurrentAreaObject.DataAreaStatus = Enums.DataAreaStatus.Working;
		CurrentAreaObject.Write();
	EndDo;
	
EndProcedure

Function CurrentAreaID() Export
	Return SessionParameters.IDValue;
EndFunction

Function AvailableCompanyLocalizations() Export
	Array = New Array;
	Array.Add("tr");
	Array.Add("ua");
	Return Array;
EndFunction

Function GetCurrencyMovementType_Legal() Export
	Query = New Query();
	Query.Text = 
	"SELECT
	|	CurrencyMovementType.Ref
	|FROM
	|	ChartOfCharacteristicTypes.CurrencyMovementType AS CurrencyMovementType
	|WHERE
	|	CurrencyMovementType.Type = VALUE(Enum.CurrencyType.Legal)";
	QuerySelection = Query.Execute().Select();
	If QuerySelection.Next() Then
		Return QuerySelection.Ref;
	Else
		Return ChartsOfCharacteristicTypes.CurrencyMovementType.EmptyRef();
	EndIf;
EndFunction

Function GetCurrencyMovementType_Transaction() Export
	Return ChartsOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency;
EndFunction

Function isSaasMode() Export
	Return GetFunctionalOption("SaasMode");
EndFunction
