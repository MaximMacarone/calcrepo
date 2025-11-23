# Архитектура проекта SimpleCalculator

## Обзор

SimpleCalculator использует модульную архитектуру на основе Swift Package Manager (SPM) с разделением на приложение-оболочку и основной функциональный модуль.

## Структура проекта

```
SimpleCalculator/
├── SimpleCalculator.xcworkspace/     # Workspace для Xcode
├── SimpleCalculator.xcodeproj/       # Проект приложения-оболочки
├── SimpleCalculator/                 # Точка входа приложения
│   ├── SimpleCalculatorApp.swift     # @main entry point
│   └── Assets.xcassets/              # Ресурсы
├── SimpleCalculatorPackage/          # Основной функциональный модуль
│   ├── Package.swift                 # Конфигурация SPM пакета
│   ├── Sources/
│   │   └── SimpleCalculatorFeature/
│   │       ├── Calculator.swift      # Бизнес-логика
│   │       └── ContentView.swift     # UI компоненты
│   └── Tests/
│       └── SimpleCalculatorFeatureTests/
│           └── SimpleCalculatorFeatureTests.swift
└── Config/                           # Конфигурационные файлы
    ├── Shared.xcconfig
    ├── Debug.xcconfig
    └── Release.xcconfig
```

## Архитектурные принципы

### Model-View (MV)

Проект использует упрощенную архитектуру Model-View без ViewModel:

- **Model**: `Calculator` - содержит всю бизнес-логику
- **View**: `ContentView` - SwiftUI представление, использующее `@State` для хранения модели

### Разделение ответственности

1. **SimpleCalculator (App Shell)**
   - Точка входа приложения
   - Конфигурация и ресурсы
   - Минимальная логика

2. **SimpleCalculatorFeature (SPM Package)**
   - Вся бизнес-логика
   - UI компоненты
   - Unit-тесты

### Преимущества такой архитектуры

- **Модульность**: Основной код изолирован в SPM пакете
- **Тестируемость**: Легко тестировать изолированные компоненты
- **Переиспользование**: Пакет можно использовать в других проектах
- **Простота**: Минимальная сложность для небольшого проекта

## Потоки данных

```
User Input → ContentView → Calculator → displayValue → ContentView → UI Update
```

1. Пользователь нажимает кнопку
2. `ContentView` вызывает метод `Calculator`
3. `Calculator` обновляет внутреннее состояние
4. `displayValue` обновляется
5. SwiftUI автоматически обновляет UI

## Тестирование

Все тесты находятся в `SimpleCalculatorPackage/Tests/` и покрывают:
- Базовые математические операции
- Обработку ошибок (деление на ноль)
- Сброс состояния
- Последовательные операции

## CI/CD

Проект использует GitHub Actions для:
- Автоматического тестирования
- Сборки приложения
- Генерации документации
- Автоматического merge PR

