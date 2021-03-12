﻿#language: en
@tree
@Positive
@Movements
@MovementsInventoryTransfer


Feature: check Inventory transfer order movements



Background:
	Given I launch TestClient opening script or connect the existing one



Scenario: _04022 preparation (Inventory transfer)
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
	* Load PO, ISR, ITO
		When Create document PurchaseOrder objects (check movements, GR before PI, Use receipt sheduling)
		When Create document InternalSupplyRequest objects (check movements)
		And I execute 1C:Enterprise script at server
				| "Documents.InternalSupplyRequest.FindByNumber(117).GetObject().Write(DocumentWriteMode.Posting);" |	
		When Create document PurchaseOrder objects (check movements, PI before GR, not Use receipt sheduling)
		And I execute 1C:Enterprise script at server
			| "Documents.PurchaseOrder.FindByNumber(115).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document InventoryTransferOrder objects (check movements)
		And I execute 1C:Enterprise script at server
			| "Documents.InventoryTransferOrder.FindByNumber(21).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.InventoryTransferOrder.FindByNumber(201).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.InventoryTransferOrder.FindByNumber(202).GetObject().Write(DocumentWriteMode.Posting);" |
	* Load Inventory transfer document
		When Create document InventoryTransfer objects (check movements)
		And I execute 1C:Enterprise script at server
 			| "Documents.InventoryTransfer.FindByNumber(21).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.InventoryTransfer.FindByNumber(201).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.InventoryTransfer.FindByNumber(202).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.InventoryTransfer.FindByNumber(203).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.InventoryTransfer.FindByNumber(204).GetObject().Write(DocumentWriteMode.Posting);" |



Scenario: _0402301 check Inventory transfer movements by the Register  "R4050 Stock inventory"
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '21' |
	* Check movements by the Register  "R4050 Stock inventory"
		And I click "Registrations report" button
		And I select "R4050 Stock inventory" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 21 dated 01.03.2021 09:54:36' | ''            | ''       | ''          | ''           | ''         | ''          |
			| 'Document registrations records'                  | ''            | ''       | ''          | ''           | ''         | ''          |
			| 'Register  "R4050 Stock inventory"'               | ''            | ''       | ''          | ''           | ''         | ''          |
			| ''                                                | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''         | ''          |
			| ''                                                | ''            | ''       | 'Quantity'  | 'Company'    | 'Store'    | 'Item key'  |
			| ''                                                | 'Receipt'     | '*'      | '2'         | ''           | 'Store 03' | '36/Yellow' |
			| ''                                                | 'Receipt'     | '*'      | '10'        | ''           | 'Store 03' | 'S/Yellow'  |
			| ''                                                | 'Receipt'     | '*'      | '10'        | ''           | 'Store 03' | 'XS/Blue'   |
			| ''                                                | 'Receipt'     | '*'      | '15'        | ''           | 'Store 03' | '36/Red'    |
			| ''                                                | 'Expense'     | '*'      | '2'         | ''           | 'Store 02' | '36/Yellow' |
			| ''                                                | 'Expense'     | '*'      | '10'        | ''           | 'Store 02' | 'S/Yellow'  |
			| ''                                                | 'Expense'     | '*'      | '10'        | ''           | 'Store 02' | 'XS/Blue'   |
			| ''                                                | 'Expense'     | '*'      | '15'        | ''           | 'Store 02' | '36/Red'    |
		And I close all client application windows

Scenario: _0402303 check Inventory transfer movements by the Register  "R4010 Actual stocks" (Use SC and Use GR)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '21' |
	* Check movements by the Register  "R4010 Actual stocks"
		And I click "Registrations report" button
		And I select "R4010 Actual stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4010 Actual stocks"'                         |
		And I close all client application windows

Scenario: _0402304 check Inventory transfer movements by the Register  "R4010 Actual stocks" (not Use SC)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '203' |
	* Check movements by the Register  "R4010 Actual stocks"
		And I click "Registrations report" button
		And I select "R4010 Actual stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 203 dated 01.03.2021 10:04:14' | ''            | ''       | ''          | ''           | ''          |
			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''          |
			| 'Register  "R4010 Actual stocks"'                  | ''            | ''       | ''          | ''           | ''          |
			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''          |
			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Item key'  |
			| ''                                                 | 'Expense'     | '*'      | '2'         | 'Store 02'   | '36/Yellow' |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'S/Yellow'  |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'XS/Blue'   |
			| ''                                                 | 'Expense'     | '*'      | '15'        | 'Store 02'   | '36/Red'    |
		And I close all client application windows

Scenario: _0402305 check Inventory transfer movements by the Register  "R4010 Actual stocks" (not Use SC not Use GR)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4010 Actual stocks"
		And I click "Registrations report" button
		And I select "R4010 Actual stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 201 dated 01.03.2021 09:55:16' | ''            | ''       | ''          | ''           | ''          |
			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''          |
			| 'Register  "R4010 Actual stocks"'                  | ''            | ''       | ''          | ''           | ''          |
			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''          |
			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Item key'  |
			| ''                                                 | 'Receipt'     | '*'      | '2'         | 'Store 03'   | '36/Yellow' |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'S/Yellow'  |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'XS/Blue'   |
			| ''                                                 | 'Receipt'     | '*'      | '15'        | 'Store 03'   | '36/Red'    |
			| ''                                                 | 'Expense'     | '*'      | '2'         | 'Store 02'   | '36/Yellow' |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'S/Yellow'  |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'XS/Blue'   |
			| ''                                                 | 'Expense'     | '*'      | '15'        | 'Store 02'   | '36/Red'    |
		And I close all client application windows
		
Scenario: _0402408 check Inventory transfer movements by the Register  "R4011 Free stocks" (Use SC and Use GR)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '21' |
	* Check movements by the Register  "R4011 Free stocks"
		And I click "Registrations report" button
		And I select "R4011 Free stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4011 Free stocks"'                     |	
		And I close all client application windows

Scenario: _0402409 check Inventory transfer movements by the Register  "R4011 Free stocks" (not Use SC)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '203' |
	* Check movements by the Register  "R4011 Free stocks"
		And I click "Registrations report" button
		And I select "R4011 Free stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 203 dated 01.03.2021 10:04:14' | ''            | ''       | ''          | ''           | ''          |
			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''          |
			| 'Register  "R4011 Free stocks"'                    | ''            | ''       | ''          | ''           | ''          |
			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''          |
			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Item key'  |
			| ''                                                 | 'Expense'     | '*'      | '2'         | 'Store 02'   | '36/Yellow' |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'S/Yellow'  |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'XS/Blue'   |
			| ''                                                 | 'Expense'     | '*'      | '15'        | 'Store 02'   | '36/Red'    |
		And I close all client application windows

		

Scenario: _0402410 check Inventory transfer movements by the Register  "R4011 Free stocks" (not Use SC not Use GR without ITO)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '204' |
	* Check movements by the Register  "R4011 Free stocks"
		And I click "Registrations report" button
		And I select "R4011 Free stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 204 dated 01.03.2021 10:32:49' | ''            | ''       | ''          | ''           | ''          |
			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''          |
			| 'Register  "R4011 Free stocks"'                    | ''            | ''       | ''          | ''           | ''          |
			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''          |
			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Item key'  |
			| ''                                                 | 'Receipt'     | '*'      | '2'         | 'Store 03'   | '36/Yellow' |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'S/Yellow'  |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'XS/Blue'   |
			| ''                                                 | 'Receipt'     | '*'      | '15'        | 'Store 03'   | '36/Red'    |
			| ''                                                 | 'Expense'     | '*'      | '2'         | 'Store 02'   | '36/Yellow' |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'S/Yellow'  |
			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'XS/Blue'   |
			| ''                                                 | 'Expense'     | '*'      | '15'        | 'Store 02'   | '36/Red'    |
		And I close all client application windows

Scenario: _0402411 check Inventory transfer movements by the Register  "R4011 Free stocks" (not Use SC not Use GR with ITO)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4011 Free stocks"
		And I click "Registrations report" button
		And I select "R4011 Free stocks" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 201 dated 01.03.2021 09:55:16' | ''            | ''                    | ''          | ''           | ''          |
			| 'Document registrations records'                   | ''            | ''                    | ''          | ''           | ''          |
			| 'Register  "R4011 Free stocks"'                    | ''            | ''                    | ''          | ''           | ''          |
			| ''                                                 | 'Record type' | 'Period'              | 'Resources' | 'Dimensions' | ''          |
			| ''                                                 | ''            | ''                    | 'Quantity'  | 'Store'      | 'Item key'  |
			| ''                                                 | 'Receipt'     | '01.03.2021 09:55:16' | '2'         | 'Store 03'   | '36/Yellow' |
			| ''                                                 | 'Receipt'     | '01.03.2021 09:55:16' | '10'        | 'Store 03'   | 'S/Yellow'  |
			| ''                                                 | 'Receipt'     | '01.03.2021 09:55:16' | '10'        | 'Store 03'   | 'XS/Blue'   |
			| ''                                                 | 'Receipt'     | '01.03.2021 09:55:16' | '15'        | 'Store 03'   | '36/Red'    |
		And I close all client application windows

// Scenario: _0402412 check Inventory transfer movements by the Register  "R4012 Stock Reservation" (not Use SC Use GR with ITO)
// 	* Select Inventory transfer
// 		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
// 		And I go to line in "List" table
// 			| 'Number'  |
// 			| '202' |
// 	* Check movements by the Register  "R4012 Stock Reservation"
// 		And I click "Registrations report" button
// 		And I select "R4012 Stock Reservation" exact value from "Register" drop-down list
// 		And I click "Generate report" button
// 		Then "ResultTable" spreadsheet document is equal
// 			| 'Inventory transfer 202 dated 01.03.2021 10:05:10' | ''            | ''       | ''          | ''           | ''          | ''                                                       |
// 			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''          | ''                                                       |
// 			| 'Register  "R4012 Stock Reservation"'              | ''            | ''       | ''          | ''           | ''          | ''                                                       |
// 			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''          | ''                                                       |
// 			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Item key'  | 'Order'                                                  |
// 			| ''                                                 | 'Expense'     | '*'      | '2'         | 'Store 02'   | '36/Yellow' | 'Inventory transfer order 202 dated 01.03.2021 10:04:57' |
// 			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'S/Yellow'  | 'Inventory transfer order 202 dated 01.03.2021 10:04:57' |
// 			| ''                                                 | 'Expense'     | '*'      | '10'        | 'Store 02'   | 'XS/Blue'   | 'Inventory transfer order 202 dated 01.03.2021 10:04:57' |
// 			| ''                                                 | 'Expense'     | '*'      | '15'        | 'Store 02'   | '36/Red'    | 'Inventory transfer order 202 dated 01.03.2021 10:04:57' |
// 		And I close all client application windows

Scenario: _0402412 check Inventory transfer movements by the Register  "R4012 Stock Reservation" (not Use SC Use GR without ITO)
	* Select Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '203' |
	* Check movements by the Register  "R4012 Stock Reservation"
		And I click "Registrations report" button
		And I select "R4012 Stock Reservation" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4012 Stock Reservation"'                     |	
		And I close all client application windows

Scenario: _0402415 check Inventory transfer movements by the Register  "R4031 Goods in transit (incoming)" (not Use SC use GR)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '203' |
	* Check movements by the Register  "R4031 Goods in transit (incoming)"
		And I click "Registrations report" button
		And I select "R4031 Goods in transit (incoming)" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 203 dated 01.03.2021 10:04:14' | ''            | ''       | ''          | ''           | ''                                                 | ''          |
			| 'Document registrations records'                   | ''            | ''       | ''          | ''           | ''                                                 | ''          |
			| 'Register  "R4031 Goods in transit (incoming)"'    | ''            | ''       | ''          | ''           | ''                                                 | ''          |
			| ''                                                 | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''                                                 | ''          |
			| ''                                                 | ''            | ''       | 'Quantity'  | 'Store'      | 'Basis'                                            | 'Item key'  |
			| ''                                                 | 'Receipt'     | '*'      | '2'         | 'Store 03'   | 'Inventory transfer 203 dated 01.03.2021 10:04:14' | '36/Yellow' |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'Inventory transfer 203 dated 01.03.2021 10:04:14' | 'S/Yellow'  |
			| ''                                                 | 'Receipt'     | '*'      | '10'        | 'Store 03'   | 'Inventory transfer 203 dated 01.03.2021 10:04:14' | 'XS/Blue'   |
			| ''                                                 | 'Receipt'     | '*'      | '15'        | 'Store 03'   | 'Inventory transfer 203 dated 01.03.2021 10:04:14' | '36/Red'    |
		And I close all client application windows

Scenario: _0402416 check Inventory transfer movements by the Register  "R4031 Goods in transit (incoming)" (not Use SC not use GR)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4031 Goods in transit (incoming)"
		And I click "Registrations report" button
		And I select "R4031 Goods in transit (incoming)" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4031 Goods in transit (incoming)"'                     |	
		And I close all client application windows

Scenario: _0402420 check Inventory transfer movements by the Register  "R4032 Goods in transit (outgoing)" (not Use SC not use GR)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4032 Goods in transit (outgoing)"
		And I click "Registrations report" button
		And I select "R4032 Goods in transit (outgoing)" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4032 Goods in transit (outgoing)"'                     |	
		And I close all client application windows

Scenario: _0402421 check Inventory transfer movements by the Register  "R4032 Goods in transit (outgoing)" ( Use SC use GR)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '21' |
	* Check movements by the Register  "R4032 Goods in transit (outgoing)"
		And I click "Registrations report" button
		And I select "R4032 Goods in transit (outgoing)" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 21 dated 01.03.2021 09:54:36' | ''            | ''       | ''          | ''           | ''                                                | ''          |
			| 'Document registrations records'                  | ''            | ''       | ''          | ''           | ''                                                | ''          |
			| 'Register  "R4032 Goods in transit (outgoing)"'   | ''            | ''       | ''          | ''           | ''                                                | ''          |
			| ''                                                | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''                                                | ''          |
			| ''                                                | ''            | ''       | 'Quantity'  | 'Store'      | 'Basis'                                           | 'Item key'  |
			| ''                                                | 'Receipt'     | '*'      | '2'         | 'Store 02'   | 'Inventory transfer 21 dated 01.03.2021 09:54:36' | '36/Yellow' |
			| ''                                                | 'Receipt'     | '*'      | '10'        | 'Store 02'   | 'Inventory transfer 21 dated 01.03.2021 09:54:36' | 'S/Yellow'  |
			| ''                                                | 'Receipt'     | '*'      | '10'        | 'Store 02'   | 'Inventory transfer 21 dated 01.03.2021 09:54:36' | 'XS/Blue'   |
			| ''                                                | 'Receipt'     | '*'      | '15'        | 'Store 02'   | 'Inventory transfer 21 dated 01.03.2021 09:54:36' | '36/Red'    |
		And I close all client application windows


Scenario: _0402425 check Inventory transfer movements by the Register  "R4021 Receipt of stock transfer orders" (not Use SC not use GR with ITO)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4021 Receipt of stock transfer orders"
		And I click "Registrations report" button
		And I select "R4021 Receipt of stock transfer orders" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 201 dated 01.03.2021 09:55:16'   | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| 'Document registrations records'                     | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| 'Register  "R4021 Receipt of stock transfer orders"' | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| ''                                                   | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''      | ''          | ''        |
			| ''                                                   | ''            | ''       | 'Quantity'  | 'Store'      | 'Order' | 'Item key'  | 'Row key' |
			| ''                                                   | 'Expense'     | '*'      | '2'         | 'Store 03'   | ''      | '36/Yellow' | ''        |
			| ''                                                   | 'Expense'     | '*'      | '10'        | 'Store 03'   | ''      | 'S/Yellow'  | ''        |
			| ''                                                   | 'Expense'     | '*'      | '10'        | 'Store 03'   | ''      | 'XS/Blue'   | ''        |
			| ''                                                   | 'Expense'     | '*'      | '15'        | 'Store 03'   | ''      | '36/Red'    | ''        |
		And I close all client application windows

Scenario: _0402426 check Inventory transfer movements by the Register  "R4021 Receipt of stock transfer orders" (not Use SC not use GR without ITO)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '204' |
	* Check movements by the Register  "R4021 Receipt of stock transfer orders"
		And I click "Registrations report" button
		And I select "R4021 Receipt of stock transfer orders" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4021 Receipt of stock transfer orders"'                     |	
		And I close all client application windows

Scenario: _0402430 check Inventory transfer movements by the Register  "R4022 Shipment of stock transfer orders" (not Use SC not use GR with ITO)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '201' |
	* Check movements by the Register  "R4022 Shipment of stock transfer orders"
		And I click "Registrations report" button
		And I select "R4022 Shipment of stock transfer orders" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Inventory transfer 201 dated 01.03.2021 09:55:16'    | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| 'Document registrations records'                      | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| 'Register  "R4022 Shipment of stock transfer orders"' | ''            | ''       | ''          | ''           | ''      | ''          | ''        |
			| ''                                                    | 'Record type' | 'Period' | 'Resources' | 'Dimensions' | ''      | ''          | ''        |
			| ''                                                    | ''            | ''       | 'Quantity'  | 'Store'      | 'Order' | 'Item key'  | 'Row key' |
			| ''                                                    | 'Expense'     | '*'      | '2'         | 'Store 02'   | ''      | '36/Yellow' | ''        |
			| ''                                                    | 'Expense'     | '*'      | '10'        | 'Store 02'   | ''      | 'S/Yellow'  | ''        |
			| ''                                                    | 'Expense'     | '*'      | '10'        | 'Store 02'   | ''      | 'XS/Blue'   | ''        |
			| ''                                                    | 'Expense'     | '*'      | '15'        | 'Store 02'   | ''      | '36/Red'    | ''        |
		And I close all client application windows

Scenario: _0402426 check Inventory transfer movements by the Register  "R4022 Shipment of stock transfer orders" (not Use SC not use GR without ITO)
	* Select Inventory transfer
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'  |
			| '204' |
	* Check movements by the Register  "R4022 Shipment of stock transfer orders"
		And I click "Registrations report" button
		And I select "R4022 Shipment of stock transfer orders" exact value from "Register" drop-down list
		And I click "Generate report" button
		And "ResultTable" spreadsheet document does not contain values
			| 'Register  "R4022 Shipment of stock transfer orders"'                     |	
		And I close all client application windows