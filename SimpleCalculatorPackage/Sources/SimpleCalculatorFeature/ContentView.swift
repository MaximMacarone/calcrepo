import SwiftUI

/// Главный экран калькулятора
public struct ContentView: View {
    @State private var calculator = Calculator()
    @State private var displayText = "0"
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            // Дисплей
            HStack {
                Spacer()
                Text(calculator.displayValue)
                    .font(.system(size: 64, weight: .light))
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Кнопки
            VStack(spacing: 15) {
                // Первая строка: Очистка
                HStack(spacing: 15) {
                    CalculatorButton(
                        title: "C",
                        color: .gray,
                        action: {
                            calculator.clear()
                        }
                    )
                    CalculatorButton(
                        title: "±",
                        color: .gray,
                        action: {
                            // Инверсия знака (упрощенная версия)
                        }
                    )
                    CalculatorButton(
                        title: "%",
                        color: .gray,
                        action: {
                            // Процент (упрощенная версия)
                        }
                    )
                    CalculatorButton(
                        title: "÷",
                        color: .orange,
                        action: {
                            calculator.setOperation(.divide)
                        }
                    )
                }
                
                // Вторая строка
                HStack(spacing: 15) {
                    CalculatorButton(title: "7", action: { calculator.inputNumber(7) })
                    CalculatorButton(title: "8", action: { calculator.inputNumber(8) })
                    CalculatorButton(title: "9", action: { calculator.inputNumber(9) })
                    CalculatorButton(
                        title: "×",
                        color: .orange,
                        action: {
                            calculator.setOperation(.multiply)
                        }
                    )
                }
                
                // Третья строка
                HStack(spacing: 15) {
                    CalculatorButton(title: "4", action: { calculator.inputNumber(4) })
                    CalculatorButton(title: "5", action: { calculator.inputNumber(5) })
                    CalculatorButton(title: "6", action: { calculator.inputNumber(6) })
                    CalculatorButton(
                        title: "-",
                        color: .orange,
                        action: {
                            calculator.setOperation(.subtract)
                        }
                    )
                }
                
                // Четвертая строка
                HStack(spacing: 15) {
                    CalculatorButton(title: "1", action: { calculator.inputNumber(1) })
                    CalculatorButton(title: "2", action: { calculator.inputNumber(2) })
                    CalculatorButton(title: "3", action: { calculator.inputNumber(3) })
                    CalculatorButton(
                        title: "+",
                        color: .orange,
                        action: {
                            calculator.setOperation(.add)
                        }
                    )
                }
                
                // Пятая строка
                HStack(spacing: 15) {
                    CalculatorButton(
                        title: "0",
                        action: { calculator.inputNumber(0) }
                    )
                    .frame(maxWidth: .infinity)
                    CalculatorButton(title: ".", action: { /* Десятичная точка */ })
                    CalculatorButton(
                        title: "=",
                        color: .orange,
                        action: {
                            calculator.performCalculation()
                        }
                    )
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

/// Кнопка калькулятора
struct CalculatorButton: View {
    let title: String
    var color: Color = Color(.systemGray5)
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(color == .orange ? .white : .primary)
                .frame(width: 80, height: 80)
                .background(color)
                .cornerRadius(40)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
