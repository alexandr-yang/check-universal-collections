﻿
#Область ИнтерфейсПлагина

// Описание плагина 
////
Функция ОписаниеПлагина(ТипыПлагинов) Экспорт 
	
	Результат = Новый Структура;
	Результат.Вставить("Тип", ТипыПлагинов.Утилита);
	Результат.Вставить("Идентификатор", Метаданные().Имя);
	Результат.Вставить("Представление", "Набор утверждений для проверки универсальных коллекций");
	Результат.Вставить("Версия", "1.0.0");
	Результат.Вставить("Автор", "Александр Янг");
	Результат.Вставить("Репозиторий", "https://github.com/alexandr-yang/check-universal-collections");
	
	Возврат Новый ФиксированнаяСтруктура(Результат);
	
КонецФункции

// Инициализация плагина 
////
Процедура Инициализация(Параметры) Экспорт 
	
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

#Область Массивы_ФиксированыеМассивы 

// Массивы идентичны 
//
// Параметры:
//   Массив1 (Массив / ФиксированныйМассив) - Массив 1
//   Массив2 (Массив / ФиксированныйМассив) - Массив 2
//   Сортировать (Булево) - Сортировать массив и вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивыИдентичны(Знач Массив1, Знач Массив2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 

	Результат = СравнитьУниверсальныеКоллекции(Массив1, Массив2, Сортировать);
		
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Сравниваемые массивы не идентичны, а хотели, чтобы были идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Массивы не идентичны 
//
// Параметры:
//   Массив1 (Массив / ФиксированныйМассив) - Массив 1
//   Массив2 (Массив / ФиксированныйМассив) - Массив 2
//   Сортировать (Булево) - Сортировать массив и вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивыНеИдентичны(Знач Массив1, Знач Массив2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СравнитьУниверсальныеКоллекции(Массив1, Массив2, Сортировать);	
	
	Если Результат Тогда
		СообщениеОбОшибке = "Сравниваемые массивы идентичны, а хотели, чтобы были не идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Массив пустой
//
// Параметры:
//   Массив (Массив / ФиксированныйМассив) - Массив
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивПустой(Массив, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Массив.Количество() = 0;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Массив не пустой, а хотели, чтобы был пустой.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Массив не пустой
//
// Параметры:
//   Массив (Массив / ФиксированныйМассив) - Массив
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивНеПустой(Массив, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Массив.Количество() = 0;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Массив пустой, а хотели, чтобы был не пустой.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Массив содержит 
//
// Параметры:
//   Массив (Массив / ФиксированныйМассив) - Массив
//   Значение (Произвольный) - Значение для поиска в массиве
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивСодержит(Массив, Значение, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Массив.Найти(Значение) = Неопределено;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Массив не содержит элемент, а хотели, чтобы содержал.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Массив не содержит 
//
// Параметры:
//   Массив (Массив / ФиксированныйМассив) - Массив
//   Значение (Произвольный) - Значение для поиска в массиве
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура МассивНеСодержит(Массив, Значение, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Массив.Найти(Значение) = Неопределено;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Массив содержит элемент, а хотели, чтобы не содержал.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;	
	
КонецПроцедуры

#КонецОбласти

#Область Структуры_ФиксированыеСтруктуры

// Структуры идентичны 
//
// Параметры:
//   Структура1 (Структура / ФиксированнаяСтруктура) - Структура 1
//   Структура2 (Структура / ФиксированнаяСтруктура) - Структура 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктурыИдентичны(Знач Структура1, Знач Структура2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СравнитьУниверсальныеКоллекции(Структура1, Структура2, Сортировать);
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Сравниваемые структуры не идентичны, а хотели, чтобы были идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Структуры не идентичны 
//
// Параметры:
//   Структура1 (Структура / ФиксированнаяСтруктура) - Структура 1
//   Структура2 (Структура / ФиксированнаяСтруктура) - Структура 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктурыНеИдентичны(Знач Структура1, Знач Структура2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СравнитьУниверсальныеКоллекции(Структура1, Структура2, Сортировать);
	
	Если Результат Тогда
		СообщениеОбОшибке = "Сравниваемые структуры не идентичны, а хотели, чтобы были идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Структура пустая 
//
// Параметры:
//   Структура (Структура / ФиксированнаяСтруктура) - Структура
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктураПустая(Структура, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Структура.Количество() = 0;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Структура не пустая, а хотели, чтобы была пустая.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Структура не пустая 
//
// Параметры:
//   Структура (Структура / ФиксированнаяСтруктура) - Структура
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктураНеПустая(Структура, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Структура.Количество() = 0;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Структура пустая, а хотели, чтобы была не пустая.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Структура содержит
//
// Параметры:
//   Структура (Структура / ФиксированнаяСтруктура) - Структура
//   Ключ (Строка) - Ключ для поиска в структуре
//   Значение (Произвольный / Неопределено) - Значение для поиска в структуре
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктураСодержит(Структура, Ключ, Значение = Неопределено, ДопСообщениеОбОшибки = "") Экспорт 
	
	НайденноеЗначение = Неопределено;
	Результат = Структура.Свойство(Ключ, НайденноеЗначение);
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Структура не содержит ключ, а хотели, чтобы содержала.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);
	Иначе
		Если Значение <> Неопределено И НайденноеЗначение <> Значение Тогда
			СообщениеОбОшибке = "Структура не содержит ключ и значение, а хотели, чтобы содержала.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

// Структура содержит
//
// Параметры:
//   Структура (Структура / ФиксированнаяСтруктура) - Структура
//   Ключ (Строка) - Ключ для поиска в структуре
//   Значение (Произвольный / Неопределено) - Значение для поиска в структуре
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СтруктураНеСодержит(Структура, Ключ, Значение = Неопределено, ДопСообщениеОбОшибки = "") Экспорт 
	
	НайденноеЗначение = Неопределено;
	Результат = Структура.Свойство(Ключ, НайденноеЗначение);
	
	Если Результат Тогда
		Если Значение = Неопределено Тогда
			СообщениеОбОшибке = "Структура содержит ключ, а хотели, чтобы не содержала.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);
		ИначеЕсли НайденноеЗначение = Значение Тогда
			СообщениеОбОшибке = "Структура содержит ключи и значение, а хотели, чтобы не содержала.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область Соответствия_ФиксированыеСоответствия

// Соответствия идентичны 
//
// Параметры:
//   Соответствие1 (Соответствие / ФиксированноеСоответствие) - Соответствие 1
//   Соответствие2 (Соответствие / ФиксированноеСоответствие) - Соответствие 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствияИдентичны(Знач Соответствие1, Знач Соответствие2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт  
	
	Результат = СравнитьУниверсальныеКоллекции(Соответствие1, Соответствие2, Сортировать);
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Сравниваемые соответствия не идентичны, а хотели, чтобы были идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Соответствия не идентичны 
//
// Параметры:
//   Соответствие1 (Соответствие / ФиксированноеСоответствие) - Соответствие 1
//   Соответствие2 (Соответствие / ФиксированноеСоответствие) - Соответствие 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствияНеИдентичны(Знач Соответствие1, Знач Соответствие2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт  
	
	Результат = СравнитьУниверсальныеКоллекции(Соответствие1, Соответствие2, Сортировать);
	
	Если Результат Тогда
		СообщениеОбОшибке = "Сравниваемые соответствия идентичны, а хотели, чтобы были не идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Соответствие пустое 
//
// Параметры:
//   Соответствие (Соответствие / ФиксированноеСоответствие) - Соответствие
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствиеПустое(Соответствие, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Соответствие.Количество() = 0;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Соответствие не пустое, а хотели, чтобы было пустое.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Соответствие не пустое 
//
// Параметры:
//   Соответствие (Соответствие / ФиксированноеСоответствие) - Соответствие
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствиеНеПустое(Соответствие, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = Соответствие.Количество() = 0;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Соответствие пустое, а хотели, чтобы было не пустое.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Соответствие содержит
//
// Параметры:
//   Соответствие (Соответствие / ФиксированноеСоответствие) - Соответствие
//   Ключ (Строка) - Ключ для поиска в соответствии
//   Значение (Произвольный / Неопределено) - Значение для поиска в соответствии
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствиеСодержит(Соответствие, Ключ, Значение = Неопределено, ДопСообщениеОбОшибки = "") Экспорт 
	
	НайденноеЗначение = Соответствие.Получить(Ключ);
	Результат = НайденноеЗначение = Неопределено;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Соответствие не содержит ключ, а хотели, чтобы содержало.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);
	Иначе
		Если Значение <> Неопределено И НайденноеЗначение <> Значение Тогда
			СообщениеОбОшибке = "Соответствие не содержит ключи и значение, а хотели, чтобы содержало.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

// Соответствие не содержит
//
// Параметры:
//   Соответствие (Соответствие / ФиксированноеСоответствие) - Соответствие
//   Ключ (Строка) - Ключ для поиска в соответствии
//   Значение (Произвольный / Неопределено) - Значение для поиска в соответствии
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СоответствиеНеСодержит(Соответствие, Ключ, Значение = Неопределено, ДопСообщениеОбОшибки = "") Экспорт 
	
	НайденноеЗначение = Соответствие.Получить(Ключ);
	Результат = НайденноеЗначение = Неопределено;
	
	Если НЕ Результат Тогда
		Если Значение = Неопределено Тогда
			СообщениеОбОшибке = "Соответствие содержит ключ, а хотели, чтобы не содержало.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
		ИначеЕсли НайденноеЗначение = Значение Тогда
			СообщениеОбОшибке = "Соответствие содержит ключи и значение, а хотели, чтобы не содержало.";
			ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);		
		КонецЕсли
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СпискиЗначений

// Списки значений идентичны 
//
// Параметры:
//   СписокЗначений1 (СписокЗначений) - Список значений 1
//   СписокЗначений2 (СписокЗначений) - Список значений 2
//   Сортировать (Булево) - Сортировать списки значений и вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СпискиЗначенийИдентичны(Знач СписокЗначений1, Знач СписокЗначений2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СравнитьУниверсальныеКоллекции(СписокЗначений1, СписокЗначений2, Сортировать);
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Сравниваемые списки значений не идентичны, а хотели, чтобы были идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Списки значений не идентичны 
//
// Параметры:
//   СписокЗначений1 (СписокЗначений) - Список значений 1
//   СписокЗначений2 (СписокЗначений) - Список значений 2
//   Сортировать (Булево) - Сортировать списки значений и вложенные данные перед сравнением
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СпискиЗначенийНеИдентичны(Знач СписокЗначений1, Знач СписокЗначений2, Сортировать = Ложь, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СравнитьУниверсальныеКоллекции(СписокЗначений1, СписокЗначений2, Сортировать);
	
	Если Результат Тогда
		СообщениеОбОшибке = "Сравниваемые списки значений идентичны, а хотели, чтобы были не идентичны.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Список значений пустой
//
// Параметры:
//   СписокЗначений (СписокЗначений) - Список значений
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СписокЗначенийПустой(СписокЗначений, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СписокЗначений.Количество() = 0;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Список значений не пустой, а хотели, чтобы был пустой.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Список значений не пустой
//
// Параметры:
//   СписокЗначений (СписокЗначений) - Список значений
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СписокЗначенийНеПустой(СписокЗначений, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СписокЗначений.Количество() = 0;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Список значений пустой, а хотели, чтобы был не пустой.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры 

// Список значений содержит 
//
// Параметры:
//   СписокЗначений (СписокЗначений) - Список значений
//   Значение (Произвольный) - Значение для поиска в списке значений
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СписокЗначенийСодержит(СписокЗначений, Значение, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СписокЗначений.НайтиПоЗначению(Значение) = Неопределено;
	
	Если Результат Тогда
		СообщениеОбОшибке = "Список значений не содержит элемент, а хотели, чтобы содержал.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;
	
КонецПроцедуры

// Список значений не содержит 
//
// Параметры:
//   СписокЗначений (СписокЗначений) - Список значений
//   Значение (Произвольный) - Значение для поиска в списке значений
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибке 
////
Процедура СписокЗначенийНеСодержит(СписокЗначений, Значение, ДопСообщениеОбОшибки = "") Экспорт 
	
	Результат = СписокЗначений.НайтиПоЗначению(Значение) = Неопределено;
	
	Если НЕ Результат Тогда
		СообщениеОбОшибке = "Список значений содержит элемент, а хотели, чтобы не содержал.";
		ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки);	
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыФункции

// Это универсальная коллекция
//
// Параметры:
//   Значение (Произвольный) - Произвольное значение

// Возвращаемое значение: 
//   Булево
////
Функция ЭтоУниверсальнаяКоллекция(Значение) 
	
	Возврат ТипЗнч(Значение) = Тип("Массив") ИЛИ
			ТипЗнч(Значение) = Тип("ФиксированныйМассив") ИЛИ
			ТипЗнч(Значение) = Тип("Структура") ИЛИ
			ТипЗнч(Значение) = Тип("ФиксированнаяСтруктура") ИЛИ
			ТипЗнч(Значение) = Тип("Соответствие") ИЛИ 
			ТипЗнч(Значение) = Тип("ФиксированноеСоответствие") ИЛИ
			ТипЗнч(Значение) = Тип("СписокЗначений");
				
КонецФункции

// Это фиксированная универсальная коллекция
//
// Параметры:
//   Значение (Произвольный) - Произвольное значение

// Возвращаемое значение: 
//   Булево
////
Функция ЭтоФиксированаяКоллекция(Значение) 
	
	Возврат ТипЗнч(Значение) = Тип("ФиксированныйМассив") ИЛИ
			ТипЗнч(Значение) = Тип("ФиксированнаяСтруктура") ИЛИ
			ТипЗнч(Значение) = Тип("ФиксированноеСоответствие");
			
КонецФункции

// Сравнить универсальные коллекции
//   Коллекция1 (Массив / ФиксированныйМассив / Структура / ФиксированнаяСтруктура / Соответствие / ФиксированноеСоответствие / СписокЗначений) - Коллекция 1
//   Коллекция2 (Массив / ФиксированныйМассив / Структура / ФиксированнаяСтруктура / Соответствие / ФиксированноеСоответствие / СписокЗначений) - Коллекция 2
//   Сортировать (Булево) - Сортировать коллекции и вложенные данные перед сравнением
////
Функция СравнитьУниверсальныеКоллекции(Коллекция1, Коллекция2, Сортировать) 
	
	Если ТипЗнч(Коллекция1) <> ТипЗнч(Коллекция2) Тогда
		Возврат Ложь;	
	КонецЕсли;
	
	Если Коллекция1.Количество() <> Коллекция2.Количество() Тогда
		Возврат Ложь;	
	КонецЕсли;
	
	Если ТипЗнч(Коллекция1) = Тип("Массив") ИЛИ
		 ТипЗнч(Коллекция1) = Тип("ФиксированныйМассив") Тогда
		Возврат СравнитьМассивы(Коллекция1, Коллекция2, Сортировать);
	ИначеЕсли ТипЗнч(Коллекция1) = Тип("Структура") ИЛИ
			  ТипЗнч(Коллекция1) = Тип("ФиксированнаяСтруктура") Тогда
		Возврат СравнитьСтруктуры(Коллекция1, Коллекция2, Сортировать);
	ИначеЕсли ТипЗнч(Коллекция1) = Тип("Соответствие") ИЛИ 
			  ТипЗнч(Коллекция1) = Тип("ФиксированноеСоответствие") Тогда
		Возврат СравнитьСоответствия(Коллекция1, Коллекция2, Сортировать);
	ИначеЕсли ТипЗнч(Коллекция1) = Тип("СписокЗначений") Тогда
		Возврат СравнитьСпискиЗначений(Коллекция1, Коллекция2, Сортировать);
	Иначе
		Возврат Ложь;	
	КонецЕсли;
	
КонецФункции

// Сравнить массивы
//   Массив1 (Массив / ФиксированныйМассив) - Массив 1
//   Массив2 (Массив / ФиксированныйМассив) - Массив 2
//   Сортировать (Булево) - Сортировать массивы и вложенные данные перед сравнением
////
Функция СравнитьМассивы(Массив1, Массив2, Сортировать) 
		
	Если Сортировать И НЕ ЭтоФиксированаяКоллекция(Массив1) Тогда
		СортироватьМассив(Массив1);
		СортироватьМассив(Массив2);
	КонецЕсли;
	
	Для Сч = 0 По Массив1.Количество() - 1 Цикл
		ЭлементМассива1 = Массив1[Сч];
		ЭлементМассива2 = Массив2[Сч];
		
		Если ТипЗнч(ЭлементМассива1) <> ТипЗнч(ЭлементМассива2) Тогда
			Возврат Ложь;	
		КонецЕсли;
		
		Если ЭтоУниверсальнаяКоллекция(ЭлементМассива1) Тогда 
			Результат = СравнитьУниверсальныеКоллекции(ЭлементМассива1, ЭлементМассива2, Сортировать);
			
			Если НЕ Результат Тогда
				Возврат Ложь;	
			КонецЕсли;
		Иначе
			Если ЭлементМассива1 <> ЭлементМассива2 Тогда
				Возврат Ложь;
			КонецЕсли;	
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

// Сравнить структуры
//   Структура1 (Структура / ФиксированнаяСтруктура) - Структура 1
//   Структура1 (Структура / ФиксированнаяСтруктура) - Структура 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
////
Функция СравнитьСтруктуры(Структура1, Структура2, Сортировать) 
		
	Для Каждого ЭлементСтруктуры1 Из Структура1 цикл
		ЭлементСтруктуры2 = Неопределено;
		
		Если НЕ Структура2.Свойство(ЭлементСтруктуры1.Ключ, ЭлементСтруктуры2) Тогда
			Возврат Ложь;	
		КонецЕсли;
		
		Если ЭтоУниверсальнаяКоллекция(ЭлементСтруктуры1.Значение) Тогда 
			Результат = СравнитьУниверсальныеКоллекции(ЭлементСтруктуры1.Значение, ЭлементСтруктуры2, Сортировать);
			
			Если НЕ Результат Тогда
				Возврат Ложь;	
			КонецЕсли;
		Иначе
			Если ЭлементСтруктуры1.Значение <> ЭлементСтруктуры2 Тогда
				Возврат Ложь;	
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

// Сравнить соответствия
//   Соответствие1 (Соответствие / ФиксированноеСоответствие) - Соответствие 1
//   Соответствие2 (Соответствие / ФиксированноеСоответствие) - Соответствие 2
//   Сортировать (Булево) - Сортировать вложенные данные перед сравнением
////
Функция СравнитьСоответствия(Соответствие1, Соответствие2, Сортировать) 
		
	Для Каждого ЭлементСоответствие1 Из Соответствие1 цикл
		ЭлементСоответствие2 = Соответствие2.Получить(ЭлементСоответствие1.Ключ);
		
		Если ЭлементСоответствие2 = Неопределено Тогда
			Возврат Ложь;	
		КонецЕсли;
		
		Если ЭтоУниверсальнаяКоллекция(ЭлементСоответствие1.Значение) Тогда 
			Результат = СравнитьУниверсальныеКоллекции(ЭлементСоответствие1.Значение, ЭлементСоответствие2, Сортировать);
			
			Если НЕ Результат Тогда
				Возврат Ложь;	
			КонецЕсли;
		Иначе
			Если ЭлементСоответствие1.Значение <> ЭлементСоответствие2 Тогда
				Возврат Ложь;	
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

// Сравнить списки значений
//   СписокЗначений1 (СписокЗначений) - Список значений 1
//   СписокЗначений2 (СписокЗначений) - Список значений 2
//   Сортировать (Булево) - Сортировать списки значений и вложенные данные еред сравнением
////
Функция СравнитьСпискиЗначений(СписокЗначений1, СписокЗначений2, Сортировать) 
		
	Если Сортировать Тогда
		СписокЗначений1.СортироватьПоЗначению();
		СписокЗначений2.СортироватьПоЗначению();
	КонецЕсли;
	
	Для Сч = 0 По СписокЗначений1.Количество() - 1 Цикл
		ЭлементСписка1 = СписокЗначений1[Сч];
		ЭлементСписка2 = СписокЗначений2[Сч];

		Если ТипЗнч(ЭлементСписка1.Значение) <> ТипЗнч(ЭлементСписка2.Значение) Тогда
			Возврат Ложь;	
		КонецЕсли;
		
		Если ЭтоУниверсальнаяКоллекция(ЭлементСписка1.Значение) Тогда 
			Результат = СравнитьУниверсальныеКоллекции(ЭлементСписка1.Значение, ЭлементСписка2.Значение, Сортировать);
			
			Если НЕ Результат Тогда
				Возврат Ложь;	
			КонецЕсли;
		Иначе
			Если ЭлементСписка1.Значение <> ЭлементСписка2.Значение ИЛИ
				 ЭлементСписка1.Пометка  <> ЭлементСписка2.Пометка Тогда
				Возврат Ложь;
			КонецЕсли;	
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

// Сортировать массив
//   Массив (Массив) - Массив данных
////
Процедура СортироватьМассив(Массив) 
	
	СписокЗначений = Новый СписокЗначений;
	СписокЗначений.ЗагрузитьЗначения(Массив); 
	СписокЗначений.СортироватьПоЗначению(НаправлениеСортировки.Возр);
	Массив = СписокЗначений.ВыгрузитьЗначения();
	
КонецПроцедуры

// Вызвать ошибку проверки
//   СообщениеОбОшибке (Строка) - Сообщение об ошибке
//   ДопСообщениеОбОшибки (Строка) - Дополнительное сообщение об ошибки
////
Процедура ВызватьОшибкуПроверки(СообщениеОбОшибке, ДопСообщениеОбОшибки = "") 
		
	ВызватьИсключение "[Failed] " + СообщениеОбОшибке + 
					  ?(ДопСообщениеОбОшибки = "", "", Символы.ПС) + ДопСообщениеОбОшибки;
	
КонецПроцедуры

#КонецОбласти
