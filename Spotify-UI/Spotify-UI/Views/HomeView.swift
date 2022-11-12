//
//  HomeView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/30/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var songIndex: Int
    @Binding var showSheet: Bool
    @State var musicIsClicked: Bool = false
    @State var podcastIsClicked: Bool = false
    @State var audiobooksIsClicked: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    TypesOfContent(musicIsClicked: $musicIsClicked, podcastIsClicked: $podcastIsClicked, audiobooksIsClicked: $audiobooksIsClicked)
                        .padding(.top, 20)
                    
                    ScrollView {
                        TileGrid()
                            .padding(.top)
                        
                        ForEach(AllSuggestionsList) {suggestion in
                            MusicSuggestionSubview(suggestions: suggestion)
                                .padding(.top)
                        }
                    }
                    
                    Spacer()
                    MiniPlayerView(songIndex: $songIndex, showSheet: $showSheet)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct HomePreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    var body: some View {
        HomeView(songIndex: $songIndex, showSheet: $showSheet)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomePreview()
    }
}

struct TileView: View {
    var image: String
    var name: String
    
    var body: some View {
        NavigationLink(destination: AlbumView()) {
            ZStack {
                Color("Gray HomeView Tile")
                HStack {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaledToFit()
                    Text(name)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
        .frame(width: 180, height: 60)
        .cornerRadius(8)
    }
}

struct TileGrid: View {
    var body: some View {
        HStack {
            VStack {
                TileView(image: songList[0].album, name: songList[0].album)
                TileView(image: songList[1].album, name: songList[1].album)
                TileView(image: songList[2].album, name: songList[2].album)
            }
            VStack {
                TileView(image: songList[3].album, name: songList[3].album)
                TileView(image: songList[4].songTitle, name: songList[4].songTitle)
                TileView(image: songList[5].album, name: songList[5].album)
            }
        }
    }
}

struct TypesOfContent: View {
    @Binding var musicIsClicked: Bool
    @Binding var podcastIsClicked: Bool
    @Binding var audiobooksIsClicked: Bool
    
    
    var body: some View {
        HStack {
            Button {
                musicIsClicked.toggle()
            } label: {
                Text("Music")
                    .font(.caption)
                    .frame(width: 70, height: 30)
                    .foregroundColor(musicIsClicked ? .black : .white)
                    .background(musicIsClicked ? .green : Color("Gray HomeView Tile"))
                    .cornerRadius(50)
            }
            Button {
                podcastIsClicked.toggle()
            } label: {
                Text("Podcasts & Shows")
                    .font(.caption)
                    .frame(width: 130, height: 30)
                    .foregroundColor(podcastIsClicked ? .black : .white)
                    .background(podcastIsClicked ? .green : Color("Gray HomeView Tile"))
                    .cornerRadius(50)
            }
            Button {
                audiobooksIsClicked.toggle()
            } label: {
                Text("Audiobooks")
                    .font(.caption)
                    .frame(width: 100, height: 30)
                    .foregroundColor(audiobooksIsClicked ? .black : .white)
                    .background(audiobooksIsClicked ? .green : Color("Gray HomeView Tile"))
                    .cornerRadius(50)
            }
            Spacer()
        }
    }
}

struct LargeTile: View {
    var mix: MusicPick
    var artistType: Bool = false
    var albumType: Bool = false
    var body: some View {
        NavigationLink(destination: AlbumView()) {
            VStack (alignment: .leading){
                Image(mix.suggested)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                if artistType {
                    Text("This is \(mix.suggestedArtists[0]). The essential tracks, all in one playlist.")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                } else if albumType {
                    VStack(alignment: .leading) {
                        Text(mix.suggested)
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("Album * \(mix.suggestedArtists[0])")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                    }
                } else {
                    ForEach(mix.suggestedArtists, id: \.self) {artist in
                        Text(artist == mix.suggestedArtists.last ? "\(artist), and more" : "\(artist), ")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
        }
        .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 170, idealHeight: 170, maxHeight: 170, alignment: .leading)
    }
}

struct MusicSuggestionSubview: View {
    var suggestions: MusicSuggestion
    
    var body: some View {
        VStack (alignment: .leading){
            Text(suggestions.name)
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(suggestions.suggestedList) {mix in
                        if suggestions.artistType {
                            LargeTile(mix: mix, artistType: true)
                        } else if suggestions.albumType {
                            LargeTile(mix: mix, albumType: true)
                        } else {
                            LargeTile(mix: mix)
                        }
                    }
                }
            }
        }
    }
}
