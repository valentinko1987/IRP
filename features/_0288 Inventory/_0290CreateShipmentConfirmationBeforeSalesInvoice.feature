#language: ru
@tree
@Positive
Функционал: проведение отгрузки раньше чем выписан инвойс

Как Разработчик
Я хочу создать схему проведение отгрузки раньше чем выписан инвойс

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий



Сценарий: _029001 проставление по партнеру признака возможности сформировать Shipment confirmation before Sales invoice
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-273' с именем 'IRP-273'
	И я проверяю что в карточке партнера есть признак Shipment confirmation before Sales invoice
		И я открываю навигационную ссылку "e1cib/list/Catalog.Partners"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Kalipso   |
		И в таблице "List" я выбираю текущую строку
		И     элемент формы с именем "ShipmentConfirmationsBeforeSalesInvoice" стал равен 'No'
		И я устанавливаю флаг 'Shipment confirmations before sales invoice'
		И     элемент формы с именем "ShipmentConfirmationsBeforeSalesInvoice" стал равен 'Yes'
		И я нажимаю на кнопку 'Save and close'

Сценарий: _029002 формирование по клиенту Kalipso заказа + отгрузки на основании заказа с ордерного склада
	И Я закрыл все окна клиентского приложения
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	Когда создаю заказ на Kalipso Basic Agreements, without VAT, TRY (Dress и Shirt)
	И я изменяю номер по заказу
		И я перехожу к закладке "Other"
		И я разворачиваю группу "More"
		И в поле 'Number' я ввожу текст '180'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '180'
		И я нажимаю на кнопку 'Post'
	И я создаю расходный ордер
		И я нажимаю на кнопку 'Shipment confirmation'
		И     элемент формы с именем "Company" стал равен 'Main Company'
		И в поле 'Number' я ввожу текст '180'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '180'
	И я проверяю табличную часть расходного ордера
		И     таблица "ItemList" содержит строки:
			| 'Item'     | 'Quantity' | 'Item key'  | 'Store'    | 'Unit' | 'Shipment basis'   |
			| 'Trousers' | '12,000'   | '36/Yellow' | 'Store 02' | 'pcs' | 'Sales order 180*' |
			| 'Shirt'    | '10,000'   | '36/Red'    | 'Store 02' | 'pcs' | 'Sales order 180*' |
	И я нажимаю на кнопку 'Post and close'
	И Я закрыл все окна клиентского приложения

Сценарий: _029003 проверка движений заказа с непрямой отгрузкой с ордерного склада по регистру OrderBalance
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'         | 'Line number' | 'Store'    | 'Order'            | 'Item key'  |
		| '12,000'   | 'Sales order 180*' | '1'           | 'Store 02' | 'Sales order 180*' | '36/Yellow' |
		| '10,000'   | 'Sales order 180*' | '2'           | 'Store 02' | 'Sales order 180*' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029004 проверка движений заказа с непрямой отгрузкой с ордерного склада по регистру StockReservation
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockReservation'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'         | 'Line number' | 'Store'    | 'Item key'  |
		| '12,000'   | 'Sales order 180*' | '1'           | 'Store 02' | '36/Yellow' |
		| '10,000'   | 'Sales order 180*' | '2'           | 'Store 02' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029005 проверка движений заказа с непрямой отгрузкой с ордерного склада по регистру InventoryBalance
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.InventoryBalance'
	Тогда таблица "List" не содержит строки:
		| 'Quantity' | 'Recorder'          | 'Company'      | 'Item key'  |
		| '12,000'   | 'Sales order 180*'  | 'Main Company' | '36/Yellow' |
		| '10,000'   | 'Sales order 180*'  | 'Main Company' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029006 проверка движений заказа с непрямой отгрузкой с ордерного склада по регистру GoodsInTransitOutgoing
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'         | 'Shipment basis'   | 'Line number' | 'Store'    | 'Item key'  |
		| '12,000'   | 'Sales order 180*' | 'Sales order 180*' | '1'           | 'Store 02' | '36/Yellow' |
		| '10,000'   | 'Sales order 180*' | 'Sales order 180*' | '2'           | 'Store 02' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029007 проверка отсутствия движений заказа с прямой отгрузкой с ордерного склада по регистру StockBalance
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
	Тогда таблица "List" не содержит строки:
		| 'Recorder'         |
		| 'Sales order 180*' |
	И Я закрыл все окна клиентского приложения

Сценарий: _029008 проверка отсутствия движений заказа с прямой отгрузкой с ордерного склада по регистру ShipmentOrders
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
	Тогда таблица "List" не содержит строки:
		| 'Recorder'         |
		| 'Sales order 180*' |
	И Я закрыл все окна клиентского приложения

Сценарий: _029009 проверка движений Shipment confirmation по заказу с прямой отгрузкой по регистру StockBalance
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'                   | 'Line number' | 'Store'    | 'Item key'  |
		| '12,000'   | 'Shipment confirmation 180*' | '1'           | 'Store 02' | '36/Yellow' |
		| '10,000'   | 'Shipment confirmation 180*' | '2'           | 'Store 02' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029010 проверка движений Shipment confirmation по заказу с прямой отгрузкой по регистру GoodsInTransitOutgoing
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'                   | 'Shipment basis'   | 'Line number' | 'Store'    | 'Item key'  |
		| '12,000'   | 'Shipment confirmation 180*' | 'Sales order 180*' | '1'           | 'Store 02' | '36/Yellow' |
		| '10,000'   | 'Shipment confirmation 180*' | 'Sales order 180*' | '2'           | 'Store 02' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029011 проверка движений Shipment confirmation по заказу с прямой отгрузкой по регистру ShipmentOrders
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
	Тогда таблица "List" содержит строки:
		| 'Quantity' | 'Recorder'                   | 'Line number' | 'Order'            | 'Shipment confirmation'      | 'Item key'  |
		| '12,000'   | 'Shipment confirmation 180*' | '1'           | 'Sales order 180*' | 'Shipment confirmation 180*' | '36/Yellow' |
		| '10,000'   | 'Shipment confirmation 180*' | '2'           | 'Sales order 180*' | 'Shipment confirmation 180*' | '36/Red'    |
	И Я закрыл все окна клиентского приложения

Сценарий: _029012 проверка движений заказа с прямой отгрузкой со смешанных складов (один товар с ордерного, другой с неордерного)
	Когда создаю заказ на Kalipso Basic Agreements, without VAT, TRY (Dress и Shirt)
	И изменяю количество и по второй строке склад
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '5,000'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я перехожу к строке:
			| Item     | Item key  |
			| Trousers | 36/Yellow |
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" в поле 'Q' я ввожу текст '7,000'
		И в таблице "ItemList" я завершаю редактирование строки
		И в таблице "ItemList" я активизирую поле с именем "ItemListStore"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита "Store"
		И в таблице "List" я перехожу к строке:
			| Description |
			| Store 01  |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я завершаю редактирование строки
	И изменяю номер по заказу
		И я перехожу к закладке "Other"
		И я разворачиваю группу "More"
		И в поле 'Number' я ввожу текст '181'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '181'
		И в таблице "ItemList" я нажимаю на кнопку '% Offers'
		И в таблице "Offers" я нажимаю на кнопку с именем 'FormOK'
		И я нажимаю на кнопку 'Post'
	И я создаю расходный ордер
		И я нажимаю на кнопку 'Shipment confirmation'
		И     элемент формы с именем "Company" стал равен 'Main Company'
		И     таблица "ItemList" содержит строки:
			| 'Item'  | 'Quantity' | 'Item key' | 'Store'    | 'Unit' | 'Shipment basis'   |
			| 'Shirt' | '10,000'   | '36/Red'   | 'Store 02' | 'pcs' | 'Sales order 181*' |
		И я нажимаю на кнопку 'Post and close'
	И Я закрыл все окна клиентского приложения
	И я проверяю движения по Sales order с прямой отгрузкой c смешанных складов по регистру OrderBalance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         | 'Line number' | 'Store'    | 'Order'            | 'Item key'  |
			| '7,000'    | 'Sales order 181*' | '1'           | 'Store 01' | 'Sales order 181*' | '36/Yellow' |
			| '10,000'   | 'Sales order 181*' | '2'           | 'Store 02' | 'Sales order 181*' | '36/Red'    |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения заказа с прямой отгрузкой с смешанных складов по регистру StockReservation
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockReservation'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         | 'Line number' | 'Store'    | 'Item key'  |
			| '7,000'    | 'Sales order 181*' | '1'           | 'Store 01' | '36/Yellow' |
			|'10,000'    | 'Sales order 181*' | '2'           | 'Store 02' | '36/Red'    |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения заказа с прямой отгрузкой с смешанных складов по регистру InventoryBalance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.InventoryBalance'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         |'Company'      | 'Item key'  |
			| '7,000'    | 'Sales order 181*' |'Main Company' | '36/Yellow' |
		Тогда таблица "List" не содержит строки:
			| 'Quantity' | 'Recorder'         |'Company'      | 'Item key'  |
			| '10,000'   | 'Sales order 181*' |'Main Company' | '36/Red'    |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения заказа с прямой отгрузкой с смешанных складов по регистру GoodsInTransitOutgoing
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         | 'Shipment basis'   | 'Line number' | 'Store'    | 'Item key' |
			| '10,000'   | 'Sales order 181*' | 'Sales order 181*' | '1'           | 'Store 02' | '36/Red'   |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения заказа с прямой отгрузкой с смешанных складов по регистру StockBalance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         | 'Line number' | 'Store'    | 'Item key'  |
			| '7,000'    | 'Sales order 181*' | '1'           | 'Store 01' | '36/Yellow' |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения заказа с прямой отгрузкой с смешанных складов по регистру ShipmentOrders
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'         | 'Line number' | 'Order'            | 'Shipment confirmation'  | 'Item key'  |
			| '7,000'    | 'Sales order 181*' | '1'           | 'Sales order 181*' | 'Sales order 181*'       | '36/Yellow' |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения Shipment confirmation по заказу с смешанных складов по регистру StockBalance
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'                   | 'Line number' | 'Store'    | 'Item key' |
			| '10,000'   | 'Shipment confirmation 181*' | '1'           | 'Store 02' | '36/Red'   |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения Shipment confirmation по заказу с смешанных складов по регистру GoodsInTransitOutgoing
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'                   | 'Shipment basis'   | 'Line number' | 'Store'    | 'Item key' |
			| '10,000'   | 'Shipment confirmation 181*' | 'Sales order 181*' | '1'           | 'Store 02' | '36/Red'   |
		И Я закрыл все окна клиентского приложения
	И я проверяю движения Shipment confirmation по заказу с смешанных складов по регистру ShipmentOrders
		И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
		Тогда таблица "List" содержит строки:
			| 'Quantity' | 'Recorder'                   | 'Line number' | 'Order'            | 'Shipment confirmation'      | 'Item key' |
			| '10,000'   | 'Shipment confirmation 181*' | '1'           | 'Sales order 181*' | 'Shipment confirmation 181*' | '36/Red'   |
		И Я закрыл все окна клиентского приложения
	
Сценарий: _029013 создание Sales invoice на несколько отгрузок
# одна отгрузка может относится только к одному Sales invoice
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И в таблице "List" я перехожу к строке:
		| 'Number' | 'Partner'     |
		| '180'    | 'Kalipso' |
	И В таблице  "List" я перехожу на одну строку вниз с выделением
	И я нажимаю на кнопку с именем 'FormDocumentSalesInvoiceGenerateSalesInvoice'
	И я нажимаю на кнопку с именем 'FormSelectAll'
	И я нажимаю на кнопку 'Ok'
	И     элемент формы с именем "Partner" стал равен 'Kalipso'
	И     элемент формы с именем "LegalName" стал равен 'Company Kalipso'
	И     элемент формы с именем "Agreement" стал равен 'Basic Agreements, without VAT'
	И     элемент формы с именем "Company" стал равен 'Main Company'
	И в таблице "ItemList" я перехожу к строке:
    	| 'Item'     | 'Item key'  | 'Store'    | 'Unit' | 'Q'      |
		| 'Trousers' | '36/Yellow' | 'Store 01' | 'pcs'  | '7,000'  |
	И в таблице 'ItemList' я удаляю строку	
	* Проверка заполнения табличной части
		И     таблица "ItemList" содержит строки:
		| 'Item'     | 'Price'  | 'Item key'  | 'Store'    | 'Shipment confirmation'      | 'Sales order'      | 'Unit' | 'Q'      | 'Offers amount' | 'Tax amount' | 'Net amount' | 'Total amount' |
		| 'Trousers' | '338,98' | '36/Yellow' | 'Store 02' | 'Shipment confirmation 180*' | 'Sales order 180*' | 'pcs' | '12,000' | ''            | '732,20'     | '4 067,76'   | '4 799,96'     |
		| 'Shirt'    | '296,61' | '36/Red'    | 'Store 02' | 'Shipment confirmation 180*' | 'Sales order 180*' | 'pcs' | '10,000' | ''            | '533,90'     | '2 966,10'   | '3 500,00'     |
		| 'Shirt'    | '296,61' | '36/Red'    | 'Store 02' | 'Shipment confirmation 180*' | 'Sales order 180*' | 'pcs' | '10,000' | ''            | '533,90'     | '2 966,10'   | '3 500,00'     |
	И я меняю номер sales invoice
		И я перехожу к закладке "Other"
		И я разворачиваю группу "More"
		И в поле 'Number' я ввожу текст '1'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '180'
		И я перехожу к закладке "Item list"
		И в таблице "ItemList" я нажимаю на кнопку '% Offers'
		И в таблице "Offers" я нажимаю на кнопку с именем 'FormOK'
		И я нажимаю на кнопку 'Post and close'
	И Пауза 5
	И я проверяю проводки Sales invoice при отгрузке по заказу
		* Проверка отсутствия проводок по регистру Stock Balance
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 180*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру Inventory Balance 
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.InventoryBalance'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 180*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру Stock StockReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockReservation'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 180*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру GoodsInTransitOutgoing
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 180*' |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру Order Balance
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
			Тогда таблица "List" содержит строки:
				| 'Quantity' | 'Recorder'           | 'Line number' | 'Store'    | 'Order'            | 'Item key'  |
				| '12,000'   | 'Sales invoice 180*' | '1'           | 'Store 02' | 'Sales order 180*' | '36/Yellow' |
				| '10,000'   | 'Sales invoice 180*' | '2'           | 'Store 02' | 'Sales order 180*' | '36/Red'    |
				| '10,000'   | 'Sales invoice 180*' | '3'           | 'Store 02' | 'Sales order 181*' | '36/Red'    |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру OrderReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderReservation'
			Тогда таблица "List" содержит строки:
				| 'Quantity' | 'Recorder'           | 'Line number' | 'Store'    | 'Item key'  |
				| '12,000'   | 'Sales invoice 180*' | '1'           | 'Store 02' | '36/Yellow' |
				| '20,000'   | 'Sales invoice 180*' | '2'           | 'Store 02' | '36/Red'    |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру OrderReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.SalesTurnovers'
			Тогда таблица "List" содержит строки:
				| 'Quantity' | 'Recorder'           | 'Sales invoice'      | 'Item key'  |
				| '12,000'   | 'Sales invoice 180*' | 'Sales invoice 180*' | '36/Yellow' |
				| '10,000'   | 'Sales invoice 180*' | 'Sales invoice 180*' | '36/Red'    |
				| '10,000'   | 'Sales invoice 180*' | 'Sales invoice 180*' | '36/Red'    |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру ShipmentOrders
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
			Тогда таблица "List" содержит строки:
				| 'Quantity' | 'Recorder'           | 'Line number' | 'Order'            | 'Shipment confirmation'      | 'Item key'  |
				| '12,000'   | 'Sales invoice 180*' | '1'           | 'Sales order 180*' | 'Shipment confirmation 180*' | '36/Yellow' |
				| '10,000'   | 'Sales invoice 180*' | '2'           | 'Sales order 180*' | 'Shipment confirmation 180*' | '36/Red'    |
				| '10,000'   | 'Sales invoice 180*' | '3'           | 'Sales order 181*' | 'Shipment confirmation 181*' | '36/Red'    |
			И Я закрыл все окна клиентского приложения

Сценарий: _029014 проверка при создании sales invoice отображение для выбора shipment confirmation по которым sales invoice уже выписан
# не должны отображатся
	# И Я устанавливаю ссылку 'https://bilist.atlassian.net/browse/IRP-272' с именем 'IRP-272'
	И я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И в таблице "List" я перехожу к строке:
		| 'Number' | 'Partner'     |
		| '180'    | 'Kalipso' |
	И В таблице  "List" я перехожу на одну строку вниз с выделением
	И я нажимаю на кнопку с именем 'FormDocumentSalesInvoiceGenerateSalesInvoice'
	И я нажимаю на кнопку с именем 'FormSelectAll'
	И я нажимаю на кнопку 'Ok'
	* Проверка заполнения данных о партнере и соглашении
		И     элемент формы с именем "Partner" стал равен 'Kalipso'
		И     элемент формы с именем "LegalName" стал равен 'Company Kalipso'
		И     элемент формы с именем "Agreement" стал равен 'Basic Agreements, without VAT'
		И     элемент формы с именем "Company" стал равен 'Main Company'
	* Проверка заполнения табличной части
		И я запоминаю количество строк таблицы "ItemList" как "Q"
		И     я вывожу значение переменной "Q"
		Тогда переменная "Q" имеет значение 1
		И     таблица "ItemList" содержит строки:
			| 'Item'     | 'Price'  | 'Item key'  | 'Store'    | 'Shipment confirmation'    | 'Sales order'      | 'Unit' | 'Q'     | 'Offers amount' | 'Tax amount' | 'Net amount' | 'Total amount' |
			| 'Trousers' | '338,98' | '36/Yellow' | 'Store 01' | 'Sales order 181*'         | 'Sales order 181*' | 'pcs' | '7,000' | ''              | '427,11'     | '2 372,86'   | '2 799,97'     |
	* Изменение номера sales invoice
		И я перехожу к закладке "Other"
		И я разворачиваю группу "More"
		И в поле 'Number' я ввожу текст '1'
		Тогда открылось окно '1C:Enterprise'
		И я нажимаю на кнопку 'Yes'
		И в поле 'Number' я ввожу текст '181'
		И я перехожу к закладке "Item list"
		И в таблице "ItemList" я нажимаю на кнопку '% Offers'
		И в таблице "Offers" я нажимаю на кнопку с именем 'FormOK'
		И я нажимаю на кнопку 'Post and close'
	И Я закрыл все окна клиентского приложения
	* Проверка движения sales invoice при отгрузке по sales order c неордерного склада
		* Проверка отсутствия проводок по регистру Stock Balance
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockBalance'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру Inventory Balance 
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.InventoryBalance'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру Stock StockReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.StockReservation'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка отсутствия проводок по регистру GoodsInTransitOutgoing
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.GoodsInTransitOutgoing'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру Order Balance
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderBalance'
			Тогда таблица "List" содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру OrderReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.OrderReservation'
			Тогда таблица "List" содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру OrderReservation
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.SalesTurnovers'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения
		* Проверка проводок по регистру ShipmentOrders
			И я открываю навигационную ссылку 'e1cib/list/AccumulationRegister.ShipmentOrders'
			Тогда таблица "List" не содержит строки:
				| 'Recorder'           |
				| 'Sales invoice 181*' |
			И Я закрыл все окна клиентского приложения










	













	
