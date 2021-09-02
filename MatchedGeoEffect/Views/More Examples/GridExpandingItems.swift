import SwiftUI

struct Item: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let color: Color
}

struct GridExpandingItems: View {
    private let items: [Item] = [
        Item(id: UUID().uuidString, title: "Item 1", subtitle: "I'm the first item", color: .blue.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 2", subtitle: "I'm the second item", color: .orange.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 3", subtitle: "I'm the third item", color: .red.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 4", subtitle: "I'm the fourth item", color: .green.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 5", subtitle: "I'm the fifth item", color: .yellow.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 6", subtitle: "I'm the sixth item", color: .pink.opacity(0.5)),
        Item(id: UUID().uuidString, title: "Item 7", subtitle: "I'm the seventh item", color: .purple.opacity(0.5))
    ]
    
    private let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    private let animation: Animation = .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1)
    
    private let titleId = "title"
    @Namespace private var titleNamespace

    private let subtitleId = "subtitle"
    @Namespace private var subtitleNamespace

    private let backgroundId = "background"
    @Namespace private var backgroundNamespace
    
    @State private var selectedItem: Item?
    
    var body: some View {
        if let item = selectedItem {
            ZStack {
                background(for: item)
                
                VStack(alignment: .leading, spacing: 50) {
                    HStack {
                        title(for: item)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(animation) {
                                selectedItem = nil
                            }
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                    }

                    Spacer()
                    
                    subtitle(for: item)
                    
                    Spacer()
                }
                .padding()
            }
            .padding(40)
        } else {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(items) { item in
                        itemView(for: item)
                            .onTapGesture {
                                withAnimation(animation) {
                                    selectedItem = item
                                }
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Expanding Items")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func itemView(for item: Item) -> some View {
        VStack {
            title(for: item)
            subtitle(for: item)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(
            background(for: item)
        )
    }
    
    private func title(for item: Item) -> some View {
        Text(item.title)
            .font(.title)
            .bold()
            .foregroundColor(.white)
            .matchedGeometryEffect(id: titleId + item.id, in: titleNamespace)
    }
    
    private func subtitle(for item: Item) -> some View {
        Text(item.subtitle)
            .bold()
            .foregroundColor(.white)
            .matchedGeometryEffect(id: subtitleId + item.id, in: subtitleNamespace)
    }
    
    private func background(for item: Item) -> some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(item.color)
            .matchedGeometryEffect(id: backgroundId + item.id, in: backgroundNamespace)
    }
}

struct GridExpandingItems_Previews: PreviewProvider {
    static var previews: some View {
        GridExpandingItems()
    }
}
