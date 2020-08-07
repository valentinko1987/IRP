﻿#Region FormEvents

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)
	DocInternalSupplyRequestServer.OnCreateAtServer(Object, ThisObject, Cancel, StandardProcessing);
EndProcedure

&AtServer
Procedure OnReadAtServer(CurrentObject)
	DocInternalSupplyRequestServer.OnReadAtServer(Object, ThisObject, CurrentObject);
EndProcedure

&AtServer
Procedure AfterWriteAtServer(CurrentObject, WriteParameters)
	DocInternalSupplyRequestServer.AfterWriteAtServer(Object, ThisObject, CurrentObject, WriteParameters);
EndProcedure

&AtClient
Procedure OnOpen(Cancel)
	DocInternalSupplyRequestClient.OnOpen(Object, ThisObject, Cancel);
EndProcedure

&AtServer
Procedure OnWriteAtServer(Cancel, CurrentObject, WriteParameters)
	DocumentsServer.OnWriteAtServer(Object, ThisObject, Cancel, CurrentObject, WriteParameters);
EndProcedure

#EndRegion

&AtClient
Procedure OpenPickupItems(Command)
	DocInternalSupplyRequestClient.OpenPickupItems(Object, ThisObject, Command);
EndProcedure

#Region ItemCompany

&AtClient
Procedure CompanyStartChoice(Item, ChoiceData, StandardProcessing)
	DocInternalSupplyRequestClient.CompanyStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure CompanyOnChange(Item)
	DocInternalSupplyRequestClient.CompanyOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure CompanyEditTextChange(Item, Text, StandardProcessing)
	DocInternalSupplyRequestClient.CompanyEditTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region ItemListItem

&AtClient
Procedure ItemListItemStartChoice(Item, ChoiceData, StandardProcessing)
	DocInternalSupplyRequestClient.ItemListItemStartChoice(Object, ThisObject, Item, ChoiceData, StandardProcessing);
EndProcedure

&AtClient
Procedure ItemListItemEditTextChange(Item, Text, StandardProcessing)
	DocInternalSupplyRequestClient.ItemListItemEditTextChange(Object, ThisObject, Item, Text, StandardProcessing);
EndProcedure

&AtClient
Procedure ItemListItemOnChange(Item)
	DocInternalSupplyRequestClient.ItemListItemOnChange(Object, ThisObject, Item);
EndProcedure

#EndRegion

&AtClient
Procedure ItemListOnChange(Item, AddInfo = Undefined) Export
	DocInternalSupplyRequestClient.ItemListOnChange(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure ItemListOnStartEdit(Item, NewRow, Clone)
	If Clone Then
		Item.CurrentData.Key = New UUID();
	EndIf;
EndProcedure

&AtClient
Procedure ItemListItemKeyOnChange(Item)
	CurrentRow = Items.ItemList.CurrentData;
	If CurrentRow = Undefined Then
		Return;
	EndIf;
	
	CalculationSettings = New Structure();
	CalculationSettings.Insert("UpdateUnit");
	CalculationStringsClientServer.CalculateItemsRow(Object,
		CurrentRow,
		CalculationSettings);
EndProcedure

&AtClient
Procedure StoreOnChange(Item)
	DocInternalSupplyRequestClient.StoreOnChange(Object, ThisObject, Item);
EndProcedure

#Region GroupTitleDecorations

&AtClient
Procedure DecorationGroupTitleCollapsedPictureClick(Item)
	DocInternalSupplyRequestClient.DecorationGroupTitleCollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleCollapsedLabelClick(Item)
	DocInternalSupplyRequestClient.DecorationGroupTitleCollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedPictureClick(Item)
	DocInternalSupplyRequestClient.DecorationGroupTitleUncollapsedPictureClick(Object, ThisObject, Item);
EndProcedure

&AtClient
Procedure DecorationGroupTitleUncollapsedLabelClick(Item)
	DocInternalSupplyRequestClient.DecorationGroupTitleUncollapsedLabelClick(Object, ThisObject, Item);
EndProcedure

#EndRegion

&AtClient
Procedure SearchByBarcode(Command)
	DocInternalSupplyRequestClient.SearchByBarcode(Command, Object, ThisObject);
EndProcedure

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