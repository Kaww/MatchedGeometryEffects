import SwiftUI

struct Limitations: View {

    @State private var group1State = false

    var body: some View {
        VStack(spacing: 50) {
            group1
            group2
        }
        .padding()
    }

    // MARK: Group1

    private var group1: some View {
        HStack {
            if group1State {
                Spacer()

                VStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundColor(.blue)

                    Circle()
                        .foregroundColor(.orange)
                }
                .frame(width: 100)
            } else {
                VStack {
                    Circle()
                        .foregroundColor(.orange)

                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundColor(.blue)
                }
                .frame(width: 100)

                Spacer()
            }
        }
        .frame(height: 300)
        .onTapGesture {
            withAnimation(.spring()) {
                group1State.toggle()
            }
        }
    }

    // MARK: Group2

    @State private var group2State = false

    private var group2: some View {
        HStack {
            if group2State {
                Spacer()

                VStack {
                    group2Text
                        .font(.title)

                    Spacer()
                }
            } else {
                VStack {
                    Spacer()

                    group2Text
                        .font(.subheadline)
                }

                Spacer()
            }
        }
        .frame(height: 100)
        .onTapGesture {
            withAnimation(.spring()) {
                group2State.toggle()
            }
        }
    }

    private var group2Text: some View {
        Text("Hello world")
    }
}

struct Limitations_Previews: PreviewProvider {
    static var previews: some View {
        Limitations()
    }
}
