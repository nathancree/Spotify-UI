//
//  LibraryView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/30/22.
//

import SwiftUI

struct LibraryView: View {
    
    @Binding var songIndex: Int
    @Binding var playlistList: [PlaylistItem]
    @Binding var showSheet: Bool
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album

    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    ForEach(playlistList) { list in
                        PlaylistView(playlist: list)
                    }
                    
                    Spacer()
                    MiniPlayerView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                        .padding(.bottom, 20)
                }
            }
        }
        .padding(.top, 30)
    }
}

struct LibraryPreview: View {
    @State var songIndex: Int = 0
    @State var playlistList: [PlaylistItem] = [PlaylistItem(name: "Liked Songs")]
    @State var showSheet: Bool = false
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    @State var thisAlbum: Album = FantasyGateway
    
    var body: some View {
        LibraryView(songIndex: $songIndex, playlistList: $playlistList, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryPreview()
    }
}

struct PlaylistItem: Identifiable {
    @State var isDownloaded: Bool = false
    let name: String
    let id = UUID()
}

struct PlaylistView: View {
    let playlist: PlaylistItem
    
    var body: some View {
        HStack {
            Image(playlist.name == "Liked Songs" ? "Liked Songs" : "No Cover Chosen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 2.5, leading: 15, bottom: 2.5, trailing: 0))
            
            VStack (alignment: .leading){
                Text(playlist.name)
                    .fontWeight(.bold)
                
                Text("Playlist")
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
