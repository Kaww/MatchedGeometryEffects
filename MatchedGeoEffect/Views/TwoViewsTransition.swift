import SwiftUI

struct TwoViewsTransition: View {
    
    @State private var isVertical = false

    var body: some View {
        ZStack {
            if isVertical {
                verticalView
            } else {
                horizontalView
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isVertical.toggle()
            }
        }
    }

    private var verticalView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundColor(.blue)

            Circle()
                .foregroundColor(.orange)
        }
        .overlay(Text("VIEW 2"))
    }

    private var horizontalView: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .foregroundColor(.blue)

            Circle()
                .foregroundColor(.orange)
        }
        .overlay(Text("VIEW 1"))
    }
}

struct TwoViewsTransition_Previews: PreviewProvider {
    static var previews: some View {
        TwoViewsTransition()
    }
}
