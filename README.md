# Версия 1.3.0 

<a id="markdown-тесты" name="тесты"></a>

# Тесты

- [Тесты](#тесты)
    - [Ссылки на каталоги](#каталоги)
    - [Введение](#введение)
    - [Описание тестов](#описание)
        - [Тесты для проверки объектов метаданных на соответствие стандартам 1C](#тесты_стандарты1с)
        - [Тесты для проверки объектов метаданных на соответствие внутренним стандартам](#тесты_внутренние_стандарты)
        - [Шаблон теста](#шаблон_теста)
    - [Настройка тестов](#настройка)
        - [Общие настройки](#настройки_общие)
        - [Настройки тестов](#настройка_тестов)

<a id="markdown-каталоги" name="каталоги"></a>

## Ссылки на каталоги

* [Файлы EPF тестов](./SmokeTests)
* [Исходники тестов](./src/SmokeTests)
* [Файлы настроек тестов](./SmokeTestsParams)

<a id="markdown-введение" name="введение"></a>

## Введение

+ Тесты проверяют метаданные на соответствие внутренним стандартам и [стандартам 1С](https://its.1c.ru/db/v8std).
+ Тесты запускаются с помощью обработки [xddTestRunner](https://github.com/silverbulleters/add/tree/master/epf/xddTestRunner) проекта [Vanessa-ADD (Vanessa Automation Driven Development)](https://github.com/silverbulleters/add).

<a id="markdown-описание" name="описание"></a>

## Описание тестов

<a id="markdown-тесты_стандарты1с" name="тесты_стандарты1с"></a>

### 1. Тесты для проверки объектов метаданных на соответствие [стандартам 1С](https://its.1c.ru/db/v8std)

<a id="markdown-Тесты_ПроверкаСтандартныхРолей" name="Тесты_ПроверкаСтандартныхРолей"></a>
+ **1.1. Проверка [стандартных ролей](https://its.1c.ru/db/v8std#content:488:hdoc)** 
([Тесты_ПроверкаСтандартныхРолей.epf](./SmokeTests/Тесты_ПроверкаСтандартныхРолей.epf))

    + Тест проверяет состав основных ролей конфигурации, типовые роли и права на корень конфигурации, остальные роли и права на корень конфигурации.
    + Настройки:
        - [Пропускать объекты с префиксом удалить](#Настройки_ПропускатьОбъектыСПрефиксомУдалить)
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Основные роли](#Настройки_ОсновныеРоли)
        - [Стандартные роли](#Настройки_СтандартныеРоли)

<a id="markdown-Тесты_ПроверкаОбщихРеквизитов" name="Тесты_ПроверкаОбщихРеквизитов"></a>
+ **1.2. Проверка [общих реквизитов](https://its.1c.ru/db/v8std#content:677:hdoc)** 
([Тесты_ПроверкаОбщихРеквизитов.epf](./SmokeTests/Тесты_ПроверкаОбщихРеквизитов.epf))

    + Тест проверяет, что у общих реквизитов включено использование разделения данных.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)

<a id="markdown-Тесты_ПроверкаПраваИнтерактивногоУдаления" name="Тесты_ПроверкаПраваИнтерактивногоУдаления"></a>
+ **1.3. Проверка [права интерактивно удаления](https://its.1c.ru/db/v8std#content:689:hdoc)** 
([Тесты_ПроверкаПраваИнтерактивногоУдаления.epf](./SmokeTests/Тесты_ПроверкаПраваИнтерактивногоУдаления.epf))

    + Тест проверяет, что у ролей кроме основных нет права на интерактивное удаление объектов базы данных.

<a id="markdown-Тесты_ПроверкаПраваИнтерактивногоУдаленияПомеченных" name="Тесты_ПроверкаПраваИнтерактивногоУдаленияПомеченных"></a>
+ **1.4. Проверка [права интерактивно удаления помеченных](https://its.1c.ru/db/v8std#content:488:hdoc)** 
([Тесты_ПроверкаПраваИнтерактивногоУдаленияПомеченных.epf](./SmokeTests/Тесты_ПроверкаПраваИнтерактивногоУдаленияПомеченных.epf))

    + Тест проверяет, что у ролей кроме основных нет права на интерактивное удаление помеченных объектов базы данных.

<a id="markdown-Тесты_ПроверкаПравНаПредопределенныеДанныеОбъектов" name="Тесты_ПроверкаПравНаПредопределенныеДанныеОбъектов"></a>
+ **1.5. Проверка [прав на предопределенные данные объектов](https://its.1c.ru/db/v8std#content:488:hdoc)** 
([Тесты_ПроверкаПравНаПредопределенныеДанныеОбъектов.epf](./SmokeTests/Тесты_ПроверкаПравНаПредопределенныеДанныеОбъектов.epf))

    + Тест проверяет, что у ролей кроме основных нет следующих прав на предопределенные данные объектов:
        * Интерактивное удаление предопределенных данных
        * Интерактивная пометка удаления предопределенных данных
        * Интерактивное снятие пометки удаления предопределенных данных
        * Интерактивное удаление помеченных предопределенных данных

<a id="markdown-Тесты_ПроверкаПривилегированногоРежимаОбъектов" name="Тесты_ПроверкаПривилегированногоРежимаОбъектов"></a>
+ **1.6. Проверка [привилегированного режима объектов](https://its.1c.ru/db/v8std#content:485:hdoc)** 
([Тесты_ПроверкаПривилегированногоРежимаОбъектов.epf](./SmokeTests/Тесты_ПроверкаПривилегированногоРежимаОбъектов.epf))

    + Тест проверяет, что у объектов метаданных установлен привилегированный режим.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)

<a id="markdown-Тесты_ПроверкаРегламентныхЗаданий" name="Тесты_ПроверкаРегламентныхЗаданий"></a>
+ **1.7. Проверка [регламентных заданий](https://its.1c.ru/db/v8std#content:540:hdoc)** 
([Тесты_ПроверкаРегламентныхЗаданий.epf](./SmokeTests/Тесты_ПроверкаРегламентныхЗаданий.epf))

    + Тест проверяет, что у регламентного задания не установлен признак "Использование".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-Тесты_ПроверкаСоставныхТиповДанных" name="Тесты_ПроверкаСоставныхТиповДанных"></a>
+ **1.8. Проверка [составных типов данных](https://its.1c.ru/db/v8std#content:728:hdoc)** 
([Тесты_ПроверкаСоставныхТиповДанных.epf](./SmokeTests/Тесты_ПроверкаСоставныхТиповДанных.epf))

    + Тест проверяет, что у реквизитов и свойств объектов метаданных не используется составной тип данных "ЛюбаяСсылка", "ДокументСсылка" и т.д.
    + У реквизитов и свойств объектов метаданных тип не содержит примитивных и ссылочных типов.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Не проверять дополнительные реквизиты](#Настройки_НеПроверятьДополнительныеРеквизиты)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных" name="Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных"></a>
+ **1.9. Проверка [синонима устаревших объектов метаданных](https://its.1c.ru/db/v8std#content:534:hdoc)** 
([Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных.epf](./SmokeTests/Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных.epf))

    + Тест проверяет, что у устаревших (с префиксом "Удалить") объектов и свойств метаданных синоним содержит префикс "(не используется)".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-Тесты_ПроверкаПравКУстаревшимОбъектам" name="Тесты_ПроверкаПравКУстаревшимОбъектам"></a>
+ **1.10. Проверка [прав к устаревшим объектам](https://its.1c.ru/db/v8std#content:689:hdoc)** 
([Тесты_ПроверкаПравКУстаревшимОбъектам.epf](./SmokeTests/Тесты_ПроверкаПравКУстаревшимОбъектам.epf))

    + Тест проверяет, что у неосновных ролей нет прав на объекты метаданных с префиксом "Удалить".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-Тесты_ПроверкаПравНаЧтениеОбъектов" name="Тесты_ПроверкаПравНаЧтениеОбъектов"></a>
+ **1.11. Проверка прав на чтение объектов** 
([Тесты_ПроверкаПравНаЧтениеОбъектов.epf](./SmokeTests/Тесты_ПроверкаПравНаЧтениеОбъектов.epf))

    + Тест проверяет, что у неосновных ролей есть право чтение объектов метаданных.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Пропускать объекты с префиксом удалить](#Настройки_ПропускатьОбъектыСПрефиксомУдалить)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов" name="Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов"></a>
+ **1.12. Проверка [пользовательских представлений новых объектов](https://its.1c.ru/db/v8std#content:468:hdoc)** 
([Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов.epf](./SmokeTests/Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов.epf))

    + Тест проверяет, что у нового объекта метаданных задано одно из следующих свойств: "Представление объекта", "Представление записи", "Представление списка".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)

<a id="markdown-Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный" name="Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный"></a>
+ **1.13. Проверка [реквизитов документов: комментарий, ответственный](https://its.1c.ru/db/v8std#content:719:hdoc)** 
([Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный.epf](./SmokeTests/Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный.epf))

    + Тест проверяет, что у документов есть реквизиты: "Комментарий", "Ответственный".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)

<a id="markdown-тесты_внутренние_стандарты" name="тесты_внутренние_стандарты"></a>

### 2. Тесты для проверки объектов метаданных на соответствие внутренним стандартам
<a id="markdown-Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах" name="Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах"></a>
+ **2.1. Проверка префикса в новых объектах и реквизитах** 
([Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах.epf](./SmokeTests/Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах.epf))

    + Тест проверяет, что у нового объекта метаданных или реквизита установлен префикс.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)

<a id="markdown-Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему" name="Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему"></a>
+ **2.2. Проверка включения новых объектов с префиксом в подсистему** 
([Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему.epf](./SmokeTests/Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему.epf))

    + Тест проверяет, что новый объект метаданных с префиксом включен в подсистему.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Подсистема](#Настройки_Подсистема)

<a id="markdown-Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов" name="Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов"></a>
+ **2.3. Проверка синонима новых объектов и реквизитов** 
([Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов.epf](./SmokeTests/Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов.epf))

    + Тест проверяет, что у новых объектов и свойств метаданных синоним не содержит префикса.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)

<a id="markdown-Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов" name="Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов"></a>
+ **2.4. Проверка префикса свойств новых объектов** 
([Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов.epf](./SmokeTests/Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов.epf))

    + Тест проверяет, что у новых с (префиксом) объектов метаданных табличные части и свойства не содержат префикса.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Конфигурация поставщика](#Настройки_КонфигурацияПоставщика)

<a id="markdown-Тесты_ПроверкаОсновныхФормОтчетов" name="Тесты_ПроверкаОсновныхФормОтчетов"></a>
+ **2.5. Проверка основных форм отчетов** 
([Тесты_ПроверкаОсновныхФормОтчетов.epf](./SmokeTests/Тесты_ПроверкаОсновныхФормОтчетов.epf))

    + Тест проверяет, что у отчетов или конфигурации установлены основные формы: "ОсновнаяФорма/ОсновнаяФормаОтчета", "ОсновнаяФормаНастроек/ОсновнаяФормаНастроекОтчета", "ОсновнаяФормаВарианта/ОсновнаяФормаВариантаОтчета".
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)
        - [Каталоги внешних отчетов](#Настройки_КаталогиВнешнихОтчетов)

<a id="markdown-Тесты_ПроверкаХранилищаВариантовОтчетов" name="Тесты_ПроверкаХранилищаВариантовОтчетов"></a>
+ **2.6. Проверка хранилища вариантов отчетов** 
([Тесты_ПроверкаХранилищаВариантовОтчетов.epf](./SmokeTests/Тесты_ПроверкаХранилищаВариантовОтчетов.epf))

    + Тест проверяет, что у отчетов или конфигурации установлено хранилище вариантов отчетов.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Префикс](#Настройки_Префикс)
        - [Отбор по префиксу](#Настройки_ОтборПоПрефиксу)
        - [Хранилище вариантов отчетов](#Настройки_ХранилищеВариантовОтчетов)
        - [Каталоги внешних отчетов](#Настройки_КаталогиВнешнихОтчетов)

<a id="markdown-Тесты_ПроверкаПравНаЧтениеОбъектовRLS" name="Тесты_ПроверкаПравНаЧтениеОбъектовRLS"></a>
+ **2.7. Проверка прав на чтение объектов с RLS** 
([Тесты_ПроверкаПравНаЧтениеОбъектовRLS.epf](./SmokeTests/Тесты_ПроверкаПравНаЧтениеОбъектовRLS.epf))

    + Тест проверяет, что у неосновных ролей нет права чтение объектов метаданных без RLS.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Объекты метаданных](#Настройки_ОбъектыМетаданных)
        
<a id="markdown-Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок" name="Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок"></a>
+ **2.8. Проверка макетов СКД внешних отчетов и обработок** 
([Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок.epf](./SmokeTests/Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок.epf))

    + Тест проверяет макет СКД у внешних отчетов и обработок.
    + Настройки:
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        - [Каталоги внешних отчетов](#Настройки_КаталогиВнешнихОтчетов)
        - [Каталоги внешних обработок](#Настройки_КаталогиВнешнихОбработок)

<a id="markdown-Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика" name="Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика"></a>
+ **2.9. Проверка объектов метаданных конфигурации поставщика** 
([Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика.epf](./SmokeTests/Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика.epf))

    + Тест проверяет, что объекты метаданных конфигурации поставщика не были удалены из конфигурации.
    + Настройки:
        - [Конфигурация поставщика](#Настройки_КонфигурацияПоставщика)
        
<a id="markdown-Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов" name="Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов"></a>
+ **2.10. Проверка каноничности префикса новых объектов и реквизитов** 
([Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов.epf](./SmokeTests/Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов.epf))

    + Тест проверяет, что префикс новых объектов метаданных соответствует каноничному написанию.
    + Настройки:
        - [Префикс](#Настройки_Префикс) 
        - [Исключения из проверок](#Настройки_ИсключенияИзПроверок)
        
<a id="markdown-шаблон_теста" name="шаблон_теста"></a>

### 3. Шаблон теста.

+ **3.1. Шаблон теста** ([Тесты_ШаблонТеста.epf](./SmokeTests/Тесты_ШаблонТеста.epf))

    + Шаблон теста для создания новых тестов.

<a id="markdown-настройка" name="настройка"></a>
## Настройка тестов

Настройки тестов задаются в файле xUnitparams.json ([пример](./SmokeTestsParams/xUnitParams.json)) в разделе **"Тесты"**.

<a id="markdown-настройки_общие" name="настройки_общие"></a>

### Общие настройки (раздел "Параметры"):

<a id="markdown-Настройки_Префикс" name="Настройки_Префикс"></a>
+ **"Префикс"** - Префикс для новых объектов и свойств метаданных. Настройка задается в разделе "Параметры" свойством "Префикс": "МойПрефикс". Настройка доступна для тестов:

    - **[Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов](#Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов)**
    - **[Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах](#Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах)**
    - **[Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов](#Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов)**
    - **[Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов](#Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов)**
    - **[Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему.epf](#Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему)**
    - **[Тесты_ПроверкаПравНаЧтениеОбъектов](#Тесты_ПроверкаПравНаЧтениеОбъектов)**
    - **[Тесты_ПроверкаОсновныхФормОтчетов](#Тесты_ПроверкаОсновныхФормОтчетов)**
    - **[Тесты_ПроверкаХранилищаВариантовОтчетов](#Тесты_ПроверкаХранилищаВариантовОтчетов)**
    - **[Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный](#Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный)**
    - **[Тесты_ПроверкаРегламентныхЗаданий](#Тесты_ПроверкаРегламентныхЗаданий)**
    - **[Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов](#Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов)**
    - **[Тесты_ПроверкаПравКУстаревшимОбъектам](#Тесты_ПроверкаПравКУстаревшимОбъектам)**
    - **[Тесты_ПроверкаСоставныхТиповДанных](#Тесты_ПроверкаСоставныхТиповДанных)**
    - **[Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных](#Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных)**

<a id="markdown-Настройки_Подсистема" name="Настройки_Подсистема"></a>
+ **"Подсистема"** - Подсистема, в которую добавляются новые объекты метаданных. Настройка задается в разделе "Параметры" свойством "Подсистема": "МояПодсистема". Настройка доступна для тестов:

    - **[Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему.epf](#Тесты_ПроверкаВключенияНовыхОбъектовСПрефиксомВПодсистему)**

<a id="markdown-Настройки_КонфигурацияПоставщика" name="Настройки_КонфигурацияПоставщика"></a>
+ **"КонфигурацияПоставщика"** - Путь к файлу со структурой конфигурации поставщика. Настройка задается в разделе "Параметры" свойством "КонфигурацияПоставщика": "ПолноеИмяФайла.json" (можно указывать как относительный путь к файлу). Файл конфигурации поставщика можно получить путем интерактивного запуска обработки **[Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах](./SmokeTests/Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах.epf)**, и с помощью команды "Выбор файла" открыть файл отчета конфигурации поставщика в текстовом формате. Файл "ОтчетПоКонфигурации.txt" можно получить в конфигураторе: открыть конфигурацию поставщика, выполнить команду Конфигурация/Отчет по конфигурации/Выводить в текстовый документ. Настройка доступна для тестов:

    - **[Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов](#Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов)**
    - **[Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика](#Тесты_ПроверкаОбъектовМетаданныхКонфигурацииПоставщика)**

<a id="markdown-Настройки_ПропускатьОбъектыСПрефиксомУдалить" name="Настройки_ПропускатьОбъектыСПрефиксомУдалить"></a>
+ **"ПропускатьОбъектыСПрефиксомУдалить"** - Пропускать в тестах устаревшие объекты метаданных. Настройка задается в разделе "Параметры" свойством "ПропускатьОбъектыСПрефиксомУдалить": true/false. Настройка доступна для тестов:

    - **[Тесты_ПроверкаПравНаЧтениеОбъектов](#Тесты_ПроверкаПравНаЧтениеОбъектов)**
    - **[Тесты_ПроверкаСтандартныхРолей](#Тесты_ПроверкаСтандартныхРолей)**

<a id="markdown-Настройки_ИмяТеста" name="Настройки_ИмяТеста"></a>
+ **"ИмяТеста"** - Включает/выключает выполнение теста. Настройка задается в разделе "Параметры" свойством "ИмяТеста": true/false. Настройка доступна для всех тестов.

<a id="markdown-настройка_тестов" name="настройка_тестов"></a>

### Настройки тестов (раздел "ИмяТеста"):

<a id="markdown-Настройки_ИсключенияИзПроверок" name="Настройки_ИсключенияИзПроверок"></a>
+ **"ИсключенияИзПроверок"** - Исключения из проверок с типом структура. Задается как список свойств структуры, где ключ - это имя объекта метаданных в единственном числе ("Документ", "Справочник"), а значение - это массив имен подчиненных объектов ("Справочник1", "Документ1", "Справочник1.ТабличнаяЧасть.Товары", "Документ1.Форма.ФормаДокумента" и т.д.). Настройка доступна для тестов:

    - **[Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов](#Тесты_ПроверкаПользовательскихПредставленийНовыхОбъектов)**
    - **[Тесты_ПроверкаПравНаЧтениеОбъектов](#Тесты_ПроверкаПравНаЧтениеОбъектов)**
    - **[Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах](#Тесты_ПроверкаПрефиксаВНовыхОбъектахИРеквизитах)**
    - **[Тесты_ПроверкаСоставныхТиповДанных](#Тесты_ПроверкаСоставныхТиповДанных)**
    - **[Тесты_ПроверкаСтандартныхРолей](#Тесты_ПроверкаСтандартныхРолей)**
    - **[Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных](#Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных)**
    - **[Тесты_ПроверкаПривилегированногоРежимаОбъектов](#Тесты_ПроверкаПривилегированногоРежимаОбъектов)**
    - **[Тесты_ПроверкаОбщихРеквизитов](#Тесты_ПроверкаОбщихРеквизитов)**
    - **[Тесты_ПроверкаРегламентныхЗаданий](#Тесты_ПроверкаРегламентныхЗаданий)**
    - **[Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов](#Тесты_ПроверкаСинонимаНовыхОбъектовИРеквизитов)**
    - **[Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов](#Тесты_ПроверкаПрефиксаСвойствНовыхОбъектов)**
    - **[Тесты_ПроверкаОсновныхФормОтчетов](#Тесты_ПроверкаОсновныхФормОтчетов)**
    - **[Тесты_ПроверкаХранилищаВариантовОтчетов](#Тесты_ПроверкаХранилищаВариантовОтчетов)**
    - **[Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный](#Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный)**
    - **[Тесты_ПроверкаПравНаЧтениеОбъектовRLS](#Тесты_ПроверкаПравНаЧтениеОбъектовRLS)**
    - **[Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов](#Тесты_ПроверкаКаноничностиПрефиксаНовыхОбъектовИРеквизитов)**
    - **[Тесты_ПроверкаПравКУстаревшимОбъектам](#Тесты_ПроверкаПравКУстаревшимОбъектам)**

<a id="markdown-Настройки_ОсновныеРоли" name="Настройки_ОсновныеРоли"></a>
+ **ОсновныеРоли** - Описание основных ролей конфигурации. Задается как массив имен ролей, которые входят в список свойства конфигурации **"Основные роли конфигурации"**. Настройка доступна для тестов:

    - **[Тесты_ПроверкаСтандартныхРолей](#Тесты_ПроверкаСтандартныхРолей)**

<a id="markdown-Настройки_СтандартныеРоли" name="Настройки_СтандартныеРоли"></a>
+ **СтандартныеРоли** - Описание стандартных ролей конфигурации. Задается как список свойств структуры, где ключ - это имя стандартной роли, значение - это массив строк с именем прав на корень конфигурации. Настройка доступна для тестов:

    - **[Тесты_ПроверкаСтандартныхРолей](#Тесты_ПроверкаСтандартныхРолей)**

<a id="markdown-Настройки_НеПроверятьДополнительныеРеквизиты" name="Настройки_НеПроверятьДополнительныеРеквизиты"></a>
+ **НеПроверятьДополнительныеРеквизиты** - Признак, что не будут проверяться дополнительные реквизиты и сведения. Настройка задается в разделе "Тесты_ПроверкаСоставныхТиповДанных" свойством "НеПроверятьДополнительныеРеквизиты": true/false. Настройка доступна для тестов:

    - **[Тесты_ПроверкаСоставныхТиповДанных](#Тесты_ПроверкаСоставныхТиповДанных)**

<a id="markdown-Настройки_ОтборПоПрефиксу" name="Настройки_ОтборПоПрефиксу"></a>
+ **ОтборПоПрефиксу** - Признак, что будут проверяться только объекты с префиксом, указанным в параметре **"Префикс"**. Настройка задается в разделе "ИмяТеста" свойством "ОтборПоПрефиксу": true/false. Настройка доступна для тестов:

    - **[Тесты_ПроверкаПравНаЧтениеОбъектов](#Тесты_ПроверкаПравНаЧтениеОбъектов)**
    - **[Тесты_ПроверкаОсновныхФормОтчетов](#Тесты_ПроверкаОсновныхФормОтчетов)**
    - **[Тесты_ПроверкаХранилищаВариантовОтчетов](#Тесты_ПроверкаХранилищаВариантовОтчетов)**
    - **[Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный](#Тесты_ПроверкаРеквизитовДокументовКомментарийОтветственный)**
    - **[Тесты_ПроверкаРегламентныхЗаданий](#Тесты_ПроверкаРегламентныхЗаданий)**
    - **[Тесты_ПроверкаПравКУстаревшимОбъектам](#Тесты_ПроверкаПравКУстаревшимОбъектам)**
    - **[Тесты_ПроверкаСоставныхТиповДанных](#Тесты_ПроверкаСоставныхТиповДанных)**
    - **[Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных](#Тесты_ПроверкаСинонимаУстаревшихОбъектовМетаданных)**

<a id="markdown-Настройки_ХранилищеВариантовОтчетов" name="Настройки_ХранилищеВариантовОтчетов"></a>
+ **ХранилищеВариантовОтчетов** - Имя хранилища вариантов отчетов. Настройка задается в разделе "Тесты_ПроверкаХранилищаВариантовОтчетов" свойством "ХранилищеВариантовОтчетов": true/false. Настройка доступна для тестов:

    - **[Тесты_ПроверкаХранилищаВариантовОтчетов](#Тесты_ПроверкаХранилищаВариантовОтчетов)**

<a id="markdown-Настройки_ОбъектыМетаданных" name="Настройки_ОбъектыМетаданных"></a>
+ **ОбъектыМетаданных** - Список объектов метаданных для проверки. Настройка задается в разделе "Тесты_ПроверкаПравНаЧтениеОбъектовRLS" как список свойств структуры, где ключ - это имя объекта метаданных в единственном числе ("Документ", "Справочник"), а значение - это массив имен подчиненных объектов ("Справочник1", "Документ1", "Справочник1.ТабличнаяЧасть.Товары", "Документ1.Форма.ФормаДокумента" и т.д.) или строка с одним символом **"*"** (будут выбраны все объекты коллекции: все справочники, все документы и т.д.). Настройка доступна для тестов:

    - **[Тесты_ПроверкаПравНаЧтениеОбъектовRLS](#Тесты_ПроверкаПравНаЧтениеОбъектовRLS)**
   
<a id="markdown-Настройки_КаталогиВнешнихОтчетов" name="Настройки_КаталогиВнешнихОтчетов"></a> 
+ **КаталогиВнешнихОтчетов** - Список каталогов с внешними отчетами. Настройка задается в разделе "ИмяТеста" как массив строк с именами каталогов (можно указывать как относительный путь). Настройка доступна для тестов:
 
    - **[Тесты_ПроверкаОсновныхФормОтчетов](#Тесты_ПроверкаОсновныхФормОтчетов)**
    - **[Тесты_ПроверкаХранилищаВариантовОтчетов](#Тесты_ПроверкаХранилищаВариантовОтчетов)**
    - **[Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок](#Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок)**

<a id="markdown-Настройки_КаталогиВнешнихОбработок" name="Настройки_КаталогиВнешнихОбработок"></a> 
+ **КаталогиВнешнихОбработок** - Список каталогов с внешними обработкаим. Настройка задается в разделе "Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок" как массив строк с именами каталогов (можно указывать как относительный путь). Настройка доступна для тестов:
 
    - **[Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок](#Тесты_ПроверкаМакетовСКДВнешнихОтчетовОбработок)**