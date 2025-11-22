import SwiftUI

/// Главный экран калькулятора
public struct ContentView: View {
    @State private var calculator = Calculator()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            // Фоновый градиент
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color(.systemGray6).opacity(0.3)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Spacer()
                
                // Дисплей с улучшенным дизайном
                VStack(alignment: .trailing, spacing: 8) {
                    Text(calculator.displayValue)
                        .font(.system(size: 72, weight: .light, design: .rounded))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal, 20)
                
                // Кнопки с улучшенным дизайном
                VStack(spacing: 16) {
                    // Первая строка: Очистка и операции
                    HStack(spacing: 16) {
                        CalculatorButton(
                            title: "C",
                            style: .function,
                            action: {
                                withAnimation(.spring(response: 0.3)) {
                                    calculator.clear()
                                }
                            }
                        )
                        CalculatorButton(
                            title: "±",
                            style: .function,
                            action: {
                                // Инверсия знака
                            }
                        )
                        CalculatorButton(
                            title: "%",
                            style: .function,
                            action: {
                                // Процент
                            }
                        )
                        CalculatorButton(
                            title: "÷",
                            style: .operation,
                            action: {
                                calculator.setOperation(.divide)
                            }
                        )
                    }
                    
                    // Вторая строка
                    HStack(spacing: 16) {
                        CalculatorButton(title: "7", style: .number, action: { calculator.inputNumber(7) })
                        CalculatorButton(title: "8", style: .number, action: { calculator.inputNumber(8) })
                        CalculatorButton(title: "9", style: .number, action: { calculator.inputNumber(9) })
                        CalculatorButton(
                            title: "×",
                            style: .operation,
                            action: {
                                calculator.setOperation(.multiply)
                            }
                        )
                    }
                    
                    // Третья строка
                    HStack(spacing: 16) {
                        CalculatorButton(title: "4", style: .number, action: { calculator.inputNumber(4) })
                        CalculatorButton(title: "5", style: .number, action: { calculator.inputNumber(5) })
                        CalculatorButton(title: "6", style: .number, action: { calculator.inputNumber(6) })
                        CalculatorButton(
                            title: "-",
                            style: .operation,
                            action: {
                                calculator.setOperation(.subtract)
                            }
                        )
                    }
                    
                    // Четвертая строка
                    HStack(spacing: 16) {
                        CalculatorButton(title: "1", style: .number, action: { calculator.inputNumber(1) })
                        CalculatorButton(title: "2", style: .number, action: { calculator.inputNumber(2) })
                        CalculatorButton(title: "3", style: .number, action: { calculator.inputNumber(3) })
                        CalculatorButton(
                            title: "+",
                            style: .operation,
                            action: {
                                calculator.setOperation(.add)
                            }
                        )
                    }
                    
                    // Пятая строка
                    HStack(spacing: 16) {
                        CalculatorButton(
                            title: "0",
                            style: .number,
                            action: { calculator.inputNumber(0) }
                        )
                        .layoutPriority(2)
                        
                        CalculatorButton(
                            title: ".",
                            style: .number,
                            action: {
                                // Десятичная точка
                            }
                        )
                        CalculatorButton(
                            title: "=",
                            style: .operation,
                            action: {
                                withAnimation(.spring(response: 0.3)) {
                                    calculator.performCalculation()
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

/// Стиль кнопки калькулятора
enum ButtonStyle {
    case number
    case operation
    case function
    
    var backgroundColor: Color {
        switch self {
        case .number:
            return Color(.systemGray5)
        case .operation:
            return .orange
        case .function:
            return Color(.systemGray4)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .number, .function:
            return .primary
        case .operation:
            return .white
        }
    }
}

/// Кнопка калькулятора с улучшенным дизайном
struct CalculatorButton: View {
    let title: String
    let style: ButtonStyle
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                    isPressed = false
                }
            }
            action()
        }) {
            Text(title)
                .font(.system(size: 36, weight: .medium, design: .rounded))
                .foregroundColor(style.foregroundColor)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 85)
                .background(style.backgroundColor)
                .cornerRadius(20)
                .shadow(
                    color: isPressed ? .clear : .black.opacity(0.15),
                    radius: isPressed ? 0 : 8,
                    x: 0,
                    y: isPressed ? 0 : 4
                )
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    ContentView()
}
