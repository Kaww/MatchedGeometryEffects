import SwiftUI

struct Toto: View {

    @Namespace private var namespace

    private let titleId = "title"
    private let backgroundId = "background"

    @State private var condition: Bool = false

    var body: some View {
        VStack {
            if condition {
                VStack {
                    Text("Etat 2")
                        .matchedGeometryEffect(id: titleId, in: namespace)

                    Color(.black)
                        .matchedGeometryEffect(id: backgroundId, in: namespace)
                }
            } else {
                HStack {
                    Text("Etat 1")
                        .matchedGeometryEffect(id: titleId, in: namespace)

                    Color(.black)
                        .matchedGeometryEffect(id: backgroundId, in: namespace)
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                condition.toggle()
            }
        }
    }
}

struct Toto_Previews: PreviewProvider {
    static var previews: some View {
        Toto()
    }
}
