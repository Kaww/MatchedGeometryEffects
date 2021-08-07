//
//  ContentView.swift
//  MatchedGeoEffect
//
//  Created by KAWRANTIN LE GOFF on 05/08/2021.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Unwrapping fields", destination: UnwrappingFields())

                NavigationLink("Apple music player", destination: AppleMusicPlayer())
                
                NavigationLink("Expanding items", destination: GridExpandingItems())
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
