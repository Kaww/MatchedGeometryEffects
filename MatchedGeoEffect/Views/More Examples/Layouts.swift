import SwiftUI

struct Layouts: View {
    var body: some View {
        VStack {
            Text("Layouts")
                .font(.title)
            
            HStack {
                VStack {
                    LayoutSwap()
                    LayoutSwap()
                }
                VStack {
                    LayoutSwap()
                    LayoutSwap()
                }
            }
        }
    }
}

struct LayoutSwap: View {
    private let rectangle = "rectangle"
    private let circle = "circle"
    @Namespace private var ns
    
    @State private var isVertical = false
    
    var body: some View {
        VStack {
            if isVertical {
                VStack {
                    content
                }
            } else {
                HStack {
                    content
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isVertical.toggle()
            }
        }
    }
    
    var content: some View {
        Group {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .matchedGeometryEffect(id: rectangle, in: ns)
            Circle()
                .matchedGeometryEffect(id: circle, in: ns)
        }
    }
}

struct Layouts_Previews: PreviewProvider {
    static var previews: some View {
        Layouts()
    }
}
