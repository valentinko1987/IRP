﻿#language: en
@tree
@Positive
@Movements
@MovementsCashPayment

Feature: check Cash payment movements


Background:
	Given I launch TestClient opening script or connect the existing one



Scenario: _043500 preparation (Cash payment)
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
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '115' |
			When Create document PurchaseOrder objects (check movements, GR before PI, Use receipt sheduling)
			And I execute 1C:Enterprise script at server
				| "Documents.PurchaseOrder.FindByNumber(115).GetObject().Write(DocumentWriteMode.Posting);" |
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '115' |
			| '116' |
			When Create document PurchaseInvoice objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.PurchaseInvoice.FindByNumber(115).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.PurchaseInvoice.FindByNumber(116).GetObject().Write(DocumentWriteMode.Posting);" |
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		If "List" table does not contain lines Then
			| 'Number'  |
			| '115' |
			| '116' |
			When Create document GoodsReceipt objects (check movements)
			And I execute 1C:Enterprise script at server
				| "Documents.GoodsReceipt.FindByNumber(115).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.GoodsReceipt.FindByNumber(116).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document CashTransferOrder objects
		When Create document CashTransferOrder objects (check movements)
		And I execute 1C:Enterprise script at server
			| "Documents.CashTransferOrder.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashTransferOrder.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashTransferOrder.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashTransferOrder.FindByNumber(4).GetObject().Write(DocumentWriteMode.Posting);" |
	* Load Cash payment
		When Create document CashPayment objects (payment to vendor without basis document)
		When Create document CashPayment objects (exchange and transfer)
		And I execute 1C:Enterprise script at server
			| "Documents.CashPayment.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashPayment.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashPayment.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
		And I close all client application windows


Scenario: _043501 check Cash payment movements by the Register "R3010 Cash on hand"
	* Select Cash payment
		Given I open hyperlink "e1cib/list/Document.CashPayment"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
	* Check movements by the Register  "R3010 Cash on hand" 
		And I click "Registrations report" button
		And I select "R3010 Cash on hand" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash payment 2 dated 05.04.2021 12:40:18' | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| 'Document registrations records'           | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| 'Register  "R3010 Cash on hand"'           | ''            | ''                    | ''          | ''             | ''             | ''         | ''                             | ''                     |
			| ''                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'   | ''             | ''         | ''                             | 'Attributes'           |
			| ''                                         | ''            | ''                    | 'Amount'    | 'Company'      | 'Account'      | 'Currency' | 'Multi currency movement type' | 'Deferred calculation' |
			| ''                                         | 'Expense'     | '05.04.2021 12:40:18' | '500'       | 'Main Company' | 'Cash desk №1' | 'USD'      | 'Reporting currency'           | 'No'                   |
			| ''                                         | 'Expense'     | '05.04.2021 12:40:18' | '500'       | 'Main Company' | 'Cash desk №1' | 'USD'      | 'en description is empty'      | 'No'                   |
			| ''                                         | 'Expense'     | '05.04.2021 12:40:18' | '2 813,75'  | 'Main Company' | 'Cash desk №1' | 'TRY'      | 'Local currency'               | 'No'                   |
	And I close all client application windows

	
Scenario: _043502 check Cash payment movements by the Register "R5010 Reconciliation statement" (payment to vendor)
	* Select Cash payment
		Given I open hyperlink "e1cib/list/Document.CashPayment"
		And I go to line in "List" table
			| 'Number'  |
			| '1' |
	* Check movements by the Register  "R5010 Reconciliation statement" 
		And I click "Registrations report" button
		And I select "R5010 Reconciliation statement" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash payment 1 dated 05.04.2021 12:40:00'   | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| 'Document registrations records'             | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| 'Register  "R5010 Reconciliation statement"' | ''            | ''                    | ''          | ''           | ''             | ''                  |
			| ''                                           | 'Record type' | 'Period'              | 'Resources' | 'Dimensions' | ''             | ''                  |
			| ''                                           | ''            | ''                    | 'Amount'    | 'Currency'   | 'Company'      | 'Legal name'        |
			| ''                                           | 'Receipt'     | '05.04.2021 12:40:00' | '1 000'     | 'TRY'        | 'Main Company' | 'Company Ferron BP' |
	And I close all client application windows


Scenario: _043530 Cash payment clear posting/mark for deletion
	And I close all client application windows
	* Select Cash payment
		Given I open hyperlink "e1cib/list/Document.CashPayment"
		And I go to line in "List" table
			| 'Number'  |
			| '2' |
	* Clear posting
		And in the table "List" I click the button named "ListContextMenuUndoPosting"
		Then user message window does not contain messages
		And I click "Registrations report" button
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Cash payment 2 dated 05.04.2021 12:40:18' |
			| 'Document registrations records'                    |
		And I close current window
	* Post Cash payment
		Given I open hyperlink "e1cib/list/Document.CashPayment"
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
		Given I open hyperlink "e1cib/list/Document.CashPayment"
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
			| 'Cash payment 2 dated 05.04.2021 12:40:18' |
			| 'Document registrations records'                    |
		And I close current window
	* Unmark for deletion and post document
		Given I open hyperlink "e1cib/list/Document.CashPayment"
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
