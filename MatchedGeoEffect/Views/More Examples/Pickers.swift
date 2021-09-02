import SwiftUI

struct Pickers: View {
    @State private var choices: [String] = [
        "Hot-dog",
        "Cheeseburger",
        "Salad",
        "Scrambled eggs"
    ]
    @State private var selectedChoiced: String = "Cheeseburger"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                VerticalBallPicker(choices: choices, selected: $selectedChoiced)
                Divider()
                HorizontalUnderlinePicker(choices: choices, selected: $selectedChoiced)
                Divider()
                DayPicker()
            }
        }
    }
}

// MARK: Vertical Picker

struct VerticalBallPicker: View {
    let choices: [String]
    @Binding var selected: String

    private let size: CGFloat = 25
    @Namespace private var verticalPickerNamespace

    var body: some View {
        VStack {
            ForEach(choices, id: \.self) { item in
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        selected = item
                    }
                }) {
                    HStack {
                        Circle()
                            .stroke(selected == item ? Color.accentColor : Color.gray)
                            .frame(width: size, height: size)
                            .matchedGeometryEffect(id: item, in: verticalPickerNamespace, properties: .frame)

                        Text(item)
                            .bold()
                            .foregroundColor(Color(white: selected == item ? 0.1 : 0.5))
                    }
                }
            }
        }
        .overlay(
            Circle()
                .fill(Color.accentColor)
                .matchedGeometryEffect(id: selected, in: verticalPickerNamespace, properties: .frame, isSource: false)
                .frame(width: size, height: size)

        )
    }
}

// MARK: Horizontal Picker

struct HorizontalUnderlinePicker: View {
    let choices: [String]
    @Binding var selected: String
    
    @Namespace private var horizontalPickerNamespace
    
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) { item in
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        selected = item
                    }
                }) {
                    Text(item)
                        .font(.system(size: 15))
                        .foregroundColor(Color(white: selected == item ? 0.1 : 0.5))
                        .padding(.bottom, 5)
                        .background(
                            Color.clear
                                .frame(height: 3)
                                .matchedGeometryEffect(id: item, in: horizontalPickerNamespace, properties: .frame, isSource: true)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        )
                }
            }
        }
        .overlay(
            Color(white: 0.1)
                .matchedGeometryEffect(id: selected, in: horizontalPickerNamespace, properties: .frame, isSource: false)
        )
    }
}

// MARK: Weekday Picker

struct DayPicker: View {
    @Namespace private var dayPickerNamespace

    @State private var selectedDay: String = "Monday"
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                day("Monday")
                day("Tuesday")
            }
            
            HStack(spacing: 20) {
                day("Wednesday")
                day("Thursday")
                day("Friday")
            }
            
            HStack(spacing: 20) {
                day("Saturday")
                day("Sunday")
            }
        }
        .font(.title2)
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.blue, lineWidth: 2.5)
                .matchedGeometryEffect(id: selectedDay, in: dayPickerNamespace, isSource: false)
        )
    }
    
    private func day(_ day: String) -> some View {
        Text(day)
            .foregroundColor(Color.blue)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.blue.opacity(0.1))
            )
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    selectedDay = day
                }
            }
            .matchedGeometryEffect(id: day, in: dayPickerNamespace)
    }
}

struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        Pickers()
    }
}
