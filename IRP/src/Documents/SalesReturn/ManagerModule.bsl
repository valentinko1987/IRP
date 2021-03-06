#Region Posting

Function PostingGetDocumentDataTables(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	
	AccReg = Metadata.AccumulationRegisters;
	Tables = New Structure();
	Tables.Insert("OrderBalance"                          , PostingServer.CreateTable(AccReg.OrderBalance));
	Tables.Insert("PartnerApTransactions"                 , PostingServer.CreateTable(AccReg.PartnerApTransactions));
	Tables.Insert("AdvanceToSuppliers_Lock"               , PostingServer.CreateTable(AccReg.AdvanceToSuppliers));
	Tables.Insert("PartnerApTransactions_OffsetOfAdvance" , PostingServer.CreateTable(AccReg.AdvanceToSuppliers));
	Tables.Insert("SalesReturnTurnovers"                  , PostingServer.CreateTable(AccReg.SalesReturnTurnovers));
	Tables.Insert("SalesTurnovers"                        , PostingServer.CreateTable(AccReg.SalesTurnovers));
	Tables.Insert("Aging_Expense"                         , PostingServer.CreateTable(AccReg.Aging));
	Tables.Insert("PartnerArTransactions"                 , PostingServer.CreateTable(AccReg.PartnerArTransactions));
	Tables.Insert("ExpensesTurnovers"                     , PostingServer.CreateTable(AccReg.ExpensesTurnovers));
	
	Query = New Query();
	Query.SetParameter("Ref", Ref);
	Query.Text = GetQueryTextQueryTable();
	QueryResults = Query.ExecuteBatch();
	
	QuerySalesTurnovers = New Query();
	QuerySalesTurnovers.Text = GetQueryTextSalesReturnSalesTurnovers();
	QuerySalesTurnovers.SetParameter("Ref", Ref);
	QueryResultSalesTurnovers = QuerySalesTurnovers.Execute();
	QueryTableSalesTurnovers = QueryResultSalesTurnovers.Unload();
	
	Tables.OrderBalance                     = QueryResults[3].Unload();
	Tables.PartnerApTransactions            = QueryResults[4].Unload();
	Tables.AdvanceToSuppliers_Lock          = QueryResults[5].Unload();
	Tables.SalesReturnTurnovers             = QueryResults[6].Unload();
	Tables.PartnerArTransactions            = QueryResults[7].Unload();
	Tables.ExpensesTurnovers	            = QueryResults[8].Unload();
	
	Tables.SalesTurnovers = QueryTableSalesTurnovers;
	
	Parameters.IsReposting = False;
	
#Region NewRegistersPosting	
	QueryArray = GetQueryTextsSecondaryTables();
	Parameters.Insert("QueryParameters", GetAdditionalQueryParamenters(Ref));
	PostingServer.ExecuteQuery(Ref, QueryArray, Parameters);
	
	Tables.Insert("CustomersTransactions", 
	PostingServer.GetQueryTableByName("CustomersTransactions", Parameters));	
#EndRegion	
	
	Return Tables;
EndFunction

Function GetQueryTextSalesReturnSalesTurnovers()
	Return 
	"SELECT
	|	RowIDInfo.Ref AS Ref,
	|	RowIDInfo.Key AS Key,
	|	MAX(RowIDInfo.RowID) AS RowID
	|INTO RowIDInfo
	|FROM
	|	Document.SalesReturn.RowIDInfo AS RowIDInfo
	|WHERE
	|	RowIDInfo.Ref = &Ref
	|GROUP BY
	|	RowIDInfo.Ref,
	|	RowIDInfo.Key
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////	
	|SELECT
	|	SalesReturnItemList.Ref.Company AS Company,
	|	SalesReturnItemList.Ref.Currency AS Currency,
	|	SalesReturnItemList.ItemKey AS ItemKey,
	|	SalesReturnItemList.Quantity AS Quantity,
	|	ISNULL(SalesReturnSerialLotNumbers.Quantity, 0) AS QuantityBySerialLtNumbers,
	|	SalesReturnItemList.Ref.Date AS Period,
	|	CASE
	|		WHEN SalesReturnItemList.SalesInvoice.Date IS NULL
	|		OR VALUETYPE(SalesReturnItemList.SalesInvoice) <> TYPE(Document.SalesInvoice)
	|			THEN SalesReturnItemList.Ref
	|		ELSE SalesReturnItemList.SalesInvoice
	|	END AS SalesInvoice,
	|	SalesReturnItemList.TotalAmount AS Amount,
	|	SalesReturnItemList.NetAmount AS NetAmount,
	|	SalesReturnItemList.OffersAmount AS OffersAmount,
	|	RowIDInfo.RowID AS RowKey,
	|	SalesReturnSerialLotNumbers.SerialLotNumber AS SerialLotNumber
	|INTO tmp
	|FROM
	|	Document.SalesReturn.ItemList AS SalesReturnItemList
	|		LEFT JOIN Document.SalesReturn.SerialLotNumbers AS SalesReturnSerialLotNumbers
	|		ON SalesReturnItemList.Key = SalesReturnSerialLotNumbers.Key
	|		AND SalesReturnItemList.Ref = SalesReturnSerialLotNumbers.Ref
	|		AND SalesReturnItemList.Ref = &Ref
	|		AND SalesReturnSerialLotNumbers.Ref = &Ref
	|		LEFT JOIN RowIDInfo AS RowIDInfo
	|		ON SalesReturnItemList.Key = RowIDInfo.Key
	|WHERE
	|	SalesReturnItemList.Ref = &Ref
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company AS Company,
	|	tmp.Currency AS Currency,
	|	tmp.ItemKey AS ItemKey,
	|	-CASE
	|		WHEN tmp.QuantityBySerialLtNumbers = 0
	|			THEN tmp.Quantity
	|		ELSE tmp.QuantityBySerialLtNumbers
	|	END AS Quantity,
	|	tmp.Period AS Period,
	|	tmp.SalesInvoice AS SalesINvoice,
	|	tmp.RowKey AS RowKey,
	|	tmp.SerialLotNumber AS SerialLotNumber,
	|	-CASE
	|		WHEN tmp.QuantityBySerialLtNumbers <> 0
	|			THEN CASE
	|				WHEN tmp.Quantity = 0
	|					THEN 0
	|				ELSE tmp.Amount / tmp.Quantity * tmp.QuantityBySerialLtNumbers
	|			END
	|		ELSE tmp.Amount
	|	END AS Amount,
	|	-CASE
	|		WHEN tmp.QuantityBySerialLtNumbers <> 0
	|			THEN CASE
	|				WHEN tmp.Quantity = 0
	|					THEN 0
	|				ELSE tmp.NetAmount / tmp.Quantity * tmp.QuantityBySerialLtNumbers
	|			END
	|		ELSE tmp.NetAmount
	|	END AS NetAmount,
	|	-CASE
	|		WHEN tmp.QuantityBySerialLtNumbers <> 0
	|			THEN CASE
	|				WHEN tmp.Quantity = 0
	|					THEN 0
	|				ELSE tmp.OffersAmount / tmp.Quantity * tmp.QuantityBySerialLtNumbers
	|			END
	|		ELSE tmp.OffersAmount
	|	END AS OffersAmount
	|FROM
	|	tmp AS tmp";
EndFunction	

Function GetQueryTextQueryTable()
	Return 	
	"SELECT
	|	RowIDInfo.Ref AS Ref,
	|	RowIDInfo.Key AS Key,
	|	MAX(RowIDInfo.RowID) AS RowID
	|INTO RowIDInfo
	|FROM
	|	Document.SalesReturn.RowIDInfo AS RowIDInfo
	|WHERE
	|	RowIDInfo.Ref = &Ref
	|GROUP BY
	|	RowIDInfo.Ref,
	|	RowIDInfo.Key
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////	
	|SELECT
	|	SalesReturnGoodsReceipts.Key
	|INTO GoodsReceipts
	|FROM
	|	Document.SalesReturn.GoodsReceipts AS SalesReturnGoodsReceipts
	|WHERE
	|	SalesReturnGoodsReceipts.Ref = &Ref
	|GROUP BY
	|	SalesReturnGoodsReceipts.Key
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	SalesReturnItemList.Ref.Company AS Company,
	|	SalesReturnItemList.Store AS Store,
	|	SalesReturnItemList.Store.UseGoodsReceipt AS UseGoodsReceipt,
	|	SalesReturnItemList.ItemKey AS ItemKey,
	|	SalesReturnItemList.SalesReturnOrder AS Order,
	|	SalesReturnItemList.Ref AS SalesReturn,
	|	SalesReturnItemList.Ref AS ReceiptBasis,
	|	CASE
	|		WHEN SalesReturnItemList.Ref.Agreement.ApArPostingDetail = VALUE(Enum.ApArPostingDetail.ByDocuments)
	|			THEN SalesReturnItemList.Ref
	|		ELSE UNDEFINED
	|	END AS BasisDocument,
	|	SalesReturnItemList.TotalAmount AS Amount,
	|	SalesReturnItemList.Ref.Partner AS Partner,
	|	SalesReturnItemList.Ref.LegalName AS LegalName,
	|	CASE
	|		WHEN SalesReturnItemList.Ref.Agreement.Kind = VALUE(Enum.AgreementKinds.Regular)
	|		AND SalesReturnItemList.Ref.Agreement.ApArPostingDetail = VALUE(Enum.ApArPostingDetail.ByStandardAgreement)
	|			THEN SalesReturnItemList.Ref.Agreement.StandardAgreement
	|		ELSE SalesReturnItemList.Ref.Agreement
	|	END AS Agreement,
	|	ISNULL(SalesReturnItemList.Ref.Currency, VALUE(Catalog.Currencies.EmptyRef)) AS Currency,
	|	0 AS BasisQuantity,
	|	SalesReturnItemList.Unit,
	|	SalesReturnItemList.ItemKey.Item.Unit AS ItemUnit,
	|	SalesReturnItemList.ItemKey.Unit AS ItemKeyUnit,
	|	VALUE(Catalog.Units.EmptyRef) AS BasisUnit,
	|	SalesReturnItemList.ItemKey.Item AS Item,
	|	SalesReturnItemList.Ref.Date AS Period,
	|	CASE
	|		WHEN SalesReturnItemList.SalesInvoice.Date IS NULL
	|		OR VALUETYPE(SalesReturnItemList.SalesInvoice) <> TYPE(Document.SalesInvoice)
	|			THEN SalesReturnItemList.Ref
	|		ELSE SalesReturnItemList.SalesInvoice
	|	END AS SalesInvoice,
	|	SalesReturnItemList.SalesInvoice AS AgingSalesInvoice,
	|	RowIDInfo.RowID AS RowKey,
	|	CASE
	|		WHEN SalesReturnItemList.ItemKey.Item.ItemType.Type = VALUE(Enum.ItemTypes.Service)
	|			THEN TRUE
	|		ELSE FALSE
	|	END AS IsService,
	|	NOT GoodsReceipts.Key IS NULL AS GoodsReceiptExists,
	|	SalesReturnItemList.BusinessUnit,
	|	SalesReturnItemList.ExpenseType,
	|	SalesReturnItemList.AdditionalAnalytic,
	|	SalesReturnItemList.QuantityInBaseUnit AS Quantity
	|INTO tmp
	|FROM
	|	Document.SalesReturn.ItemList AS SalesReturnItemList
	|		LEFT JOIN GoodsReceipts AS GoodsReceipts
	|		ON SalesReturnItemList.Key = GoodsReceipts.Key
	|		LEFT JOIN RowIDInfo AS RowIDInfo
	|		ON SalesReturnItemList.Key = RowIDInfo.Key
	|WHERE
	|	SalesReturnItemList.Ref = &Ref
	|;
	|// 3. OrderBalance //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company,
	|	tmp.Store,
	|	tmp.ItemKey,
	|	tmp.Order AS Order,
	|	tmp.Quantity AS Quantity,
	|	tmp.Unit AS Unit,
	|	tmp.Period,
	|	tmp.RowKey
	|FROM
	|	tmp AS tmp
	|WHERE
	|	tmp.Order <> VALUE(Document.SalesReturnOrder.EmptyRef)
	|;
	|// 4. PartnerApTransactions //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company AS Company,
	|	tmp.BasisDocument AS BasisDocument,
	|	tmp.Partner AS Partner,
	|	tmp.LegalName AS LegalName,
	|	tmp.Agreement AS Agreement,
	|	tmp.Currency AS Currency,
	|	SUM(Amount) AS Amount,
	|	tmp.Period
	|FROM
	|	tmp AS tmp
	|GROUP BY
	|	tmp.Company,
	|	tmp.BasisDocument,
	|	tmp.Partner,
	|	tmp.LegalName,
	|	tmp.Agreement,
	|	tmp.Currency,
	|	tmp.Period
	|;
	|// 5. AdvanceToSuppliers_Lock //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company AS Company,
	|	tmp.BasisDocument AS BasisDocument,
	|	tmp.Partner AS Partner,
	|	tmp.LegalName AS LegalName,
	|	tmp.Agreement AS Agreement,
	|	tmp.Currency AS Currency,
	|	SUM(tmp.Amount) AS DocumentAmount,
	|	tmp.Period
	|FROM
	|	tmp AS tmp
	|GROUP BY
	|	tmp.Company,
	|	tmp.BasisDocument,
	|	tmp.Partner,
	|	tmp.LegalName,
	|	tmp.Agreement,
	|	tmp.Currency,
	|	tmp.Period
	|;
	|// 6. SalesReturnTurnovers //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company,
	|	tmp.Currency,
	|	tmp.ItemKey,
	|	-SUM(tmp.Quantity) AS Quantity,
	|	-SUM(tmp.Amount) AS Amount,
	|	tmp.Period,
	|	tmp.SalesInvoice,
	|	tmp.RowKey
	|FROM
	|	tmp AS tmp
	|GROUP BY
	|	tmp.Company,
	|	tmp.Currency,
	|	tmp.ItemKey,
	|	tmp.Period,
	|	tmp.SalesInvoice,
	|	tmp.RowKey
	|;
	|// 7. PartnerArTransactions //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company AS Company,
	|	tmp.AgingSalesInvoice AS BasisDocument,
	|	tmp.Partner AS Partner,
	|	tmp.LegalName AS LegalName,
	|	tmp.Agreement AS Agreement,
	|	tmp.Currency AS Currency,
	|	SUM(Amount) AS Amount,
	|	tmp.Period
	|FROM
	|	tmp AS tmp
	|WHERE
	|	NOT tmp.SalesInvoice.Date IS NULL
	|GROUP BY
	|	tmp.Company,
	|	tmp.AgingSalesInvoice,
	|	tmp.Partner,
	|	tmp.LegalName,
	|	tmp.Agreement,
	|	tmp.Currency,
	|	tmp.Period
	|;
	|// 8. ExpensesTurnovers //////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	tmp.Company AS Company,
	|	tmp.BusinessUnit AS BusinessUnit,
	|	tmp.ExpenseType AS ExpenseType,
	|	tmp.ItemKey AS ItemKey,
	|	tmp.Currency AS Currency,
	|	tmp.AdditionalAnalytic AS AdditionalAnalytic,
	|	tmp.Period AS Period,
	|	SUM(tmp.Amount) AS Amount
	|FROM
	|	tmp AS tmp
	|GROUP BY
	|	tmp.Company,
	|	tmp.BusinessUnit,
	|	tmp.ExpenseType,
	|	tmp.ItemKey,
	|	tmp.Currency,
	|	tmp.AdditionalAnalytic,
	|	tmp.Period";
EndFunction

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

	// Advance to suppliers
	Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance =
		AccumulationRegisters.AdvanceToSuppliers.GetTableAdvanceToSuppliers_OffsetOfAdvance(
		Parameters.Object.RegisterRecords,
		Parameters.PointInTime,
		Parameters.DocumentDataTables.AdvanceToSuppliers_Lock);
	
	// Aging expense
	Parameters.DocumentDataTables.Aging_Expense = 
		AccumulationRegisters.Aging.GetTableAging_Expense_OnMoneyReceipt(
		Parameters.PointInTime,
		Parameters.DocumentDataTables.PartnerArTransactions, Undefined);
	
	If Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance.Count() Then
    	Query = New Query();
    	Query.Text = 
    	"SELECT
    	|	tmp.Company,
    	|	tmp.Partner,
    	|	tmp.LegalName,
    	|	tmp.BasisDocument,
    	|	tmp.Currency,
    	|	tmp.Amount
    	|INTO tmp
    	|FROM
    	|	&QueryTable AS tmp
    	|;
    	|////////////////////////////////////////////////////////////////////////////////
    	|SELECT
    	|	AccountsStatementBalance.Company,
    	|	AccountsStatementBalance.Partner,
    	|	AccountsStatementBalance.LegalName,
    	|	AccountsStatementBalance.Currency,
    	|	&Period AS Period,
    	|	AccountsStatementBalance.AdvanceFromCustomersBalance AS AdvanceFromCustomersBalance,
    	|	tmp.Amount AS AdvanceToSuppliers
    	|FROM
    	|	AccumulationRegister.AccountsStatement.Balance(&PointInTime, (Company, Partner, LegalName, Currency) IN
    	|		(SELECT
    	|			tmp.Company,
    	|			tmp.Partner,
    	|			tmp.LegalName,
    	|			tmp.Currency
    	|		FROM
    	|			tmp AS tmp)) AS AccountsStatementBalance
    	|		INNER JOIN tmp AS tmp
    	|		ON AccountsStatementBalance.Company = tmp.Company
    	|		AND AccountsStatementBalance.Partner = tmp.Partner
    	|		AND AccountsStatementBalance.LegalName = tmp.LegalName
    	|		AND AccountsStatementBalance.Currency = tmp.Currency";
    	Query.SetParameter("QueryTable", Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance);
    	Query.SetParameter("PointInTime", Parameters.PointInTime);
    	Query.SetParameter("Period", Parameters.Object.Date);
    	Parameters.DocumentDataTables.Insert("PartnerApTransactions_OffsetOfAdvance_AccountStatement",
    	Query.Execute().Unload());
    EndIf;
EndProcedure

Function PostingGetPostingDataTables(Ref, Cancel, PostingMode, Parameters, AddInfo = Undefined) Export
	PostingDataTables = New Map();
	
	// OrderBalance
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.OrderBalance,
		New Structure("RecordType, RecordSet, WriteInTransaction",
			AccumulationRecordType.Expense,
			Parameters.DocumentDataTables.OrderBalance,
			Parameters.IsReposting));
	
	// SalesTurnovers
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.SalesTurnovers,
		New Structure("RecordSet, WriteInTransaction",
			Parameters.DocumentDataTables.SalesTurnovers,
			Parameters.IsReposting));
	
	// SalesReturnTurnovers
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.SalesReturnTurnovers,
		New Structure("RecordSet, WriteInTransaction",
			Parameters.DocumentDataTables.SalesReturnTurnovers,
			Parameters.IsReposting));
		
	// AccountsStatement
	ArrayOfTables = New Array();
	Table1 = Parameters.DocumentDataTables.PartnerApTransactions.Copy();
	Table1.Columns.Amount.Name = "TransactionAR";
	PostingServer.AddColumnsToAccountsStatementTable(Table1);
	Table1.FillValues(AccumulationRecordType.Receipt, "RecordType");
	For Each row In Table1 Do
		row.TransactionAR = - row.TransactionAR;
	EndDo;
	ArrayOfTables.Add(Table1);
	
	Table2 = Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance.Copy();
	Table2.Columns.Amount.Name = "TransactionAR";
	PostingServer.AddColumnsToAccountsStatementTable(Table2);
	Table2.FillValues(AccumulationRecordType.Expense, "RecordType");
	For Each row In Table2 Do
		row.TransactionAR = - row.TransactionAR;
	EndDo;
	ArrayOfTables.Add(Table2);
	
	Table3 = Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance.Copy();
	Table3.Columns.Amount.Name = "AdvanceFromCustomers";
	PostingServer.AddColumnsToAccountsStatementTable(Table3);
	Table3.FillValues(AccumulationRecordType.Expense, "RecordType");
	For Each row In Table3 Do
		row.AdvanceToSuppliers = - row.AdvanceToSuppliers;
	EndDo;
	ArrayOfTables.Add(Table3);
	
	If Parameters.DocumentDataTables.Property("PartnerApTransactions_OffsetOfAdvance_AccountStatement") Then
		Table4 = Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance_AccountStatement.Copy();
		PostingServer.AddColumnsToAccountsStatementTable(Table4);
		Table4.FillValues(AccumulationRecordType.Expense, "RecordType");
		ArrayOfTables.Add(Table4);
	EndIf;
	
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.AccountsStatement,
		New Structure("RecordSet, WriteInTransaction",
			PostingServer.JoinTables(ArrayOfTables,
				"RecordType, Period, Company, Partner, LegalName, BasisDocument, Currency, 
				|TransactionAR, AdvanceFromCustomers, 
				|TransactionAP, AdvanceToSuppliers"),
			Parameters.IsReposting));
	
	// PartnerApTransactions
	// PartnerApTransactions [Receipt]  
	// PartnerApTransactions_OffsetOfAdvance [Expense]
	ArrayOfTables = New Array();
	Table1 = Parameters.DocumentDataTables.PartnerApTransactions.Copy();
	Table1.Columns.Add("RecordType", New TypeDescription("AccumulationRecordType"));
	Table1.FillValues(AccumulationRecordType.Receipt, "RecordType");
	ArrayOfTables.Add(Table1);
	
	Table2 = Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance.Copy();
	Table2.Columns.Add("RecordType", New TypeDescription("AccumulationRecordType"));
	Table2.FillValues(AccumulationRecordType.Expense, "RecordType");
	ArrayOfTables.Add(Table2);
	
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.PartnerApTransactions,
		New Structure("RecordSet, WriteInTransaction",
			PostingServer.JoinTables(ArrayOfTables,
				"RecordType, Period, Company, BasisDocument, Partner, 
				|LegalName, Agreement, Currency, Amount"),
			Parameters.IsReposting));
	
	// AdvanceToSuppliers
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.AdvanceToSuppliers,
		New Structure("RecordType, RecordSet",
			AccumulationRecordType.Expense,
			Parameters.DocumentDataTables.PartnerApTransactions_OffsetOfAdvance));
	
	
	// Aging
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.Aging,
		New Structure("RecordType, RecordSet",
			AccumulationRecordType.Expense,
			Parameters.DocumentDataTables.Aging_Expense));

	// ExpensesTurnovers
	PostingDataTables.Insert(Parameters.Object.RegisterRecords.ExpensesTurnovers,
		New Structure("RecordSet, WriteInTransaction",
			Parameters.DocumentDataTables.ExpensesTurnovers,
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
#Region NewRegisterPosting
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
	PostingServer.CheckBalance_AfterWrite(Ref, Cancel, Parameters, "Document.SalesReturn.ItemList", AddInfo);
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
	Return StrParams;
EndFunction

Function GetQueryTextsSecondaryTables()
	QueryArray = New Array;
	QueryArray.Add(ItemList());
	QueryArray.Add(OffersInfo());
	QueryArray.Add(GoodReceiptInfo());
	QueryArray.Add(Taxes());
	QueryArray.Add(CustomersTransactions());
	QueryArray.Add(SerialLotNumbers());
	QueryArray.Add(PostingServer.Exists_R4010B_ActualStocks());
	QueryArray.Add(PostingServer.Exists_R4011B_FreeStocks());
	Return QueryArray;
EndFunction

Function GetQueryTextsMasterTables()
	QueryArray = New Array;
	QueryArray.Add(R2002T_SalesReturns());	
	QueryArray.Add(R2005T_SalesSpecialOffers());
	QueryArray.Add(R2012B_SalesOrdersInvoiceClosing());
	QueryArray.Add(R2021B_CustomersTransactions());
	QueryArray.Add(R2031B_ShipmentInvoicing());
	QueryArray.Add(R2040B_TaxesIncoming());
	QueryArray.Add(R4010B_ActualStocks());
	QueryArray.Add(R4011B_FreeStocks());
	QueryArray.Add(R4014B_SerialLotNumber());
	QueryArray.Add(R4031B_GoodsInTransitIncoming());
	QueryArray.Add(R4050B_StockInventory());
	QueryArray.Add(R5010B_ReconciliationStatement());
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
		|	Document.SalesReturn.RowIDInfo AS RowIDInfo
		|WHERE
		|	RowIDInfo.Ref = &Ref
		|GROUP BY
		|	RowIDInfo.Ref,
		|	RowIDInfo.Key
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////	
		|SELECT
		|	GoodsReceipts.Key,
		|	GoodsReceipts.GoodsReceipt
		|INTO GoodsReceipts
		|FROM
		|	Document.SalesReturn.GoodsReceipts AS GoodsReceipts
		|WHERE
		|	GoodsReceipts.Ref = &Ref
		|GROUP BY
		|	GoodsReceipts.Key,
		|	GoodsReceipts.GoodsReceipt
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|SELECT
		|	ItemList.Ref.Company AS Company,
		|	ItemList.Store AS Store,
		|	ItemList.UseGoodsReceipt AS UseGoodsReceipt,
		|	ItemList.ItemKey AS ItemKey,
		|	ItemList.SalesReturnOrder AS SalesReturnOrder,
		|	NOT ItemList.SalesReturnOrder.Ref IS NULL AS SalesReturnOrderExists,
		|	ItemList.Ref AS SalesReturn,
		|	CASE
		|		WHEN ItemList.Ref.Agreement.ApArPostingDetail = VALUE(Enum.ApArPostingDetail.ByDocuments)
		|			THEN ItemList.Ref
		|		ELSE UNDEFINED
		|	END AS BasisDocument,
		|	ItemList.QuantityInBaseUnit AS Quantity,
		|	ItemList.TotalAmount AS Amount,
		|	ItemList.Ref.Partner AS Partner,
		|	ItemList.Ref.LegalName AS LegalName,
		|	CASE
		|		WHEN ItemList.Ref.Agreement.Kind = VALUE(Enum.AgreementKinds.Regular)
		|		AND ItemList.Ref.Agreement.ApArPostingDetail = VALUE(Enum.ApArPostingDetail.ByStandardAgreement)
		|			THEN ItemList.Ref.Agreement.StandardAgreement
		|		ELSE ItemList.Ref.Agreement
		|	END AS Agreement,
		|	ISNULL(ItemList.Ref.Currency, VALUE(Catalog.Currencies.EmptyRef)) AS Currency,
		|	ItemList.Ref.Date AS Period,
		|	CASE
		|		WHEN ItemList.SalesInvoice.Ref IS NULL
		|		OR VALUETYPE(ItemList.SalesInvoice) <> TYPE(Document.SalesInvoice)
		|			THEN ItemList.Ref
		|		ELSE ItemList.SalesInvoice
		|	END AS SalesInvoice,
		|	ItemList.SalesInvoice AS AgingSalesInvoice,
		|	TableRowIDInfo.RowID AS RowKey,
		|	NOT GoodsReceipts.Key IS NULL AS GoodsReceiptExists,
		|	GoodsReceipts.GoodsReceipt,
		|	ItemList.NetAmount,
		|	ItemList.ItemKey.Item.ItemType.Type = VALUE(Enum.ItemTypes.Service) AS IsService
		|INTO ItemList
		|FROM
		|	Document.SalesReturn.ItemList AS ItemList
		|		LEFT JOIN GoodsReceipts AS GoodsReceipts
		|		ON ItemList.Key = GoodsReceipts.Key
		|		LEFT JOIN TableRowIDInfo AS TableRowIDInfo
		|		ON ItemList.Key = TableRowIDInfo.Key
		|WHERE
		|	ItemList.Ref = &Ref";
EndFunction

Function GoodReceiptInfo()
	Return
		"SELECT
		|	GoodReceiptInfo.Key,
		|	GoodReceiptInfo.GoodsReceipt,
		|	GoodReceiptInfo.Quantity
		|INTO GoodReceiptInfo
		|FROM
		|	Document.SalesReturn.GoodsReceipts AS GoodReceiptInfo
		|WHERE
		|	GoodReceiptInfo.Ref = &Ref";
EndFunction

Function OffersInfo()
	Return
		"SELECT
		|	SalesReturnItemList.Ref.Date AS Period,
		|	SalesReturnItemList.Ref AS Invoice,
		|	SalesReturnItemList.Key AS RowKey,
		|	SalesReturnItemList.ItemKey,
		|	SalesReturnItemList.Ref.Company AS Company,
		|	SalesReturnItemList.Ref.Currency,
		|	SalesReturnSpecialOffers.Offer AS SpecialOffer,
		|	- SalesReturnSpecialOffers.Amount AS OffersAmount,
		|	- SalesReturnItemList.TotalAmount AS SalesAmount,
		|	- SalesReturnItemList.NetAmount AS NetAmount
		|INTO OffersInfo
		|FROM
		|	Document.SalesReturn.ItemList AS SalesReturnItemList
		|		INNER JOIN Document.SalesReturn.SpecialOffers AS SalesReturnSpecialOffers
		|		ON SalesReturnItemList.Key = SalesReturnSpecialOffers.Key
		|		AND SalesReturnItemList.Ref = &Ref
		|		AND SalesReturnSpecialOffers.Ref = &Ref";
EndFunction

Function SerialLotNumbers()
	Return
		"SELECT
		|	SerialLotNumbers.Ref.Date AS Period,
		|	SerialLotNumbers.Ref.Company AS Company,
		|	SerialLotNumbers.Key,
		|	SerialLotNumbers.SerialLotNumber,
		|	SerialLotNumbers.Quantity,
		|	ItemList.ItemKey AS ItemKey
		|INTO SerialLotNumbers
		|FROM
		|	Document.SalesReturn.SerialLotNumbers AS SerialLotNumbers
		|		LEFT JOIN Document.SalesReturn.ItemList AS ItemList
		|		ON SerialLotNumbers.Key = ItemList.Key
		|		AND ItemList.Ref = &Ref
		|WHERE
		|	SerialLotNumbers.Ref = &Ref";	
EndFunction	

Function Taxes()
	Return
		"SELECT
		|	SalesReturnTaxList.Ref.Date AS Period,
		|	SalesReturnTaxList.Ref.Company AS Company,
		|	SalesReturnTaxList.Tax AS Tax,
		|	SalesReturnTaxList.TaxRate AS TaxRate,
		|	CASE
		|		WHEN SalesReturnTaxList.ManualAmount = 0
		|			THEN SalesReturnTaxList.Amount
		|		ELSE SalesReturnTaxList.ManualAmount
		|	END AS TaxAmount,
		|	SalesReturnItemList.NetAmount AS TaxableAmount
		|INTO Taxes
		|FROM
		|	Document.SalesReturn.ItemList AS SalesReturnItemList
		|		INNER JOIN Document.SalesReturn.TaxList AS SalesReturnTaxList
		|		ON SalesReturnItemList.Key = SalesReturnTaxList.Key
		|		AND SalesReturnItemList.Ref = &Ref
		|		AND SalesReturnTaxList.Ref = &Ref";
EndFunction

Function CustomersTransactions()
	Return
		"SELECT
		|	ItemList.Period,
		|	ItemList.Company,
		|	ItemList.Currency,
		|	ItemList.LegalName,
		|	ItemList.Partner,
		|	ItemList.BasisDocument AS TransactionDocument,
		|	ItemList.Agreement,
		|	SUM(ItemList.Amount) AS DocumentAmount
		|INTO CustomersTransactions
		|FROM
		|	ItemList AS ItemList
		|GROUP BY
		|	ItemList.Period,
		|	ItemList.Company,
		|	ItemList.LegalName,
		|	ItemList.Partner,
		|	ItemList.BasisDocument,
		|	ItemList.Agreement,
		|	ItemList.Currency";
EndFunction

Function R2002T_SalesReturns()
	Return
		"SELECT *
		|INTO R2002T_SalesReturns
		|FROM
		|	ItemList AS ItemList
		|WHERE TRUE";

EndFunction

Function R2005T_SalesSpecialOffers()
	Return
		"SELECT 
		|	*
		|INTO R2005T_SalesSpecialOffers
		|FROM
		|	OffersInfo AS OffersInfo
		|WHERE TRUE";

EndFunction

Function R2012B_SalesOrdersInvoiceClosing()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Expense) AS RecordType,
		|	ItemList.SalesReturnOrder AS Order,
		|	*
		|INTO R2012B_SalesOrdersInvoiceClosing
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.SalesReturnOrderExists";

EndFunction

Function R2021B_CustomersTransactions()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	CustomersTransactions.Period,
		|	CustomersTransactions.Company,
		|	CustomersTransactions.Currency,
		|	CustomersTransactions.LegalName,
		|	CustomersTransactions.Partner,
		|	CustomersTransactions.Agreement,
		|	CustomersTransactions.TransactionDocument AS Basis,
		|	- SUM(CustomersTransactions.DocumentAmount) AS Amount
		|INTO R2021B_CustomersTransactions
		|FROM
		|	CustomersTransactions AS CustomersTransactions
		|GROUP BY
		|	CustomersTransactions.Period,
		|	CustomersTransactions.Company,
		|	CustomersTransactions.Currency,
		|	CustomersTransactions.LegalName,
		|	CustomersTransactions.Partner,
		|	CustomersTransactions.Agreement,
		|	CustomersTransactions.TransactionDocument,
		|	VALUE(AccumulationRecordType.Receipt)";
EndFunction

Function R2031B_ShipmentInvoicing()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.SalesReturn AS Basis,
		|	ItemList.Quantity AS Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|INTO R2031B_ShipmentInvoicing
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.UseGoodsReceipt
		|	AND NOT ItemList.GoodsReceiptExists
		|
		|UNION ALL
		|
		|SELECT
		|	VALUE(AccumulationRecordType.Expense),
		|	GoodReceipts.GoodsReceipt,
		|	GoodReceipts.Quantity,
		|	ItemList.Company,
		|	ItemList.Period,
		|	ItemList.ItemKey,
		|	ItemList.Store
		|FROM
		|	ItemList AS ItemList
		|		INNER JOIN GoodReceiptInfo AS GoodReceipts
		|		ON ItemList.RowKey = GoodReceipts.Key
		|WHERE
		|	TRUE";
EndFunction

Function R2040B_TaxesIncoming()
	Return
		"SELECT 
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	- Taxes.TaxableAmount,
		|	- Taxes.TaxAmount,
		|	*
		|INTO R2040B_TaxesIncoming
		|FROM
		|	Taxes AS Taxes
		|WHERE TRUE";

EndFunction

#Region Stock

Function R4010B_ActualStocks()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.Period,
		|	ItemList.Store,
		|	ItemList.ItemKey,
		|	ItemList.Quantity
		|INTO R4010B_ActualStocks
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	NOT ItemList.IsService
		|	AND NOT ItemList.UseGoodsReceipt
		|	AND NOT ItemList.GoodsReceiptExists";
EndFunction

Function R4011B_FreeStocks()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.Period,
		|	ItemList.Store,
		|	ItemList.ItemKey,
		|	ItemList.Quantity
		|INTO R4011B_FreeStocks
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	NOT ItemList.IsService
		|	AND NOT ItemList.UseGoodsReceipt
		|	AND NOT ItemList.GoodsReceiptExists";
EndFunction

Function R4014B_SerialLotNumber()
	Return
		"SELECT 
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|*
		|INTO R4014B_SerialLotNumber
		|FROM
		|	SerialLotNumbers AS SerialLotNumbers
		|WHERE 
		|	TRUE";

EndFunction

Function R4031B_GoodsInTransitIncoming()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	CASE
		|		WHEN ItemList.GoodsReceiptExists
		|			Then ItemList.GoodsReceipt
		|		Else ItemList.SalesReturn
		|	End AS Basis,
		|	*
		|INTO R4031B_GoodsInTransitIncoming
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	ItemList.UseGoodsReceipt
		|	OR ItemList.GoodsReceiptExists";

EndFunction

Function R4050B_StockInventory()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	*
		|INTO R4050B_StockInventory
		|FROM
		|	ItemList AS ItemList
		|WHERE
		|	NOT ItemList.IsService";

EndFunction

#EndRegion

Function R5010B_ReconciliationStatement()
	Return
		"SELECT
		|	VALUE(AccumulationRecordType.Receipt) AS RecordType,
		|	ItemList.Company,
		|	ItemList.LegalName,
		|	ItemList.Currency,
		|	- SUM(ItemList.Amount) AS Amount,
		|	ItemList.Period
		|INTO R5010B_ReconciliationStatement
		|FROM
		|	ItemList AS ItemList
		|GROUP BY
		|	ItemList.Company,
		|	ItemList.LegalName,
		|	ItemList.Currency,
		|	ItemList.Period";
EndFunction

#EndRegion
