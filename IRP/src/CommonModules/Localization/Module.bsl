Function Strings(CodeLanguage) Export
	
	Strings = New Structure();
	
	#Region Service
	Strings.Insert("S_001", NStr("en='Unsupported type of request body';de='Nicht unterstützter Typ des anforderungskörpers';ro='Tipul neacceptat al organismului de solicitare';ru='Неподдерживаемый тип тела запроса';tr='Desteklenmeyen request body tipi'", CodeLanguage));
	
	// Can Not connect to: localhost:8080 Detail: There is no internet connection
	Strings.Insert("S_002", NStr("en='Can''t connect to: %1:%2 Detail: %3';de='Kann keine Verbindung herstellen zu: %1:%2 Detail: %3';ro='Nu se poate conecta la: %1:%2 Detalii: %3';ru='Не удается подключиться к: %1: % 2 деталь: %3';tr='Bağlantı sağlanamadı: %1:%2. Ayrıntı: %3'", CodeLanguage));
	
	// Received response from: localhost:8080
	Strings.Insert("S_003", NStr("en='Received response from: %1:%2';de='Antwort erhalten von: %1:%2';ro='Răspuns primit de la: %1:%2';ru='Получен ответ от: %1:%2';tr='Cevap başarılı alındı: %1:%2'", CodeLanguage));
	
	Strings.Insert("S_004", NStr("en='Resource address is empty';de='Ressourcenadresse ist leer';ro='Adresa resurselor este goală';ru='Адрес ресурса пуст';tr='Kaynak adresler boş'", CodeLanguage));
	
	// Integration setting Not found by name: connection_to_other_system
	Strings.Insert("S_005", NStr("en='Integration setting not found by name: %1';de='Integrationseinstellung nicht nach name gefunden: %1';ro='Setarea integrării nu a fost găsită după nume: %1';ru='Параметр интеграции не найден по имени: %1';tr='Entegrasyon ayarlar tanıma göre bulunamadı: %1'", CodeLanguage));
	
	Strings.Insert("S_006", NStr("en='Method unsupported on web client';de='Methode auf web-client nicht unterstützt';ro='Metodă neacceptată pe clientul web';ru='Метод не поддерживается на веб-клиенте';tr='Web istemci kullanırken bu metod desteklenmemektedir'", CodeLanguage));
	
	Strings.Insert("S_007", NStr("en='Metadata name is empty';de='Metadata name ist leer';ro='Numele metadatelor este gol';ru='Имя метаданных пустое';tr='Üstveri tanımı boş'", CodeLanguage));
	
	// Metadata name Not defined: Catalog_Items
	Strings.Insert("S_008", NStr("en='Metadata name not defined: %1';de='Metadaten-name nicht definiert: %1';ro='Denumirea metadatelor nedefinită: %1';ru='Имя метаданных не определено: %1';tr='Üstveri tanımı tanımlanmadı: %1'", CodeLanguage));
	
	Strings.Insert("S_009", NStr("en='JSON is empty';de='JSON leer ist';ro='JSON este gol';ru='JSON пуст';tr='JSON boş'", CodeLanguage));
	
	Strings.Insert("S_010", NStr("en='External system is empty';de='Externes system ist leer';ro='Sistemul extern este gol';ru='Внешняя система пуста';tr='Dış sistem boş'", CodeLanguage));
	
	// External system Not defined: IRP
	Strings.Insert("S_011", NStr("en='External system not defined: %1';de='Externes system nicht definiert: %1';ro='Sistem extern nedefinit: %1';ru='Внешняя система не определена: %1';tr='Dış sistem belirlenmedi: %1'", CodeLanguage));
	Strings.Insert("S_012", NStr("en='Can''t retrieve value for: Property[%1] Value[%2] Metadata[%3]'", CodeLanguage));
	
	// Special offers
	Strings.Insert("S_013", NStr("en='Not supported type of object: %1'", CodeLanguage));
	
	// FileTransfer
	Strings.Insert("S_014", NStr("en='File name is empty';de='Dateiname ist leer';ro='Numele fișierului este gol';ru='Имя файла пустое';tr='Dosya ismi boş'", CodeLanguage));
	Strings.Insert("S_015", NStr("en='Path for save not set';de='Pfad für speichern nicht gesetzt';ro='Calea pentru salvare nu este setată';ru='Путь для сохранения не задан';tr='Kaydetme adresi belirlenmedi'", CodeLanguage));
	
	// Test connection
	Strings.Insert("S_016", NStr("en='%1 Status code: %2 %3';de='% 1 Statuscode: %2 %3';ro='%1 Cod de stare: %2 %3';ru='%1 код состояния: %2 %3';tr='%1 Durum kodu: %2 %3'", CodeLanguage));
	// skipped "S_017"
	
	//	Barcode
	Strings.Insert("S_018", NStr("en='Item added';de='Artikel Hinzugefügt';ro='Postul adăugat';ru='Товар добавлен'", CodeLanguage));
	Strings.Insert("S_019", NStr("en='Barcode %1 not found';de='Barcode - %1 nicht gefunden';ro='Codul de bare %1 nu a fost găsit';ru='Штрих-код %1 не найден'", CodeLanguage));

	// 10 of 233 
	Strings.Insert("S_020", NStr("en='%1 of %2';de='%1 von %2';ro='%1 din %2';ru='%1 из %2'", CodeLanguage));
	
	
	Strings.Insert("S_021", NStr("en='Goods receipt';de='Wareneingang';ro='Primirea mărfurilor';ru='Получение товара';tr='Satın alma irsaliyesi'", CodeLanguage));
	Strings.Insert("S_022", NStr("en='Multicurrency receipt basises';de='Fremdwährungs-Eingang basises';ro='Baze de primire multicurrency';ru='Мультивалютные квитанционные базы'", CodeLanguage));
	
	Strings.Insert("S_023", NStr("en='Procurement method';de='Beschaffungsmethode';ro='Metoda de achiziție';ru='Метод закупок';tr='Tedarik şekli'", CodeLanguage));
	
	
	// name templates
	Strings.Insert("S_024", NStr("en='Customer agreement, %1';de='Kundenvereinbarung, %1';ro='Acordul clientului, %1';ru='Клиентское соглашение, %1'", CodeLanguage));
	Strings.Insert("S_025", NStr("en='Vendor agreement, %1';de='Lieferantenvereinbarung, %1';ro='Contract de vânzare, %1';ru='Соглашение с поставщиком, %1'", CodeLanguage));
	Strings.Insert("S_026", NStr("en='Selected icon will be resized to 16x16 px';de='Das ausgewählte Symbol wird auf 16x16 px verkleinert';ro='Pictograma selectată va fi redimensionată la 16x16 px';ru='Размер выбранного значка будет изменен до 16x16 пикселей';tr='Seçilen simge 16x16 olarak yeniden boyutlanadırılacak'", CodeLanguage));
	
	Strings.Insert("S_027", NStr("en='[Not filled]';de='[Nicht gefüllt]';ro='(Nu este completat]';ru='[Не заполнять]';tr='[Doldurulmamış]'", CodeLanguage));
	
	#EndRegion
	
	#Region Service
	Strings.Insert("Form_001", NStr("en='New page';de='Neue Seite';ro='Pagină nouă';ru='Новая страница'", CodeLanguage));
	Strings.Insert("Form_002", NStr("en='Delete';de='Löschen';ro='Ștergere';ru='Удалить';tr='Kaldır'", CodeLanguage));
	Strings.Insert("Form_003", NStr("en='Quantity';de='Menge';ro='Cantitate';ru='Количество';tr='Miktar'", CodeLanguage));
	Strings.Insert("Form_004", NStr("en='Customer agreements';de='Kundenvereinbarung';ro='Acorduri cu clienții';ru='Клиентское соглашение';tr='Müşteri sözleşmeleri'", CodeLanguage));
	Strings.Insert("Form_005", NStr("en='Customers';de='Kunde';ro='Clienţi';ru='Клиенты';tr='Müşteriler'", CodeLanguage));
	Strings.Insert("Form_006", NStr("en='Vendors';de='Softwareanbietern';ro='Furnizori';ru='Поставщики';tr='Tedarikçiler'", CodeLanguage));
	Strings.Insert("Form_007", NStr("en='Vendor agreements';de='Lieferantenvereinbarungen';ro='Acorduri de furnizor';ru='Соглашения с поставщиками';tr='Tedarikçi sözleşmeleri'", CodeLanguage));
	Strings.Insert("Form_008", NStr("en='User';de='Benutzer';ro='Utilizator';ru='Пользователь';tr='Kullanıcı'", CodeLanguage));
	Strings.Insert("Form_009", NStr("en='User group';de='Benutzergruppe';ro='Grup de utilizatori';ru='Группа пользователей';tr='Kullanıcı grubu'", CodeLanguage));
	Strings.Insert("Form_010", NStr("en='Show all';de='Alle anzeigen';ro='Arată toate';ru='Показать все'", CodeLanguage));
	Strings.Insert("Form_011", NStr("en='Show selected (%1)';de='Karte ausgewählt (%1)';ro='Afișare selectată (%1)';ru='Показать выбранные (%1)'", CodeLanguage));
	Strings.Insert("Form_012", NStr("en='Load picture';de='Bild laden';ro='Imaginea de încărcare';ru='Загрузить картинку'", CodeLanguage));
	Strings.Insert("Form_013", NStr("en='Date';de='Datum';ro='Dată';ru='Дата';tr='Tarih'", CodeLanguage));
	Strings.Insert("Form_014", NStr("en='Number';de='Zahl';ro='Număr';ru='Номер';tr='Numara'", CodeLanguage));
	Strings.Insert("Form_015", NStr("en='Finish';de='Beenden';ro='Termină';ru='Заканчивать';tr='Bitiş'", CodeLanguage));
	Strings.Insert("Form_016", NStr("en='Next';de='Nächsten';ro='Următorul.';ru='Следующий';tr='Sonraki'", CodeLanguage));
	 // change icon
	Strings.Insert("Form_017", NStr("en='Change';de='Ändern';ro='Schimbare';ru='Изменить';tr='Değiştir'", CodeLanguage));
	 // clear icon
	Strings.Insert("Form_018", NStr("en='Clear';de='Klar';ro='Liber.';ru='Четкий';tr='Temizle'", CodeLanguage));
	 // cancel answer on question
	Strings.Insert("Form_019", NStr("en='Cancel';de='Stornieren';ro='Anulează';ru='Отменить';tr='İptal'", CodeLanguage));
	Strings.Insert("Form_020", NStr("en='Retail, %1';de='Einzelhandel, %1';ro='Vânzare cu amănuntul, %1';ru='Розничная торговля, %1';tr='Perakende, %1'", CodeLanguage));
	Strings.Insert("Form_021", NStr("en='Download currency rate type';de='Download Währung rate Typ';ro='Descărcați tipul de curs valutar';ru='Скачать тип валютного курса';tr='Döviz kur tipi yükle'", CodeLanguage));
	// PriceInfo report 
	Strings.Insert("Form_022", NStr("en='1. By item keys';de='1. Nach Artikel Tasten';ro='1. Prin chei element';ru='1. По элементам ключей'", CodeLanguage));
	Strings.Insert("Form_023", NStr("en='2. By properties';de='2. Nach Eigenschaften';ro='2. Prin proprietăți';ru='2. По свойствам'", CodeLanguage));
	Strings.Insert("Form_024", NStr("en='3. By items';de='3. Nach Artikel';ro='3. Prin articole';ru='3. По пунктам'", CodeLanguage));
	#EndRegion
	
	#Region ErrorMessages
	Strings.Insert("Error_001", NStr("en='Unsupported type of barcode';de='Nicht unterstützte Art von barcode';ro='Tipul de cod de bare neacceptat';ru='Неподдерживаемый тип штрих-кода';tr='Desteklenmeyen barkod tipi'", CodeLanguage));
	Strings.Insert("Error_002", NStr("en='%1 descriptions is empty';de='% 1 Beschreibungen sind leer';ro='%1 descrieri este gol';ru='% 1 описания пусты';tr='%1 tanımı boş'", CodeLanguage));
	Strings.Insert("Error_003", NStr("en='Fill any description';de='Füllen Sie eine Beschreibung';ro='Completați orice descriere';ru='Заполните любое описание';tr='Tanım doldurunuz'", CodeLanguage));
	Strings.Insert("Error_004", NStr("en='Not supported metadata'", CodeLanguage));
	Strings.Insert("Error_005", NStr("en='Fill any additional attribute description %1';de='Füllen Sie eine zusätzliche attributbeschreibung %1 aus';ro='Completați orice descriere suplimentară a atributului %1';ru='Заполните любое дополнительное описание атрибута %1';tr='Ek alan tanımı doldurun %1'", CodeLanguage));
	Strings.Insert("Error_006", NStr("en='Recalculate offers';de='Angebote neu berechnen';ro='Recalculați ofertele';ru='Пересчитать предложения';tr='Kapmanya tekrar hesapla'", CodeLanguage));
	Strings.Insert("Error_007", NStr("en='Not enough free balance: [%1][%2], In stock [%3]: free: %4 %5 necessary: %6 %7';de='Nicht genug freie balance: [%1][%2], auf Lager [%3]: kostenlos: %4 %5 notwendig: %6 %7';ro='Nu este suficient echilibru liber: [%1][%2], În stoc [%3]: gratuit: %4 %5 necesar: %6 %7';ru='Недостаточно свободного баланса: [%1][%2], в наличии [%3]: бесплатно: %4% 5 необходимо: %6% 7';tr='Yetersiz stok bakiye: [%1][%2], mevcut stok: [%3], serbest bakiye: [%4] [%5], ihtiyaç duyulan: [%6] [%7]'", CodeLanguage));
	Strings.Insert("Error_008", NStr("en='Groups are created by administrator';de='Gruppen werden vom administrator erstellt';ro='Grupurile sunt create de administrator';ru='Группы создаются администратором';tr='Gruplar sistem yöneticisi tarafından ekleniyor'", CodeLanguage));
	Strings.Insert("Error_009", NStr("en='Can`t write object: [%1]';de='Objekt kann nicht geschrieben werden: [%1]';ro='Nu se poate scrie obiect: [%1]';ru='Не удается написать объект: [%1]';tr='Nesne kaydedilemesi: [%1]'", CodeLanguage));
	Strings.Insert("Error_010", NStr("en='Field: [%1] is empty';de='Feld: [%1] ist leer';ro='Câmp: [%1] este gol';ru='Поле: [%1] пусто';tr='%1 alanı boştur.'", CodeLanguage));
	Strings.Insert("Error_011", NStr("en='Need add any row';de='Müssen jede Zeile hinzufügen';ro='Adăugați adăugați orice rând';ru='Нужно добавить любую строку';tr='Satır eklemek gerekir'", CodeLanguage));
	Strings.Insert("Error_012", NStr("en='Not according rules for naming variable';de='Nicht nach Regeln für die Benennung von Variablen';ro='Nu în conformitate cu regulile pentru denumirea variabilei';ru='Не в соответствии с правилами именования переменных';tr='Değişkenlerin tanımları yapmak için kurrallar belirlenmedi'", CodeLanguage));
	Strings.Insert("Error_013", NStr("en='Value is not unique';de='Wert ist nicht eindeutig';ro='Valoarea nu este unică';ru='Значение не является уникальным';tr='Değer eşsiz değildir'", CodeLanguage));
	Strings.Insert("Error_014", NStr("en='Password and password confirmation do not match';de='Passwort und Passwortbestätigung Stimmen nicht überein';ro='Parola și confirmarea parolei nu se potrivesc';ru='Пароль и подтверждение пароля не совпадают';tr='Şifre ve şifre onayı bir birinden farklıdır'", CodeLanguage));
	Strings.Insert("Error_015", NStr("en='Webclient does not support this feature';de='Webclient unterstützt diese Funktion nicht';ro='Webclient nu acceptă această caracteristică';ru='Webclient не поддерживает эту функцию';tr='Web istemci tarafından bu özellik desteklenmemektedir'", CodeLanguage));
	Strings.Insert("Error_016", NStr("en='Lines on which you need to order items from suppliers are missed in the Sales Order';de='Linien, auf denen Sie Artikel von Lieferanten bestellen müssen, werden im Auftrag vermisst';ro='Linii pe care trebuie să comandați articole de la furnizori sunt pierdute în comanda de vânzări';ru='Строки, по которым необходимо заказать товары у поставщиков, пропущены в заказе на продажу';tr='Tedarikçinde sipariş edilen satırlar müşteri siparişinde bulunamadı'", CodeLanguage));
	Strings.Insert("Error_017", NStr("en='Please, at first create Goods receipt or uncheck the box Goods receipt before Purchase invoice on the tab Other';de='Bitte erstellen Sie zunächst Wareneingang oder deaktivieren Sie das Feld Wareneingang vor Kauf Rechnung auf der Registerkarte Andere';ro='Vă rugăm să creați mai întâi primirea mărfurilor sau debifați caseta Primirea mărfurilor înainte Cumpărați factura în fila Altele';ru='Пожалуйста, сначала создайте товарный чек или снимите флажок товарный чек перед покупкой счета-фактуры на вкладке другое';tr='Lütfen, sevk irsaliye oluşturun veya satın alma faturasının Diğer sekmesinde ""Satın alma fatura öncesi irsaliyeye izin ver"" işareti kaldırınız'", CodeLanguage));
	Strings.Insert("Error_018", NStr("en='Please, at first create Shipment confirmation or uncheck the box Shipment confirmation before Sales invoice on the tab Other';de='Bitte erstellen Sie zunächst Versandbestätigung oder deaktivieren Sie das Feld Versandbestätigung vor dem Verkauf Rechnung auf der Registerkarte Andere';ro='Vă rugăm să creați mai întâi Confirmare expediere sau debifați caseta Confirmare expediere înainte Factură vânzare în fila Altele';ru='Пожалуйста, сначала создайте подтверждение отгрузки или снимите флажок подтверждение отгрузки перед выставлением счета-фактуры на вкладке другое';tr='Lütfen, ilk önce sevk irsaliye oluşturun veya satış faturasının Diğer sekmesinde ""Satış fatura öncesi sevk irsaliye izin ver"" işareti kaldırınız'", CodeLanguage));
	Strings.Insert("Error_019", NStr("en='Lines on which you need to create %1 are missed In the %2.';de='Zeilen, auf denen Sie %1 erstellen müssen, werden in %2 vermisst.';ro='Liniile pe care trebuie să creați %1 sunt ratate În %2.';ru='Строки, на которых нужно создать %1, пропущены в %2.';tr='%1 oluşturmak istediğiniz satırlar %2 da bulunamadı.'", CodeLanguage));
	Strings.Insert("Error_020", NStr("en='Basis document is required on line %1';de='Basisdokument wird in Zeile %1 benötigt';ro='Documentul de bază este necesar pe linia %1';ru='Базовый документ требуется по строке %1';tr='%1 satırda kaynak evrak gerekmektedir'", CodeLanguage));
	Strings.Insert("Error_021", NStr("en='Lines on which you may create return are missed In the Purchase invoice. All products are already returned.';de='Zeilen, auf denen Sie eine Rücksendung erstellen können, werden in der Kaufrechnung vermisst. Alle Produkte sind bereits zurückgegeben.';ro='Liniile pe care puteți crea retur sunt ratate în factura de achiziție. Toate produsele sunt deja returnate.';ru='Строки, по которым вы можете создать возврат, пропущены в счете-фактуре покупки. Все продукты уже возвращены.';tr='İade etmeye çalışılan satırlar satın alma faturasında bulunamadı. Tüm malzemeler daha önce iade edilmişti.'", CodeLanguage));
	Strings.Insert("Error_022", NStr("en='Lines on which you may create return are missed In the Sales invoice. All products are already returned.';de='Zeilen, auf denen Sie eine Rücksendung erstellen können, werden in der Rechnung vermisst. Alle Produkte sind bereits zurückgegeben.';ro='Liniile pe care le puteți crea retur sunt pierdute în factura de vânzări. Toate produsele sunt deja returnate.';ru='Строки, по которым можно создать возврат, пропущены в счете-фактуре продажи. Все продукты уже возвращены.';tr='İade etmeye çalışılan satırlar satış faturasında bulunamadı. Tüm malzemeler daha önce iade edilmişti.'", CodeLanguage));
	Strings.Insert("Error_023", NStr("en='Lines on which you need to order items from suppliers are missed In the Internal supply request';de='Linien, auf denen Sie Artikel von Lieferanten bestellen müssen, werden in der Internen Lieferanfrage vermisst';ro='Linii pe care trebuie să comandați articole de la furnizori sunt pierdute În cererea de aprovizionare internă';ru='Строки, по которым необходимо заказать товары у поставщиков, пропущены во внутреннем запросе на поставку';tr='Sipariş edilen malzemeler iç talep siparişinde mevcut değil'", CodeLanguage));
	Strings.Insert("Error_024", NStr("en='Please, at first create Sales invoice or check the box Shipment confirmation before Sales invoice on the tab Other';de='Bitte erstellen Sie zuerst Verkaufsrechnung oder überprüfen Sie das Feld Versandbestätigung vor Verkaufsrechnung auf der Registerkarte Andere';ro='Vă rugăm, creați mai întâi factura de vânzare sau bifați caseta Confirmarea expedierii înainte de factura de vânzare în fila Altele';ru='Пожалуйста, сначала создайте счет продажи или установите флажок подтверждение отгрузки перед счетом продажи на вкладке другое';tr='Lütfen, ilk önce satış faturasını oluşturun veya ""Diğer"" sekmesinde ""Fatura öncesi irsaliyeye izin ver"" kutucuğu işaretleyiniz'", CodeLanguage));
	Strings.Insert("Error_028", NStr("en='Please, check the box Goods receipt before Purchase invoice on the tab ""Other""'", CodeLanguage));
	Strings.Insert("Error_029", NStr("en='Please, at first create Purchase invoice or check the box Goods receipt before Purchase invoice on the tab Other';de='Bitte erstellen Sie zunächst Kaufrechnung oder überprüfen Sie die box Wareneingang vor Kauf Rechnung auf der Registerkarte Andere';ro='Vă rugăm, creați mai întâi Factură de cumpărare sau bifați caseta Primirea mărfurilor înainte Factură de cumpărare în fila Altele';ru='Пожалуйста, сначала создайте счет-фактуру покупки или установите флажок товарная квитанция перед покупкой счета-фактуры на вкладке другое';tr='Lütfen, ilk önce satın alma faturasını oluşturun veya ""Diğer"" sekmesinde ""Fatura öncesi irsaliyeye izin ver"" kutucuğu işaretleyiniz'", CodeLanguage));
	Strings.Insert("Error_030", NStr("en='The %1 is required on line %2 of the %3';de='%1 wird in Zeile %2 des %3 benötigt';ro='Procentul %1 este necesar pe linia %2 din procentul %3';ru='%1 требуется в строке %2 из %3';tr='%3 satırdan %2 satıra %1 ihtiyacı var'", CodeLanguage));
	Strings.Insert("Error_031", NStr("en='Items were not received from supplier according to procurement method.';de='Artikel wurden nicht vom Lieferanten nach beschaffungsmethode empfangen.';ro='Articolele nu au fost primite de la furnizor conform metodei de achiziție.';ru='Товары не были получены от поставщика в соответствии с методом закупок.';tr='Seçilen tedarik şekline uygun olarak tedarikçiden malzeme daha stokta bulunamamaktadır.'", CodeLanguage));
	Strings.Insert("Error_032", NStr("en='Action not completed';de='Aktion nicht abgeschlossen';ro='Acțiunea nefinalizată';ru='Действие не завершено'", CodeLanguage));
	Strings.Insert("Error_033", NStr("en='Duplicated attribute'", CodeLanguage));
	Strings.Insert("Error_034", NStr("en='%1 is not picture storage volume';de='%1 ist nicht Bild-Speicher-volume';ro='%1 nu este volumul de stocare a imaginii';ru='%1-это не объем хранения изображений'", CodeLanguage));
	Strings.Insert("Error_035", NStr("en='Cannot upload more than 1 file';de='Kann nicht mehr als 1 Datei hochladen';ro='Nu se poate încărca mai mult de 1 fișier';ru='Невозможно загрузить более 1 файла'", CodeLanguage));
	Strings.Insert("Error_036", NStr("en='Not found row by index In Files table';de='Nicht gefunden Zeile für index in Dateien Tabelle';ro='Nu a fost găsit rând de index În tabelul Fișiere';ru='Не найдено строка по индексу в таблице файлы'", CodeLanguage));
	Strings.Insert("Error_037", NStr("en='Unsupported data composition comparison type';de='Nicht unterstützte datenzusammensetzung vergleichstyp';ro='Tip de comparație a compoziției datelor neacceptate';ru='Неподдерживаемый тип сравнения состава данных'", CodeLanguage));	
	Strings.Insert("Error_038", NStr("en='Thread have status [%1] but In register ThreadInfo set status [%2] Error info : [%3]';de='Thread hat status [%1] , aber im register ThreadInfo set status [%2] Fehlerinfo : [%3]';ro='Thread are stare [%1] dar În registrul ThreadInfo setați starea [%2] Informații despre eroare: [%3]';ru='Поток имеет статус [%1], но в регистре ThreadInfo установлен статус [%2] Информация об ошибке : [%3]'", CodeLanguage));
	Strings.Insert("Error_039", NStr("en='Job not found';de='Job nicht gefunden';ro='Loc de muncă nu a fost găsit';ru='Работа не найдена';tr='Zamanlanan görev bulunamadı'", CodeLanguage));
	Strings.Insert("Error_040", NStr("en='Support picture files only';de='Unterstützung Bild-Dateien nur';ro='Suportă numai fișiere imagine';ru='Поддержка только файлов изображений'", CodeLanguage));
	Strings.Insert("Error_041", NStr("en='Tax table content more 1 row [key: %1] [tax: %2]';de='Steuertabelle Inhalt mehr 1 Zeile [Schlüssel: %1] [Steuer: %2]';ro='Conținutul taxei de masă mai mult 1 rând [cheie: %1] [taxă: %2]';ru='Содержание налоговой таблицы больше 1 строки [ключ: %1] [налог: %2]'", CodeLanguage));
	Strings.Insert("Error_042", NStr("en='Cannot find tax by column name: %1';de='Steuer nicht nach Spaltennamen finden: %1';ro='Nu se poate găsi taxa după numele coloanei: %1';ru='Не удается найти налог по имени столбца: %1'", CodeLanguage));
	Strings.Insert("Error_043", NStr("en='Unsupported document type';de='Nicht unterstützter Dokumenttyp';ro='Tip de document neacceptat';ru='Неподдерживаемый тип документа'", CodeLanguage));
	Strings.Insert("Error_044", NStr("en='Not supported operation';de='Nicht unterstützte operation';ro='Operație neacceptată';ru='Не поддерживается операция'", CodeLanguage));
	Strings.Insert("Error_045", NStr("en='Document is empty';de='Dokument ist leer';ro='Documentul este gol';ru='Документ пуст'", CodeLanguage));
	Strings.Insert("Error_046", NStr("en='An error occurred while connecting external barcode printing component.';de='Beim verbinden der externen barcode-druckkomponente ist ein Fehler aufgetreten.';ro='A apărut o eroare la conectarea componentei de imprimare de coduri de bare externe.';ru='Произошла ошибка при подключении внешнего компонента печати штрих-кодов.';tr='Barkod yazdırma dış bileşeni bağlama hatası'", CodeLanguage));
	Strings.Insert("Error_047", NStr("en='%1 is a required field';de='%1 ist ein Pflichtfeld';ro='%1 este un câmp obligatoriu';ru='%1-Обязательное поле';tr='%1 zorunlu alandır'", CodeLanguage));
	Strings.Insert("Error_048", NStr("en='Select at least one %1 from %2';de='Wählen Sie mindestens ein %1 aus %2';ro='Selectați cel puțin un %1 din %2';ru='Выберите хотя бы один %1 из %2';tr='%2 den en az bir %1 tane seçiniz'", CodeLanguage));
	Strings.Insert("Error_049", NStr("en='Default picture storage volume not set';de='Standard Bild Speichervolumen nicht eingestellt';ro='Volumul de stocare implicit al imaginii nu este setat';ru='Объем хранения изображений по умолчанию не установлен';tr='Varsayılan resim depolama hacmi belirtilmemiş.'", CodeLanguage));
	Strings.Insert("Error_050", NStr("en='Currency exchange is possible only through accounts with the same type (cash account or bank account).';de='Wechselstube ist nur über Konten mit dem gleichen Typ (barkonto oder Bankkonto) möglich.';ro='Schimbul valutar este posibil numai prin conturi cu același tip (cont de numerar sau cont bancar).';ru='Обмен валюты возможен только через счета одного типа (кассовый счет или банковский счет).';tr='Döviz bozdurma sadece bankalar veya sadece kasalar arası mümkün.'", CodeLanguage));
	Strings.Insert("Error_051", NStr("en='Lines on which you may create %1 are missed. Or all %1 are already created.';de='Zeilen, auf denen Sie %1 erstellen können, werden vermisst. Oder alle %1 sind bereits erstellt.';ro='Liniile pe care puteți crea %1 sunt ratate. Sau toate %1 sunt deja create.';ru='Строки, на которых вы можете создать %1, пропущены. Или все %1 уже созданы.';tr='%1 oluşturabildiğiniz satırlar bulunamadı. Veya tüm %1 daha önce oluşturulmuştu.'", CodeLanguage));
	Strings.Insert("Error_052", NStr("en='Unchecking ""Use shipment confirmation"" isn`t possible. Shipment confirmations from store %1 have already been created previously.'", CodeLanguage));
	Strings.Insert("Error_053", NStr("en='Unchecking ""Use goods receipt"" isn`t possible. Goods receipts from store %1 have already been created previously.'", CodeLanguage));
	Strings.Insert("Error_054", NStr("en='Not properly status of sales order to proceed.';de='Nicht richtig status des Verkaufs um fortzufahren.';ro='Nu starea corectă a ordinului de vânzare pentru a continua.';ru='Не правильно состояние заказа на продажу, чтобы продолжить работу.';tr='Devam etmek için satış sipariş durumu uygun değil.'", CodeLanguage));
	Strings.Insert("Error_055", NStr("en='No lines with properly procurement method.';de='Keine Linien mit ordnungsgemäßer beschaffungsmethode.';ro='Nu există linii cu metoda de achiziție în mod corespunzător.';ru='Нет линий с правильным методом закупок.';tr='Uygun tedarik şekli satırlar bulunamadı.'", CodeLanguage));
	Strings.Insert("Error_056", NStr("en='All items in sales order are already ordered by purchase order(s).';de='Alle Artikel im Auftrag sind bereits per Bestellung bestellt.';ro='Toate articolele din comanda de vânzare sunt deja comandate prin comanda de cumpărare (e).';ru='Все товары в заказе на продажу уже заказаны по заказам на покупку.';tr='Satış siparişindeki tüm malzemeler tedarikçi sipariş(ler) ile tamamlanmış durumdandır.'", CodeLanguage));
	Strings.Insert("Error_057", NStr("en='Don`t need to create a %1 for selected Cash transfer order(s).';de='Für ausgewählte Überweisungsaufträge muss kein %1 erstellt werden.';ro='Nu este nevoie să creați un %1 pentru ordinele de transfer de numerar selectate.';ru='Не нужно создавать %1 для выбранных заказов на перевод наличных денег.';tr='%1 seçilen finansal transfer siparişi istinaden oluşturmaya gerek yok.'", CodeLanguage));
	Strings.Insert("Error_058", NStr("en='Whole amount in Cash transfer order(s) are already payed by document %1(s).';de='Der Gesamtbetrag der Barüberweisung wird bereits per Dokument %1(s) ausgezahlt.';ro='Suma totală în ordinul (ordinele) de transfer în numerar este deja plătită prin documentul %1(s).';ru='Вся сумма в кассовом ордере(ордерах) уже оплачена документом %1(ы).';tr='Finansal transfer siparişin çıkış tutarın tamamı %1 evraklar ile kapatılmıştı.'", CodeLanguage));
	Strings.Insert("Error_059", NStr("en='In the selected documents there are Cash transfer order(s) by which %1(s) has already been created and those for which %1 doesn`t need to be created.';de='In den ausgewählten Dokumenten gibt es Bargeldtransferaufträge, mit denen %1(s) bereits erstellt wurde und für die %1 nicht erstellt werden muss.';ro='În documentele selectate există ordine de transfer în numerar prin care %1(s) a fost deja creat(e) și cele pentru care %1 nu trebuie să fie creat(e).';ru='В выбранных документах есть кассовые ордера, по которым уже создан %1(Ы), и те, для которых %1 не нужно создавать.';tr='Seçilen finansal transfer sipariş(ler) istinaden %1 daha önce oluşturuldu veya %1 oluşturmaya gerek olmayanlar mevcut.'", CodeLanguage));
	Strings.Insert("Error_060", NStr("en='Whole amount in Cash transfer order(s) are already received by document %1(s).'", CodeLanguage));
	Strings.Insert("Error_061", NStr("en='Not possible to change box ""Shipment confirmation before sales invoice"" because for this Sales order already have been created %1(s).'", CodeLanguage));
	Strings.Insert("Error_062", NStr("en='There is no need to create shipment confirmation for the store(s) %1.';de='Es besteht keine Notwendigkeit, Versandbestätigung für den laden(s) %1 zu erstellen.';ro='Nu este nevoie să creați confirmarea expedierii pentru magazinul (magazinele) %1.';ru='Нет необходимости создавать подтверждение отгрузки для магазина(ов) %1.';tr='%1 depo(lar) için sevk irsaliyesi oluşturmaya gerek yok.'", CodeLanguage));
	Strings.Insert("Error_063", NStr("en='There is not possible to post Sales order for the store(s) %1.';de='Es ist nicht möglich, eine Bestellung für den / die laden(s) %1 zu buchen.';ro='Nu este posibilă postarea comenzii de vânzare pentru magazinul (magazinele) %1.';ru='Невозможно разместить заказ на продажу для магазина(ов) %1.';tr='%1 depo(lar) için satış siparişi kaydedilemez.'", CodeLanguage));
	Strings.Insert("Error_064", NStr("en='There is no need to create Shipment confirmation for store(s) %1. Item will be shipped by Sales order';de='Es besteht keine Notwendigkeit, Versandbestätigung für Shop(s) %1 zu erstellen. Artikel wird durch Auftrag versendet';ro='Nu este nevoie să creați confirmarea expedierii pentru magazinul (magazinele) %1. Postul va fi expediat prin comandă de vânzări';ru='Нет необходимости создавать подтверждение отгрузки для магазина(ов) %1. Товар будет отправлен по заказу на продажу';tr='%1 depo(lar) için sevk irsaliyesi oluşturmaya gerek yok. Malzemeler satış siparişi tarafından sevk edilecektir.'", CodeLanguage));
	Strings.Insert("Error_065", NStr("en='Item key is not unique';de='Elementschlüssel ist nicht eindeutig';ro='Element cheie nu este unic';ru='Ключ элемента не является уникальным';tr='Varyant eşsiz değildir'", CodeLanguage));
	Strings.Insert("Error_066", NStr("en='Specification is not unique';de='Spezifikation ist nicht einzigartig';ro='Caietul de sarcini nu este unic';ru='Спецификация не является уникальным';tr='Reçete eşsiz değildir'", CodeLanguage));
	Strings.Insert("Error_067", NStr("en='Not properly status of %1 to proceed.';de='Der Status von %1 wird nicht korrekt angezeigt.';ro='Nu este corect starea %1 pentru a continua.';ru='Не совсем корректно состояние %1 для продолжения работы.';tr='Devam etmek için geçersiz %1 statüsü.'", CodeLanguage));	
	Strings.Insert("Error_068", NStr("en='Line No. [%1] [%2 %3] %4 remains: %5 %8 Required: %6 %8 Lacks: %7 %8';de='Linie Nr. [%1] [%2 %3] %4 bleibt: %5 %8 Erforderlich: %6 %8 Fehlt: %7 %8';ro='Linia nr. [%1] [%2 %3] %4 rămâne: %5 %8 Necesar: %6 %8 Lipsă: %7 %8';ru='Линия Нет. [%1] [%2 %3] %4 осталось: %5% 8 требуется: %6% 8 не хватает: %7 %8';tr='Satır no [%1] [%2 %3] %4 Kalan: %5 %8 Gereken: %6 %8 Eksik: %7 %8'", CodeLanguage));
	Strings.Insert("Error_071", NStr("en='External data processor ""%1"" was not connected';de='Externer Datenprozessor ""%1"" wurde nicht angeschlossen';ro='Procesorul de date extern ""%1"" nu a fost conectat';ru='Внешний процессор обработки данных ""%1"" не был подключен';tr='""%1"" dış veri işlemci bağlanamadı'", CodeLanguage));
	Strings.Insert("Error_072", NStr("en='Store is required on line %1';de='Speicher wird auf Linie %1 benötigt';ro='Magazinul este necesar pe linia %1';ru='Магазин требуется на линии %1';tr='%1 satırda depo bilgisi eksik'", CodeLanguage));
	Strings.Insert("Error_073", NStr("en='All items in %1(s) are already received by %2(s).';de='Alle Elemente in %1(s) werden bereits von %2 (s) empfangen.';ro='Toate elementele din %1(s) sunt deja primite cu %2(s).';ru='Все элементы в %1(s) уже получены %2(s).';tr='%1 deki tüm malzemeler %2 tarafından stoka alınmıştı.'", CodeLanguage));
	Strings.Insert("Error_074", NStr("en='Currency transfer is possible only when amounts is equal.';de='Eine überweisung ist nur möglich, wenn die Beträge gleich sind.';ro='Transferul valutar este posibil numai atunci când sumele sunt egale.';ru='Перевод валюты возможен только при равенстве сумм.';tr='Döviz transferi sadece tutar eşit olduğunda mümkündür'", CodeLanguage));
	Strings.Insert("Error_075", NStr("en='Not yet all Physical count by location is closed';de='Noch nicht alle Physischen Zählung nach Standort geschlossen';ro='Încă nu toate numărul fizic de locație este închis';ru='Еще не все физические подсчеты по местоположению закрыты';tr='Tüm lokasyon bazlı sayım fişler daha kapanmadı'", CodeLanguage));
	#EndRegion
	
	#Region InfoMessages
	Strings.Insert("InfoMessage_001", NStr("en='%1 is not the same as the %2 will be due to the fact that there is already another %1 that partially closed this %2';de='%1 ist nicht dasselbe wie %2, da es bereits ein anderes %1 gibt, das dieses %2 teilweise geschlossen hat';ro='%1 nu este același lucru cu %2 se va datora faptului că există deja un alt %1 care a închis parțial acest %2';ru='%1 не то же самое, что %2 будет из-за того, что уже есть другой %1, который частично закрыл этот %2';tr='%1 %2 ya göre farklıdır, çünkü %2 yi kapatan başka bir %1 mevcut'", CodeLanguage));
	Strings.Insert("InfoMessage_002", NStr("en='Object %1 created';de='Das Objekt %1 erstellt';ro='Obiectul %1 creat';ru='Объект %1 создан';tr='%1 nesne oluşturuldu'", CodeLanguage));
	Strings.Insert("InfoMessage_003", NStr("en='This is the service form.';de='Dies ist das service-Formular.';ro='Acesta este formularul de serviciu.';ru='Это форма обслуживания.';tr='Bu teknik formudur.'", CodeLanguage));
	Strings.Insert("InfoMessage_004", NStr("en='Save object before continue';de='Objekt vor weiter speichern';ro='Salvați obiectul înainte de a continua';ru='Сохраните объект перед продолжением';tr='Devam etmeden önce nesneyi kaydedin'", CodeLanguage));
	Strings.Insert("InfoMessage_005", NStr("en='Done';de='Erfolgen';ro='Gata.';ru='Сделано';tr='Tamamlandı'", CodeLanguage));
	Strings.Insert("InfoMessage_006", NStr("en='Document Physical count by location already created, use update';de='Dokument Physikalische Zählung nach Ort bereits erstellt, verwenden update';ro='Document conta fizic de locație deja creat, utilizați actualizare';ru='Физическое количество документов по местоположению уже создано, используйте обновление';tr='Lokasyon bazlı sayım fişi mevcut, güncelleme seçeneği kullanın'", CodeLanguage));
	Strings.Insert("InfoMessage_007", NStr("en='#%1 date: %2';de='#%1 Datum: %2';ro='#%1 data: %2';ru='#%1 Дата: %2';tr='#%1 tarih: %2'", CodeLanguage));
	#EndRegion
	
	#Region QuestionToUser
	Strings.Insert("QuestionToUser_001", NStr("en='The object is not saved, you must write to continue. Continue?';de='Das Objekt wird nicht gespeichert, Sie müssen schreiben, um fortzufahren. Weiter?';ro='Obiectul nu este salvat, trebuie să scrieți pentru a continua. Să continuăm?';ru='Объект не сохраняется, вы должны написать, чтобы продолжить. Продолжать?';tr='Nesne kaydedilmedi, devam etmeden önce kaydetmek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_002", NStr("en='Would you like to switch to scan mode?';de='Möchten Sie in den scan-Modus wechseln?';ro='Doriți să comutați la modul de scanare?';ru='Хотите перейти в режим сканирования?';tr='Tarama biçime geçmek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_003", NStr("en='Filled data on cheque bonds transactions will be deleted. Do you want to update %1?';de='Ausgefüllte Daten über scheckanleihetransaktionen werden gelöscht. Möchten Sie %1 aktualisieren?';ro='Datele completate privind tranzacțiile cu obligațiuni de cec vor fi șterse. Doriți să actualizați %1?';ru='Заполненные данные по операциям с чековыми облигациями будут удалены. Вы хотите обновить %1?';tr='Doldurulmuş çek/senet bilgiler temizlenecek. %1 güncellemek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_004", NStr("en='Change tax rates according agreement?';de='Steuersätze nach Vereinbarung ändern?';ro='Modificarea ratelor de impozitare conform acordului?';ru='Изменить налоговые ставки в соответствии с соглашением?';tr='Vergi oranları sözleşmeye göre değiştirmek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_005", NStr("en='Do you want to update filled stores?';de='Möchten Sie gefüllte Geschäfte aktualisieren?';ro='Doriți să actualizați magazinele umplute?';ru='Вы хотите обновить заполненные магазины?';tr='Tüm depoları güncellemek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_006", NStr("en='Do you want to update filled Currency?';de='Möchten Sie gefüllte Währung aktualisieren?';ro='Doriți să actualizați completat Moneda?';ru='Вы хотите обновить заполненную валюту?';tr='Mevcut dövizi değiştirmek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_007", NStr("en='Transaction table will be cleared. Continue?';de='Transaktionstabelle wird gelöscht. Weiter?';ro='Tabelul de tranzacții va fi șters. Să continuăm?';ru='Таблица транзакций будет очищена. Продолжать?';tr='İşlemler tablosu temizlenecek. Devam etmek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_008", NStr("en='When the currency is changed, rows with cash transfer documents will be cleared. Continue?';de='Wenn die Währung geändert wird, werden Zeilen mit bargeldüberweisungsdokumenten gelöscht. Weiter?';ro='Când se schimbă moneda, rândurile cu documente de transfer de numerar vor fi șterse. Să continuăm?';ru='При изменении валюты строки с документами по переводу наличных будут очищены. Продолжать?'", CodeLanguage));
	Strings.Insert("QuestionToUser_009", NStr("en='Update filled stores on %1';de='Gefüllte Speicher auf %1 aktualisieren';ro='Actualizați magazinele completate pe %1';ru='Обновление заполненных магазинов на %1';tr='Dolu depolar %1 ile güncellendi'", CodeLanguage));
	Strings.Insert("QuestionToUser_011", NStr("en='Update filled price types on %1';de='Gefüllte preistypen auf %1 aktualisieren';ro='Actualizați tipurile de preț completate pe %1';ru='Обновить заполненные типы цен на %1';tr='Dolu fiyat tipler %1 ile güncellendi'", CodeLanguage));
	Strings.Insert("QuestionToUser_012", NStr("en='Do you want to exit?';de='Willst du aussteigen?';ro='Vrei să ieşi?';ru='Вы хотите выйти из игры?';tr='Çıkmak istediğinizden emin misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_013", NStr("en='Update filled prices.';de='Update gefüllte Preise.';ro='Actualizați prețurile umplute.';ru='Обновление заполненных цен.';tr='Dolu fiyatlar güncelleme.'", CodeLanguage));
	Strings.Insert("QuestionToUser_014", NStr("en='Transaction type changed. Do you want to update filled data?';de='Transaktionstyp geändert. Möchten Sie gefüllte Daten aktualisieren?';ro='Tipul de tranzacție schimbat. Doriți să actualizați datele completate?';ru='Изменился тип транзакции. Вы хотите обновить заполненные данные?';tr='Hareket tipi değiştirildi. Doldurulmuş veriyi güncellemek ister misiniz?'", CodeLanguage));
	Strings.Insert("QuestionToUser_015", NStr("en='Filled data will be cleared. Proceed?';de='Gefüllte Daten werden gelöscht. Weitermachen?';ro='Datele completate vor fi șterse. Să începem?';ru='Заполненные данные будут очищены. Продолжать?';tr='Mevcut veri temizlenecek. Devam edilsin mi?'", CodeLanguage));
	Strings.Insert("QuestionToUser_016", NStr("en='Change or clear icon?';de='Symbol ändern oder löschen?';ro='Schimbați sau ștergeți pictograma?';ru='Изменить или очистить значок?';tr='Simge değiştirmek veya temizlemek ister misiniz?'", CodeLanguage));
	#EndRegion
	
	#Region SuggestionToUser
	Strings.Insert("SuggestionToUser_1", NStr("en='Choice value';de='Wahl Wert';ro='Alegerea valorii';ru='Значение выбора';tr='Seçim değeri'", CodeLanguage));
	Strings.Insert("SuggestionToUser_2", NStr("en='Enter barcode';de='Geben Sie barcode';ro='Introduceți codul de bare';ru='Введите штрих-код';tr='Barkod giriniz'", CodeLanguage));
	Strings.Insert("SuggestionToUser_3", NStr("en='Input option name'", CodeLanguage));
	Strings.Insert("SuggestionToUser_4", NStr("en='Input new option name'", CodeLanguage));
	#EndRegion
	
	#Region UsersEvent
	Strings.Insert("UsersEvent_001", NStr("en='User not found by UUID: %1 Name: %2';de='Benutzer nicht gefunden von UUID: %1 Name: %2';ro='Utilizatorul nu a fost găsit de UUID: %1 Nume: %2';ru='Пользователь не найден по UUID: %1 Имя: %2';tr='UUID ye göre bulunamayan kullanıcı: %1 Tanımı: %2'", CodeLanguage));
	Strings.Insert("UsersEvent_002", NStr("en='User found by UUID: %1 Name: %2';de='Benutzer gefunden von UUID: %1 Name: %2';ro='Utilizator utilizat de UUID: %1 Nume: %2';ru='Пользователь найден по UUID: %1 Имя: %2';tr='UUID ye göre bulunan kullanıcı: %1 Tanımı: %2'", CodeLanguage));
	#EndRegion
	
	#Region Items
	
	// Interface
	Strings.Insert("I_1", NStr("en='Enter Description';de='Beschreibung Eingeben';ro='Introduceți Descriere';ru='Введите Описание';tr='Tanım ekleyiniz'", CodeLanguage));
	
	Strings.Insert("I_2", NStr("en='Click for input description';de='Klicken Sie für Eingabe Beschreibung';ro='Faceți clic pe descrierea de intrare';ru='Нажмите для ввода описания';tr='Açıklama tanımlamak için tıklayınız'", CodeLanguage));
	
	Strings.Insert("I_3", NStr("en='Please, fill the document';de='Bitte füllen Sie das Dokument aus';ro='Vă rugăm să completați documentul';ru='Пожалуйста, заполните этот документ';tr='Lütfen, evrakı doldurun'", CodeLanguage));
	
	#EndRegion
	
	#Region Exceptions
	Strings.Insert("Exc_001", NStr("en='Not supported object type';de='Nicht unterstützter Objekttyp';ro='Nu este acceptat tipul de obiect';ru='Не поддерживается тип объекта';tr='Desteklenmeyen obje tipi'", CodeLanguage));
	Strings.Insert("Exc_002", NStr("en='Not condition';de='Nicht Bedingung';ro='Nu condiție';ru='Не состояние';tr='Koşul değil'", CodeLanguage));
	Strings.Insert("Exc_003", NStr("en='Not implemented method: %1';de='Nicht implementierte Methode: %1';ro='Metoda implementată: %1';ru='Не реализованный метод: %1';tr='Uygulanmayan metod: %1'", CodeLanguage));
	Strings.Insert("Exc_004", NStr("en='Can not extract Currency from object';de='Kann keine Währung aus Objekt extrahieren';ro='Nu se poate extrage moneda din obiect';ru='Не удается извлечь валюту из объекта';tr='Nesneden döviz alınamadı'", CodeLanguage));
	Strings.Insert("Exc_005", NStr("en='Library name is empty';de='Bibliotheksname ist leer';ro='Numele bibliotecii este gol';ru='Название Библиотека пуста';tr='Kütüphane ismi boş'", CodeLanguage));
	Strings.Insert("Exc_006", NStr("en='Library data not contain version';de='Bibliotheksdaten enthalten keine version';ro='Biblioteca datelor nu conține versiunea';ru='Данные библиотеки не содержат версию';tr='Kütüphane verisi sürüm içermiyor'", CodeLanguage));
	Strings.Insert("Exc_007", NStr("en='Not implemented for library version: %1';de='Nicht für Bibliotheksversion implementiert: %1';ro='Nu este implementat pentru versiunea de bibliotecă: %1';ru='Не реализовано для версии библиотеки: %1';tr='%1 kütüphane sürümü için uygulanmadı'", CodeLanguage));
	Strings.Insert("Exc_008", NStr("en='Unknown row key';de='Unbekannte Zeile Schlüssel';ro='Tasta rând necunoscut';ru='Неизвестный ключ строки';tr='Bilinmeyen satır anahtarı'", CodeLanguage));
	Strings.Insert("Exc_009", NStr("en='Error: %1';de='Fehler: %1';ro='Eroare: %1';ru='Ошибка: %1';tr='Hata: %1'", CodeLanguage));
	#EndRegion
	
	#Region Saas
	Strings.Insert("Saas_001", NStr("en='Area %1 not found!';de='Bereich %1 nicht gefunden!!!';ro='Zona %1 nu a fost găsită!';ru='Область %1 не найдена!';tr='%1 bölümü bulunamadı'", CodeLanguage));
	Strings.Insert("Saas_002", NStr("en='Area status: %1';de='Status der Fläche: %1';ro='Starea zonei: %1';ru='Статус области: %1';tr='Bölüm statüsü: %1'", CodeLanguage));
	Strings.Insert("Saas_003", NStr("en='Company localization %1 is not available';de='Unternehmen Lokalisierung von %1 ist nicht verfügbar';ro='Localizarea companiei %1 nu este disponibilă';ru='Локализация компании %1 недоступна';tr='Şirket %1 lokalizasyonu ulaşılamıyor'", CodeLanguage));
	#EndRegion
	
	#Region FillingFromClassifiers
    // Do not modify "en" strings
    Strings.Insert("Class_001", NStr("en='Purchase price';de='Kaufpreis';ro='Prețul de achiziție';ru='Покупная цена';tr='Alım fiyatı'", CodeLanguage));
    Strings.Insert("Class_002", NStr("en='Sales price';de='Verkaufspreis';ro='Prețul de vânzare';ru='Продажная стоимость';tr='Satış fiyatı'", CodeLanguage));
    Strings.Insert("Class_003", NStr("en='Prime cost';de='Prime Kosten';ro='Costul primar';ru='Себестоимость';tr='Birim maliyet fiyatı'", CodeLanguage));
    Strings.Insert("Class_004", NStr("en='Service';de='Service';ro='Servicii';ru='Услуга';tr='Hizmet'", CodeLanguage));
    Strings.Insert("Class_005", NStr("en='Product';de='Produkt';ro='Produs';ru='Продукт';tr='Malzeme'", CodeLanguage));
    Strings.Insert("Class_006", NStr("en='Main store';de='Hauptgeschäft';ro='magazinul principal';ru='Главный магазин';tr='Ana depo'", CodeLanguage));
    Strings.Insert("Class_007", NStr("en='Main manager';de='Main-manager';ro='Managerul principal';ru='Главный менеджер';tr='Ana sorumlu'", CodeLanguage));
    Strings.Insert("Class_008", NStr("en='pcs';de='PC';ro='buc';ru='штук';tr='adet'", CodeLanguage));
    #EndRegion
    
    #Region PredefinedObjectDescriptions
	PredefinedDescriptions(Strings, CodeLanguage);
	#EndRegion
    
	#Region Titles
	Strings.Insert("Title_00100", NStr("en='Select basis documents in Cheque bond transaction';de='Wählen Sie Basisdokumente im Scheckbriefgeschäft aus';ro='Selectați documentele de bază în tranzacția de obligațiuni de verificare';ru='Выбор базовых документов в проводке чековых облигаций';tr='Çek/senet bordrosunda kaynak evrak seç'", CodeLanguage));	// Form PickUpDocuments
	
	#EndRegion
	
	#Region ChoiceListValues
	Strings.Insert("CLV_1", NStr("en='All';de='Aller';ro='Toate';ru='Все';tr='Tümü'", CodeLanguage));
	#EndRegion
	
	Return Strings;
EndFunction


Procedure PredefinedDescriptions(Strings, CodeLanguage)

	Strings.Insert("Description_A001", NStr("en='Catalog Agreements';de='Katalog Vereinbarungen';ro='Acorduri de catalog';ru='Соглашения По Каталогу';tr='K Sözleşmeler'", CodeLanguage));
	Strings.Insert("Description_A003", NStr("en='Catalog Business units';de='Katalog Business units';ro='Catalog Unități de afaceri';ru='Каталог бизнес единиц';tr='K Departmanlar'", CodeLanguage));
	Strings.Insert("Description_A004", NStr("en='Catalog Cash accounts';de='Katalog Cash-Konten';ro='Catalog Conturi numerar';ru='Каталог кассовых счетов';tr='K Kasa/Banka'", CodeLanguage));
	Strings.Insert("Description_A005", NStr("en='Catalog Cheque bonds';de='Katalog Scheck Anleihen';ro='Catalog obligațiuni de cec';ru='Каталог чековых облигаций';tr='K Çek/Senetler'", CodeLanguage));
	Strings.Insert("Description_A006", NStr("en='Catalog Companies';de='Katalog Unternehmen';ro='Companii de catalog';ru='Каталог Компаний';tr='K Şirketler'", CodeLanguage));
	Strings.Insert("Description_A007", NStr("en='Catalog Company types';de='Katalog Unternehmen Typen';ro='Catalog Tipuri de companii';ru='Каталог типов компаний';tr='K Şirket tipleri'", CodeLanguage));
	Strings.Insert("Description_A008", NStr("en='Catalog Countries';de='Katalog Länder';ro='Catalog de țări';ru='Каталог Стран';tr='K Ülkeler'", CodeLanguage));
	Strings.Insert("Description_A009", NStr("en='Catalog Currencies';de='Katalog Währungen';ro='Catalog valute';ru='Валюты Каталога';tr='K Dövizler'", CodeLanguage));
	Strings.Insert("Description_A010", NStr("en='Catalog Expense and revenue types';de='Katalogkosten und umsatzarten';ro='Catalog Tipuri de cheltuieli și venituri';ru='Каталог видов расходов и доходов';tr='K Gider ve gelir tipleri'", CodeLanguage));
	Strings.Insert("Description_A011", NStr("en='Catalog Item keys';de='Katalog-Element-Tasten';ro='Catalog chei articol';ru='Ключи элементов каталога';tr='K Varyantlar'", CodeLanguage));
	Strings.Insert("Description_A012", NStr("en='Catalog Items';de='Katalogeinträge';ro='Articole de catalog';ru='элемент каталога';tr='K Malzemeler'", CodeLanguage));
	Strings.Insert("Description_A013", NStr("en='Catalog Item types';de='Katalog Elementtypen';ro='Catalog Tipuri de articole';ru='Типы элементов каталога';tr='K Malzeme tipleri'", CodeLanguage));
	Strings.Insert("Description_A014", NStr("en='Catalog Partners';de='Katalog Partner';ro='Catalog Parteneri';ru='Каталог Партнеров';tr='K Cari hesaplar'", CodeLanguage));
	Strings.Insert("Description_A015", NStr("en='Catalog Price keys';de='Katalog Preis Schlüssel';ro='Catalog Chei de preț';ru='Ключи Каталог цен ';tr='K Fiyat anahtarları'", CodeLanguage));
	Strings.Insert("Description_A016", NStr("en='Catalog Price types';de='Katalog Preistypen';ro='Catalog Tipuri de prețuri';ru='Типы цен в каталоге';tr='K Fiyat tipleri'", CodeLanguage));
	Strings.Insert("Description_A017", NStr("en='Catalog Serial lot numbers';de='Katalog Serielle Losnummern';ro='Catalog Numere de loturi seriale';ru='Каталог серийных номеров партий';tr='K Seri lot numaraları'", CodeLanguage));
	Strings.Insert("Description_A018", NStr("en='Catalog Specifications';de='Katalog-Spezifikationen';ro='Specificații catalog';ru='Технические Характеристики Каталога';tr='K Reçeteler'", CodeLanguage));
	Strings.Insert("Description_A019", NStr("en='Catalog Stores';de='Katalog Speichert';ro='Magazine de catalog';ru='Каталог Магазинов';tr='K Depolar'", CodeLanguage));
	Strings.Insert("Description_A020", NStr("en='Catalog Taxes';de='Katalog Steuern';ro='Taxe de catalog';ru='Каталог Налогов';tr='K Vergiler'", CodeLanguage));
	Strings.Insert("Description_A021", NStr("en='Catalog Units';de='Katalog-Einheiten';ro='Unități de catalog';ru='Единицы Измерения Каталога';tr='K Birimler'", CodeLanguage));
	Strings.Insert("Description_A022", NStr("en='Catalog Users';de='Katalog-Benutzer';ro='Catalog Utilizatori';ru='Пользователи Каталога';tr='K Kullanıcılar'", CodeLanguage));
	Strings.Insert("Description_A023", NStr("en='Document Bank payment';de='Dokument-Bank-Zahlung';ro='Plata băncii de documente';ru='Документ банковский платеж';tr='D Banka ödeme fişi'", CodeLanguage));
	Strings.Insert("Description_A024", NStr("en='Document Bank receipt';de='Beleg bankbeleg';ro='Primirea băncii de documente';ru='Документ банковская квитанция';tr='D Banka tahsilat fişi'", CodeLanguage));
	Strings.Insert("Description_A025", NStr("en='Document Bundling';de='Bündelung Von Dokumenten';ro='Gruparea documentelor';ru='Пакетирование Документов';tr='D Takım oluşturma fişi'", CodeLanguage));
	Strings.Insert("Description_A026", NStr("en='Document Cash expense';de='Dokument Bargeld Kosten';ro='Cheltuieli cu numerarul documentelor';ru='Документ кассовые расходы';tr='D Nakit gider fişi'", CodeLanguage));
	Strings.Insert("Description_A027", NStr("en='Document Cash payment';de='Dokument Barzahlung';ro='Plata în numerar a documentului';ru='Документ оплата наличными';tr='D Kasa ödeme fişi'", CodeLanguage));
	Strings.Insert("Description_A028", NStr("en='Document Cash receipt';de='Dokument Bargeldeingang';ro='Chitanță de numerar pentru documente';ru='Документ кассовый чек';tr='D Kasa tahsilat fişi'", CodeLanguage));
	Strings.Insert("Description_A029", NStr("en='Document Cash revenue';de='Bareinnahmen dokumentieren';ro='Venituri în numerar din documente';ru='Документ наличной выручки';tr='D Nakit gelir fişi'", CodeLanguage));
	Strings.Insert("Description_A030", NStr("en='Document Cash transfer order';de='Dokument Barüberweisung bestellen';ro='Ordin de transfer al documentelor Fondului Monetar';ru='Документ заказ на перемещение денежных средств ';tr='D Finansal transfer siparişi'", CodeLanguage));
	Strings.Insert("Description_A031", NStr("en='Document Cheque bond transaction';de='Dokument Scheck Anleihe Transaktion';ro='Tranzacție cu obligațiuni de verificare a documentului';ru='Документ чек облигационная сделка';tr='D Çek/Senet bordrosu'", CodeLanguage));
	Strings.Insert("Description_A032", NStr("en='Document Goods receipt';de='Wareneingang dokumentieren';ro='Primirea mărfurilor document';ru='Документ товарная квитанция';tr='D Satın alma irsaliyesi'", CodeLanguage));
	Strings.Insert("Description_A033", NStr("en='Document Incoming payment order';de='Dokument Eingehender Zahlungsauftrag';ro='Ordin de plată primit de document';ru='Документ входящее платежное поручение';tr='D Tahsilat siparişi'", CodeLanguage));
	Strings.Insert("Description_A034", NStr("en='Document Inventory transfer';de='Dokument Inventar übertragen';ro='Transferul inventarului documentului';ru='Документ перемещение запасов ';tr='D Depo transfer fişi'", CodeLanguage));
	Strings.Insert("Description_A035", NStr("en='Document Inventory transfer order';de='Dokument Inventar übertragen, um';ro='Ordinea transferului inventarului';ru='Заказ на перемещение запасов документов';tr='D Depo transfer siparişi'", CodeLanguage));
	Strings.Insert("Description_A036", NStr("en='Document Invoice match';de='Dokument Rechnung Spiel';ro='Meciul facturii documentului';ru='Документ счет-фактура совпадение';tr='D Fatura kapatma fişi'", CodeLanguage));
	Strings.Insert("Description_A037", NStr("en='Document Labeling';de='Beschriftung Von Dokumenten';ro='Etichetarea documentelor';ru='Маркировка Документов';tr='D Seri lot tanımlama fişi'", CodeLanguage));
	Strings.Insert("Description_A038", NStr("en='Document Opening entry';de='Dokument Öffnen Eintrag';ro='Înregistrarea deschiderii documentului';ru='Запись для открытия документа';tr='D Açılış kayıt fişi'", CodeLanguage));
	Strings.Insert("Description_A039", NStr("en='Document Outgoing payment order';de='Dokument Ausgehende Zahlungsauftrag';ro='Document Ordin de plată de ieșire';ru='Документ исходящее платежное поручение';tr='D Ödeme siparişi'", CodeLanguage));
	Strings.Insert("Description_A040", NStr("en='Document Physical count by location';de='Physische Anzahl der Dokumente nach Standort';ro='Document Numărarea documentelor după locație';ru='Физическое количество документов по местоположению';tr='D Lokasyon sayım fişi'", CodeLanguage));
	Strings.Insert("Description_A041", NStr("en='Document Physical inventory';de='Materielles Inventar dokumentieren';ro='Document Inventarul fizic';ru='Документ физическая инвентаризация';tr='D Sayım fişi'", CodeLanguage));
	Strings.Insert("Description_A042", NStr("en='Document Price list';de='Dokument Preisliste';ro='Lista de prețuri a documentelor';ru='Прейскурант документов';tr='D Fiyat listesi'", CodeLanguage));
	Strings.Insert("Description_A043", NStr("en='Document Purchase invoice';de='Dokument Kauf Rechnung';ro='Document Factură de cumpărare';ru='Документ счет-фактура на покупку';tr='D Satın alma faturası'", CodeLanguage));
	Strings.Insert("Description_A044", NStr("en='Document Purchase order';de='Dokument Kaufauftrag';ro='Document Ordin de achiziție';ru='Документ заказ на покупку';tr='D Satın alma siparişi'", CodeLanguage));
	Strings.Insert("Description_A045", NStr("en='Document Purchase return';de='Dokument Kauf Rückkehr';ro='Întoarcere la cumpărarea documentului';ru='Документ о возврате покупки';tr='D Alım iadesi'", CodeLanguage));
	Strings.Insert("Description_A046", NStr("en='Document Purchase return order';de='Dokument Kauf Rücksendung bestellen';ro='Document de cumpărare pentru retur';ru='Приобрести документ возврат';tr='D Alım iade siparişi'", CodeLanguage));
	Strings.Insert("Description_A047", NStr("en='Document Reconciliation statement';de='Dokument-Versöhnungserklärung';ro='Declarație de reconciliere a documentului';ru='Заявление о сверке документов';tr='D Cari hesap mutabakat fişi'", CodeLanguage));
	Strings.Insert("Description_A048", NStr("en='Document Sales invoice';de='Dokument Umsatz Rechnung';ro='Factură de vânzări document';ru='Продаж счета-фактуры';tr='D Satış faturası'", CodeLanguage));
	Strings.Insert("Description_A049", NStr("en='Document Sales order';de='Dokument-Verkaufsauftrag';ro='Ordin de vânzare a documentelor';ru='Документ заказ на продажу';tr='D Satış siparişi'", CodeLanguage));
	Strings.Insert("Description_A050", NStr("en='Document Sales return';de='Dokument Umsatzrendite';ro='Vânzări de documente retur';ru='Возврат продажи документов';tr='D Satış iadesi'", CodeLanguage));
	Strings.Insert("Description_A051", NStr("en='Document Sales return order';de='Dokument Umsatzrendite um';ro='Vânzări de vânzări pentru retur';ru='Заказ на возврат продажи документа';tr='D Satış iade siparişi'", CodeLanguage));
	Strings.Insert("Description_A052", NStr("en='Document Shipment confirmation';de='Dokument Versandbestätigung';ro='Confirmarea expedierii documentului';ru='Подтверждение отгрузки документов';tr='D Sevk irsaliyesi'", CodeLanguage));
	Strings.Insert("Description_A053", NStr("en='Document Stock adjustment as surplus';de='Dokument bestandskorrekturen als überschuss';ro='Ajustarea stocului de stoc ca excedent';ru='Документ корректировка запасов как излишек';tr='D Stok sayım girişi'", CodeLanguage));
	Strings.Insert("Description_A054", NStr("en='Document Stock adjustment as write off';de='Dokument bestandskorrekturen als abschreiben';ro='Ajustarea stocului de stoc ca anulare';ru='Документ корректировка запасов по мере списания';tr='D Stok sayım çıkışı'", CodeLanguage));
	Strings.Insert("Description_A056", NStr("en='Document Unbundling';de='Entbündelung Von Dokumenten';ro='Dezlegarea documentului';ru='Разделение Документа ';tr='D Ürün takımı bozma fişi'", CodeLanguage));
	Strings.Insert("Description_A057", NStr("en='User defined';de='Benutzerdefinierte';ro='Definit de utilizator';ru='Пользовательский';tr='Kullanıcı tanımlı'", CodeLanguage));
	Strings.Insert("Description_A058", NStr("en='Cheque bond incoming';de='Scheck-bond-eingehende';ro='Cec de obligaţiuni de intrare';ru='Входящий чек облигация';tr='Gelen çek/senet'", CodeLanguage));
	Strings.Insert("Description_A059", NStr("en='Cheque bond outgoing';de='Scheckübergabe';ro='Cec de obligațiuni de ieșire';ru='Чек облигация исходящая';tr='Çıkan çek/senet'", CodeLanguage));
	Strings.Insert("Description_A060", NStr("en='Document Credit debit note';de='Dokument Kredit-Lastschrift';ro='Notă de debitare a documentului de credit';ru='Документ Дебет Кредит Примечание';tr='D Borç alacak dekontu'", CodeLanguage));
	Strings.Insert("Description_A061", NStr("en='Settlement currency';de='Abrechnungswährung';ro='Moneda de decontare';ru='Валюта расчетов';tr='Cari hesap dövizi'", CodeLanguage));

EndProcedure

