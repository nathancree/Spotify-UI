//
//  AlbumView.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/12/22.
//

import SwiftUI

struct AlbumView: View {
    
    @Binding var showSheet: Bool
    @Binding var songIndex: Int
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album
    @State var thisAlbum: Album
    
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
                LinearGradient(colors: [Color(uiColor: UIImage(imageLiteralResourceName: thisAlbum.album_name).getAverageColour ?? .green), Color(uiColor: UIImage(imageLiteralResourceName: thisAlbum.album_name).getAverageColour ?? .green), .black], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        backButton
                        Spacer()
                    }
                    
                    ScrollView {
                        ZStack {
                            LinearGradient(colors: [Color(uiColor: UIImage(imageLiteralResourceName: thisAlbum.album_name).getAverageColour ?? .green), Color(uiColor: UIImage(imageLiteralResourceName: thisAlbum.album_name).getAverageColour ?? .green), .black], startPoint: .top, endPoint: .center)
                                .ignoresSafeArea()
                            VStack {
                            
                                Image(thisAlbum.album_name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 250, height: 250)
                                HStack {
                                    Text(thisAlbum.album_name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                HStack {
                                    Image(thisAlbum.artists.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(20)
                                        .padding(.leading, 10)
                                    Text(thisAlbum.artists.name)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Album • \(thisAlbum.release_date)")
                                        .font(.caption)
                                        .padding(.leading, 10)
                                        Spacer()
                                }
                                .padding(.bottom, 10)
                                
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
                                    ForEach(thisAlbum.tracks) {track in
                                        Button {
                                            currentTrack = track
                                            currentAlbum = thisAlbum
                                        } label: {
                                            HStack {
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

struct AlbumPreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    var body: some View {
        AlbumView(showSheet: $showSheet, songIndex: $songIndex, currentTrack: $currentTrack, currentAlbum: $currentAlbum, thisAlbum: getAlbum(albumList: AlbumList, currentAlbum: "Fantasy Gateway"))
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumPreview()
    }
}

struct AlbumClickableButton: View {
    @State var isCliked = false
    let buttonIsClicked: String
    let buttonIsNotClicked: String
    let selectedSize: CGFloat
    var playButton: Bool = false
    
    var body: some View {
        Button {
            isCliked.toggle()
        } label: {
            Image(systemName: isCliked ? buttonIsClicked : buttonIsNotClicked)
                .resizable()
                .foregroundColor(playButton ? .green : isCliked ? .green : .white)
                .aspectRatio(contentMode: .fill)
                .frame(width: selectedSize, height: selectedSize)
        }
    }
}
