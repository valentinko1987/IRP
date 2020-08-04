﻿#Region FormEvents

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)
	LibraryLoader.RegisterLibrary(Object, ThisObject, Currencies_GetDeclaration(Object, ThisObject));	
	DocSalesInvoiceServer.OnCreateAtServer(Object, ThisObject, Cancel, StandardProcessing);
	If Parameters.Key.IsEmpty() Then
		SetVisibilityAvailability(Object, ThisObject);
	EndIf;
	// {TAXES}
	Taxes_CreateFormControls();
	DocSalesInvoiceServer.CalculateTableAtServer(ThisObject, Object);
	Taxes_CreateTaxTree();
	// {TAXES}
EndProcedure

&AtClient
Procedure OnOpen(Cancel, AddInfo = Undefined) Export
	DocSalesInvoiceClient.OnOpen(Object, ThisObject, Cancel);
EndProcedure

&AtClient
Procedure NotificationProcessing(EventName, Parameter, Source, AddInfo = Undefined) Export
	If EventName = "UpdateAddAttributeAndPropertySets" Then
		AddAttributesCreateFormControl();
	EndIf;
	
	If Not Source = ThisObject Then
		Return;
	EndIf;
	
	DocSalesInvoiceClient.NotificationProcessing(Object, ThisObject, EventName, Parameter, Source);
	
	// {TAXES}
	If EventName = "CalculateTax" Then
		Taxes_CreateTaxTree();
		TaxesClient.ExpandTaxTree(ThisObject.Items.TaxTree, ThisObject.TaxTree.GetItems());
	EndIf;
	// {TAXES}
EndProcedure

&AtClient
Procedure BeforeWrite(Cancel, WriteParameters)
	Return;
EndProcedure

&AtServer
Procedure OnWriteAtServer(Cancel, CurrentObject, WriteParameters)
	DocumentsServer.OnWriteAtServer(Object, ThisObject, Cancel, CurrentObject, WriteParameters);
EndProcedure

&AtClient
Procedure AfterWrite(WriteParameters, AddInfo = Undefined) Export
	DocSalesInvoiceClient.AfterWriteAtClient(Object, ThisObject, WriteParameters);
EndProcedure

&AtServer
Procedure AfterWriteAtServer(CurrentObject, WriteParameters, AddInfo = Undefined) Export
	// {TAXES}
	Taxes_CreateFormControls();
	// {TAXES}
	DocSalesInvoiceServer.AfterWriteAtServer(Object, ThisObject, CurrentObject, WriteParameters);
	SetVisibilityAvailability(Object, ThisObject);
EndProcedure

&AtServer
Procedure OnReadAtServer(CurrentObject)
	DocSalesInvoiceServer.OnReadAtServer(Object, ThisObject, CurrentObject);
	Taxes_CreateFormControls();
	SetVisibilityAvailability(CurrentObject, ThisObject);
EndProcedure

&AtServer
Procedure BeforeWriteAtServer(Cancel, CurrentObject, WriteParameters)
	AddAttributesAndPropertiesServer.BeforeWriteAtServer(ThisObject, Cancel, CurrentObject, WriteParameters);
EndProcedure

&AtClientAtServerNoContext
Procedure SetVisibilityAvailability(Object, Form) Export
	Form.Items.LegalName.Enabled = ValueIsFilled(Object.Partner);
EndProcedure

#EndRegion

#Region FormItemsEvents
&AtClient
Procedure DateOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.DateOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure StoreOnChange(Item)
	DocSalesInvoiceClient.StoreOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DeliveryDateOnChange(Item)
	DocumentsClient.DeliveryDateOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListStoreOnChange(Item)
	DocSalesInvoiceClient.ItemListStoreOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure PartnerOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.PartnerOnChange(Object, ThisObject, Item);
	SetVisibilityAvailability(Object, ThisObject);
EndProcedure

&AtClient
Procedure LegalNameOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.LegalNameOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure AgreementOnChange(Item, AddInfo = Undefined) Export
	// {TAXES}
	TaxesClient.ChangeTaxRatesByAgreement(Object, ThisObject);
	// {TAXES}
	DocSalesInvoiceClient.AgreementOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ManagerOnChange(Item)
	Return;
EndProcedure

&AtClient
Procedure CompanyOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.CompanyOnChange(Object, ThisObject, Item);
	// {TAXES}
	Taxes_CreateFormControls();
	// {TAXES}
EndProcedure

&AtClient
Procedure PriceIncludeTaxOnChange(Item)
	DocSalesInvoiceClient.PriceIncludeTaxOnChange(Object, ThisObject, Item);
EndProcedure

#EndRegion

#Region ItemListEvents

&AtClient
Procedure ItemListAfterDeleteRow(Item)
	DocSalesInvoiceClient.ItemListAfterDeleteRow(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListOnStartEdit(Item, NewRow, Clone)
	If Clone Then
		Item.CurrentData.Key = New UUID();
	EndIf;
	DocumentsClient.TableOnStartEdit(Object, ThisObject, "Object.ItemList", Item, NewRow, Clone);
EndProcedure

&AtClient
Procedure ItemListOnActivateRow(Item)
	DocSalesInvoiceClient.ItemListOnActivateRow(Object, ThisObject, Item);
EndProcedure

#EndRegion

#Region ItemListItemsEvents

&AtClient
Procedure ItemListItemOnChange(Item, AddInfo = Undefined) Export
		DocSalesInvoiceClient.ItemListItemOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListItemKeyOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListItemKeyOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListPriceTypeOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListPriceTypeOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListUnitOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListUnitOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListQuantityOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListQuantityOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListPriceOnChange(Item, AddInfo = Undefined) Export
	DocSalesInvoiceClient.ItemListPriceOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListTotalAmountOnChange(Item, AddInfo = Undefined) Export
	CurrentData = ThisObject.Items.ItemList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;
	
	TaxesClient.CalculateReverseTaxOnChangeTotalAmount(Object, ThisObject, CurrentData);
EndProcedure

&AtClient
Procedure ItemListItemStartChoice(Item, ChoiceData, StandardProcessing)
	DocSalesInvoiceClient.ItemListItemStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure ItemListItemEditTextChange(Item, Text, StandardProcessing)
	DocSalesInvoiceClient.ItemListItemEditTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region ItemPartner

&AtClient
Procedure PartnerStartChoice(Item, ChoiceData, StandardProcessing)
	DocSalesInvoiceClient.PartnerStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure PartnerEditTextChange(Item, Text, StandardProcessing)
	DocSalesInvoiceClient.PartnerTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region ItemLegalName

&AtClient
Procedure LegalNameStartChoice(Item, ChoiceData, StandardProcessing)
	DocSalesInvoiceClient.LegalNameStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure LegalNameEditTextChange(Item, Text, StandardProcessing)
	DocSalesInvoiceClient.LegalNameTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region ItemAgreement

&AtClient
Procedure AgreementStartChoice(Item, ChoiceData, StandardProcessing)
	DocSalesInvoiceClient.AgreementStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure AgreementEditTextChange(Item, Text, StandardProcessing)
	DocSalesInvoiceClient.AgreementTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region ItemCompany

&AtClient
Procedure CompanyStartChoice(Item, ChoiceData, StandardProcessing)
	DocSalesInvoiceClient.CompanyStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure CompanyEditTextChange(Item, Text, StandardProcessing)
	DocSalesInvoiceClient.CompanyEditTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region DescriptionEvents

&AtClient
Procedure DescriptionClick(Item, StandardProcessing)
	DocumentsClient.DescriptionClick(Object, ThisObject, Item, StandardProcessing);
EndProcedure

#EndRegion

#Region SpecialOffers

#Region Offers_for_document

&AtClient
Procedure SetSpecialOffers(Command)
	OffersClient.OpenFormPickupSpecialOffers_ForDocument(Object,
		ThisObject,
		"SpecialOffersEditFinish_ForDocument");
EndProcedure

&AtClient
Procedure SpecialOffersEditFinish_ForDocument(Result, AdditionalParameters) Export
	OffersClient.SpecialOffersEditFinish_ForDocument(Result, Object, ThisObject, AdditionalParameters);
	
EndProcedure

#EndRegion

#Region Offers_for_row

&AtClient
Procedure SetSpecialOffersAtRow(Command)
	OffersClient.OpenFormPickupSpecialOffers_ForRow(Object,
		Items.ItemList.CurrentData,
		ThisObject,
		"SpecialOffersEditFinish_ForRow");
EndProcedure

&AtClient
Procedure SpecialOffersEditFinish_ForRow(Result, AdditionalParameters) Export
	OffersClient.SpecialOffersEditFinish_ForRow(Result, Object, ThisObject, AdditionalParameters);
EndProcedure

#EndRegion

#EndRegion

#Region GroupTitleDecorations

&AtClient
Procedure DecorationGroupTitleCollapsedPictureClick(Item)
	DocSalesInvoiceClient.DecorationGroupTitleCollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleCollapsedLabelClick(Item)
	DocSalesInvoiceClient.DecorationGroupTitleCollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedPictureClick(Item)
	DocSalesInvoiceClient.DecorationGroupTitleUncollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedLabelClick(Item)
	DocSalesInvoiceClient.DecorationGroupTitleUncollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

#EndRegion

#Region Commands

&AtClient
Procedure OpenPickupItems(Command)
	DocSalesInvoiceClient.OpenPickupItems(Object, ThisObject, Command);
EndProcedure

&AtClient
Procedure SearchByBarcode(Command)
	DocSalesInvoiceClient.SearchByBarcode(Command, Object, ThisObject);
EndProcedure

&AtClient
Procedure SelectShipmentConfirmation(Command)
	CommandParameters = New Structure("Company, Partner, LegalName, Agreement, Currency, PriceIncludeTax");
	FillPropertyValues(CommandParameters, Object);
	ExistingShipArray = New Array();
	For Each Row In Object.ItemList Do
		If ExistingShipArray.Find(Row.ShipmentConfirmation) = Undefined Then
			ExistingShipArray.Add(Row.ShipmentConfirmation);
		EndIf;
	EndDo;
	CommandParameters.Insert("ExistingShipArray", ExistingShipArray);
	InfoShipmentConfirmation = DocSalesInvoiceServer.GetInfoShipmentConfirmationBeforeSalesInvoice(CommandParameters);
	
	FormParameters = New Structure("InfoShipmentConfirmations", InfoShipmentConfirmation.Tree);
	OpenForm("Document.SalesInvoice.Form.SelectShipmentConfirmationsForm"
		, FormParameters, , , ,
		, New NotifyDescription("SelectShipmentConfirmationsContinue", ThisObject,
			New Structure("InfoShipmentConfirmation",
				InfoShipmentConfirmation)));
EndProcedure

&AtClient
Procedure SelectSalesOrders(Command)
	FilterValues = New Structure("Company, Partner, LegalName, Agreement, Currency, PriceIncludeTax, Ref");
	FillPropertyValues(FilterValues, Object);
	
	ExistingRows = New Array;
	For Each Row In Object.ItemList Do
		RowStructure = New Structure("Key, Unit, Quantity");
		FillPropertyValues(RowStructure, Row);
		ExistingRows.Add(RowStructure);
	EndDo;
	
	FormParameters = New Structure("FilterValues, ExistingRows", FilterValues, ExistingRows);
	OpenForm("Document.SalesInvoice.Form.SelectSalesOrdersForm"
		, FormParameters, , , ,
		, New NotifyDescription("SelectSalesOrdersContinue", ThisObject));
EndProcedure

&AtClient
Procedure SelectShipmentConfirmationsContinue(Result, AdditionalParameters) Export
	If Result = Undefined Then
		Return;
	EndIf;
	
	ArrayOfBasisDocuments = New Array();
	For Each Row In AdditionalParameters.InfoShipmentConfirmation.Linear Do
		If Result.Find(Row.ShipmentConfirmation) <> Undefined Then
			ArrayOfBasisDocuments.Add(Row);
		EndIf;
	EndDo;
	SelectShipmentConfirmationsFinish(ArrayOfBasisDocuments);
	DocSalesInvoiceClient.ItemListOnChange(Object, ThisObject, Items.ItemList);
EndProcedure

&AtServer
Procedure SelectShipmentConfirmationsFinish(ArrayOfBasisDocuments)
	DocSalesInvoiceServer.FillDocumentWithShipmentConfirmationArray(Object, ThisObject, ArrayOfBasisDocuments);
EndProcedure

&AtClient
Procedure SelectSalesOrdersContinue(Result, AdditionalParameters) Export
	If Result = Undefined Then
		Return;
	EndIf;
	
	SelectSalesOrdersContinueAtServer(Result, AdditionalParameters);
	
	DocSalesInvoiceClient.ItemListOnChange(Object, ThisObject, Items.ItemList);
EndProcedure

&AtServer
Procedure SelectSalesOrdersContinueAtServer(Result, AdditionalParameters)
	Settings = New Structure();
	Settings.Insert("Rows", New Array());
	Settings.Insert("CalculateSettings", New Structure());
	Settings.CalculateSettings = CalculationStringsClientServer.GetCalculationSettings(Settings.CalculateSettings);
	AgreementInfo = Catalogs.Agreements.GetAgreementInfo(Object.Agreement);
		
	For Each ResultRow In Result Do
		RowsByKey = Object.ItemList.FindRows(New Structure("Key", ResultRow.Key));
		If RowsByKey.Count() Then
			RowByKey = RowsByKey[0];
			ItemKeyUnit = CatItemsServer.GetItemKeyUnit(ResultRow.ItemKey);
			UnitFactorFrom = Catalogs.Units.GetUnitFactor(RowByKey.Unit, ItemKeyUnit);
			UnitFactorTo = Catalogs.Units.GetUnitFactor(ResultRow.Unit, ItemKeyUnit);
			FillPropertyValues(RowByKey, ResultRow, , "Quantity");
			RowByKey.Quantity = ?(UnitFactorTo = 0,
					0,
					RowByKey.Quantity * UnitFactorFrom / UnitFactorTo) + ResultRow.Quantity;
			RowByKey.PriceType = ResultRow.PriceType;
			RowByKey.Price = ResultRow.Price;
			Settings.Rows.Add(RowByKey);
		Else
			NewRow = Object.ItemList.Add();
			FillPropertyValues(NewRow, ResultRow);
			NewRow.PriceType = ResultRow.PriceType;
			NewRow.Price = ResultRow.Price;
			Settings.Rows.Add(NewRow);
		EndIf;
	EndDo;
	
	TaxInfo = Undefined;
	SavedData = TaxesClientServer.GetSavedData(ThisObject, TaxesServer.GetAttributeNames().CacheName);
	If SavedData.Property("ArrayOfColumnsInfo") Then
		TaxInfo = SavedData.ArrayOfColumnsInfo;
	EndIf;
	CalculationStringsClientServer.CalculateItemsRows(Object,
		ThisObject,
		Settings.Rows,
		Settings.CalculateSettings,
		TaxInfo);
EndProcedure

#EndRegion

#Region Taxes
&AtClient
Procedure TaxValueOnChange(Item) Export
    CurrentData = Items.ItemList.CurrentData;
    If CurrentData = Undefined Then
        Return;
    EndIf;
    PutToTaxTable_(Item.Name, CurrentData.Key, CurrentData[Item.Name]);
    Settings = New Structure();
    Settings.Insert("Rows", New Array());
    Settings.Insert("CalculateSettings");
    Settings.CalculateSettings = New Structure("CalculateTax");
    Settings.Rows.Add(CurrentData);
    DocumentsClient.ItemListCalculateRowsAmounts(Object, ThisObject, Settings);
EndProcedure

&AtServer
Procedure PutToTaxTable_(ItemName, Key, Value) Export
    TaxesServer.PutToTaxTableByColumnName(ThisObject, Key, ItemName, Value);
EndProcedure

&AtClient
Procedure TaxTreeBeforeAddRow(Item, Cancel, Clone, Parent, IsFolder, Parameter)
    Cancel = True;
EndProcedure

&AtClient
Procedure TaxTreeOnChange(Item)
    CurrentData = Items.TaxTree.CurrentData;
    If CurrentData = Undefined Then
        Return;
    EndIf;
    Filter = TaxesClient.ChangeTaxAmount(Object, ThisObject, CurrentData, Object.ItemList);
    Taxes_CreateTaxTree();
    TaxesClient.ExpandTaxTree(ThisObject.Items.TaxTree, ThisObject.TaxTree.GetItems());
    ThisObject.Items.TaxTree.CurrentRow = TaxesClient.FindRowInTree(Filter, ThisObject.TaxTree);
EndProcedure

&AtClient
Procedure TaxTreeBeforeDeleteRow(Item, Cancel)
    Cancel = True;
EndProcedure

&AtServer
Procedure Taxes_CreateFormControls() Export
    TaxesParameters = TaxesServer.GetCreateFormControlsParameters();
    TaxesParameters.Date = Object.Date;
    TaxesParameters.Company = Object.Company;
    TaxesParameters.PathToTable = "Object.ItemList";
    TaxesParameters.ItemParent = ThisObject.Items.ItemList;
    TaxesParameters.ColumnOffset = ThisObject.Items.ItemListOffersAmount;
    TaxesParameters.ItemListName = "ItemList";
    TaxesParameters.TaxListName = "TaxList";
    TaxesParameters.TotalAmountColumnName = "ItemListTotalAmount";
    TaxesServer.CreateFormControls(Object, ThisObject, TaxesParameters);
EndProcedure

&AtServer
Procedure Taxes_CreateTaxTree() Export
    TaxesTreeParameters = TaxesServer.GetCreateTaxTreeParameters();
    TaxesTreeParameters.MetadataMainList = Metadata.Documents.SalesInvoice.TabularSections.ItemList;
    TaxesTreeParameters.MetadataTaxList = Metadata.Documents.SalesInvoice.TabularSections.TaxList;
    TaxesTreeParameters.ObjectMainList = Object.ItemList;
    TaxesTreeParameters.ObjectTaxList = Object.TaxList;
    TaxesTreeParameters.MainListColumns = "Key, Item, ItemKey";
    TaxesTreeParameters.Level1Columns = "Tax";
    TaxesTreeParameters.Level2Columns = "Key, Item, ItemKey, TaxRate";
    TaxesTreeParameters.Level3Columns = "Key, Analytics";
    TaxesServer.CreateTaxTree(Object, ThisObject, TaxesTreeParameters);
EndProcedure

#EndRegion

#Region Currencies

#Region Currencies_Library_Loader

&AtServerNoContext
Function Currencies_GetDeclaration(Object, Form)
	Declaration = LibraryLoader.GetDeclarationInfo();
	Declaration.LibraryName = "LibraryCurrencies";
	
	LibraryLoader.AddActionHandler(Declaration, "Currencies_OnOpen", "OnOpen", Form);
	LibraryLoader.AddActionHandler(Declaration, "Currencies_AfterWriteAtServer", "AfterWriteAtServer", Form);
	LibraryLoader.AddActionHandler(Declaration, "Currencies_AfterWrite", "AfterWrite", Form);
	LibraryLoader.AddActionHandler(Declaration, "Currencies_NotificationProcessing", "NotificationProcessing", Form);
	
	ArrayOfItems_MainTableAmount = New Array();
	ArrayOfItems_MainTableAmount.Add(Form.Items.ItemList);
	LibraryLoader.AddActionHandler(Declaration, "Currencies_MainTableAmountOnChange", "OnChange", ArrayOfItems_MainTableAmount);
	
	ArrayOfItems_Header = New Array();
	ArrayOfItems_Header.Add(Form.Items.Partner);
	ArrayOfItems_Header.Add(Form.Items.LegalName);
	ArrayOfItems_Header.Add(Form.Items.Agreement);
	ArrayOfItems_Header.Add(Form.Items.Company);
	ArrayOfItems_Header.Add(Form.Items.Date);
	ArrayOfItems_Header.Add(Form.Items.Currency);
	LibraryLoader.AddActionHandler(Declaration, "Currencies_HeaderOnChange", "OnChange", ArrayOfItems_Header);
	
	Columns = CurrenciesClientServer.GetPropertiesForReplace();
	Columns.Amount = "TotalAmount";
	TableColumns = New Structure("ItemList", Columns);
	
	LibraryData = New Structure();
	LibraryData.Insert("TableColumns", TableColumns);
	LibraryData.Insert("MainTableName", "ItemList");
	LibraryData.Insert("Version", "2.0");
	LibraryLoader.PutData(Declaration, LibraryData);
	Return Declaration;
EndFunction

#Region Currencies_Event_Handlers

&AtClient
Procedure Currencies_OnOpen(Cancel, AddInfo = Undefined) Export
	CurrenciesClientServer.OnOpen(Object, ThisObject, Cancel, AddInfo);
EndProcedure

&AtServer
Procedure Currencies_AfterWriteAtServer(CurrentObject, WriteParameters, AddInfo = Undefined) Export
	CurrenciesClientServer.AfterWriteAtServer(Object, ThisObject, CurrentObject, WriteParameters, AddInfo);
EndProcedure
	
&AtClient
Procedure Currencies_AfterWrite(WriteParameters, AddInfo = Undefined) Export
	CurrenciesClientServer.AfterWrite(Object, ThisObject, WriteParameters, AddInfo);
EndProcedure

&AtClient
Procedure Currencies_NotificationProcessing(EventName, Parameter, Source, AddInfo = Undefined) Export
	CommonFunctionsClientServer.PutToAddInfo(AddInfo, "Currencies_CurrentTableName", "ItemList");
	CurrenciesClientServer.NotificationProcessing(Object, ThisObject, EventName, Parameter, Source, AddInfo);
EndProcedure

&AtClient
Procedure Currencies_MainTableAmountOnChange(Item, AddInfo = Undefined) Export
	CommonFunctionsClientServer.PutToAddInfo(AddInfo, "Currencies_CurrentTableName", "ItemList");
	CurrenciesClientServer.MainTableAmountOnChange(Object, ThisObject, Item, AddInfo);
EndProcedure

&AtClient
Procedure Currencies_HeaderOnChange(Item, AddInfo = Undefined) Export
	ArrayOfTableNames = New Array();
	ArrayOfTableNames.Add("ItemList");
	CommonFunctionsClientServer.PutToAddInfo(AddInfo, "Currencies_ArrayOfTableNames", ArrayOfTableNames);
	CommonFunctionsClientServer.PutToAddInfo(AddInfo, "Currencies_CurrentTableName", "ItemList");
	CurrenciesClientServer.HeaderOnChange(Object, ThisObject, Item, AddInfo);
EndProcedure

#EndRegion

#EndRegion

#Region Currencies_TableCurrencies_Events

&AtClient
Procedure CurrenciesSelection(Item, RowSelected, Field, StandardProcessing)
	CurrenciesClient.CurrenciesTable_Selection(Object, ThisObject, Item, RowSelected, Field, StandardProcessing);
EndProcedure

&AtClient
Procedure CurrenciesBeforeAddRow(Item, Cancel, Clone, Parent, IsFolder, Parameter)
	Cancel = True;
EndProcedure

&AtClient
Procedure CurrenciesBeforeDeleteRow(Item, Cancel)
	Cancel = True;
EndProcedure

&AtClient
Procedure CurrenciesRatePresentationOnChange(Item)
	CurrenciesClient.CurrenciesTable_RatePresentationOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure CurrenciesMultiplicityOnChange(Item)
	CurrenciesClient.CurrenciesTable_MultiplicityOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure CurrenciesAmountOnChange(Item)
	CurrenciesClient.CurrenciesTable_AmountOnChange(Object, ThisObject, Item);
EndProcedure

#EndRegion

#Region Currencies_Server_API

&AtServer
Procedure Currencies_SetVisibleCurrenciesRow(RowKey, IgnoreRowKey = False) Export
	CurrenciesServer.SetVisibleCurrenciesRow(Object, RowKey, IgnoreRowKey);
EndProcedure

&AtServer
Procedure Currencies_ClearCurrenciesTable(RowKey = Undefined) Export
	CurrenciesServer.ClearCurrenciesTable(Object, RowKey);
EndProcedure

&AtServer
Procedure Currencies_FillCurrencyTable(RowKey, Currency, AgreementInfo) Export
	CurrenciesServer.FillCurrencyTable(Object, 
	                                   Object.Date, 
	                                   Object.Company, 
	                                   Currency, 
	                                   RowKey,
	                                   AgreementInfo);
EndProcedure

&AtServer
Procedure Currencies_UpdateRatePresentation() Export
	CurrenciesServer.UpdateRatePresentation(Object);
EndProcedure

&AtServer
Procedure Currencies_CalculateAmount(Amount, RowKey) Export
	CurrenciesServer.CalculateAmount(Object, Amount, RowKey);
EndProcedure

&AtServer
Procedure Currencies_CalculateRate(Amount, MovementType, RowKey) Export
	CurrenciesServer.CalculateRate(Object, Amount, MovementType, RowKey);
EndProcedure

#EndRegion

#EndRegion

#Region AddAttributes

&AtClient
Procedure AddAttributeStartChoice(Item, ChoiceData, StandardProcessing) Export
	AddAttributesAndPropertiesClient.AddAttributeStartChoice(ThisObject, Item, StandardProcessing);
EndProcedure

&AtServer
Procedure AddAttributesCreateFormControl()
	AddAttributesAndPropertiesServer.CreateFormControls(ThisObject, "GroupOther");
EndProcedure

#EndRegion

#Region ExternalCommands

&AtClient
Procedure GeneratedFormCommandActionByName(Command) Export
	ExternalCommandsClient.GeneratedFormCommandActionByName(Object, ThisObject, Command.Name);
	GeneratedFormCommandActionByNameServer(Command.Name);	
EndProcedure

&AtServer
Procedure GeneratedFormCommandActionByNameServer(CommandName) Export
	ExternalCommandsServer.GeneratedFormCommandActionByName(Object, ThisObject, CommandName);
EndProcedure

#EndRegion