import SwiftUI

struct CardDrawer: View {
    @State private var colors = [
        Color.blue,
        Color.orange,
        Color.green
    ]
    @State private var selectedColor: Color?

    @Namespace private var namespace
    private var colorId = "color"

    var body: some View {
        VStack {
            ZStack {
                ForEach(colors, id: \.self) { color in
                    if color == selectedColor {
                        color
                            .matchedGeometryEffect(id: "colorId-\(color.description)", in: namespace)
                            .aspectRatio(contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedColor = nil
                                }
                            }
                    }
                }
            }

            Spacer()

            HStack {
                ForEach(colors, id: \.self) { color in
                    if color != selectedColor {
                        color
                            .matchedGeometryEffect(id: "colorId-\(color.description)", in: namespace)
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedColor = color
                                }
                            }
                    }
                }
            }
        }
    }
}

struct CardDrawer_Previews: PreviewProvider {
    static var previews: some View {
        CardDrawer()
    }
}
