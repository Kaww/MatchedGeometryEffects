import SwiftUI

struct UnwrappingFields: View {
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            InputText(title: "Firstname", text: "Kawrantin", isEditing: isEditing)
            
            InputText(title: "Lastname", text: "LE GOFF", isEditing: isEditing)
            
            InputText(title: "City", text: "Paris", isEditing: isEditing)
            
            Button(action: {
                withAnimation(.spring()) {
                    isEditing.toggle()
                }
            }) {
                Text(isEditing ? "Confirm" : "Edit")
                    .font(.headline)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding(.top, 50)
        .padding()
        .navigationTitle("Unwrapping fields")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputText: View {
    @Namespace private var animation
    @Namespace private var bg
    @Namespace private var head
    
    let title: String
    let text: String
    let isEditing: Bool
    
    var body: some View {
        if isEditing {
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .matchedGeometryEffect(id: "head", in: head)
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(white: 0.9))
                    .frame(height: 40)
                    .matchedGeometryEffect(id: "bg", in: bg)
                    .overlay(
                        HStack {
                            Text(text)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .matchedGeometryEffect(id: "title", in: animation)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    )
            }
        } else {
            ZStack(alignment: .topLeading) {
                Text(title)
                    .bold()
                    .matchedGeometryEffect(id: "head", in: head)
                    .opacity(0)
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(white: 0.9))
                    .frame(height: 0)
                    .matchedGeometryEffect(id: "bg", in: bg)
                    .opacity(0)

                HStack {
                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .matchedGeometryEffect(id: "title", in: animation)
                        .padding(.leading, 0)
                    
                    Spacer()
                }
            }
        }
    }
}

struct UnwrappingFields_Previews: PreviewProvider {
    static var previews: some View {
        UnwrappingFields()
    }
}
