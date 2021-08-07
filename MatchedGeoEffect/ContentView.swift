//
//  ContentView.swift
//  MatchedGeoEffect
//
//  Created by KAWRANTIN LE GOFF on 05/08/2021.
//

import SwiftUI

/// Sources
/// The 3 Karin Prater's videos on geometry effects ->  https://www.youtube.com/watch?v=oy30a4zTdCs&t=205s

struct ContentView: View {
    var body: some View {
            NavigationView {
                List {
                    NavigationLink("Unwrapping fields", destination: UnwrappingFields())

                    NavigationLink("Apple music player", destination: AppleMusicPlayer())

                    NavigationLink("Expanding items", destination: GridExpandingItems())

                    NavigationLink("Pickers", destination: Pickers())
                    
                    NavigationLink("Some Layouts", destination: Layouts())
                }
                .navigationTitle("Matched Geometry")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
