[![Quality Gate Status](https://dev.irpteam.com/sq/api/project_badges/measure?project=IRP&metric=alert_status)](https://dev.irpteam.com/sq/dashboard?id=IRP)
[![Reliability Rating](https://dev.irpteam.com/sq/api/project_badges/measure?project=IRP&metric=reliability_rating)](https://dev.irpteam.com/sq/dashboard?id=IRP)
[![Coverage](https://dev.irpteam.com/sq/api/project_badges/measure?project=IRP&metric=coverage)](https://dev.irpteam.com/sq/dashboard?id=IRP)
[![Allure](https://img.shields.io/badge/allure-open-yellowgreen)](https://dev.irpteam.com/tc/repository/download/IRP_RunVA/.lastSuccessful/allure-report.zip!/index.html?branch=develop)


<<<<<<< HEAD
# IRP Core 

**Программное решение "IRP"** предназначено для автоматизации товарного учета, оптовой торговли и финансовых операций.

## Основные принципы разработки системы

* простая и быстрая адаптация под специфику разных стран
* использования системы расширений и внешних обработок
* поддержка мультиязычности интерфейсов и данных
* система гибких настроек под особенности бизнес-процессов пользователей без корректировки кода ядра
* персонализация настроек без написания кода
* использование последних технологий

## Интеграционные механизмы которые используются в процессе разработки

* EDT (код “IRP” написан на английском языке)
* Sonar (BSL + проверка через АПК)
* Vanessa automation
* Translator
* CI/CD контур

## Архитектурные решения по локализации

**​1. Мультиязычность интерфейсов**

Вся локализация кода вынесена в один модуль. Перевод осуществляется с помощью собственного программного решения «Translator». Процесс перевода полностью автоматизирован.

**2. Мультиязычность данных**

Во всех справочниках поддерживается возможность заполнения наименования на разных языках. Пользователю отображаются введенные данные на установленном ему языке.
Например, название номенклатуры заполняется изначально на русском и на английском языке. Русскоязычный пользователь при работе с базой будет видеть наименование номенклатуры на русском, англоязычный пользователь - на английском, или по приоритету, если наименование на установленном языке не заполнено.

**3. Гибкая система налогов**

Учет налогов в программе с легкостью настраивается под особенности разных стран. Например, налог можно разделить не только по товарам, но и по размерной сетке. 
В системе нет предустановленных налогов, они все подключаются внешними обработками, в которых прописывается сама логика расчета налогов.
На одну строку товара может быть назначено не ограниченное количество строк налога

**4. Конфигурация заточена под расширения**

* внесения доработок происходит оперативно и гибко, при этом сама конфигурация не затрагивается
* обновление по странам возможно проводить частично
* оперативное изменение состава отчетов возможно в течение дня без доставления неудобств пользователям

**5. Гибкость настроек под особенности рынков разных стран обеспечивается системой внешних обработок**

* подключение и настройка контактной информации
* подключение и настройка скидок
* подключение и настройка налогов
* печатные формы документов
* курсы валют с разными источниками, прямая и не прямая конвертация из валюты в валюту

**6. Цена и количество переменной длины**

Цену, количество, сумму и т.д. - можно быстро настроить под параметры страны и/или потребности клиента в пару кликов мыши (а именно, увеличить или уменьшить количество символов в определяемых типах).

**7. Контактная информация в разрезе стран**

Под каждую страну возможно задать свою структуру контактной информации.

**8. Мультивалютный учет**

* операции регистрируются в той валюте, в которой они производятся
* пользователи по мере необходимости могут добавлять новые валюты расчетов и отчетности
* курсы валют могут быть установлены как по отношению к базовой валюте так и по соотношению дополнительных валют


**8. Прочие особенности**

* В системе, практически нет ролей, все роли создаются на лету, через специальное расширение
* Партионный модуль вынесен в расширение
* Работа с внешними обработками позволяет делать их быструю отладку (включая формы), и встраивать обработки в расширения или ядро, не меняя при этом логику их вызовов
* При перепроведении документа - система смотрит, если проводки не меняются, то данных в регистрах не обновляются
* Возможность менять язык отображения наименования данных "на лету"
* Все интеграции в системе делаются через специальных шаблонный справочник



## Архитектурные решения по товарному учету

**1. Возможность учета товара по коробам, размерным сеткам и наборам**

Короба вынесены в отдельный справочник box и используются для единоразовой упаковки произвольных товаров с целью перемещения.

Размерные сетки определены справочником Specification и связаны с товаром по Item key.
Наборы учитываются как отдельный Item. Могут быть сформированы как на основании заранее созданной спецификации (когда необходим контроль составляющих) так и без неё.

**2. Склад в пути для перемещений**

## Архитектурные решения по финансовому учету

**1. Система взаиморасчетов с клиентами**

Варианты настройки системы взаиморасчетов:

* по инвойсам
* по соглашениям
* без привязки к инвойсам и соглашения

Проведения платежей из банковской выписки или кассового листа возможно единым документом (не требуется создавать отдельный документ на каждый платеж). Расход и приход денежных средств осуществляется разными документами.

**2. Учет денежных средств в пути**

При перемещении денежных средств между кассами и банковскими счетами, до момента поступления денежных средств в место назначения, они числятся как денежные средства в пути. За счет этого не возникает ситуация, когда денежные средства списываются в никуда.

**3. Контроль конвертации валюты**

При конвертации валюты денежные средства после их выдачи для конвертации (до момента возврата в место хранения) числятся на ответственном за обмен сотруднике/партнере. Это позволяет отслеживать разницу курсов при конвертации и производить компенсации. 
Например, сотруднику для обмена на евро было выдано 1 150 лир. Плановое поступление - 175 евро. В процессе обмена курс изменился и для покупки 175 евро сотрудник потратил 1151 лиру (1 лира должна быть компенсирована). 
=======
>>>>>>> f607218b5 (IRP-1)
