﻿#Область ОписаниеПеременных

&НаКлиенте
Перем КонтекстЯдра;
&НаКлиенте
Перем Утверждения;
&НаКлиенте
Перем ОтборПоПрефиксу;
&НаКлиенте
Перем ПрефиксОбъектов;
&НаКлиенте
Перем ИсключенияИзПроверок;

#КонецОбласти

#Область ИнтерфейсТестирования

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	
	ПутьНастройки = "Тесты";
	Настройки(КонтекстЯдра, ПутьНастройки);
		
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдра) Экспорт
	
	Если Не ВыполнятьТест(КонтекстЯдра) Тогда
		Возврат;
	КонецЕсли;
		
	НаборТестов.НачатьГруппу("Документы", Ложь);
	мДокументы = Документы(ПрефиксОбъектов, ОтборПоПрефиксу);	
	Для Каждого Документ Из мДокументы Цикл
		ИмяПроцедуры = "ТестДолжен_ПроверитьРеквизитыДокументовКомментарийОтветственный";
		НаборТестов.Добавить(ИмяПроцедуры, НаборТестов.ПараметрыТеста(Документ.Имя, Документ.ПолноеИмя), Документ.Имя);	
	КонецЦикла;
			
КонецПроцедуры

#КонецОбласти

#Область РаботаСНастройками

&НаКлиенте
Процедура Настройки(КонтекстЯдра, Знач ПутьНастройки)

	Если ЗначениеЗаполнено(Объект.Настройки) Тогда
		Возврат;
	КонецЕсли;
	
	ОтборПоПрефиксу = Ложь;
	ПрефиксОбъектов = "";
	ИсключенияИзПроверок = Новый Соответствие;
	ПлагинНастроек = КонтекстЯдра.Плагин("Настройки");
	Объект.Настройки = ПлагинНастроек.ПолучитьНастройку(ПутьНастройки);
	Настройки = Объект.Настройки;
	
	Если Не ЗначениеЗаполнено(Объект.Настройки) Тогда
		Объект.Настройки = Новый Структура(ПутьНастройки, Неопределено);
		Возврат;
	КонецЕсли;
	
	Если Настройки.Свойство("Параметры") И Настройки.Параметры.Свойство("Префикс") Тогда
		ПрефиксОбъектов = Настройки.Параметры.Префикс;		
	КонецЕсли;
	
	Если Настройки.Свойство(ИмяТеста()) И Настройки[ИмяТеста()].Свойство("ОтборПоПрефиксу") Тогда
		ОтборПоПрефиксу = Настройки[ИмяТеста()].ОтборПоПрефиксу;		
	КонецЕсли;
	
	Если Настройки.Свойство(ИмяТеста()) И Настройки[ИмяТеста()].Свойство("ИсключенияИзПроверок") Тогда
		ИсключенияИзПроверок(Настройки);
	КонецЕсли;
			
КонецПроцедуры

&НаКлиенте
Процедура ИсключенияИзПроверок(Настройки)

	Для Каждого ИсключенияИзПроверокПоОбъектам Из Настройки[ИмяТеста()].ИсключенияИзпроверок Цикл
		Для Каждого ИсключениеИзПроверок Из ИсключенияИзПроверокПоОбъектам.Значение Цикл
			ИсключенияИзПроверок.Вставить(ВРег(ИсключенияИзПроверокПоОбъектам.Ключ + "." + ИсключениеИзПроверок), Истина); 	
		КонецЦикла;
	КонецЦикла;	

КонецПроцедуры

#КонецОбласти

#Область Тесты

&НаКлиенте
Процедура ТестДолжен_ПроверитьРеквизитыДокументовКомментарийОтветственный(ИмяДокумента, ПолноеИмяДокумента) Экспорт
	
	ПропускатьТест = ПропускатьТест(ПолноеИмяДокумента);
	
	Результат = ПроверитьРеквизитыДокументовКомментарийОтветственный(ИмяДокумента);
	Если Результат <> "" И ПропускатьТест.Пропустить Тогда
		Утверждения.ПропуститьТест(ПропускатьТест.ТекстСообщения);
	Иначе
		Утверждения.Проверить(Результат = "", ТекстСообщения(ИмяДокумента, Результат));
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПроверитьРеквизитыДокументовКомментарийОтветственный(ИмяДокумента)
	
	Документ = Метаданные.Документы.Найти(ИмяДокумента);	
	Результат = "";
	
	Если Документ.Реквизиты.Найти("Комментарий") = Неопределено Тогда
		Разделитель = ?(ЗначениеЗаполнено(Результат), ",", "");
		Результат = СтрШаблон(НСтр("ru = '%1%2 комментарий'"), Результат, Разделитель);	
	КонецЕсли;
	
	Если Документ.Реквизиты.Найти("Ответственный") = Неопределено Тогда
		Разделитель = ?(ЗначениеЗаполнено(Результат), ",", "");
		Результат = СтрШаблон(НСтр("ru = '%1%2 ответственный'"), Результат, Разделитель);	
	КонецЕсли;
		
	Возврат Результат;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Функция ПропускатьТест(ИмяДокумента)

	Результат = Новый Структура;
	Результат.Вставить("ТекстСообщения", "");
	Результат.Вставить("Пропустить", Ложь);
	
	Если ИсключенияИзПроверок.Получить(ВРег(ИмяДокумента)) <> Неопределено Тогда
		Результат.ТекстСообщения = СтрШаблон(НСтр("ru = 'Объект ""%1"" исключен из проверки.'"), ИмяДокумента);
		Результат.Пропустить = Истина;
		Возврат Результат;
	КонецЕсли;
		
	Возврат Результат;

КонецФункции 

&НаКлиентеНаСервереБезКонтекста
Функция ТекстСообщения(ИмяДокумента, Результат)

	ШаблонСообщения = НСтр("ru = 'Для документа ""%1"" не указаны реквизиты:%2.'");
	ТекстСообщения = СтрШаблон(ШаблонСообщения, ИмяДокумента, Результат);
	
	Возврат ТекстСообщения;

КонецФункции

&НаСервере
Функция ИмяТеста()
	Возврат РеквизитФормыВЗначение("Объект").Метаданные().Имя;
КонецФункции

&НаКлиенте
Функция ВыполнятьТест(КонтекстЯдра)
	
	ВыполнятьТест = Истина;
	ПутьНастройки = "Тесты";
	Настройки(КонтекстЯдра, ПутьНастройки);
	Настройки = Объект.Настройки;
	
	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Возврат ВыполнятьТест;
	КонецЕсли;
		
	Если ТипЗнч(Настройки) = Тип("Структура") 
		И Настройки.Свойство("Параметры") 
		И Настройки.Параметры.Свойство(ИмяТеста()) Тогда
		ВыполнятьТест = Настройки.Параметры[ИмяТеста()];	
	КонецЕсли;
	
	Возврат ВыполнятьТест;

КонецФункции

&НаСервереБезКонтекста
Функция Документы(ПрефиксОбъектов, ОтборПоПрефиксу)

	Результат = Новый Массив;
	
	Для Каждого Документ Из Метаданные.Документы Цикл
		Если ОтборПоПрефиксу И Не ИмяСодержитПрефикс(Документ.Имя, ПрефиксОбъектов) Тогда
			Продолжить;
		КонецЕсли;
		СтруктураДокумента = Новый Структура;
		СтруктураДокумента.Вставить("Имя", Документ.Имя);
		СтруктураДокумента.Вставить("Синоним", Документ.Синоним);
		СтруктураДокумента.Вставить("ПолноеИмя", Документ.ПолноеИмя());
		Результат.Добавить(СтруктураДокумента);
	КонецЦикла;	
	
	Возврат Результат;

КонецФункции 

&НаКлиентеНаСервереБезКонтекста
Функция ИмяСодержитПрефикс(Имя, Префикс)
	
	Если Не ЗначениеЗаполнено(Префикс) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ДлинаПрефикса = СтрДлина(Префикс);
	Возврат СтрНайти(ВРег(Лев(Имя, ДлинаПрефикса)), ВРег(Префикс)) > 0;
	
КонецФункции

#КонецОбласти