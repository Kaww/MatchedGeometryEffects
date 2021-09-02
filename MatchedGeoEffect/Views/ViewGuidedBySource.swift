import SwiftUI

struct ViewGuidedBySource: View {
    @State private var sources = [
        "Source 1",
        "Source 2",
        "Source 3"
    ]
    @State private var selectedSource = ""

    var body: some View {
        VStack {
            ForEach(sources, id: \.self) { source in
                buttonView(title: source)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.orange, lineWidth: 4)
        )
    }

    private func buttonView(title: String) -> some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedSource = title
            }
        }) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding(8)
        }
        .buttonStyle(PlainButtonStyle())

    }
}

struct ViewGuidedBySource_Previews: PreviewProvider {
    static var previews: some View {
        ViewGuidedBySource()
    }
}
