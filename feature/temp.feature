#language: en

@tree

Functionality: <description features>

As <Role>
I want <functional description>
To <business effect>

Scenario: <description of the scenario>



	And In the command interface I select "Inventory" "Items"
	Then "Items" window is opened
	And I click the button named "FormCreate"
	Then "Item (create)" window is opened
	And I input "Item" text in the field named "Description_en"
	And I click Choice button of the field named "ItemType"
	Then "Item types" window is opened
	And I click the button named "FormCreate"
	Then "Item type (create)" window is opened
	And I input "Item type" text in the field named "Description_en"
	And I click the button named "FormWriteAndClose"
	And I wait "Item type (create) *" window closing in 20 seconds
	Then "Item types" window is opened
	And I click the button named "FormChoose"
	Then "Item (create) *" window is opened
	And I click Choice button of the field named "Unit"
	Then "Item units" window is opened
	And I click the button named "FormCreate"
	Then "Item unit (create)" window is opened
	And I input "item unit" text in the field named "Description_en"
	And I click the button named "FormWriteAndClose"
	And I wait "Item unit (create) *" window closing in 20 seconds
	Then "Item units" window is opened
	And I click the button named "FormChoose"
	Then "Item (create) *" window is opened
	And I click the button named "FormWriteAndClose"
	And I wait "Item (create) *" window closing in 20 seconds


