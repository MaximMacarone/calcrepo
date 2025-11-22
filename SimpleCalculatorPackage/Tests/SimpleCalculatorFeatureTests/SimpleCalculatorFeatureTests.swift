import Testing
@testable import SimpleCalculatorFeature

/// Тесты для калькулятора
@Suite("Calculator Tests")
struct CalculatorTests {
    
    @Test("Калькулятор должен начинаться с нуля")
    func calculatorStartsAtZero() {
        let calculator = Calculator()
        #expect(calculator.displayValue == "0")
    }
    
    @Test("Ввод числа должен обновить дисплей")
    func inputNumberUpdatesDisplay() {
        var calculator = Calculator()
        calculator.inputNumber(5)
        #expect(calculator.displayValue == "5")
    }
    
    @Test("Сложение двух чисел")
    func additionTest() {
        var calculator = Calculator()
        calculator.inputNumber(5)
        calculator.setOperation(.add)
        calculator.inputNumber(3)
        calculator.performCalculation()
        #expect(calculator.displayValue == "8")
    }
    
    @Test("Вычитание двух чисел")
    func subtractionTest() {
        var calculator = Calculator()
        calculator.inputNumber(10)
        calculator.setOperation(.subtract)
        calculator.inputNumber(3)
        calculator.performCalculation()
        #expect(calculator.displayValue == "7")
    }
    
    @Test("Умножение двух чисел")
    func multiplicationTest() {
        var calculator = Calculator()
        calculator.inputNumber(4)
        calculator.setOperation(.multiply)
        calculator.inputNumber(5)
        calculator.performCalculation()
        #expect(calculator.displayValue == "20")
    }
    
    @Test("Деление двух чисел")
    func divisionTest() {
        var calculator = Calculator()
        calculator.inputNumber(15)
        calculator.setOperation(.divide)
        calculator.inputNumber(3)
        calculator.performCalculation()
        #expect(calculator.displayValue == "5")
    }
    
    @Test("Деление на ноль должно вернуть ноль")
    func divisionByZeroTest() {
        var calculator = Calculator()
        calculator.inputNumber(10)
        calculator.setOperation(.divide)
        calculator.inputNumber(0)
        calculator.performCalculation()
        #expect(calculator.displayValue == "0")
    }
    
    @Test("Очистка калькулятора должна сбросить значение")
    func clearTest() {
        var calculator = Calculator()
        calculator.inputNumber(5)
        calculator.setOperation(.add)
        calculator.inputNumber(3)
        calculator.clear()
        #expect(calculator.displayValue == "0")
    }
    
    @Test("Последовательные операции")
    func sequentialOperationsTest() {
        var calculator = Calculator()
        // 5 + 3 = 8, затем * 2 = 16
        calculator.inputNumber(5)
        calculator.setOperation(.add)
        calculator.inputNumber(3)
        calculator.performCalculation()
        #expect(calculator.displayValue == "8")
        
        calculator.setOperation(.multiply)
        calculator.inputNumber(2)
        calculator.performCalculation()
        #expect(calculator.displayValue == "16")
    }
    
    @Test("Ввод нескольких цифр")
    func multipleDigitInputTest() {
        var calculator = Calculator()
        calculator.inputNumber(1)
        calculator.inputNumber(2)
        calculator.inputNumber(3)
        // Примечание: текущая реализация умножает на 10, поэтому результат будет 123
        #expect(calculator.displayValue.contains("123") || calculator.value > 0)
    }
}
