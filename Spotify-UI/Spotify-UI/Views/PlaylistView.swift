//
//  PlaylistView.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/13/22.
//

import SwiftUI

struct PlaylistView: View {
    
    @Binding var showSheet: Bool
    @Binding var songIndex: Int
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album
    @State var thisPlaylist: Playlist
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fill)
                .frame(width: 10, height: 10)
                .padding(.leading, 30)
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(uiColor: UIImage(imageLiteralResourceName: thisPlaylist.image).getAverageColour ?? .green), Color(uiColor: UIImage(imageLiteralResourceName: thisPlaylist.image).getAverageColour ?? .green), .black], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        backButton
                        Spacer()
                    }
                    
                    ScrollView {
                        ZStack {
                            LinearGradient(colors: [Color(uiColor: UIImage(imageLiteralResourceName: thisPlaylist.image).getAverageColour ?? .green), Color(uiColor: UIImage(imageLiteralResourceName: thisPlaylist.image).getAverageColour ?? .green), .black], startPoint: .top, endPoint: .center)
                                .ignoresSafeArea()
                            VStack {
                            
                                Image(thisPlaylist.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 250, height: 250)
                                    .padding(.bottom, 10)
//                                HStack {
//                                    Text(thisPlaylist.name)
//                                        .font(.title)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                        .padding(.leading, 10)
//                                    Spacer()
//                                }
                                HStack {
                                    Text(thisPlaylist.discription)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("and more")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                }
                                .padding(.leading, 10)
                                
                                HStack {
                                    Text("Made for")
                                        .font(.caption)
                                        .padding(.leading, 10)
                                    Text("nathan cree")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        Spacer()
                                }
                                .padding(.top, 5)
                                
                                HStack(spacing: 20) {
                                    AlbumClickableButton(buttonIsClicked: "heart.fill", buttonIsNotClicked: "heart", selectedSize: 25)
                                    AlbumClickableButton(buttonIsClicked: "arrow.down.to.line.circle.fill", buttonIsNotClicked: "arrow.down.to.line.circle", selectedSize: 25)
                                    Image(systemName: "ellipsis")
                                    Spacer()
                                    AlbumClickableButton(buttonIsClicked: "shuffle", buttonIsNotClicked: "shuffle", selectedSize: 20)
                                    AlbumClickableButton(buttonIsClicked: "pause.circle.fill", buttonIsNotClicked: "play.circle.fill", selectedSize: 40, playButton: true)
                                }
                                .padding(.init(top: 10, leading: 10, bottom: 20, trailing: 10))
                                
                                VStack(spacing: 20) {
                                    ForEach(thisPlaylist.tracks) {track in
                                        Button {
                                            currentTrack = track
                                            currentAlbum = getAlbum(albumList: AlbumList, currentAlbum: track.album)
                                            currentAlbum.tracks = thisPlaylist.tracks
                                        } label: {
                                            HStack {
                                                Image(track.album)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40, height: 40)
                                                
                                                VStack(alignment: .leading){
                                                    Text(track.name)
                                                        .font(.headline)
                                                        .foregroundColor(currentTrack.name == track.name ? .green : .white)
                                                    HStack {
                                                        ForEach(track.artists) {artist in
                                                            Text(artist.name == track.artists.last?.name ? "\(artist.name)" : "\(artist.name), ")
                                                                .foregroundColor(.secondary)
                                                        }
                                                    }
                                                }
                                                Spacer()
                                                Image(systemName: "ellipsis")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    MiniPlayerView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                        .padding(.bottom, 20)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct PlaylistPreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    @State var thisPlaylist: Playlist = MidnightMix
    var body: some View {
        PlaylistView(showSheet: $showSheet, songIndex: $songIndex, currentTrack: $currentTrack, currentAlbum: $currentAlbum, thisPlaylist: thisPlaylist)
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPreview()
    }
}



