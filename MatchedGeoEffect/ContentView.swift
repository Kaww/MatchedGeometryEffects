import SwiftUI

/// Sources
/// The 3 Karin Prater's videos on geometry effects ->  https://www.youtube.com/watch?v=oy30a4zTdCs&t=205s

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Two views transition", destination: TwoViewsTransition())

                NavigationLink("View guided by source", destination: ViewGuidedBySource())

                NavigationLink("Limitations", destination: Limitations())

                NavigationLink("+ More examples", destination: OtherExamples())
            }
            .navigationTitle("Matched Geometries")
        }
    }
}

struct OtherExamples: View {
    var body: some View {
        List {
            NavigationLink("Pickers", destination: Pickers())
            NavigationLink("Card Drawer", destination: CardDrawer())

            NavigationLink("Unwrapping fields", destination: UnwrappingFields())

            NavigationLink("Apple music player", destination: AppleMusicPlayer())

            NavigationLink("Expanding items", destination: GridExpandingItems())

            NavigationLink("Some Layouts", destination: Layouts())

        }
        .navigationTitle("Other examples")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
