﻿#language: en
@tree
@Positive
@Movements
@MovementsCashReceipt

Feature: check Cash receipt movements


Background:
	Given I launch TestClient opening script or connect the existing one



Scenario: _043600 preparation (Cash receipt)
	When set True value to the constant
	And I close TestClient session
	Given I open new TestClient session or connect the existing one
	* Load info
		When Create information register Barcodes records
		When Create catalog Companies objects (own Second company)
		When Create catalog Agreements objects
		When Create catalog ObjectStatuses objects
		When Create catalog ItemKeys objects
		When Create catalog ItemTypes objects
		When Create catalog Units objects
		When Create catalog Items objects
		When Create catalog PriceTypes objects
		When Create catalog Specifications objects
		When Create chart of characteristic types AddAttributeAndProperty objects
		When Create catalog AddAttributeAndPropertySets objects
		When Create catalog AddAttributeAndPropertyValues objects
		When Create catalog Currencies objects
		When Create catalog Companies objects (Main company)
		When Create catalog Stores objects
		When Create catalog Partners objects
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog PartnerSegments objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog TaxRates objects
		When Create catalog Taxes objects	
		When Create information register TaxSettings records
		When Create information register PricesByItemKeys records
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		When Create catalog BusinessUnits objects
		When Create catalog ExpenseAndRevenueTypes objects
		When Create catalog Companies objects (second company Ferron BP)
		When Create catalog PartnersBankAccounts objects
		When update ItemKeys
		When Create catalog SerialLotNumbers objects
		When Create catalog CashAccounts objects
	* Add plugin for taxes calculation
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "TaxCalculateVAT_TR" |
			When add Plugin for tax calculation
		When Create information register Taxes records (VAT)
	* Tax settings
		When filling in Tax settings for company
	When Create Document discount
	* Add plugin for discount
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "DocumentDiscount" |
			When add Plugin for document discount
			When Create catalog CancelReturnReasons objects
	* Load documents
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '1' |
			| '3' |	
			When Create document SalesOrder objects (check movements, SC before SI, Use shipment sheduling)
			When Create document SalesOrder objects (check movements, SI before SC, not Use shipment sheduling)
			And I execute 1C:Enterprise script at server
				| "Documents.SalesOrder.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.SalesOrder.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '2' |
			| '3' |	
			When Create document ShipmentConfirmation objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.ShipmentConfirmation.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.ShipmentConfirmation.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '1' |
			| '3' |	
			When Create document SalesInvoice objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.SalesInvoice.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.SalesInvoice.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '102' |
			When Create document SalesReturnOrder objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.SalesReturnOrder.FindByNumber(102).GetObject().Write(DocumentWriteMode.Posting);" |
			And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '101' |
			| '104' |
			When Create document SalesReturn objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.SalesReturn.FindByNumber(101).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.SalesReturn.FindByNumber(104).GetObject().Write(DocumentWriteMode.Posting);" |
	* Load Cash receipt
		When Create document CashReceipt objects (check movements)
		And I execute 1C:Enterprise script at server
			| "Documents.CashReceipt.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashReceipt.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashReceipt.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
		And I close all client application windows



Scenario: _043601 check Cash receipt movements by the Register "R3010 Cash on hand"
	* Select Cash receipt
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
	* Check movements by the Register  "R3010 Cash on hand" 
		And I click "Registrations report" button
		And I select "R3010 Cash on hand" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash receipt 2 dated 05.04.2021 14:34:09' | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| 'Document registrations records'           | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| 'Register  "R3010 Cash on hand"'           | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| ''                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'   | ''             | ''         | ''                             | 'Attributes'           |
			| ''                                         | ''            | ''                    | 'Amount'    | 'Company'      | 'Account'      | 'Currency' | 'Multi currency movement type' | 'Deferred calculation' |
			| ''                                         | 'Receipt'     | '05.04.2021 14:34:09' | '500'       | 'Main Company' | 'Cash desk №2' | 'USD'      | 'Reporting currency'           | 'No'                   |
			| ''                                         | 'Receipt'     | '05.04.2021 14:34:09' | '500'       | 'Main Company' | 'Cash desk №2' | 'USD'      | 'en description is empty'      | 'No'                   |
			| ''                                         | 'Receipt'     | '05.04.2021 14:34:09' | '2 813,75'  | 'Main Company' | 'Cash desk №2' | 'TRY'      | 'Local currency'               | 'No'                   |
	And I close all client application windows

	
Scenario: _043602 check Cash receipt movements by the Register "R5010 Reconciliation statement" (payment to vendor)
	* Select Cash receipt
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '1' |
	* Check movements by the Register  "R5010 Reconciliation statement" 
		And I click "Registrations report" button
		And I select "R5010 Reconciliation statement" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash receipt 1 dated 05.04.2021 14:33:49'   | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| 'Document registrations records'             | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| 'Register  "R5010 Reconciliation statement"' | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| ''                                           | 'Record type' | 'Period'              | 'Resources' | 'Dimensions' | ''             | ''                  |
			| ''                                           | ''            | ''                    | 'Amount'    | 'Currency'   | 'Company'      | 'Legal name'        |
			| ''                                           | 'Expense'     | '05.04.2021 14:33:49' | '800'       | 'TRY'        | 'Main Company' | 'Company Ferron BP' |
	And I close all client application windows


Scenario: _043630 Cash receipt clear posting/mark for deletion
	And I close all client application windows
	* Select Cash receipt
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
	* Clear posting
		And in the table "List" I click the button named "ListContextMenuUndoPosting"
		Then user message window does not contain messages
		And I click "Registrations report" button
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash receipt 2 dated 05.04.2021 14:34:09' |
			| 'Document registrations records'                    |
		And I close current window
	* Post Cash receipt
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
		And in the table "List" I click the button named "ListContextMenuPost"		
		Then user message window does not contain messages
		And I click "Registrations report" button
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document contains values
			| 'R3010 Cash on hand' |
		And I close all client application windows
	* Mark for deletion
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
		And in the table "List" I click the button named "ListContextMenuSetDeletionMark"
		Then "1C:Enterprise" window is opened
		And I click "Yes" button
		Then user message window does not contain messages
		And I click "Registrations report" button
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash receipt 2 dated 05.04.2021 14:34:09' |
			| 'Document registrations records'                    |
		And I close current window
	* Unmark for deletion and post document
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
		And in the table "List" I click the button named "ListContextMenuSetDeletionMark"
		Then "1C:Enterprise" window is opened
		And I click "Yes" button				
		Then user message window does not contain messages
		And in the table "List" I click the button named "ListContextMenuPost"	
		Then user message window does not contain messages
		And I click "Registrations report" button
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document contains values
			| 'R3010 Cash on hand' |
		And I close all client application windows		

