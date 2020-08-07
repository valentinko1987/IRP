Function Strings(Lang) Export
	
	Strings = New Structure();
	
	#Region Service
	
	// %1 - localhost
	// %2 - 8080 
	// %3 - There is no internet connection
	Strings.Insert("S_002", NStr("en='Can`t connect to: %1:%2 Detail: %3';de='Verbindung mit %1:%2 kann nicht hergestellt werden. Details: %3';ru='Не получается подключиться к: %1:%2 Подробности: %3'", Lang));
	
	// %1 - localhost
	// %2 - 8080
	Strings.Insert("S_003", NStr("en='Received response from: %1:%2';de='Antwort von %1: %2 erhalten';ru='Получен ответ от: %1: %2'", Lang));
	Strings.Insert("S_004", NStr("en='Resource address is empty';de='Ressourcenadresse ist leer';ru='Адрес ресурса не заполнен'", Lang));
	
	// %1 - connection_to_other_system
	Strings.Insert("S_005", NStr("en='Integration setting not found by name: %1';de='Integrationseinstellung wurde nach Namen %1 nicht gefunden';ru='Настройки интеграции с наименованием %1 не найдены'", Lang));
	Strings.Insert("S_006", NStr("en='Method unsupported on web client';de='Methode ist nicht unterstützt im Web-Client';ru='В web клиенте метод не поддерживается'", Lang));
	
	// Special offers
	Strings.Insert("S_013", NStr("en='Not supported type of object: %1';de='Nicht unterstützter Typ des Objekts: %1';ru='Тип объекта: %1 не поддерживается'", Lang));
	
	// FileTransfer
	Strings.Insert("S_014", NStr("en='File name is empty';de='Dateiname ist leer';ru='Имя файла не заполнено'", Lang));
	Strings.Insert("S_015", NStr("en='Path for save not set';de='Pfad zum Speichern ist nicht festgelegt';ru='Путь сохранения не установлен'", Lang));
	
	// Test connection
	// %1 - Method unsupported on web client
	// %2 - 404
	// %3 - Text frim site
	Strings.Insert("S_016", NStr("en='%1 Status code: %2 %3';de='%1 Statuscode: %2%3';ru='%1 Статус код: %2 %3'", Lang));
	
	//	scan barcode
	Strings.Insert("S_018", NStr("en='Item added';de='Element hinzugefügt';ru='Номенклатура добавлена'", Lang)); 
	
	// %1 - 123123123123
	Strings.Insert("S_019", NStr("en='Barcode %1 not found';de='Barcode %1 nicht gefunden';ru='Штрих-код %1 не найден'", Lang));
	Strings.Insert("S_022", NStr("en='Multi currency receipt basises';de='Multiwährung Empfangsbasis';ru='Валюты в документах-основаниях не должны отличаться'", Lang));
	Strings.Insert("S_023", NStr("en='Procurement method';de='Beschaffungsmethode';ru='Метод обеспечения'", Lang));
	
	Strings.Insert("S_026", NStr("en='Selected icon will be resized to 16x16 px';de='Die Größe des ausgewählten Symbols wird auf 16x16 Pixel geändert';ru='Размер выбранной иконки будет изменен до 16x16 px'", Lang));

	// presentation of empty value for query result
	Strings.Insert("S_027", NStr("en='[Not filled]';de='[Nicht ausgefüllt]';ru='[не заполнено]'", Lang));
	
	#EndRegion
	
	#Region Service
	Strings.Insert("Form_001", NStr("en='New page';de='Neue Seite';ru='Новая страница'", Lang));
	Strings.Insert("Form_002", NStr("en='Delete';de='Löschen';ru='Пометить на удаление/Снять пометку'", Lang));
	Strings.Insert("Form_003", NStr("en='Quantity';de='Anzahl';ru='Количество'", Lang));
	Strings.Insert("Form_004", NStr("en='Customers terms';de='Vereinbarungen mit Kunden';ru='Соглашения с клиентами'", Lang));
	Strings.Insert("Form_005", NStr("en='Customers';de='Kunden';ru='Клиенты'", Lang));
	Strings.Insert("Form_006", NStr("en='Vendors';de='Lieferanten';ru='Поставщики'", Lang));
	Strings.Insert("Form_007", NStr("en='Vendors terms';de='Vereinbarungen mit Lieferanten';ru='Соглашения с поставщиками'", Lang));
	Strings.Insert("Form_008", NStr("en='User';de='Benutzer';ru='Пользователь';tr='Kullanıcı'", Lang));
	Strings.Insert("Form_009", NStr("en='User group';de='Benutzergruppe';ru='Группа пользователей'", Lang));
	Strings.Insert("Form_013", NStr("en='Date';de='Datum';ru='Дата'", Lang));
	Strings.Insert("Form_014", NStr("en='Number';de='Nummer';ru='Номер'", Lang));
	
	// change icon
	Strings.Insert("Form_017", NStr("en='Change';de='Ändern';ru='Изменить'", Lang));
	
	// clear icon
	Strings.Insert("Form_018", NStr("en='Clear';de='Löschen';ru='Очистить'", Lang));
	
	// cancel answer on question
	Strings.Insert("Form_019", NStr("en='Cancel';de='Abbrechen';ru='Отмена'", Lang));
	
	// PriceInfo report 
	Strings.Insert("Form_022", NStr("en='1. By item keys';de='1. Nach Artikelvarianten';ru='1. По ключам аналитики номенклатуры'", Lang));
	Strings.Insert("Form_023", NStr("en='2. By properties';de='2. Nach Eigenschaften';ru='2. По свойствам'", Lang));
	Strings.Insert("Form_024", NStr("en='3. By items';de='3. Nach Produkten';ru='3. По номенклатуре'", Lang));
	
	Strings.Insert("Form_025", NStr("en='Create from classifier'", Lang));
	
	Strings.Insert("Form_026", NStr("en='Item Bundle'", Lang));
	Strings.Insert("Form_027", NStr("en='Item';de='Produkt';ru='Номенклатура'", Lang));
	Strings.Insert("Form_028", NStr("en='Item type';de='Produkttyp';ru='Вид номенклатуры'", Lang));
	#EndRegion
	
	#Region ErrorMessages

	// %1 - en
	Strings.Insert("Error_002", NStr("en='%1 descriptions is empty';de='%1 Beschreibung ist leer';ru='%1 наименование не заполнено'", Lang));
	Strings.Insert("Error_003", NStr("en='Fill any description';de='Füllen Sie eine Beschreibung aus';ru='Заполните наименование'", Lang));
	Strings.Insert("Error_004", NStr("en='Not supported metadata';de='Nicht unterstützte Metadaten';ru='Метаданные не поддерживаются'", Lang));
	
	// %1 - en
	Strings.Insert("Error_005", NStr("en='Fill any additional attribute description %1';de='Füllen Sie eine Zusatzattributbeschreibung %1 aus';ru='Заполните наименование дополнительного реквизита %1'", Lang));
	Strings.Insert("Error_008", NStr("en='Groups are created by administrator';de='Gruppen sind vom Administrator erstellt';ru='Группы создаются администратором'", Lang));
	
	// %1 - Number 111 is not unique
	Strings.Insert("Error_009", NStr("en='Can`t write object: [%1]';de='Das Objekt kann nicht geschrieben werden: [%1]';ru='Ошибка при записи объекта: [%1]'", Lang));
	
	// %1 - Number
	Strings.Insert("Error_010", NStr("en='Field: [%1] is empty';de='Feld [%1] ist leer';ru='Поле: [%1] не заполнено'", Lang));
	Strings.Insert("Error_011", NStr("en='Need add any row';de='Fügen Sie eine Zeile hinzu';ru='Нужно добавить хоть одну строку'", Lang));
	Strings.Insert("Error_012", NStr("en='Not according rules for naming variable';de='Nicht gemäß der Benennungsregeln von Variablen';ru='Не соответствует правилам наименования переменных'", Lang));
	Strings.Insert("Error_013", NStr("en='Value is not unique';de='Der Wert ist nicht eindeutig';ru='Значение не уникально'", Lang));
	Strings.Insert("Error_014", NStr("en='Password and password confirmation do not match';de='Das Kennwort und die Kennwortbestätigung stimmen nicht überein';ru='Пароль и подтверждение пароля не совпадают'", Lang));

	// %1 - Sales order
	Strings.Insert("Error_016", NStr("en='Lines on which you need to order items from suppliers are missed in the %1';de='Zeilen, auf deren Basis Sie Waren von den Lieferanten bestellen müssen, fehlen im %1';ru='В %1 не осталось товаров по которым необходимо сделать заказ поставщику'", Lang));
	Strings.Error_016 = StrTemplate(Strings.Error_016, Metadata.Documents.SalesOrder.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_017", NStr("en='Please, at first create %1 or uncheck the box %1 before %2 on the tab Other';de='Zunächst erstellen Sie einen %1 oder deaktivieren Sie das Kontrollkästchen ""%1 vor der %2"" auf der Registerkarte ""Sonstiges""';ru='Вначале необходимо создать %1 или снять галочку %1 перед документом %2 на вкладке Дополнительно'", Lang));
	Strings.Error_017 = StrTemplate(Strings.Error_017, Metadata.Documents.GoodsReceipt.Synonym, Metadata.Documents.PurchaseInvoice.Synonym);

	// %1 - Shipment confirmation
	// %1 - Sales invoice
	Strings.Insert("Error_018", NStr("en='Please, at first create %1 or uncheck the box %1 before %2 on the tab Other';de='Zunächst erstellen Sie einen %1 oder deaktivieren Sie das Kontrollkästchen ""%1 vor der %2"" auf der Registerkarte ""Sonstiges""';ru='Вначале необходимо создать %1 или снять галочку %1 перед документом %2 на вкладке Дополнительно'", Lang));
	Strings.Error_018 = StrTemplate(Strings.Error_018, Metadata.Documents.ShipmentConfirmation.Synonym, Metadata.Documents.SalesInvoice.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_019", NStr("en='Lines on which you need to create %1 are missed in the %2.';de='Zeilen, auf deren basis sie den %1 erstellen müssen, fehlen in der %2.';ru='Строки по которым необходимо создать %1 отсутствуют в %2.'", Lang));

	// %1 - 12
	Strings.Insert("Error_020", NStr("en='Basis document is required on line %1';de='Basisdokument ist erforderlich in Zeile %1';ru='Необходимо заполнить документ-основания по строке %1'", Lang));

	// %1 - Purchase invoice
	Strings.Insert("Error_021", NStr("en='Lines on which you may create return are missed in the %1. All products are already returned.';de='Zeilen, auf deren Basis Sie eine Retoure erstellen können, fehlen in %1. Alle Produkte wurden bereits zurückgegeben.';ru='По всем товарам из выбранного документа %1 уже были оформлен возвраты.'", Lang));
	Strings.Error_021 = StrTemplate(Strings.Error_021, Metadata.Documents.PurchaseInvoice.Synonym);

	// %1 - Internal supply request
	Strings.Insert("Error_023", NStr("en='Lines on which you need to order items from suppliers are missed in the %1';de='Zeilen, auf deren Basis Sie Waren von den Lieferanten bestellen müssen, fehlen im %1';ru='В %1 не осталось товаров по которым необходимо сделать заказ поставщику'", Lang));
	Strings.Error_023 = StrTemplate(Strings.Error_023, Metadata.Documents.InternalSupplyRequest.Synonym);
	
	// %1 - Goods receipt
	// %2 - Purchase invoice
	Strings.Insert("Error_028", NStr("en='Please, check the box %1 before %2 on the tab Other';de='Bitte aktivieren Sie das Kontrollkästchen ""%1 vor der %2"" auf der Registerkarte ""Sonstiges""';ru='Необходимо установить галочку %1 перед %2 на вкладке Дополнительно'", Lang));
	Strings.Error_028 = StrTemplate(Strings.Error_028, Metadata.Documents.GoodsReceipt.Synonym, Metadata.Documents.PurchaseInvoice.Synonym);
	
	// %1 - Cash account
	// %2 - 12
	// %3 - Cheque bonds
	Strings.Insert("Error_030", NStr("en='The %1 is required on line %2 of the %3';de='Das %1 ist erforderlich in %3, in Zeile %2';ru='%1 обязателен для заполнения в строке %2 %3'", Lang));

	Strings.Insert("Error_031", NStr("en='Items were not received from supplier according to procurement method.';de='Produkte wurden vom Lieferanten gemäß der Beschaffungsmethode nicht erhalten.';ru='Заказанные товары у поставщика для обеспечения заказа не были получены'", Lang));
	Strings.Insert("Error_032", NStr("en='Action not completed';de='Aktion ist nicht abgeschlossen';ru='Действие не завершено'", Lang));
	Strings.Insert("Error_033", NStr("en='Duplicated attribute';de='Doppeltes Attribut';ru='Реквизит дублируется'", Lang));
	// %1 - Google drive
	Strings.Insert("Error_034", NStr("en='%1 is not picture storage volume';de='%1 ist nicht ein Bildspeichervolume';ru='%1 не является томом для хранения изображений'", Lang));
	Strings.Insert("Error_035", NStr("en='Cannot upload more than 1 file';de='Nur 1 Datei kann hochgeladen werden';ru='Невозможно загрузить более 1 файла'", Lang));
	Strings.Insert("Error_037", NStr("en='Unsupported data composition comparison type';de='Nicht unterstützter Vergleichstyp der Datenzusammensetzung';ru='Неподдерживаемый тип сравнения состава данных'", Lang));	
	Strings.Insert("Error_040", NStr("en='Support picture files only';de='Nur Bilddateien unterstützen';ru='Поддерживается только тип файла картинка'", Lang));
	Strings.Insert("Error_041", NStr("en='Tax table content more 1 row [key: %1] [tax: %2]';de='Steuertabelle enthält noch 1 Zeile [Schlüssel: %1] [Steuer: %2]';ru='Таблица налогов содержит больше 1 строки [ключ: %1] [налог: %2]'", Lang));
	// %1 - Name
	Strings.Insert("Error_042", NStr("en='Cannot find tax by column name: %1';de='Das Steuer kann nach dem Spaltennamen %1 nicht gefunden werden';ru='Не найден налог по наименованию колонки: %1'", Lang));
	Strings.Insert("Error_043", NStr("en='Unsupported document type';de='Nicht unterstützter Dokumenttyp';ru='Неподдерживаемый тип документа'", Lang));
	Strings.Insert("Error_044", NStr("en='Not supported operation';de='Nicht unterstützter Vorgang';ru='Операция не поддерживается'", Lang));
	Strings.Insert("Error_045", NStr("en='Document is empty';de='Dokument ist leer';ru='Документ не заполнен'", Lang));
	// %1 - Currency
	Strings.Insert("Error_047", NStr("en='%1 is a required field';de='%1 ist ein erforderliches Feld';ru='Поле %1 обязательное для заполнения'", Lang));
	Strings.Insert("Error_049", NStr("en='Default picture storage volume not set';de='Das Standardbildspeichervolume ist nicht festgelegt';ru='Том хранения файлов по умолчанию не заполнен'", Lang));
	Strings.Insert("Error_050", NStr("en='Currency exchange is possible only through accounts with the same type (cash account or bank account).';de='Der Währungsumtausch ist nur auf den Konten mit demselben Typ verfügbar (Kassenkonto oder Bankkonto).';ru='Обмен валюты возможен только между счетами одного типа (между двумя кассами или между двумя банковскими счетами).'", Lang));
	// %1 - Bank payment
	Strings.Insert("Error_051", NStr("en='Lines on which you may create %1 are missed. Or all %1 are already created.';de='Zeilen, auf deren Basis Sie die %1 erstellen können, fehlen. Oder alle %1 wurden bereits erstellt.';ru='Отсутствуют строки по которым необходимо создать %1 или же все документы %1 уже были созданы ранее.'", Lang));
	// %1 - Main store
	// %2 - Use shipment confirmation
	// %3 - Shipment confirmations
	Strings.Insert("Error_052", NStr("en='Unchecking ""%2"" isn`t possible. 
|%3 from store %1 have already been created previously.';de='Das Kontrollkästchen ""%2"" kann nicht deaktiviert werden. 
|%3 vom Lager %1 wurden bereits zuvor erstellt.';ru='Снять галочку ""%2"" невозможно. 
|Ранее со склада %1 уже были созданы %3.'", Lang));
	Strings.Error_052 = StrTemplate(Strings.Error_052, "%1", Metadata.Catalogs.Stores.Attributes.UseShipmentConfirmation.Synonym,
															 Metadata.Documents.ShipmentConfirmation.Synonym);										

	// %1 - Main store
	// %2 - Use goods receipt
	// %3 - Goods receipts
	Strings.Insert("Error_053", NStr("en='Unchecking ""2"" isn`t possible. %3 from store %1 have already been created previously.';de='Das Kontrollkästchen ""2"" kann nicht deaktiviert werden. %3 vom Lager %1 wurden bereits zuvor erstellt.';ru='Снять галочку ""%2"" невозможно. Ранее со склада %1 уже были созданы %3.'", Lang));
	Strings.Error_053 = StrTemplate(Strings.Error_053, "%1", Metadata.Catalogs.Stores.Attributes.UseGoodsReceipt.Synonym,
			 												 Metadata.Documents.GoodsReceipt.Synonym);
	// %1 - sales order
	Strings.Insert("Error_054", NStr("en='Not properly status of %1 to proceed.';de='Status des %1s ist unangemessen, Fortsetzen ist nicht möglich.';ru='Статус документа %1 для продолжения неверный'", Lang));
															  
	Strings.Insert("Error_055", NStr("en='No lines with properly procurement method.';de='Keine Zeilen mit einer korrekten Beschaffungsmethode.';ru='Отсутствуют строки с нужным способом обеспечения'", Lang));

	Strings.Insert("Error_056", NStr("en='All items in sales order are already ordered by purchase order(s).';de='Alle Produkte im Auftrag sind durch die Bestellung bereits bestellt.';ru='Все товары в заказе клиента уже заказаны поставщику.'", Lang));

	// %1 - sales order
	// %2 - purchase order
	Strings.Insert("Error_056", NStr("en='All items in %1 are already ordered by %2(s).';de='Alle Produkte im %1 sind bereits durch %2 bestellt.';ru='Все товары в %1 уже заказаны по %2.'", Lang));
	Strings.Error_056 = StrTemplate(Strings.Error_056, Metadata.Documents.SalesOrder.Synonym, Metadata.Documents.PurchaseOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_057", NStr("en='Don`t need to create a %1 for selected %2(s).';de='Eine %1 kann für den gewählten %2 nicht erstellt werden.';ru='Для выбранных %2 не нужно создавать %1.'", Lang));
	Strings.Error_057 = StrTemplate(Strings.Error_057, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_058", NStr("en='Whole amount in %2(s) are already payed by document %1(s).';de='Der Gesamtbetrag im %2 ist bereits durch das Dokument %1 bezahlt.';ru='Вся сумма по %2 уже была выдана по документу %1.'", Lang));
	Strings.Error_058 = StrTemplate(Strings.Error_058, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_059", NStr("en='In the selected documents there are %2(s) by which %1(s) has already been created
| and those for which %1 doesn`t need to be created.';de='Die ausgewählten Dokumente enthalten einen %2, auf dessen Basis die %1 
|bereits erstellt wurde, und denjenigen, für den die %1 nicht erstellt werden muss.';ru='В списке выбранных %2 есть те по которым %1 уже были созданы
| и те по которым %1 создавать не нужно. '", Lang));
	Strings.Error_059 = StrTemplate(Strings.Error_059, "%1", Metadata.Documents.CashTransferOrder.Synonym);
	
	// %1 - Bank receipt
	// %2 - Cash transfer order
	Strings.Insert("Error_060", NStr("en='Whole amount in %2(s) are already received by document %1(s).';de='Der Gesamtbetrag im %2 ist bereits durch das Dokument %1 erhalten.';ru='Вся сумма по %2 уже была получена по документу %1.'", Lang));
	Strings.Error_060 = StrTemplate(Strings.Error_060, "%1", Metadata.Documents.CashTransferOrder.Synonym);

	// %1 - Main store
	// %2 - Shipment confirmation
	// %3 - Sales order
	Strings.Insert("Error_064", NStr("en='There is no need to create %2 for store(s) %1. Item will be shipped by %3';de='Es ist nicht erforderlich, einen %2 für Lager %1 zu erstellen. Das Produkt wird nach dem %3 versendet.';ru='Для склада %1 нет необходимости создавать %2. Товар будет отгружен по %3. '", Lang));
	Strings.Error_064 = StrTemplate(Strings.Error_064, "%1", Metadata.Documents.ShipmentConfirmation.Synonym,
															 Metadata.Documents.SalesOrder.Synonym);

	Strings.Insert("Error_065", NStr("en='Item key is not unique';de='Artikelvariante ist nicht eindeutig';ru='Ключ аналитики номенклатуры не уникален'", Lang));
	Strings.Insert("Error_066", NStr("en='Specification is not unique';de='Spezifikation ist nicht eindeutig';ru='Спецификация товара не уникальна'", Lang));

	// %1 - 12
	// %2 - Boots
	// %3 - Red XL
	// %4 - ordered
	// %5 - 11
	// %6 - 15
	// %7 - 4
	// %8 - pcs
	Strings.Insert("Error_068", NStr("en='Line No. [%1] [%2 %3] %4 remains: %5 %8 Required: %6 %8 Lacks: %7 %8';de='In Zeile Nr. [%1] [%2 %3] %4 ist Restmenge %5 %8. Erforderlich: %6 %8. Es fehlt: %7 %8.';ru='Строка № [%1] [%2%3] %4 остаток: %5%8 Требуется: %6%8 Разница: %7%8'", Lang));

	// %1 - some extention name
	Strings.Insert("Error_071", NStr("en='Plugin ""%1"" was not connected';de='Plug-In ""%1"" konnte nicht verbunden werden';ru='Внешняя обработка ""%1"" не подключена'", Lang));
	
	// %1 - 12
	Strings.Insert("Error_072", NStr("en='Store is required on line %1';de='Lager ist erforderlich in Zeile %1';ru='Необходимо заполнить склад по строке %1'", Lang));

	// %1 - Sales order
	// %2 - Goods receipt
	Strings.Insert("Error_073", NStr("en='All items in %1(s) are already received by %2(s).';de='Alle Produkte im %1 sind durch den %2 bereits erhalten.';ru='Все товары в %1 уже получены на основании %2. '", Lang));
	Strings.Insert("Error_074", NStr("en='Currency transfer is possible only when amounts is equal.';de='Währungstransfer ist verfügbar, nur wenn Beträge gleich sind.';ru='При перемещении денежных средств в одной валюте сумма отправки и получения должны совпадать.'", Lang));

	// %1 - Physical count by location
	Strings.Insert("Error_075", NStr("en='Not yet all %1 is closed';de='Noch nicht die ganze %1 ist geschlossen';ru='Есть незакрытые документы %1'", Lang));
	Strings.Error_075 = StrTemplate(Strings.Error_075, Metadata.Documents.PhysicalCountByLocation.Synonym);
	
	// %1 - Retail sales receipt
	Strings.Insert("Error_076", NStr("en='Lines on which you may create return are missed in the %1. All products are already returned.';de='Zeilen, auf deren Basis Sie eine Retoure erstellen können, fehlen in %1. Alle Produkte wurden bereits zurückgegeben.';ru='По всем товарам из выбранного документа %1 уже были оформлен возвраты.'", Lang));
	Strings.Error_076 = StrTemplate(Strings.Error_076, Metadata.Documents.RetailSalesReceipt.Synonym);
	
	#EndRegion
	
	#Region InfoMessages
	// %1 - Purchase invoice
	// %2 - Purchase order
	Strings.Insert("InfoMessage_001", NStr("en='%1 is not the same as the %2 will be due to the fact 
|that there is already another %1 that partially closed this %2';de='Die %1 und der %2 sind nicht identisch, denn es gibt 
|noch eine %1, die diesen %2 teilweise geschlossen hat';ru='%1 не совпадает с документом %2 в силу того, 
|что ранее уже создан документ %1, который частично закрыл документ %2'", Lang));
	// %1 - Boots
	Strings.Insert("InfoMessage_002", NStr("en='Object %1 created';de='Objekt %1 erstellt';ru='Объект %1 создан'", Lang));
	Strings.Insert("InfoMessage_003", NStr("en='This is the service form.';de='Das ist ein ein Service-Formular.';ru='Это сервисная форма.'", Lang));
	Strings.Insert("InfoMessage_004", NStr("en='Save object before continue';de='Objekt speichern, bevor Sie fortfahren';ru='Для продолжения необходимо сохранить объект'", Lang));
	Strings.Insert("InfoMessage_005", NStr("en='Done';de='Fertig';ru='Завершено'", Lang));
	
	// %1 - Physical count by location
	Strings.Insert("InfoMessage_006", NStr("en='Document %1 already created, use update';de='Dokument %1 wurde bereits erstellt. Aktualisieren Sie es.';ru='Документы %1 уже созданы. Возможно использовать только функцию обновления количества'", Lang));
	Strings.InfoMessage_006 = StrTemplate(Strings.InfoMessage_006, Metadata.Documents.PhysicalCountByLocation.Synonym);

	// %1 - 12
	// %2 - 20.02.2020
	Strings.Insert("InfoMessage_007", NStr("en='#%1 date: %2';de='Nr. %1 Datum: %2';ru='#%1 дата: %2'", Lang));
	#EndRegion
	
	#Region QuestionToUser
	Strings.Insert("QuestionToUser_001", NStr("en='The object is not saved, you must write to continue. Continue?';de='Das Objekt ist nicht gespeichert. Sie müssen es schreiben, um fortzufahren. Fortfahren?';ru='Для продолжения необходимо сохранить объект. Продолжить? '", Lang));
	Strings.Insert("QuestionToUser_002", NStr("en='Would you like to switch to scan mode?';de='Möchten Sie zum Scanmodus wechseln?';ru='Переключиться в режим сканирования?'", Lang));
	Strings.Insert("QuestionToUser_003", NStr("en='Filled data on cheque bonds transactions will be deleted. Do you want to update %1?';de='Eingegebene Daten über Scheck- und Anleihetransaktionen werden gelöscht. Möchten Sie %1 aktualisieren?';ru='Заполненные данные по чекам будут очищены. Обновить %1? '", Lang));
	Strings.Insert("QuestionToUser_004", NStr("en='Change tax rates according agreement?';de='Steuersätze gemäß Vereinbarung ändern?';ru='Изменить налоговые ставки в соответствии с соглашением?'", Lang));
	Strings.Insert("QuestionToUser_005", NStr("en='Do you want to update filled stores?';de='Möchten Sie die eingegebenen Lager aktualisieren?';ru='Обновить заполненные склады?'", Lang));
	Strings.Insert("QuestionToUser_006", NStr("en='Do you want to update filled currency?';de='Möchten Sie die eingegebene Währung aktualisieren?';ru='Обновить заполненные цены'", Lang));
	Strings.Insert("QuestionToUser_007", NStr("en='Transaction table will be cleared. Continue?';de='Die Transaktionstabelle wird geleert. Fortfahren?';ru='Таблица транзакций будет очищена. Продолжить?'", Lang));
	Strings.Insert("QuestionToUser_008", NStr("en='When the currency is changed, rows with cash transfer documents will be cleared. Continue?';de='Wenn die Währung geändert wird, Zeilen mit Überweisungsdokumenten werden geleert. Fortfahren?';ru='При изменении валюты заполненные строки будут отвязаны от документа перемещения денежных средств. Продолжить?'", Lang));
	Strings.Insert("QuestionToUser_009", NStr("en='Update filled stores on %1';de='Eingegebene Lager basierend auf %1 aktualisieren';ru='Обновление склада на %1'", Lang));
	Strings.Insert("QuestionToUser_011", NStr("en='Update filled price types on %1';de='Aktualisieren Sie die eingegebenen Preistypen für %1';ru='Обновление вида цен на %1'", Lang));
	Strings.Insert("QuestionToUser_012", NStr("en='Do you want to exit?';de='Möchten Sie den Vorgang beenden?';ru='Вы действительно хотите выйти?'", Lang));
	Strings.Insert("QuestionToUser_013", NStr("en='Update filled prices.';de='Aktualisieren Sie die eingegebenen Preise.';ru='Обновление заполненных цен.'", Lang));
	Strings.Insert("QuestionToUser_014", NStr("en='Transaction type changed. Do you want to update filled data?';de='Der Transaktionstyp wurde geändert. Möchten Sie eingegebene Daten aktualisieren?';ru='Тип операции изменен. Обновить заполненные данные? '", Lang));
	Strings.Insert("QuestionToUser_015", NStr("en='Filled data will be cleared. Proceed?';de='Eingegebene Daten werden geleert. Fortfahren?';ru='Заполненные данные будут очищены. Продолжить?'", Lang));
	Strings.Insert("QuestionToUser_016", NStr("en='Change or clear icon?';de='Symbol ändern oder löschen?';ru='Заменить или удалить иконку?'", Lang));
	#EndRegion
	
	#Region SuggestionToUser
	Strings.Insert("SuggestionToUser_1", NStr("en='Choice value';de='Auswahlwert';ru='Значение выбора'", Lang));
	Strings.Insert("SuggestionToUser_2", NStr("en='Enter barcode';de='Barcode eingeben';ru='Введите штрих-код'", Lang));
	Strings.Insert("SuggestionToUser_3", NStr("en='Input option name';de='Optionsname eingeben';ru='Наименование параметра ввода'", Lang));
	Strings.Insert("SuggestionToUser_4", NStr("en='Input new option name';de='Neuen Optionsnamen eingeben';ru='Введите новое наименование параметра'", Lang));
	#EndRegion
	
	#Region UsersEvent
	Strings.Insert("UsersEvent_001", NStr("en='User not found by UUID: %1 Name: %2';de='Benutzer wurde nach UUID %1 und Namen %2 nicht gefunden';ru='Пользователь по UUID: %1 не найден. Имя: %2'", Lang));
	Strings.Insert("UsersEvent_002", NStr("en='User found by UUID: %1 Name: %2';de='Benutzer mit UUID %1 und Namen %2 ist gefunden';ru='Пользователь по UUID: %1 найден. Имя: %2'", Lang));
	#EndRegion
	
	#Region Items
	
	// Interface
	Strings.Insert("I_1", NStr("en='Enter description';de='Geben Sie eine Beschreibung ein';ru='Введите Наименование'", Lang));
	
	Strings.Insert("I_2", NStr("en='Click for input description';de='Beschreibung eingeben';ru='Нажмите для заполнения'", Lang));
	
	Strings.Insert("I_3", NStr("en='Please, fill the document';de='Bitte füllen Sie das Dokument aus';ru='Пожалуйста, заполните документ'", Lang));
	
	#EndRegion
	
	#Region Exceptions
	Strings.Insert("Exc_001", NStr("en='Not supported object type';de='Nicht unterstützter Objekttyp';ru='Неподдерживаемый тип объекта'", Lang));
	Strings.Insert("Exc_002", NStr("en='Not condition';de='Nicht Bedingung';ru='Без условия'", Lang));
	Strings.Insert("Exc_003", NStr("en='Not implemented method: %1';de='Nicht implementierte Methode: %1';ru='Метод не реализован: %1'", Lang));
	Strings.Insert("Exc_004", NStr("en='Can not extract Currency from object';de='Die Währung kann aus dem Objekt nicht extrahiert werden';ru='Валюта из объекта не извлечена'", Lang));
	Strings.Insert("Exc_005", NStr("en='Library name is empty';de='Bibliothekname ist leer';ru='Наименование библиотеки не заполнено'", Lang));
	Strings.Insert("Exc_006", NStr("en='Library data not contain version';de='Bibliotheksdaten enthalten keine Version';ru='Данные библиотеки не содержат версии'", Lang));
	Strings.Insert("Exc_007", NStr("en='Not implemented for library version: %1';de='Nicht implementiert für Bibliotheksversion %1';ru='Не применяется для версии библиотеки: %1'", Lang));
	Strings.Insert("Exc_008", NStr("en='Unknown row key';de='Unbekannter Zeilenschlüssel';ru='Неизвестный ключ строки'", Lang));
	Strings.Insert("Exc_009", NStr("en='Error: %1';de='Fehler: %1';ru='Ошибка: %1'", Lang));
	#EndRegion
	
	#Region Saas
	// %1 - 12
	Strings.Insert("Saas_001", NStr("en='Area %1 not found!';de='Bereich %1 nicht gefunden.';ru='Рабочая область %1 не найдена!'", Lang));
	
	// %1 - closed
	Strings.Insert("Saas_002", NStr("en='Area status: %1';de='Bereichsstatus: %1';ru='Статус рабочей области: %1'", Lang));
	
	// %1 - en
	Strings.Insert("Saas_003", NStr("en='Company localization %1 is not available';de='Organisationslokalisierung %1 ist nicht verfügbar';ru='Локализация компании %1 не доступна'", Lang));
	#EndRegion
	
	#Region FillingFromClassifiers
    // Do not modify "en" strings
    Strings.Insert("Class_001", NStr("en='Purchase price';de='Einkaufspreis';ru='Цена закупки'", Lang));
    Strings.Insert("Class_002", NStr("en='Sales price';de='Verkaufspreis';ru='Цена продажи'", Lang));
    Strings.Insert("Class_003", NStr("en='Prime cost';de='Selbstkosten';ru='Себестоимость'", Lang));
    Strings.Insert("Class_004", NStr("en='Service';de='Dienstleistung';ru='Сервис'", Lang));
    Strings.Insert("Class_005", NStr("en='Product';de='Ware';ru='Товар'", Lang));
    Strings.Insert("Class_006", NStr("en='Main store';de='Hauptlager';ru='Главный склад'", Lang));
    Strings.Insert("Class_007", NStr("en='Main manager';de='Hauptmanager';ru='Главный менеджер'", Lang));
    Strings.Insert("Class_008", NStr("en='pcs';de='Stck.';ru='шт'", Lang));
    #EndRegion
    
    #Region PredefinedObjectDescriptions
	PredefinedDescriptions(Strings, Lang);
	#EndRegion
    
	#Region Titles
	// %1 - Cheque bond transaction
	Strings.Insert("Title_00100", NStr("en='Select basis documents in %1';de='Wählen Sie Basisdokumente in der %1 aus';ru='Выбор документов-оснований в документе %1'", Lang));	// Form PickUpDocuments
	Strings.Title_00100 = StrTemplate(Strings.Title_00100, Metadata.Documents.ChequeBondTransaction.Synonym);
	#EndRegion
	
	#Region ChoiceListValues
	Strings.Insert("CLV_1", NStr("en='All';de='Alle';ru='Все'", Lang));
	#EndRegion
	
	Return Strings;
EndFunction

Procedure PredefinedDescriptions(Strings, CodeLanguage)

	Strings.Insert("Description_A001", NStr("en='Catalog Agreements';de='Katalog Vereinbarungen';ru='Справочник Соглашения'", CodeLanguage));
	Strings.Insert("Description_A003", NStr("en='Catalog Business units';de='Katalog Abteilungen';ru='Справочник Подразделения'", CodeLanguage));
	Strings.Insert("Description_A004", NStr("en='Catalog Cash accounts';de='Katalog Kassenkonten';ru='Справочник Кассы\банковские счета'", CodeLanguage));
	Strings.Insert("Description_A005", NStr("en='Catalog Cheque bonds';de='Katalog Schecks und Anleihen';ru='Справочник Банковские чеки'", CodeLanguage));
	Strings.Insert("Description_A006", NStr("en='Catalog Companies';de='Katalog Organisationen';ru='Справочник Организации'", CodeLanguage));
	Strings.Insert("Description_A007", NStr("en='Catalog Company types';de='Katalog Organisationsarten';ru='Справочник Типы организаций'", CodeLanguage));
	Strings.Insert("Description_A008", NStr("en='Catalog Countries';de='Katalog Länder';ru='Справочник Страны'", CodeLanguage));
	Strings.Insert("Description_A009", NStr("en='Catalog Currencies';de='Katalog Währungen';ru='Справочник Валюты'", CodeLanguage));
	Strings.Insert("Description_A010", NStr("en='Catalog Expense and revenue types';de='Katalog Spesen- und Einnahmearten';ru='Справочник Статьи доходов и расходов'", CodeLanguage));
	Strings.Insert("Description_A011", NStr("en='Catalog Item keys';de='Dokument Artikelvarianten';ru='Справочник Ключи аналитики номенклатуры'", CodeLanguage));
	Strings.Insert("Description_A012", NStr("en='Catalog Items';de='Katalog Produkte';ru='Справочник Номенклатура'", CodeLanguage));
	Strings.Insert("Description_A013", NStr("en='Catalog Item types';de='Katalog Produkttypen';ru='Справочник Виды номенклатуры'", CodeLanguage));
	Strings.Insert("Description_A014", NStr("en='Catalog Partners';de='Katalog Geschäftspartner';ru='Справочник Партнеры'", CodeLanguage));
	Strings.Insert("Description_A015", NStr("en='Catalog Price keys';de='Katalog Preisschlüssel';ru='Справочник Ключи аналитики ценообразования'", CodeLanguage));
	Strings.Insert("Description_A016", NStr("en='Catalog Price types';de='Katalog Preistypen';ru='Справочник Виды цен'", CodeLanguage));
	Strings.Insert("Description_A017", NStr("en='Catalog Serial lot numbers';de='Katalog Serien- und Chargennummern';ru='Справочник Серии номенклатуры'", CodeLanguage));
	Strings.Insert("Description_A018", NStr("en='Catalog Specifications';de='Katalog Spezifikationen';ru='Справочник Спецификации товаров'", CodeLanguage));
	Strings.Insert("Description_A019", NStr("en='Catalog Stores';de='Katalog Lager';ru='Справочник Склады'", CodeLanguage));
	Strings.Insert("Description_A020", NStr("en='Catalog Taxes';de='Katalog Steuern';ru='Справочник Налоги'", CodeLanguage));
	Strings.Insert("Description_A021", NStr("en='Catalog Units';de='Katalog Einheiten';ru='Справочник Единицы измерения номенклатуры'", CodeLanguage));
	Strings.Insert("Description_A022", NStr("en='Catalog Users';de='Katalog Benutzer';ru='Справочник Пользователи'", CodeLanguage));
	Strings.Insert("Description_A023", NStr("en='Document Bank payment';de='Dokument Ausgangszahlung';ru='Документ Платежное поручение исходящие'", CodeLanguage));
	Strings.Insert("Description_A024", NStr("en='Document Bank receipt';de='Dokument Eingangszahlung';ru='Документ Платежное поручение входящее'", CodeLanguage));
	Strings.Insert("Description_A025", NStr("en='Document Bundling';de='Dokument Bündelung';ru='Документ Комплектация набора'", CodeLanguage));
	Strings.Insert("Description_A026", NStr("en='Document Cash expense';de='Dokument Barausgabe';ru='Документ Прочие наличные расходы'", CodeLanguage));
	Strings.Insert("Description_A027", NStr("en='Document Cash payment';de='Dokument Ausgabebeleg';ru='Документ Расходный кассовый ордер'", CodeLanguage));
	Strings.Insert("Description_A028", NStr("en='Document Cash receipt';de='Dokument Einnahmebeleg';ru='Документ Приходный кассовый ордер'", CodeLanguage));
	Strings.Insert("Description_A029", NStr("en='Document Cash revenue';de='Dokument Bareinnahme';ru='Документ Прочие наличные доходы'", CodeLanguage));
	Strings.Insert("Description_A030", NStr("en='Document Cash transfer order';de='Dokument Umbuchungsauftrag';ru='Документ Заявка на перемещение денежных средств'", CodeLanguage));
	Strings.Insert("Description_A031", NStr("en='Document Cheque bond transaction';de='Dokument Scheck- und Anleihetransaktion';ru='Документ Операция по чекам и долговым обязательствам'", CodeLanguage));
	Strings.Insert("Description_A032", NStr("en='Document Goods receipt';de='Dokument Wareneingang';ru='Документ Приходная товарная накладная'", CodeLanguage));
	Strings.Insert("Description_A033", NStr("en='Document Incoming payment order';de='Dokument Antrag auf Geldeingang';ru='Документ Заявка на поступление денежных средств'", CodeLanguage));
	Strings.Insert("Description_A034", NStr("en='Document Inventory transfer';de='Dokument Lagerumbuchung';ru='Документ Перемещение товаров'", CodeLanguage));
	Strings.Insert("Description_A035", NStr("en='Document Inventory transfer order';de='Dokument Lagerumbuchungsauftrag';ru='Документ Заказ на перемещение товаров'", CodeLanguage));
	Strings.Insert("Description_A036", NStr("en='Document Invoice match';de='Dokument Rechnungsabgleich';ru='Документ Сопоставление документа-основания взаиморасчетов с платежами'", CodeLanguage));
	Strings.Insert("Description_A037", NStr("en='Document Labeling';de='Dokument Bezeichnung';ru='Документ Штрихкодирование'", CodeLanguage));
	Strings.Insert("Description_A038", NStr("en='Document Opening entry';de='Dokument Anfangsbestand';ru='Документ Ввод начальных остатков'", CodeLanguage));
	Strings.Insert("Description_A039", NStr("en='Document Outgoing payment order';de='Dokument Antrag auf Geldausgang';ru='Документ Заявка на расходование денежных средств'", CodeLanguage));
	Strings.Insert("Description_A040", NStr("en='Document Physical count by location';de='Dokument Inventurliste';ru='Документ Пересчет товаров'", CodeLanguage));
	Strings.Insert("Description_A041", NStr("en='Document Physical inventory';de='Dokument Inventur';ru='Документ Инвентаризация товаров'", CodeLanguage));
	Strings.Insert("Description_A042", NStr("en='Document Price list';de='Dokument Preiskalkulation';ru='Документ Установка цен номенклатуры'", CodeLanguage));
	Strings.Insert("Description_A043", NStr("en='Document Purchase invoice';de='Dokument Einkaufsrechnung';ru='Документ Поступление товаров и услуг'", CodeLanguage));
	Strings.Insert("Description_A044", NStr("en='Document Purchase order';de='Dokument Bestellung';ru='Документ Заказ поставщику'", CodeLanguage));
	Strings.Insert("Description_A045", NStr("en='Document Purchase return';de='Dokument Lieferantenretoure';ru='Документ Возврат поставщику'", CodeLanguage));
	Strings.Insert("Description_A046", NStr("en='Document Purchase return order';de='Dokument Lieferantenretourenauftrag';ru='Документ Заказ на возврат поставщику'", CodeLanguage));
	Strings.Insert("Description_A047", NStr("en='Document Reconciliation statement';de='Dokument Offene Posten';ru='Документ Сверка взаиморасчетов'", CodeLanguage));
	Strings.Insert("Description_A048", NStr("en='Document Sales invoice';de='Dokument Rechnung';ru='Документ Реализация товаров и услуг'", CodeLanguage));
	Strings.Insert("Description_A049", NStr("en='Document Sales order';de='Dokument Auftrag';ru='Документ Заказ покупателя'", CodeLanguage));
	Strings.Insert("Description_A050", NStr("en='Document Sales return';de='Dokument Kundenretoure';ru='Документ Возврат товаров от покупателя'", CodeLanguage));
	Strings.Insert("Description_A051", NStr("en='Document Sales return order';de='Dokument Kundenretourenauftrag';ru='Документ Заказ на возврат покупателя'", CodeLanguage));
	Strings.Insert("Description_A052", NStr("en='Document Shipment confirmation';de='Dokument Lieferschein';ru='Документ Расходная товарная накладная'", CodeLanguage));
	Strings.Insert("Description_A053", NStr("en='Document Stock adjustment as surplus';de='Dokument Aktivierung von Warenüberschüssen';ru='Документ Оприходование товаров'", CodeLanguage));
	Strings.Insert("Description_A054", NStr("en='Document Stock adjustment as write off';de='Dokument Warenabschreibung';ru='Документ Списание товаров'", CodeLanguage));
	Strings.Insert("Description_A056", NStr("en='Document Unbundling';de='Dokument Entbündelung';ru='Документ Разукомлектация набора'", CodeLanguage));
	Strings.Insert("Description_A057", NStr("en='User defined';de='Benutzerdefiniert';ru='Произвольный'", CodeLanguage));
	Strings.Insert("Description_A058", NStr("en='Cheque bond incoming';de='Eingangsscheck/Anleihe';ru='Входящие банковские чеки'", CodeLanguage));
	Strings.Insert("Description_A059", NStr("en='Cheque bond outgoing';de='Ausgangsscheck/Anleihe';ru='Исходящие банковские чеки'", CodeLanguage));
	Strings.Insert("Description_A060", NStr("en='Document Credit debit note';de='Dokument Gut- und Lastschrift';ru='Документ Списание задолженности'", CodeLanguage));
	Strings.Insert("Description_A061", NStr("en='Settlement currency';de='Abrechnungswährung';ru='Валюта транзакции'", CodeLanguage));

EndProcedure