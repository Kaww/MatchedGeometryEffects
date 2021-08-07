//
//  AppleMusicPlayer.swift
//  MatchedGeoEffect
//
//  Created by KAWRANTIN LE GOFF on 05/08/2021.
//

import SwiftUI

struct AppleMusicPlayer: View {
    private let albumId = "albumId"
    @Namespace private var albumNamespace
    
    private let titleId = "titleId"
    @Namespace private var titleNamespace
    
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Spacer()

            VStack {
                
                if isExpanded {
                    VStack(spacing: 50) {
                        albumCover
                            .matchedGeometryEffect(id: albumId, in: albumNamespace)
                            .frame(width: frame, height: frame)
                            .shadow(color: .black.opacity(0.5), radius: 20, x: 0.0, y: 0.0)
                        
                        /// Note:
                        /// Padding needs to be after the matchedGeometry
                        /// matchedGeometryEffect works well on basic components, BUT NOT ON CONTAINERS
                        albumTitle
//                            .padding(.bottom, 50) THIS DOES NOT WORK
                            .matchedGeometryEffect(id: titleId, in: titleNamespace)
                            .padding(.bottom, 100)
                    }
                } else {
                    HStack {
                        albumCover
                            .matchedGeometryEffect(id: albumId, in: albumNamespace)
                            .frame(width: frame, height: frame)
                        
                        albumTitle
                            .matchedGeometryEffect(id: titleId, in: titleNamespace)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color(white: 0.9)
                    .edgesIgnoringSafeArea(.bottom)
            )
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
        }
    }
    
    private var albumCover: some View {
        Image("albumcover")
            .resizable()
            .cornerRadius(10) // needs to be before the matched geo effect, else the "animation" is going to be clipped
    }
    
    private var albumTitle: some View {
        Text("Polo & Pan - Cyclorama")
            .font(.headline)
    }

    private var frame: CGFloat {
        isExpanded ? 250 : 60
    }
}

struct AppleMusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AppleMusicPlayer()
    }
}
