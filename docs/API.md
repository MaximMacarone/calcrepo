# SimpleCalculator API Documentation

## Overview

SimpleCalculator - это iOS приложение-калькулятор, построенное с использованием SwiftUI и Swift Package Manager.

## Modules

### SimpleCalculatorFeature

Основной модуль приложения, содержащий бизнес-логику и UI компоненты.

#### Calculator

Класс, реализующий логику калькулятора.

##### Methods

- `inputNumber(_ number: Int)` - Ввод числа
- `setOperation(_ operation: Calculator.Operation)` - Установка операции (add, subtract, multiply, divide)
- `performCalculation()` - Выполнение вычисления
- `clear()` - Очистка калькулятора

##### Properties

- `displayValue: String` - Текущее значение для отображения

#### ContentView

Главный SwiftUI view калькулятора.

##### Components

- `CalculatorButton` - Кнопка калькулятора с различными стилями (number, operation, function)

## Usage Example

```swift
import SimpleCalculatorFeature

let calculator = Calculator()
calculator.inputNumber(5)
calculator.setOperation(.add)
calculator.inputNumber(3)
calculator.performCalculation()
print(calculator.displayValue) // "8"
```

## Testing

Все компоненты покрыты unit-тестами в модуле `SimpleCalculatorFeatureTests`.

