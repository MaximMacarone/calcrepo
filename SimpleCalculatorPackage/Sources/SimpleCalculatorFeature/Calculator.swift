import Foundation

/// Модель калькулятора для выполнения математических операций
public struct Calculator {
    private var currentValue: Double = 0
    private var previousValue: Double = 0
    private var operation: Operation?
    private var shouldResetDisplay: Bool = false
    
    public enum Operation: String, CaseIterable {
        case add = "+"
        case subtract = "-"
        case multiply = "×"
        case divide = "÷"
        case equals = "="
    }
    
    public init() {}
    
    /// Текущее значение калькулятора
    public var displayValue: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 10
        formatter.minimumFractionDigits = 0
        
        if let formatted = formatter.string(from: NSNumber(value: currentValue)) {
            return formatted
        }
        return "0"
    }
    
    /// Ввод числа
    public mutating func inputNumber(_ number: Double) {
        if shouldResetDisplay {
            currentValue = number
            shouldResetDisplay = false
        } else {
            if currentValue == 0 {
                currentValue = number
            } else {
                // Простая логика для добавления цифр
                let stringValue = String(currentValue)
                if !stringValue.contains(".") {
                    currentValue = currentValue * 10 + number
                } else {
                    let parts = stringValue.split(separator: ".")
                    let decimalPlaces = parts[1].count
                    currentValue = currentValue + number / pow(10, Double(decimalPlaces + 1))
                }
            }
        }
    }
    
    /// Установка операции
    public mutating func setOperation(_ operation: Operation) {
        if let previousOp = self.operation, !shouldResetDisplay {
            performCalculation()
        }
        
        previousValue = currentValue
        self.operation = operation
        shouldResetDisplay = true
    }
    
    /// Выполнение вычисления
    public mutating func performCalculation() {
        guard let operation = operation else { return }
        
        switch operation {
        case .add:
            currentValue = previousValue + currentValue
        case .subtract:
            currentValue = previousValue - currentValue
        case .multiply:
            currentValue = previousValue * currentValue
        case .divide:
            if currentValue != 0 {
                currentValue = previousValue / currentValue
            } else {
                // Деление на ноль
                currentValue = 0
            }
        case .equals:
            break
        }
        
        self.operation = nil
        shouldResetDisplay = true
    }
    
    /// Сброс калькулятора
    public mutating func clear() {
        currentValue = 0
        previousValue = 0
        operation = nil
        shouldResetDisplay = false
    }
    
    /// Получение текущего значения (для тестирования)
    public var value: Double {
        currentValue
    }
}

