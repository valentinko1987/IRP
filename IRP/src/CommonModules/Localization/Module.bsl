Function Strings(Lang) Export
	
	Strings = New Structure();
	
	#Region Service
	
	// %1 - localhost
	// %2 - 8080 
	// %3 - There is no internet connection
	Strings.Insert("S_002", NStr("hash='8F1AF96F-BAA7-000C-C44F-FDB3FF70D8E7%1,%2,%3'", Lang));
	
	// %1 - localhost
	// %2 - 8080
	Strings.Insert("S_003", NStr("hash='D865A954-FA75-74C4-4B62-2D3E456B7118%1,%2'", Lang));
	Strings.Insert("S_004", NStr("hash='189F6347-6E1E-255D-D293-3344F42C3BC0'", Lang));
	
	// %1 - connection_to_other_system
	Strings.Insert("S_005", NStr("hash='6B938BAD-46BD-1F00-0EFD-DF7559E5EE16_____%1'", Lang));
	Strings.Insert("S_006", NStr("hash='36788B38-3DB7-6203-3CC5-583101C03BEB'", Lang));
	
	// Special offers
	Strings.Insert("S_013", NStr("hash='ACCBB3C4-B10F-3E5B-BF07-74684A79DE53%1'", Lang));
	
	// FileTransfer
	Strings.Insert("S_014", NStr("hash='7FED2DB1-2EAE-6B87-7636-64BCB09B6373'", Lang));
	Strings.Insert("S_015", NStr("hash='5475EF01-DF09-EA2E-E9D2-2605D902A363'", Lang));
	
	// Test connection
	// %1 - Method unsupported on web client
	// %2 - 404
	// %3 - Text frim site
	Strings.Insert("S_016", NStr("hash='8A6925D9-C33E-111C-CCE0-03D2919B3B22%1,%2,%3'", Lang));
	
	//	scan barcode
	Strings.Insert("S_018", NStr("hash='6575B9FC-E657-ED72-2059-9F8BFC3D0875'", Lang)); 
	
	// %1 - 123123123123
	Strings.Insert("S_019", NStr("hash='D5437C14-AEA1-B8D7-784B-BCE41FB9C53C%1'", Lang));
	Strings.Insert("S_022", NStr("hash='5D032FF3-AB7D-277B-B937-78EAEFA03EF9'", Lang));
	Strings.Insert("S_023", NStr("hash='5C861201-7421-FC59-95BA-A53F5DBFCF5D'", Lang));
	
	Strings.Insert("S_026", NStr("hash='DE5E5712-3422-FC05-5902-200A38394882_____'", Lang));

	// presentation of empty value for query result
	Strings.Insert("S_027", NStr("hash='93B84AB4-8908-FB5E-E6FE-EF29DC51B661'", Lang));
	
	#EndRegion
	
	#Region Service
	Strings.Insert("Form_001", NStr("hash='227B2DD1-03AA-8EA0-0130-07913DEAA02F'", Lang));
	Strings.Insert("Form_002", NStr("hash='84ADEDC7-D2D9-875F-FB00-081005992A16'", Lang));
	Strings.Insert("Form_003", NStr("hash='51E1E7E3-9C72-BEB1-1C62-233C85FF58E4'", Lang));
	Strings.Insert("Form_004", NStr("hash='C9ACF1DE-33F5-B49A-A261-1A9CBD1A850D'", Lang));
	Strings.Insert("Form_005", NStr("hash='9394DC76-A7E8-AA35-5FC6-6517717CEECF'", Lang));
	Strings.Insert("Form_006", NStr("hash='B0A85FF6-4C94-A282-28AD-D851313053EA'", Lang));
	Strings.Insert("Form_007", NStr("hash='CB24FD49-510A-71E3-3C26-6B092CEE53EA'", Lang));
	Strings.Insert("Form_008", NStr("hash='76C447B0-C7AF-4EE9-9529-9D625A59668E'", Lang));
	Strings.Insert("Form_009", NStr("hash='3C31AAC3-37C3-4A7F-FC55-5277B640ED15'", Lang));
	Strings.Insert("Form_013", NStr("hash='3D008872-6735-3A1E-E347-7972676B69B3'", Lang));
	Strings.Insert("Form_014", NStr("hash='DE5C20EC-29F2-7402-284B-BF659223D0EC'", Lang));
	
	// change icon
	Strings.Insert("Form_017", NStr("hash='74E5F6E1-D312-680E-EFD2-2CD9FE8D3E87'", Lang));
	
	// clear icon
	Strings.Insert("Form_018", NStr("hash='01A3C395-0082-6352-2C6D-DE29579D0ED6'", Lang));
	
	// cancel answer on question
	Strings.Insert("Form_019", NStr("hash='DDD7EF50-72B0-BFA5-5330-0591CFF31B84'", Lang));
	
	// PriceInfo report 
	Strings.Insert("Form_022", NStr("hash='5165ACC2-B401-935D-D480-00C1904631D1'", Lang));
	Strings.Insert("Form_023", NStr("hash='DAA047BB-B2DE-61DC-C271-1FC693A09820'", Lang));
	Strings.Insert("Form_024", NStr("hash='D6FA468B-E15B-393A-AB44-4E88EA28492D'", Lang));
	#EndRegion
	
	#Region ErrorMessages

	// %1 - en
	Strings.Insert("Error_002", NStr("hash='E593F117-1DAE-61C5-5F39-97C62CC2EA69%1'", Lang));
	Strings.Insert("Error_003", NStr("hash='3AC372F4-0851-8745-5BC7-7288C4E84A8E'", Lang));
	Strings.Insert("Error_004", NStr("hash='D1FD3E74-E397-96AF-F2BC-C1F2CEAFD1EC'", Lang));
	
	// %1 - en
	Strings.Insert("Error_005", NStr("hash='745EC86E-4974-6ED4-4831-16E20D7E43C3________%1'", Lang));
	Strings.Insert("Error_008", NStr("hash='6E3DD0B2-A4E6-716C-C19F-F7E90D96A4AE'", Lang));
	
	// %1 - Number 111 is not unique
	Strings.Insert("Error_009", NStr("hash='044131B9-DCD1-EF30-09F1-1B6B8F648432%1'", Lang));
	
	// %1 - Number
	Strings.Insert("Error_010", NStr("hash='383EE0C0-4B29-D6D7-75C8-8D6BE8B9E8F3%1'", Lang));
	Strings.Insert("Error_011", NStr("hash='7AE96E95-F0FB-BA60-0565-59856A21F8FC'", Lang));
	Strings.Insert("Error_012", NStr("hash='73DBE651-84CB-9BF0-0AEA-A82775AB14FE___'", Lang));
	Strings.Insert("Error_013", NStr("hash='B1D239F4-8E20-CE18-84ED-DA2FBC44B678'", Lang));
	Strings.Insert("Error_014", NStr("hash='8B8596B2-C71F-34D4-4E0D-D0D7BEC756A1___________'", Lang));

	// %1 - Sales order
	Strings.Insert("Error_016", NStr("hash='E84FA4FE-C84C-8F3F-FDBF-FC19BD70C7D7______________________________________%1'", Lang));
	Strings.Error_016 = StrTemplate(Strings.Error_016, Metadata.Documents.SalesOrder.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_017", NStr("hash='FE2F14C2-3230-1205-57EC-CEC35D266B41_______________________________________%1,%1,%2'", Lang));
	Strings.Error_017 = StrTemplate(Strings.Error_017, Metadata.Documents.GoodsReceipt.Synonym, Metadata.Documents.PurchaseInvoice.Synonym);

	// %1 - Shipment confirmation
	// %1 - Sales invoice
	Strings.Insert("Error_018", NStr("hash='FE2F14C2-3230-1205-57EC-CEC35D266B41_______________________________________%1,%1,%2'", Lang));
	Strings.Error_018 = StrTemplate(Strings.Error_018, Metadata.Documents.ShipmentConfirmation.Synonym, Metadata.Documents.SalesInvoice.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_019", NStr("hash='E95D80C0-9C5E-1365-5554-496AF168EC74______________________%1,%2'", Lang));

	// %1 - 12
	Strings.Insert("Error_020", NStr("hash='B627C29B-6B74-F69C-CF74-4D53AEBFA851_%1'", Lang));

	// %1 - Purchase invoice
	Strings.Insert("Error_021", NStr("hash='28B07FCB-1A0C-AF9F-F183-3D3754C6037F_________________________________________________________%1'", Lang));
	Strings.Error_021 = StrTemplate(Strings.Error_021, Metadata.Documents.PurchaseInvoice.Synonym);

	// %1 - Internal supply request
	Strings.Insert("Error_023", NStr("hash='E84FA4FE-C84C-8F3F-FDBF-FC19BD70C7D7______________________________________%1'", Lang));
	Strings.Error_023 = StrTemplate(Strings.Error_023, Metadata.Documents.InternalSupplyRequest.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_028", NStr("hash='F21B0926-6788-BEE0-09C1-120FA5B8BE44_______________%1,%2'", Lang));
	Strings.Error_028 = StrTemplate(Strings.Error_028, Metadata.Documents.GoodsReceipt.Synonym, Metadata.Documents.PurchaseInvoice.Synonym);
	
	// %1 - Cash account
	// %2 - 12
	// %3 - Cheque bonds
	Strings.Insert("Error_030", NStr("hash='51991E9A-3EF7-92E2-2F7B-B7696C96D3E2___%1,%2,%3'", Lang));

	Strings.Insert("Error_031", NStr("hash='179C88CD-59CB-A043-3AC5-52F2D831AF9F__________________________________'", Lang));
	Strings.Insert("Error_032", NStr("hash='99F5DB97-D582-B530-01C6-6F771EABF96C'", Lang));
	Strings.Insert("Error_033", NStr("hash='E7B99D17-9B09-A242-27EB-B4D07AEE491C'", Lang));
	// %1 - Google drive
	Strings.Insert("Error_034", NStr("hash='432F3EC1-9930-69A1-10AA-A39126EDE877%1'", Lang));
	Strings.Insert("Error_035", NStr("hash='9C7117FE-6428-63C8-8FEC-CE325A13CBA1'", Lang));
	Strings.Insert("Error_037", NStr("hash='99A38806-4540-1444-467C-C0F4050DD751________'", Lang));	
	Strings.Insert("Error_040", NStr("hash='B46EBBA8-0443-3FA5-5BC7-76DFB12CC411'", Lang));
	Strings.Insert("Error_041", NStr("hash='2A12CEA2-3FE4-1267-7BD0-03A2E71D8C00____________%1,%2'", Lang));
	// %1 - Name
	Strings.Insert("Error_042", NStr("hash='2F77202A-650B-8712-2FDE-E28FFF80779A%1'", Lang));
	Strings.Insert("Error_043", NStr("hash='3223D4E8-E9D3-25A0-0592-25DC34310083'", Lang));
	Strings.Insert("Error_044", NStr("hash='B66F68ED-5266-DD7C-CE07-7E61C2D7A14C'", Lang));
	Strings.Insert("Error_045", NStr("hash='39CDAB76-6367-D019-9534-467B5828CC6F'", Lang));
	// %1 - Currency
	Strings.Insert("Error_047", NStr("hash='9AEB5A51-DB80-33A5-5EB3-33A20AF1CF9E%1'", Lang));
	Strings.Insert("Error_049", NStr("hash='FD9B7B47-B0B1-E75D-D557-70F92EBC58D2__'", Lang));
	Strings.Insert("Error_050", NStr("hash='D84359BE-794A-5CA0-04BD-D252B9AF15B3__________________________________________________________________'", Lang));
	// %1 - Bank payment
	Strings.Insert("Error_051", NStr("hash='BB3D85AA-2E36-99E2-233B-B4021875EDFC_______________________________________%1,%1'", Lang));
	// %1 - Main store
	// %2 - Use shipment confirmation
	// %3 - Shipment confirmations
	Strings.Insert("Error_052", NStr("hash='2C361CE0-35B2-65CF-FF8D-D4DC54888B89%2,%3,%1
|_____________________________________________________'", Lang));
	Strings.Error_052 = StrTemplate(Strings.Error_052, "%1", Metadata.Catalogs.Stores.Attributes.UseShipmentConfirmation.Synonym,
															 Metadata.Documents.ShipmentConfirmation.Synonym);										

	// %1 - Main store
	// %2 - Use goods receipt
	// %3 - Goods receipts
	Strings.Insert("Error_053", NStr("hash='3B36F0CE-D6DB-87AB-BFF2-215A3A27068C_________________________________________________%3,%1'", Lang));
	Strings.Error_053 = StrTemplate(Strings.Error_053, "%1", Metadata.Catalogs.Stores.Attributes.UseGoodsReceipt.Synonym,
			 												 Metadata.Documents.GoodsReceipt.Synonym);
	// %1 - sales order
	Strings.Insert("Error_054", NStr("hash='1C0879F2-EAEF-2A05-571D-D87B5818F186_%1'", Lang));
	Strings.Error_053 = StrTemplate(Strings.Error_053, Metadata.Documents.SalesOrder.Synonym);
															  
	Strings.Insert("Error_055", NStr("hash='ED35F668-0E5E-3984-4354-4A2D393ECC37______'", Lang));

	Strings.Insert("Error_056", NStr("hash='F20B1A5B-39EA-6AF8-8CC6-60E1746FB51D______________________________'", Lang));

	// %1 - sales order
	// %2 - purchase order
	Strings.Insert("Error_056", NStr("hash='47191EBF-FD79-E2F9-965A-A400354CC5D9_________%1,%2'", Lang));
	Strings.Error_056 = StrTemplate(Strings.Error_056, Metadata.Documents.SalesOrder.Synonym, Metadata.Documents.PurchaseOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_057", NStr("hash='ABAB5BA9-4438-5DD3-3FA1-1C26EEF93602_________%1,%2'", Lang));
	Strings.Error_057 = StrTemplate(Strings.Error_057, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_058", NStr("hash='43F4096E-D2B1-E4DF-FE62-26ABC18CE576______________________%2,%1'", Lang));
	Strings.Error_058 = StrTemplate(Strings.Error_058, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_059", NStr("hash='A6EEB18E-1144-4F7A-A12E-EE8ADBDB8246_____________________________________________%2,%1,%1
|__________________________________________________'", Lang));
	Strings.Error_059 = StrTemplate(Strings.Error_059, "%1", Metadata.Documents.CashTransferOrder.Synonym);
	
	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_060", NStr("hash='FB40B712-ADA4-8A24-495B-BC20C51B36EE_________________________%2,%1'", Lang));
	Strings.Error_060 = StrTemplate(Strings.Error_060, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Main store
	// %2 - Shipment confirmation
	// %3 - Sales order
	Strings.Insert("Error_064", NStr("hash='EBDE96C1-306F-521F-FD9D-DF6ACA1C5478_____________________________________%2,%1,%3'", Lang));
	Strings.Error_064 = StrTemplate(Strings.Error_064, "%1", Metadata.Documents.ShipmentConfirmation.Synonym,
															 Metadata.Documents.SalesOrder.Synonym);

	Strings.Insert("Error_065", NStr("hash='16489CE8-D6DF-6585-525E-E30E81B79C4D'", Lang));
	Strings.Insert("Error_066", NStr("hash='CEBF3B80-6CD0-3E35-5D0C-C9D231A0F940'", Lang));
	
	// %3 - Sales order
	Strings.Insert("Error_067", NStr("hash='1C0879F2-EAEF-2A05-571D-D87B5818F186_%1'", Lang));

	// %1 - 12
	// %2 - Boots
	// %3 - Red XL
	// %4 - ordered
	// %5 - 11
	// %6 - 15
	// %7 - 4
	// %8 - pcs
	Strings.Insert("Error_068", NStr("hash='3F32D933-6F68-8415-5B22-2EE1AF6849DB________________________________%1,%2,%3,%4,%5,%8,%6,%8,%7,%8'", Lang));

	// %1 - some extention name
	Strings.Insert("Error_071", NStr("hash='4003A0B4-950C-E122-2EC8-84434E1A4764%1'", Lang));
	
	// %1 - 12
	Strings.Insert("Error_072", NStr("hash='9382ADDF-31C4-09F2-246B-B13CD8556870%1'", Lang));

	// %1 - Sales order
	// %2 - Goods receipt
	Strings.Insert("Error_073", NStr("hash='112419D9-3971-1A72-2B67-7B81BF292894_____________%1,%2'", Lang));
	Strings.Insert("Error_074", NStr("hash='D045CB34-80BC-2300-0872-2A0819BB2CE1_____________________'", Lang));

	// %1 - Physical count by location
	Strings.Insert("Error_075", NStr("hash='F204896B-4850-D9E5-59A2-295DA798E2B8%1'", Lang));
	Strings.Error_075 = StrTemplate(Strings.Error_075, Metadata.Documents.PhysicalCountByLocation.Synonym);
	
	// %1 - Retail sales receipt
	Strings.Insert("Error_076", NStr("hash='28B07FCB-1A0C-AF9F-F183-3D3754C6037F_________________________________________________________%1'", Lang));
	Strings.Error_076 = StrTemplate(Strings.Error_076, Metadata.Documents.RetailSalesReceipt.Synonym);
	
	#EndRegion
	
	#Region InfoMessages
	// %1 - Purchase invoice
	// %2 - Purchase order
	Strings.Insert("InfoMessage_001", NStr("hash='91F88062-9588-4E31-10A5-5EB82FD6FD5B_________________%1,%2,%1,%2
|_____________________________________________________________'", Lang));
	// %1 - Boots
	Strings.Insert("InfoMessage_002", NStr("hash='FA027814-82D4-C9EA-A8C2-28E207EB31EB%1'", Lang));
	Strings.Insert("InfoMessage_003", NStr("hash='0D3C26F4-A835-A741-17C4-40D25A187A25'", Lang));
	Strings.Insert("InfoMessage_004", NStr("hash='2C3414F3-E98C-5C9F-F12E-EEFB660F89A6'", Lang));
	Strings.Insert("InfoMessage_005", NStr("hash='807FB5AE-34C6-44DE-EA92-24F5987DFE40'", Lang));
	
	// %1 - Physical count by location
	Strings.Insert("InfoMessage_006", NStr("hash='FECDB919-D7E4-E1DC-CF55-5AC1CAE47861___%1'", Lang));
	Strings.InfoMessage_006 = StrTemplate(Strings.InfoMessage_006, Metadata.Documents.PhysicalCountByLocation.Synonym);

	// %1 - 12
	// %2 - 20.02.2020
	Strings.Insert("InfoMessage_007", NStr("hash='69B878AE-601E-EE40-0978-8F8AC2CCB78A%1,%2'", Lang));
	#EndRegion
	
	#Region QuestionToUser
	Strings.Insert("QuestionToUser_001", NStr("hash='E654BDB2-CD4D-C97A-AA38-8EC7B1302705__________________________'", Lang));
	Strings.Insert("QuestionToUser_002", NStr("hash='D9CEE6BA-34C6-A300-00C3-39C1C90CB17D__'", Lang));
	Strings.Insert("QuestionToUser_003", NStr("hash='D20C8C9D-71C4-2AF6-6B4A-AF80E1EE3BC9_______________________________________________%1'", Lang));
	Strings.Insert("QuestionToUser_004", NStr("hash='62B4AB8A-011B-8313-3BB2-2A4EDAB2D802_'", Lang));
	Strings.Insert("QuestionToUser_005", NStr("hash='79090F78-B86C-8CA9-9EC7-7121335DC155'", Lang));
	Strings.Insert("QuestionToUser_006", NStr("hash='84DA2153-50FD-514A-A75A-A6C873B298CD__'", Lang));
	Strings.Insert("QuestionToUser_007", NStr("hash='B6FF0C07-C95C-AE7B-B49B-BDED479A01C0________'", Lang));
	Strings.Insert("QuestionToUser_008", NStr("hash='C4E140B1-9F60-30CE-E393-328403B1AB3C______________________________________________________'", Lang));
	Strings.Insert("QuestionToUser_009", NStr("hash='FBBE664D-7235-DDEF-F2B4-402E2683CC06%1'", Lang));
	Strings.Insert("QuestionToUser_011", NStr("hash='0F743A46-43FA-A036-6CB4-4BA169F0CC50%1'", Lang));
	Strings.Insert("QuestionToUser_012", NStr("hash='584DFA8C-67CE-A827-7591-11A73CA166A1'", Lang));
	Strings.Insert("QuestionToUser_013", NStr("hash='E0C7A8C5-1917-7B8C-C62D-D8D8880B3C8C'", Lang));
	Strings.Insert("QuestionToUser_014", NStr("hash='1622AC31-28EB-E5E1-13FB-BA8E1B9B7A68________________________'", Lang));
	Strings.Insert("QuestionToUser_015", NStr("hash='88F43131-4629-A0F8-8F11-1B165E46BC12_'", Lang));
	Strings.Insert("QuestionToUser_016", NStr("hash='3CD8BAA8-F5E9-977D-DD3F-FEEC9EEB2442'", Lang));
	#EndRegion
	
	#Region SuggestionToUser
	Strings.Insert("SuggestionToUser_1", NStr("hash='C7E731CE-E605-D5AC-CEBE-EE4D90177111'", Lang));
	Strings.Insert("SuggestionToUser_2", NStr("hash='08042D39-D6BF-252E-E42D-DC143F1900A2'", Lang));
	Strings.Insert("SuggestionToUser_3", NStr("hash='F800CD24-FF9E-F66E-E1A0-021ED149D11D'", Lang));
	Strings.Insert("SuggestionToUser_4", NStr("hash='7B32B6FE-3D60-0800-0404-443F41F9DE19'", Lang));
	#EndRegion
	
	#Region UsersEvent
	Strings.Insert("UsersEvent_001", NStr("hash='A003F15B-444F-737D-D1A6-6BCF3C89D6AD%1,%2'", Lang));
	Strings.Insert("UsersEvent_002", NStr("hash='DB5B33DF-20CC-2C3E-E0D5-5F30DCA3C64C%1,%2'", Lang));
	#EndRegion
	
	#Region Items
	
	// Interface
	Strings.Insert("I_1", NStr("hash='CF633766-69D6-AC22-2FA2-21DF61CB554C'", Lang));
	
	Strings.Insert("I_2", NStr("hash='3E52C140-3767-CDF7-7924-4CA719D60CD1'", Lang));
	
	Strings.Insert("I_3", NStr("hash='1BD1E890-2909-EDB4-46A8-8F8E0874B4BB'", Lang));
	
	#EndRegion
	
	#Region Exceptions
	Strings.Insert("Exc_001", NStr("hash='C9FA5A60-392B-2CB0-0E95-54FBD0138E8D'", Lang));
	Strings.Insert("Exc_002", NStr("hash='AFAA76F3-CB6C-8B1D-D639-948CA738005B'", Lang));
	Strings.Insert("Exc_003", NStr("hash='29A29C59-4537-009B-BC38-8C24572D3186%1'", Lang));
	Strings.Insert("Exc_004", NStr("hash='862CEC43-C13D-BAC6-6ED5-5954AE12BF64'", Lang));
	Strings.Insert("Exc_005", NStr("hash='F43CA43D-1865-F6CA-A10E-E2E571322A77'", Lang));
	Strings.Insert("Exc_006", NStr("hash='F0F73D0E-5181-0728-8C01-127C2D06EC89'", Lang));
	Strings.Insert("Exc_007", NStr("hash='A4C817AC-1165-CB63-33AD-DEDBF3CB9AD0___%1'", Lang));
	Strings.Insert("Exc_008", NStr("hash='119E6E15-2C62-E832-23D7-7ACD4F20B530'", Lang));
	Strings.Insert("Exc_009", NStr("hash='12A174BD-4463-6BE7-7E7A-AB27FB0CAF50%1'", Lang));
	#EndRegion
	
	#Region Saas
	// %1 - 12
	Strings.Insert("Saas_001", NStr("hash='92E90D60-8269-5C51-13A0-09CDE34BDB78%1'", Lang));
	
	// %1 - closed
	Strings.Insert("Saas_002", NStr("hash='9042ECD5-37C7-5DEF-FAC9-9DAE56AD388A%1'", Lang));
	
	// %1 - en
	Strings.Insert("Saas_003", NStr("hash='E752A806-3D06-FF93-3208-8237CCBEB77F____%1'", Lang));
	#EndRegion
	
	#Region FillingFromClassifiers
    // Do not modify "en" strings
    Strings.Insert("Class_001", NStr("hash='383F84AA-6C94-9CF2-282E-ECBAABFE25C4'", Lang));
    Strings.Insert("Class_002", NStr("hash='9048D720-30FF-481F-FC3C-C69763E3108A'", Lang));
    Strings.Insert("Class_003", NStr("hash='B9E76F2E-CEEC-C606-659F-F85495D82DFD'", Lang));
    Strings.Insert("Class_004", NStr("hash='4765EBF3-4BD5-C7D2-2F1A-A12A24B44756'", Lang));
    Strings.Insert("Class_005", NStr("hash='C8EB8E41-4CB5-CC12-24BB-BC19A061172B'", Lang));
    Strings.Insert("Class_006", NStr("hash='78C6CA81-3F7B-1050-0EA7-70628D95C5FA'", Lang));
    Strings.Insert("Class_007", NStr("hash='3E4C4E38-16F1-5382-2B30-0D2F4B0EB586'", Lang));
    Strings.Insert("Class_008", NStr("hash='5073B496-F747-0E7F-FE83-33CF32FDCCE0'", Lang));
    #EndRegion
    
    #Region PredefinedObjectDescriptions
	PredefinedDescriptions(Strings, Lang);
	#EndRegion
    
	#Region Titles
	// %1 - Cheque bond transaction
	Strings.Insert("Title_00100", NStr("hash='D48E8348-C4C1-C398-8915-54F099D6C8BD%1'", Lang));	// Form PickUpDocuments
	Strings.Title_00100 = StrTemplate(Strings.Title_00100, Metadata.Documents.ChequeBondTransaction.Synonym);
	#EndRegion
	
	#Region ChoiceListValues
	Strings.Insert("CLV_1", NStr("hash='43FD3975-BF22-AC9B-BFAE-E4E7C6F06735'", Lang));
	#EndRegion
	
	Return Strings;
EndFunction

Procedure PredefinedDescriptions(Strings, CodeLanguage)

	Strings.Insert("Description_A001", NStr("hash='A8FF75AA-47A3-74A5-5195-5DEDFB24ADDF'", CodeLanguage));
	Strings.Insert("Description_A003", NStr("hash='187B0DFC-6EE3-50B4-490A-A4A518C70BFC'", CodeLanguage));
	Strings.Insert("Description_A004", NStr("hash='9186BE19-CDFD-143A-A511-1215DCCD0C9D'", CodeLanguage));
	Strings.Insert("Description_A005", NStr("hash='15DB5892-FA5D-63BC-CD6B-B6959923E363'", CodeLanguage));
	Strings.Insert("Description_A006", NStr("hash='816CADDC-184A-0A38-8FED-DE5718FAB415'", CodeLanguage));
	Strings.Insert("Description_A007", NStr("hash='06471A1C-7089-72DD-D011-10012DC4CF2A'", CodeLanguage));
	Strings.Insert("Description_A008", NStr("hash='E4B38FAB-E1AC-DE3E-EC9E-E2454E2C001E'", CodeLanguage));
	Strings.Insert("Description_A009", NStr("hash='8FC686D4-44BA-77E6-6011-1BB861E8C215'", CodeLanguage));
	Strings.Insert("Description_A010", NStr("hash='37855256-BE21-B832-2EEA-A7439CF169C9'", CodeLanguage));
	Strings.Insert("Description_A011", NStr("hash='EB1C33B2-B01A-28E4-401A-ADD22DD14506'", CodeLanguage));
	Strings.Insert("Description_A012", NStr("hash='3EDA209D-4CBC-6C63-34FF-F782CABB2099'", CodeLanguage));
	Strings.Insert("Description_A013", NStr("hash='462DDC8F-4862-A0F3-3088-846ACD965FD1'", CodeLanguage));
	Strings.Insert("Description_A014", NStr("hash='C179E671-8DDE-6F2B-BF62-232892E0283A'", CodeLanguage));
	Strings.Insert("Description_A015", NStr("hash='D5C44832-D055-1AA2-2DBE-E186060152E9'", CodeLanguage));
	Strings.Insert("Description_A016", NStr("hash='4F82D112-A45D-EEA2-2193-30F08441B154'", CodeLanguage));
	Strings.Insert("Description_A017", NStr("hash='5B188215-77CB-F10C-C03E-E8EDE5A1AF2B'", CodeLanguage));
	Strings.Insert("Description_A018", NStr("hash='84ACD6D5-B0FF-573B-B472-23681BB76993'", CodeLanguage));
	Strings.Insert("Description_A019", NStr("hash='D2F066E0-0561-2C4C-C759-94C19EFB580B'", CodeLanguage));
	Strings.Insert("Description_A020", NStr("hash='2DBE2BF6-289B-5EBE-E8D6-6110921AF14E'", CodeLanguage));
	Strings.Insert("Description_A021", NStr("hash='108F6FBF-7269-34EA-ADAD-DFD86F58E916'", CodeLanguage));
	Strings.Insert("Description_A022", NStr("hash='FE49E86F-8842-0D25-5B35-54E9A7957650'", CodeLanguage));
	Strings.Insert("Description_A023", NStr("hash='9A7F43FB-4F13-A9DD-DB9E-E95314C3B5DC'", CodeLanguage));
	Strings.Insert("Description_A024", NStr("hash='7CA1A8D9-4541-B717-7532-2278F7081760'", CodeLanguage));
	Strings.Insert("Description_A025", NStr("hash='AC40C452-B8B1-A8BC-C58C-CFC547C5F60E'", CodeLanguage));
	Strings.Insert("Description_A026", NStr("hash='CC393C24-9767-7D67-75AC-CCB0B8FB0499'", CodeLanguage));
	Strings.Insert("Description_A027", NStr("hash='DFB95B97-E069-9B6B-BAF0-0A20CB22B306'", CodeLanguage));
	Strings.Insert("Description_A028", NStr("hash='8D00C5CF-B26E-C926-622B-BFC7398E29EF'", CodeLanguage));
	Strings.Insert("Description_A029", NStr("hash='5954DB68-1275-37F2-2CC6-6759FCCF7E04'", CodeLanguage));
	Strings.Insert("Description_A030", NStr("hash='9E42A9EF-A1B0-2B18-8996-63B37397A521'", CodeLanguage));
	Strings.Insert("Description_A031", NStr("hash='9B274517-14A4-B4F7-75C0-08DF58DCFE50'", CodeLanguage));
	Strings.Insert("Description_A032", NStr("hash='C262E1A8-7E52-0401-18D1-1618381CAD21'", CodeLanguage));
	Strings.Insert("Description_A033", NStr("hash='58CEFE62-7BA4-3DF3-3C3F-FCD0C87C7D54'", CodeLanguage));
	Strings.Insert("Description_A034", NStr("hash='6786BEE4-90FC-AA54-477C-CCCA0BC6EE21'", CodeLanguage));
	Strings.Insert("Description_A035", NStr("hash='C598EA96-FD46-2DD9-963F-F93AEF3F9E90'", CodeLanguage));
	Strings.Insert("Description_A036", NStr("hash='C2E48A3B-4EB4-DD6C-CC04-4EAC7C8C96E9'", CodeLanguage));
	Strings.Insert("Description_A037", NStr("hash='1BE2462A-D758-D5BA-A083-3C98B4321671'", CodeLanguage));
	Strings.Insert("Description_A038", NStr("hash='CFF7082D-CFC8-E829-9C35-535649A2D1F7'", CodeLanguage));
	Strings.Insert("Description_A039", NStr("hash='EADBC4B8-2FDC-7174-43AA-A55C60D6FB71'", CodeLanguage));
	Strings.Insert("Description_A040", NStr("hash='2424B36C-055A-01CB-B418-8CE2BB1874D2'", CodeLanguage));
	Strings.Insert("Description_A041", NStr("hash='9B4E5EF8-801A-3192-2A66-6819CF18E27E'", CodeLanguage));
	Strings.Insert("Description_A042", NStr("hash='A0F60566-7197-2C5C-C157-7718ADC1C945'", CodeLanguage));
	Strings.Insert("Description_A043", NStr("hash='B13DFC97-268E-560B-BC6D-D7E975E0A022'", CodeLanguage));
	Strings.Insert("Description_A044", NStr("hash='1F8669C2-31F7-EF3A-A4DD-DE6E00D3ED32'", CodeLanguage));
	Strings.Insert("Description_A045", NStr("hash='9C8F01DA-8F77-837D-D6CA-A92537250A7F'", CodeLanguage));
	Strings.Insert("Description_A046", NStr("hash='B1678B96-EEC0-5AEC-CE81-1BE93BCAD904'", CodeLanguage));
	Strings.Insert("Description_A047", NStr("hash='5BF75F52-CB0C-CF46-6989-949D3745A30D'", CodeLanguage));
	Strings.Insert("Description_A048", NStr("hash='EE47793F-9D29-62BD-D61D-DD406C0CB339'", CodeLanguage));
	Strings.Insert("Description_A049", NStr("hash='DA01CBFD-3852-5AD2-2440-0B1CD26BE016'", CodeLanguage));
	Strings.Insert("Description_A050", NStr("hash='EE7DFAEE-AE9F-011C-CF63-3732C19330FE'", CodeLanguage));
	Strings.Insert("Description_A051", NStr("hash='525D65B0-4170-98C3-3DD3-36D809348407'", CodeLanguage));
	Strings.Insert("Description_A052", NStr("hash='B9AFF3DD-86C6-ECEC-CB72-25A7DA57E707'", CodeLanguage));
	Strings.Insert("Description_A053", NStr("hash='23DAA625-F382-EE7F-F86C-CDF8CEA75CBA'", CodeLanguage));
	Strings.Insert("Description_A054", NStr("hash='0B7A0F4E-A9B0-D8AB-B5B7-72A46E677C2D__'", CodeLanguage));
	Strings.Insert("Description_A056", NStr("hash='807F2088-04A1-4D4A-ADA9-9F2B7DFF3172'", CodeLanguage));
	Strings.Insert("Description_A057", NStr("hash='2D36C6CE-6673-046B-BA5B-B96D18500D38'", CodeLanguage));
	Strings.Insert("Description_A058", NStr("hash='73049E71-BDD5-EB1C-C754-4FBF71664F77'", CodeLanguage));
	Strings.Insert("Description_A059", NStr("hash='5504F34F-8167-5DB6-6D92-2087D4FE0106'", CodeLanguage));
	Strings.Insert("Description_A060", NStr("hash='3C677367-364D-7469-9286-612C4E40BD10'", CodeLanguage));
	Strings.Insert("Description_A061", NStr("hash='3EE08F55-CAA0-F7F6-6731-1B70968DCC8B'", CodeLanguage));

EndProcedure