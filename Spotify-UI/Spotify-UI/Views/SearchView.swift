//
//  SearchView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/30/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var songIndex: Int
    @Binding var showSheet: Bool
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    NavigationLink(destination: clickedOnSearchBar()) {
                        SearchBarSubview()
                            .padding(.top, 20)
                    }
                    
                    ScrollView {
                        HStack {
                            Text("Browse all")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 50, leading: 10, bottom: 10, trailing: 0))
                            Spacer()
                        }
                        HStack(spacing: 15) {
                            VStack(spacing: 15) {
                                ForEach(1..<20) {num in
                                    NavigationLink(destination: clickedOnSearchBar()) {
                                        SearchTile(image: "image \(num)")
                                    }
                                }
                            }
                            VStack(spacing: 15) {
                                ForEach(21..<40) {num in
                                    NavigationLink(destination: clickedOnSearchBar()) {
                                        SearchTile(image: "image \(num)")
                                    }
                                }
                            }
                        }
                        
                    }
                    
                    Spacer()
                    MiniPlayerView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct SearchPreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    
    var body: some View {
        SearchView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPreview()
    }
}

struct SearchBarSubview: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.black)
                .padding(.leading)
            Text("What do you want to listen to?")
                .foregroundColor(.black)
            Spacer()
        }
        .frame(width: 390, height: 45)
        .background(.white)
        .cornerRadius(15)
    }
}

struct SearchTile: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 180, height: 80)
            .cornerRadius(8)
    }
}

struct clickedOnSearchBar: View {
    var body: some View {
        Image(systemName: "start")
    }
}
