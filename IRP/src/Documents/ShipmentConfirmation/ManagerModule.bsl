#Region Posting

Function PostingGetDocumentDataTables(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	Tables = New Structure();
	AccReg = Metadata.AccumulationRegisters;
//	Tables.Insert("GoodsInTransitOutgoing"       , PostingServer.CreateTable(AccReg.GoodsInTransitOutgoing));
	Tables.Insert("ShipmentOrders"               , PostingServer.CreateTable(AccReg.ShipmentOrders));
	Tables.Insert("ShipmentConfirmationSchedule" , PostingServer.CreateTable(AccReg.ShipmentConfirmationSchedule));
	
//	Tables.Insert("GoodsInTransitOutgoing_Exists" , PostingServer.CreateTable(AccReg.GoodsInTransitOutgoing));
	Tables.Insert("ShipmentOrders_Exists"         , PostingServer.CreateTable(AccReg.ShipmentOrders));
	
//	Tables.GoodsInTransitOutgoing_Exists = 
//	AccumulationRegisters.GoodsInTransitOutgoing.GetExistsRecords(Ref, AccumulationRecordType.Expense, AddInfo);
	
	Tables.ShipmentOrders_Exists = 
	AccumulationRegisters.ShipmentOrders.GetExistsRecords(Ref, AccumulationRecordType.Receipt, AddInfo);
	
	Query = New Query();
	Query.Text =
	
			"SELECT
			|	SalesOrderRowIDInfo.Ref AS SalesOrderRef,
			|	SalesOrderRowIDInfo.Key AS SalesOrderKey,
			|	MAX(SalesOrderRowIDInfo.RowID) AS SalesOrderRowID
			|INTO SalesOrderRowIDInfo
			|FROM
			|	Document.SalesOrder.RowIDInfo AS SalesOrderRowIDInfo
			|WHERE
			|	SalesOrderRowIDInfo.Ref IN
			|		(SELECT
			|			CAST(ShipmentConfirmationItemList.ShipmentBasis AS Document.SalesOrder).Ref
			|		FROM
			|			Document.ShipmentConfirmation.ItemList AS ShipmentConfirmationItemList
			|		WHERE
			|			ShipmentConfirmationItemList.Ref = &Ref)
			|GROUP BY
			|	SalesOrderRowIDInfo.Ref,
			|	SalesOrderRowIDInfo.Key
			|;
			|
			|////////////////////////////////////////////////////////////////////////////////
			|SELECT
			|	SalesOrderItemList.Ref AS SalesOrderRef,
			|	SalesOrderItemList.ProcurementMethod,
			|	SalesOrderRowIDInfo.SalesOrderRowID AS SalesOrderRowID
			|INTO SalesOrderItemList
			|FROM
			|	Document.SalesOrder.ItemList AS SalesOrderItemLIst
			|		INNER JOIN SalesOrderRowIDInfo AS SalesOrderRowIDInfo
			|		ON SalesOrderItemLIst.Ref = SalesOrderRowIDInfo.SalesOrderRef
			|		AND SalesOrderItemLIst.Key = SalesOrderRowIDInfo.SalesOrderKey
			|;
			|
			|////////////////////////////////////////////////////////////////////////////////
			|SELECT
			|	RowIDInfo.Ref AS Ref,
			|	RowIDInfo.Key AS Key,
			|	MAX(RowIDInfo.RowID) AS RowID
			|INTO RowIDInfo
			|FROM
			|	Document.ShipmentConfirmation.RowIDInfo AS RowIDInfo
			|WHERE
			|	RowIDInfo.Ref = &Ref
			|GROUP BY
			|	RowIDInfo.Ref,
			|	RowIDInfo.Key
			|;
			|
			|////////////////////////////////////////////////////////////////////////////////
			|SELECT
			|	ShipmentConfirmationItemList.Ref.Company AS Company,
			|	ShipmentConfirmationItemList.Store AS Store,
			|	ShipmentConfirmationItemList.ItemKey AS ItemKey,
			|	ShipmentConfirmationItemList.ShipmentBasis AS ShipmentBasis,
			|	ShipmentConfirmationItemList.ShipmentBasis REFS Document.SalesOrder
			|	AND NOT CAST(ShipmentConfirmationItemList.ShipmentBasis AS Document.SalesOrder).Date IS NULL AS UseSalesOrder,
			|	CASE
			|		WHEN ShipmentConfirmationItemList.ShipmentBasis REFS Document.SalesOrder
			|		AND NOT CAST(ShipmentConfirmationItemList.ShipmentBasis AS Document.SalesOrder).Date IS NULL
			|			THEN CAST(ShipmentConfirmationItemList.ShipmentBasis AS
			|				Document.SalesOrder).ShipmentConfirmationsBeforeSalesInvoice
			|		ELSE FALSE
			|	END AS ShipmentBeforeInvoice,
			|	NOT ShipmentConfirmationItemList.ShipmentBasis.Ref IS NULL AS UseShipmentBasis,
			|	NOT ShipmentConfirmationItemList.ShipmentBasis.Ref IS NULL
			|	AND ShipmentConfirmationItemList.ShipmentBasis REFS Document.SalesOrder
			|	AND ISNULL(SalesOrderItemList.ProcurementMethod,
			|		VALUE(Enum.ProcurementMethods.EmptyRef)) = VALUE(Enum.ProcurementMethods.Stock) AS ProcMeth_Stock,
			|	NOT ShipmentConfirmationItemList.ShipmentBasis.Ref IS NULL
			|	AND ShipmentConfirmationItemList.ShipmentBasis REFS Document.SalesOrder
			|	AND ISNULL(SalesOrderItemList.ProcurementMethod,
			|		VALUE(Enum.ProcurementMethods.EmptyRef)) = VALUE(Enum.ProcurementMethods.NoReserve) AS ProcMeth_NoReserve,
			|	ShipmentConfirmationItemList.Ref AS ShipmentConfirmation,
			|	ShipmentConfirmationItemList.Quantity AS Quantity,
			|	0 AS BasisQuantity,
			|	ShipmentConfirmationItemList.Unit AS Unit,
			|	ShipmentConfirmationItemList.ItemKey.Item.Unit AS ItemUnit,
			|	ShipmentConfirmationItemList.ItemKey.Unit AS ItemKeyUnit,
			|	VALUE(Catalog.Units.EmptyRef) AS BasisUnit,
			|	ShipmentConfirmationItemList.ItemKey.Item AS Item,
			|	ShipmentConfirmationItemList.Ref.Date AS Period,
			|	RowIDInfo.RowID AS RowKey
			|FROM
			|	Document.ShipmentConfirmation.ItemList AS ShipmentConfirmationItemList
			|		LEFT JOIN RowIDInfo AS RowIDInfo
			|		ON ShipmentConfirmationItemList.Key = RowIDInfo.Key
			|		LEFT JOIN SalesOrderItemList AS SalesOrderItemList
			|		ON RowIDInfo.RowID = SalesOrderItemList.SalesOrderRowID
			|		AND CAST(ShipmentConfirmationItemList.ShipmentBasis AS Document.SalesOrder) = SalesOrderItemList.SalesOrderRef
			|WHERE
			|	ShipmentConfirmationItemList.Ref = &Ref";
	
	Query.SetParameter("Ref", Ref);
	QueryResults = Query.Execute();
	QueryTable = QueryResults.Unload();
	
	PostingServer.CalculateQuantityByUnit(QueryTable);
	
	TempManager = New TempTablesManager();
	
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text =
		"SELECT
		|	QueryTable.Company AS Company,
		|	QueryTable.Store AS Store,
		|	QueryTable.ItemKey AS ItemKey,
		|	QueryTable.ShipmentBasis AS ShipmentBasis,
		|	QueryTable.UseSalesOrder AS UseSalesOrder,
		|	QueryTable.ShipmentBeforeInvoice AS ShipmentBeforeInvoice,
		|	QueryTable.ShipmentConfirmation AS ShipmentConfirmation,
		|	QueryTable.BasisQuantity AS Quantity,
		|	QueryTable.BasisUnit AS Unit,
		|	QueryTable.Period AS Period,
		|	QueryTable.RowKey AS RowKey,
		|	QueryTable.UseShipmentBasis AS UseShipmentBasis,
		|	QueryTable.ProcMeth_Stock,
		|	QueryTable.ProcMeth_NoReserve
		|INTO tmp
		|FROM
		|	&QueryTable AS QueryTable
		|";
	Query.SetParameter("QueryTable", QueryTable);
	Query.Execute();
	
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text =
		"SELECT * INTO tmp_1 FROM tmp AS tmp
		|WHERE
		|   NOT tmp.UseSalesOrder
		|   AND tmp.UseShipmentBasis";
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find("tmp_1").GetData().IsEmpty() Then
		GetTables_NotUseSO(Tables, TempManager, "tmp_1");
	EndIf;
	
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text =
		"SELECT * INTO tmp_2 FROM tmp AS tmp
		|WHERE
		|           tmp.UseSalesOrder
		|   AND     tmp.UseShipmentBasis
		|   AND NOT tmp.ShipmentBeforeInvoice";
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find("tmp_2").GetData().IsEmpty() Then
		GetTables_UseSO_NotSCBeforeInvoice(Tables, TempManager, "tmp_2");
	EndIf;
	
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text =
		"SELECT * INTO tmp_3 FROM tmp AS tmp
		|WHERE
		|       tmp.UseSalesOrder
		|   AND tmp.UseShipmentBasis
		|   AND tmp.ShipmentBeforeInvoice";
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find("tmp_3").GetData().IsEmpty() Then
		GetTables_UseSO_SCBeforeInvoice(Tables, TempManager, "tmp_3");
	EndIf;
	
//	Query = New Query();
//	Query.TempTablesManager = TempManager;
//	Query.Text =
//		"SELECT * INTO tmp_4 FROM tmp AS tmp
//		|WHERE
//		|   NOT tmp.UseShipmentBasis";
//	Query.Execute();
//	If Not Query.TempTablesManager.Tables.Find("tmp_4").GetData().IsEmpty() Then
//		GetTables_NotUseSCBasis(Tables, TempManager, "tmp_4");
//	EndIf;
	
	Parameters.IsReposting = False;
	
#Region NewRegistersPosting
	QueryArray = GetQueryTextsSecondaryTables();
	Parameters.Insert("QueryParameters", GetAdditionalQueryParamenters(Ref));
	PostingServer.ExecuteQuery(Ref, QueryArray, Parameters);
#EndRegion
	
	Return Tables;
EndFunction

#Region Table_tmp_1

Procedure GetTables_NotUseSO(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text = "SELECT * INTO tmp_1 FROM source AS tmp";
	NewTableName = StrReplace("tmp_1", "tmp", TableName);
	Query.Text = StrReplace(Query.Text, "tmp_1", NewTableName);
	Query.Text = StrReplace(Query.Text, "source", TableName);
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find(NewTableName).GetData().IsEmpty() Then
		GetTables_NotUseSO_IsProduct(Tables, TempManager, NewTableName);
	EndIf;
EndProcedure

Procedure GetTables_NotUseSO_IsProduct(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	
	#Region QueryText
	Query.Text =
//		"//[0] - GoodsInTransitOutgoing
//		|SELECT
//		|	tmp.Store,
//		|	tmp.ItemKey,
//		|	tmp.ShipmentBasis,
//		|	tmp.Quantity AS Quantity,
//		|	tmp.Period,
//		|	tmp.RowKey AS RowKey
//		|FROM
//		|	tmp AS tmp
//		|;
		"//[0] - ShipmentConfirmationSchedule
		|SELECT
		|	tmp.Company AS Company,
		|	tmp.ShipmentBasis AS Order,
		|	tmp.Store AS Store,
		|	tmp.ItemKey AS ItemKey,
		|	tmp.RowKey AS RowKey,
		|	tmp.Quantity AS Quantity,
		|	tmp.Period,
		|	tmp.Period AS DeliveryDate
		|FROM
		|	tmp AS tmp
		|		INNER JOIN AccumulationRegister.ShipmentConfirmationSchedule AS ShipmentConfirmationSchedule
		|		ON ShipmentConfirmationSchedule.Recorder = tmp.ShipmentBasis
		|		AND ShipmentConfirmationSchedule.RowKey = tmp.RowKey
		|		AND ShipmentConfirmationSchedule.Company = tmp.Company
		|		AND ShipmentConfirmationSchedule.Store = tmp.Store
		|		AND ShipmentConfirmationSchedule.ItemKey = tmp.ItemKey
		|		AND ShipmentConfirmationSchedule.RecordType = VALUE(AccumulationRecordType.Receipt)";
	
	Query.Text = StrReplace(Query.Text, "tmp", TableName);
	#EndRegion
	
	QueryResults = Query.ExecuteBatch();
	
//	PostingServer.MergeTables(Tables.GoodsInTransitOutgoing       , QueryResults[0].Unload());
	PostingServer.MergeTables(Tables.ShipmentConfirmationSchedule , QueryResults[0].Unload());
EndProcedure

#EndRegion

#Region Table_tmp_2

Procedure GetTables_UseSO_NotSCBeforeInvoice(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text = "SELECT * INTO tmp_1 FROM source AS tmp";
	NewTableName = StrReplace("tmp_1", "tmp", TableName);
	Query.Text = StrReplace(Query.Text, "tmp_1", NewTableName);
	Query.Text = StrReplace(Query.Text, "source", TableName);
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find(NewTableName).GetData().IsEmpty() Then
		GetTables_UseSO_NotSCBeforeInvoice_IsProduct(Tables, TempManager, NewTableName);
	EndIf;
EndProcedure

Procedure GetTables_UseSO_NotSCBeforeInvoice_IsProduct(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	
	#Region QueryText
	Query.Text =
//		"//[0] - GoodsInTransitOutgoing
//		|SELECT
//		|	tmp.Store,
//		|	tmp.ItemKey,
//		|	tmp.ShipmentBasis,
//		|	tmp.Quantity AS Quantity,
//		|	tmp.Period,
//		|	tmp.RowKey AS RowKey
//		|FROM
//		|	tmp AS tmp
//		|;
		"//[0] - ShipmentOrders
		|SELECT
		|	tmp.ItemKey,
		|	tmp.ShipmentBasis AS Order,
		|	tmp.ShipmentConfirmation AS ShipmentConfirmation,
		|	tmp.Quantity AS Quantity,
		|	tmp.Period,
		|	tmp.RowKey
		|FROM
		|	tmp AS tmp
		|;
		|
		|//[1] - ShipmentConfirmationSchedule
		|SELECT
		|	tmp.Company AS Company,
		|	tmp.ShipmentBasis AS Order,
		|	tmp.Store AS Store,
		|	tmp.ItemKey AS ItemKey,
		|	tmp.RowKey AS RowKey,
		|	tmp.Quantity AS Quantity,
		|	tmp.Period,
		|	tmp.Period AS DeliveryDate
		|FROM
		|	tmp AS tmp
		|		INNER JOIN AccumulationRegister.ShipmentConfirmationSchedule AS ShipmentConfirmationSchedule
		|		ON ShipmentConfirmationSchedule.Recorder = tmp.ShipmentBasis
		|		AND ShipmentConfirmationSchedule.RowKey = tmp.RowKey
		|		AND ShipmentConfirmationSchedule.Company = tmp.Company
		|		AND ShipmentConfirmationSchedule.Store = tmp.Store
		|		AND ShipmentConfirmationSchedule.ItemKey = tmp.ItemKey
		|		AND ShipmentConfirmationSchedule.RecordType = VALUE(AccumulationRecordType.Receipt)";
	
	Query.Text = StrReplace(Query.Text, "tmp", TableName);
	#EndRegion
	
	QueryResults = Query.ExecuteBatch();
	
//	PostingServer.MergeTables(Tables.GoodsInTransitOutgoing       , QueryResults[0].Unload());
	PostingServer.MergeTables(Tables.ShipmentOrders               , QueryResults[0].Unload());
	PostingServer.MergeTables(Tables.ShipmentConfirmationSchedule , QueryResults[1].Unload());
EndProcedure

#EndRegion

#Region Table_tmp_3

Procedure GetTables_UseSO_SCBeforeInvoice(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	Query.Text = "SELECT * INTO tmp_1 FROM source AS tmp";
	NewTableName = StrReplace("tmp_1", "tmp", TableName);
	Query.Text = StrReplace(Query.Text, "tmp_1", NewTableName);
	Query.Text = StrReplace(Query.Text, "source", TableName);
	Query.Execute();
	If Not Query.TempTablesManager.Tables.Find(NewTableName).GetData().IsEmpty() Then
		GetTables_UseSO_SCBeforeInvoice_IsProduct(Tables, TempManager, NewTableName);
	EndIf;
EndProcedure

Procedure GetTables_UseSO_SCBeforeInvoice_IsProduct(Tables, TempManager, TableName)
	Query = New Query();
	Query.TempTablesManager = TempManager;
	
	#Region QueryText
	Query.Text =
//		"//[0] - GoodsInTransitOutgoing
//		|SELECT
//		|	tmp.Store,
//		|	tmp.ItemKey,
//		|	tmp.ShipmentBasis,
//		|	tmp.Quantity AS Quantity,
//		|	tmp.Period,
//		|	tmp.RowKey AS RowKey
//		|FROM
//		|	tmp AS tmp
//		|;
		"//[0] - ShipmentOrders
		|SELECT
		|	tmp.ItemKey,
		|	tmp.ShipmentBasis AS Order,
		|	tmp.ShipmentConfirmation AS ShipmentConfirmation,
		|	tmp.Quantity AS Quantity,
		|	tmp.Period,
		|	tmp.RowKey
		|FROM
		|	tmp AS tmp
		|;
		|
		|//[1] - ShipmentConfirmationSchedule
		|SELECT
		|	tmp.Company AS Company,
		|	tmp.ShipmentBasis AS Order,
		|	tmp.Store AS Store,
		|	tmp.ItemKey AS ItemKey,
		|	tmp.RowKey AS RowKey,
		|	tmp.Quantity AS Quantity,
		|	tmp.Period,
		|	tmp.Period AS DeliveryDate
		|FROM
		|	tmp AS tmp
		|		INNER JOIN AccumulationRegister.ShipmentConfirmationSchedule AS ShipmentConfirmationSchedule
		|		ON ShipmentConfirmationSchedule.Recorder = tmp.ShipmentBasis
		|		AND ShipmentConfirmationSchedule.RowKey = tmp.RowKey
		|		AND ShipmentConfirmationSchedule.Company = tmp.Company
		|		AND ShipmentConfirmationSchedule.Store = tmp.Store
		|		AND ShipmentConfirmationSchedule.ItemKey = tmp.ItemKey
		|		AND ShipmentConfirmationSchedule.RecordType = VALUE(AccumulationRecordType.Receipt)";
	
	Query.Text = StrReplace(Query.Text, "tmp", TableName);
	#EndRegion
	
	QueryResults = Query.ExecuteBatch();
	
//	PostingServer.MergeTables(Tables.GoodsInTransitOutgoing       , QueryResults[0].Unload());
	PostingServer.MergeTables(Tables.ShipmentOrders               , QueryResults[0].Unload());
	PostingServer.MergeTables(Tables.ShipmentConfirmationSchedule , QueryResults[1].Unload());
EndProcedure

#EndRegion

//#Region Table_tmp_4

//Procedure GetTables_NotUseSCBasis(Tables, TempManager, TableName)
//	Query = New Query();
//	Query.TempTablesManager = TempManager;
//	Query.Text = "SELECT * INTO tmp_1 FROM source AS tmp";
//	NewTableName = StrReplace("tmp_1", "tmp", TableName);
//	Query.Text = StrReplace(Query.Text, "tmp_1", NewTableName);
//	Query.Text = StrReplace(Query.Text, "source", TableName);
//	Query.Execute();
//	If Not Query.TempTablesManager.Tables.Find(NewTableName).GetData().IsEmpty() Then
//		GetTables_NotUseSCBasis_IsProduct(Tables, TempManager, NewTableName);
//	EndIf;
//EndProcedure

//Procedure GetTables_NotUseSCBasis_IsProduct(Tables, TempManager, TableName)
//	Query = New Query();
//	Query.TempTablesManager = TempManager;
//	
//	#Region QueryText
//	Query.Text =
//		"//[0] - GoodsInTransitOutgoing
//		|SELECT
//		|	tmp.Store,
//		|	tmp.ItemKey,
//		|	tmp.ShipmentConfirmation AS ShipmentBasis,
//		|	tmp.Quantity AS Quantity,
//		|	tmp.Period,
//		|	tmp.RowKey AS RowKey
//		|FROM
//		|	tmp AS tmp";
//	
//	Query.Text = StrReplace(Query.Text, "tmp", TableName);
//	#EndRegion
//	
//	QueryResults = Query.ExecuteBatch();
//	PostingServer.MergeTables(Tables.GoodsInTransitOutgoing , QueryResults[0].Unload());
//EndProcedure

//#EndRegion

Function PostingGetLockDataSource(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	DataMapWithLockFields = New Map();
	Return DataMapWithLockFields;
EndFunction

Procedure PostingCheckBeforeWrite(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
#Region NewRegisterPosting
	Tables = Parameters.DocumentDataTables;	
	QueryArray = GetQueryTextsMasterTables();
	PostingServer.SetRegisters(Tables, Ref);
	PostingServer.FillPostingTables(Tables, Ref, QueryArray, Parameters);
#EndRegion
EndProcedure

Function PostingGetPostingDataTables(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	PostingDataTables = New Map();
	
//	// GoodsInTransitOutgoing
//	PostingDataTables.Insert(Parameters.Object.RegisterRecords.GoodsInTransitOutgoing,
//		New Structure("RecordType, RecordSet, WriteInTransaction",
//			AccumulationRecordType.Expense,
//			Parameters.DocumentDataTables.GoodsInTransitOutgoing,
//			True));
	
	// ShipmentOrders
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.ShipmentOrders,
		New Structure("RecordType, RecordSet, WriteInTransaction",
			AccumulationRecordType.Receipt,
			Parameters.DocumentDataTables.ShipmentOrders,
			True));
	
	// ShipmentConfirmationSchedule
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.ShipmentConfirmationSchedule,
		New Structure("RecordType, RecordSet, WriteInTransaction",
			AccumulationRecordType.Expense,
			Parameters.DocumentDataTables.ShipmentConfirmationSchedule,
			Parameters.IsReposting));
		
#Region NewRegistersPosting
	PostingServer.SetPostingDataTables(PostingDataTables, Parameters);
#EndRegion		
	Return PostingDataTables;
EndFunction

Procedure PostingCheckAfterWrite(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	CheckAfterWrite(Ref, Cancel, Parameters, AddInfo);
EndProcedure

#EndRegion

#Region Undoposting

Function UndopostingGetDocumentDataTables(Ref, Cancel, Parameters, AddInfo = Undefined) Export
	Return PostingGetDocumentDataTables(Ref, Cancel, Undefined, Parameters, AddInfo);
EndFunction

Function UndopostingGetLockDataSource(Ref, Cancel, Parameters, AddInfo = Undefined) Export
	DataMapWithLockFields = New Map();
	Return DataMapWithLockFields;
EndFunction

Procedure UndopostingCheckBeforeWrite(Ref, Cancel, Parameters, AddInfo = Undefined) Export
#Region NewRegistersPosting
	QueryArray = GetQueryTextsMasterTables();
	PostingServer.ExecuteQuery(Ref, QueryArray, Parameters);
#EndRegion
EndProcedure

Procedure UndopostingCheckAfterWrite(Ref, Cancel, Parameters, AddInfo = Undefined) Export
	Parameters.Insert("Unposting", True);
	CheckAfterWrite(Ref, Cancel, Parameters, AddInfo);
EndProcedure

#EndRegion

#Region CheckAfterWrite

Procedure CheckAfterWrite(Ref, Cancel, Parameters, AddInfo = Undefined)
	Unposting = ?(Parameters.Property("Unposting"), Parameters.Unposting, False);
	AccReg = AccumulationRegisters;
	
	Parameters.Insert("RecordType", AccumulationRecordType.Expense);
	PostingServer.CheckBalance_AfterWrite(Ref, Cancel, Parameters, "Document.ShipmentConfirmation.ItemList", AddInfo);
		
	LineNumberAndRowKeyFromItemList = PostingServer.GetLineNumberAndRowKeyFromItemList(Ref, "Document.ShipmentConfirmation.ItemList");
//	If Not Cancel And Not AccReg.GoodsInTransitOutgoing.CheckBalance(Ref, LineNumberAndRowKeyFromItemList,
//	                                                                 Parameters.DocumentDataTables.GoodsInTransitOutgoing,
//	                                                                 Parameters.DocumentDataTables.GoodsInTransitOutgoing_Exists,
//	                                                                 AccumulationRecordType.Expense, Unposting, AddInfo) Then
//		Cancel = True;
//	EndIf;
	
	If Not Cancel And Not AccReg.ShipmentOrders.CheckBalance(Ref, LineNumberAndRowKeyFromItemList,
	                                                         Parameters.DocumentDataTables.ShipmentOrders,
	                                                         Parameters.DocumentDataTables.ShipmentOrders_Exists,
	                                                         AccumulationRecordType.Receipt, Unposting, AddInfo) Then
		Cancel = True;
	EndIf;
EndProcedure

#EndRegion

#Region NewRegistersPosting

Function GetInformationAboutMovements(Ref) Export
	Str = New Structure;
	Str.Insert("QueryParamenters", GetAdditionalQueryParamenters(Ref));
	Str.Insert("QueryTextsMasterTables", GetQueryTextsMasterTables());
	Str.Insert("QueryTextsSecondaryTables", GetQueryTextsSecondaryTables());
	Return Str;
EndFunction

Function GetAdditionalQueryParamenters(Ref)
	StrParams = New Structure();
	StrParams.Insert("Ref", Ref);
	If ValueIsFilled(Ref) Then
		StrParams.Insert("BalancePeriod", New Boundary(Ref.PointInTime(), BoundaryType.Excluding));
	Else
		StrParams.Insert("BalancePeriod", Undefined);
	EndIf;
	Return StrParams;
EndFunction

Function GetQueryTextsSecondaryTables()
	QueryArray = New Array;
	QueryArray.Add(ItemList());
	QueryArray.Add(PostingServer.Exists_R4010B_ActualStocks());
	QueryArray.Add(PostingServer.Exists_R4011B_FreeStocks());
	Return QueryArray;	
EndFunction

Function GetQueryTextsMasterTables()
	QueryArray = New Array;
	QueryArray.Add(R2011B_SalesOrdersShipment());
	QueryArray.Add(R2013T_SalesOrdersProcurement());
	QueryArray.Add(R2031B_ShipmentInvoicing());
	QueryArray.Add(R1031B_ReceiptInvoicing());
	QueryArray.Add(R4010B_ActualStocks());
	QueryArray.Add(R4011B_FreeStocks());
	QueryArray.Add(R4012B_StockReservation());
	QueryArray.Add(R4022B_StockTransferOrdersShipment());
	QueryArray.Add(R4032B_GoodsInTransitOutgoing());
	QueryArray.Add(R4034B_GoodsShipmentSchedule());
	Return QueryArray;	
EndFunction	

Function ItemList()
	Return
	"SELECT
	|	RowIDInfo.Ref AS Ref,
	|	RowIDInfo.Key AS Key,
	|	MAX(RowIDInfo.RowID) AS RowID
	|INTO TableRowIDInfo
	|FROM
	|	Document.ShipmentConfirmation.RowIDInfo AS RowIDInfo
	|WHERE
	|	RowIDInfo.Ref = &Ref
	|GROUP BY
	|	RowIDInfo.Ref,
	|	RowIDInfo.Key
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	ItemList.Ref.Company AS Company,
	|	ItemList.Store AS Store,
	|	ItemList.ItemKey AS ItemKey,
	|	ItemList.Ref AS ShipmentConfirmation,
	|	ItemList.Quantity AS UnitQuantity,
	|	ItemList.QuantityInBaseUnit AS Quantity,
	|	ItemList.Unit,
	|	ItemList.Ref.Date AS Period,
	|	TableRowIDInfo.RowID AS RowKey,
	|	ItemList.SalesOrder AS SalesOrder,
	|	NOT ItemList.SalesOrder.Ref IS NULL AS SalesOrderExists,
	|	ItemList.SalesInvoice AS SalesInvoice,
	|	NOT ItemList.SalesInvoice.Ref IS NULL AS SalesInvoiceExists,
	|	ItemList.PurchaseReturnOrder AS PurchaseReturnOrder,
	|	NOT ItemList.PurchaseReturnOrder.Ref IS NULL AS PurchaseReturnOrderExists,
	|	ItemList.PurchaseReturn AS PurchaseReturn,
	|	NOT ItemList.PurchaseReturn.Ref IS NULL AS PurchaseReturnExists,
	|	ItemList.InventoryTransferOrder AS InventoryTransferOrder,
	|	NOT ItemList.InventoryTransferOrder.Ref IS NULL AS InventoryTransferOrderExists,
	|	ItemList.InventoryTransfer AS InventoryTransfer,
	|	NOT ItemList.InventoryTransfer.Ref IS NULL AS InventoryTransferExists,
	|	ItemList.Ref.TransactionType = VALUE(Enum.ShipmentConfirmationTransactionTypes.Sales) AS IsTransaction_Sales,
	|	ItemList.Ref.TransactionType = VALUE(Enum.ShipmentConfirmationTransactionTypes.ReturnToVendor) AS
	|		IsTransaction_ReturnToVendor,
	|	ItemList.Ref.TransactionType = VALUE(Enum.ShipmentConfirmationTransactionTypes.InventoryTransfer) AS
	|		IsTransaction_InventoryTransfer
	|INTO ItemList
	|FROM
	|	Document.ShipmentConfirmation.ItemList AS ItemList
	|		INNER JOIN TableRowIDInfo AS TableRowIDInfo
	|		ON ItemList.Key = TableRowIDInfo.Key
	|WHERE
	|	ItemList.Ref = &Ref";
EndFunction

Function R2011B_SalesOrdersShipment()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemList.SalesOrder AS Order,
		|	*
		|INTO R2011B_SalesOrdersShipment
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesOrderExists";

EndFunction

Function R2013T_SalesOrdersProcurement()
	Return
		"SELECT
		|	ItemList.Quantity AS ShippedQuantity,
		|	ItemList.SalesOrder AS Order,
		|	*
		|INTO R2013T_SalesOrdersProcurement
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesOrderExists";
EndFunction

Function R2031B_ShipmentInvoicing()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.ShipmentConfirmation AS Basis,
		|	ItemList.Quantity AS Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|INTO R2031B_ShipmentInvoicing
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	NOT ItemList.SalesInvoiceExists
		|	AND ItemList.IsTransaction_Sales
		|
		|UNION ALL
		|
		|SELECT
		|	VALUE(AccumulationRecordType.Expense),
		|	ItemList.SalesInvoice,
		|	ItemList.Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesInvoiceExists
		|	AND ItemList.IsTransaction_Sales";
EndFunction

Function R1031B_ReceiptInvoicing()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.ShipmentConfirmation AS Basis,
		|	ItemList.Quantity AS Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|INTO R1031B_ReceiptInvoicing
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	NOT ItemList.PurchaseReturnExists
		|	AND ItemList.IsTransaction_ReturnToVendor
		|
		|UNION ALL
		|
		|SELECT
		|	VALUE(AccumulationRecordType.Expense),
		|	ItemList.PurchaseReturn,
		|	ItemList.Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.PurchaseReturnExists
		|	AND ItemList.IsTransaction_ReturnToVendor";
EndFunction	

#Region Stock

Function R4010B_ActualStocks()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	*
		|INTO R4010B_ActualStocks
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	TRUE";
EndFunction

Function R4011B_FreeStocks()
	Return
		"SELECT
		|	ItemList.Period AS Period,
		|	ItemList.Store AS Store,
		|	ItemList.ItemKey AS ItemKey,
		|	ItemList.SalesOrder AS SalesOrder,
		|	ItemList.SalesInvoice AS SalesInvoice,
		|	ItemList.SalesOrderExists AS SalesOrderExists,
		|	ItemList.SalesInvoiceExists AS SalesInvoiceExists,
		|	ItemList.InventoryTransferOrder AS InventoryTransferOrder,
		|	ItemList.InventoryTransferOrderExists AS InventoryTransferOrderExists,
		|	SUM(ItemList.Quantity) AS Quantity
		|INTO ItemListGroup
		|FROM
		|	ItemList AS ItemList
		|GROUP BY
		|	ItemList.Period,
		|	ItemList.Store,
		|	ItemList.ItemKey,
		|	ItemList.SalesOrder,
		|	ItemList.SalesInvoice,
		|	ItemList.SalesOrderExists,
		|	ItemList.SalesInvoiceExists,
		|	ItemList.InventoryTransferOrder,
		|	ItemList.InventoryTransferOrderExists
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|SELECT
		|	StockReservation.Store AS Store,
		|	StockReservation.Order AS Basis,
		|	StockReservation.ItemKey AS ItemKey,
		|	StockReservation.QuantityBalance AS Quantity
		|INTO TmpStockReservation
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.SalesOrder
		|		FROM
		|			ItemList AS ItemList)) AS StockReservation
		|WHERE
		|	StockReservation.QuantityBalance > 0
		|
		|UNION ALL
		|
		|SELECT
		|	StockReservation.Store,
		|	StockReservation.Order,
		|	StockReservation.ItemKey,
		|	StockReservation.QuantityBalance
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.SalesInvoice
		|		FROM
		|			ItemList AS ItemList)) AS StockReservation
		|WHERE
		|	StockReservation.QuantityBalance > 0
		|
		|UNION ALL
		|
		|SELECT
		|	StockReservation.Store,
		|	StockReservation.Order,
		|	StockReservation.ItemKey,
		|	StockReservation.QuantityBalance
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.InventoryTransferOrder
		|		FROM
		|			ItemList AS ItemList)) AS StockReservation
		|WHERE
		|	StockReservation.QuantityBalance > 0
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemListGroup.Period AS Period,
		|	ItemListGroup.Store AS Store,
		|	ItemListGroup.ItemKey AS ItemKey,
		|	ItemListGroup.Quantity - ISNULL(TmpStockReservation.Quantity, 0) AS Quantity
		|INTO R4011B_FreeStocks
		|FROM
		|	ItemListGroup AS ItemListGroup
		|		LEFT JOIN TmpStockReservation AS TmpStockReservation
		|		ON (ItemListGroup.Store = TmpStockReservation.Store)
		|		AND (ItemListGroup.ItemKey = TmpStockReservation.ItemKey)
		|		AND (TmpStockReservation.Basis = ItemListGroup.SalesOrder
		|		OR TmpStockReservation.Basis = ItemListGroup.SalesInvoice
		|		OR TmpStockReservation.Basis = ItemListGroup.InventoryTransferOrder)
		|WHERE
		|	ItemListGroup.Quantity > ISNULL(TmpStockReservation.Quantity, 0)
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|DROP ItemListGroup
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|DROP TmpStockReservation";
EndFunction

Function R4012B_StockReservation()
	Return
		"SELECT
		|	ItemList.Period,
		|	ItemList.Store,
		|	ItemList.ItemKey,
		|	ItemList.SalesOrder,
		|	ItemList.SalesInvoice,
		|	ItemList.InventoryTransferOrder,
		|	SUM(ItemList.Quantity) AS Quantity
		|INTO ItemListGroup
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesOrderExists
		|	OR ItemList.SalesInvoiceExists
		|	OR ItemList.InventoryTransferOrderExists
		|GROUP BY
		|	ItemList.Period,
		|	ItemList.Store,
		|	ItemList.ItemKey,
		|	ItemList.SalesOrder,
		|	ItemList.SalesInvoice,
		|	ItemList.InventoryTransferOrder
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|SELECT
		|	*
		|INTO TmpStockReservation
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.SalesOrder
		|		FROM
		|			ItemListGroup AS ItemList))
		|
		|UNION ALL
		|
		|SELECT
		|	*
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.SalesInvoice
		|		FROM
		|			ItemListGroup AS ItemList))
		|
		|UNION ALL
		|
		|SELECT
		|	*
		|FROM
		|	AccumulationRegister.R4012B_StockReservation.Balance(&BalancePeriod, (Store, ItemKey, Order) IN
		|		(SELECT
		|			ItemList.Store,
		|			ItemList.ItemKey,
		|			ItemList.InventoryTransferOrder
		|		FROM
		|			ItemListGroup AS ItemList)) AS StockReservation
		|WHERE
		|	StockReservation.QuantityBalance > 0
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemList.Period AS Period,
		|	ItemList.SalesOrder AS Order,
		|	ItemList.ItemKey AS ItemKey,
		|	ItemList.Store AS Store,
		|	CASE
		|		WHEN StockReservation.QuantityBalance > ItemList.Quantity
		|			THEN ItemList.Quantity
		|		ELSE StockReservation.QuantityBalance
		|	END AS Quantity
		|INTO R4012B_StockReservation
		|FROM
		|	ItemListGroup AS ItemList
		|		INNER JOIN TmpStockReservation AS StockReservation
		|		ON (ItemList.SalesOrder = StockReservation.Order
		|			OR ItemList.SalesInvoice = StockReservation.Order
		|			OR ItemList.InventoryTransferOrder = StockReservation.Order)
		|		AND ItemList.ItemKey = StockReservation.ItemKey
		|		AND ItemList.Store = StockReservation.Store
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|DROP TmpStockReservation
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|DROP ItemListGroup";
EndFunction

Function R4032B_GoodsInTransitOutgoing()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|CASE
		|	When ItemList.IsTransaction_Sales AND ItemList.SalesInvoiceExists Then
		|		ItemList.SalesInvoice
		|	When ItemList.IsTransaction_InventoryTransfer AND ItemList.InventoryTransferExists Then
		|		ItemList.InventoryTransfer
		|	When ItemList.IsTransaction_ReturnToVendor AND ItemList.PurchaseReturnExists Then
		|		ItemList.PurchaseReturn
		|ELSE
		|		ItemList.ShipmentConfirmation
		|END AS Basis,
		|	*
		|INTO R4032B_GoodsInTransitOutgoing
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	TRUE";

EndFunction

#EndRegion

Function R4022B_StockTransferOrdersShipment()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemList.InventoryTransferOrder AS Order,
		|	*
		|INTO R4022B_StockTransferOrdersShipment
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.InventoryTransferOrderExists";

EndFunction

Function R4034B_GoodsShipmentSchedule()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemList.SalesOrder AS Basis,
		|	*
		|INTO R4034B_GoodsShipmentSchedule
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesOrderExists
		|	AND ItemList.SalesOrder.UseItemsShipmentScheduling";

EndFunction

#EndRegion

