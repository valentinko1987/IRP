﻿#language: en
@tree
@Positive
@PartnerCatalogs


Feature: filling in Retail customers catalog

As an owner
I want to fill out information on the company
To further use it when reflecting in the program of business processes

Background:
	Given I open new TestClient session or connect the existing one



	

Scenario: _005049 filling in the "Retail customers" catalog
	When set True value to the constant
	And I close TestClient session
	Given I open new TestClient session or connect the existing one
	* Open and filling in Retail customer
		Given I open hyperlink "e1cib/list/Catalog.RetailCustomers"
		And I click the button named "FormCreate"
		And I input "Description Retail customer" text in the field named "Description"
		And I input "Name Retail customer" text in the field named "Name"
		And I input "Surname Retail customer" text in the field named "Surname"
		And I input "002" text in the field named "Code"
		And I click "Save and close" button
		And Delay 2
	* Check for created  Tax additional analytics
		And "List" table contains lines
		| 'Description'                                  | 'Code' | 'Name'                 | 'Surname'                 |
		| 'Name Retail customer Surname Retail customer' | '002'  | 'Name Retail customer' | 'Surname Retail customer' |
		And I close all client application windows
