//
//  SingleSongView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/30/22.
//

import SwiftUI

struct SingleSongView: View {
    @State var liked: Bool = false
    @State var songTime: Double = 0
    @State var play: Bool = true
    @State var shuffle: Bool = false
    @State var clickRepeat: Bool = false
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.down")
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
                
                Image(currentTrack.album)
                    .resizable()
                    .ignoresSafeArea()
                    .scaleEffect(2)
                    .contrast(2)
                    .blur(radius: 30)
                
                LinearGradient(colors: [Color("Dark Afterthought"),.gray.opacity(0)], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        backButton
                        PlayListInfo()
                    }
                    .padding(.init(top: 20, leading: 0, bottom: 50, trailing: 0))
                    
                    Image(currentTrack.album)
                        .resizable()
                        .frame(width: 340, height: 340)
                        .padding(.bottom, 50)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(currentTrack.name)
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            HStack {
                                ForEach(currentTrack.artists) {artist in
                                    Text(artist.name == currentTrack.artists.last?.name ? "\(artist.name)" : "\(artist.name), ")
                                        .foregroundColor(Color("Light Gray"))
                                        .font(.headline)
                                }
                            }
                        }
                        .padding(.leading, 30)
                        Spacer()
                        
                        Button {
                            //track album artist and playlist should all probs be reference type classes instead of structs
//                            liked.toggle()
                            currentTrack.liked.toggle()// = liked
                        } label: {
                            Image(systemName: currentTrack.liked ? "heart.fill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                                .foregroundColor(currentTrack.liked ? .green : .white)
                                .padding(.trailing, 30)
                        }
                    }
                    Slider(value: $songTime, in: 0 ... currentTrack.timeLength, step: 1)
                        .accentColor(.white)
                    //found how to change the slider ball size on stack overflow >:)
                        .onAppear {
                            let progressCircleConfig = UIImage.SymbolConfiguration(scale: .small)
                            UISlider.appearance()
                                .setThumbImage(UIImage(systemName: "circle.fill",
                                                       withConfiguration: progressCircleConfig),
                                               for: .normal)
                        }
                        .padding(.init(top: 10, leading: 30, bottom: -5, trailing: 30))
                    
                    HStack {
                        Text("\(String(format: "%.0f", floor(songTime/60))):\(String(format: "%02.0f", songTime.truncatingRemainder(dividingBy: 60)))")
                            .foregroundColor(Color("Light Gray"))
                            .font(.subheadline)
                            .padding(.leading, 30)
                        
                        Spacer()
                        Text("-\(String(format: "%.0f", floor(currentTrack.timeLength/60 - songTime/60))):\(String(format: "%02.0f", (currentTrack.timeLength - songTime).truncatingRemainder(dividingBy: 60)))")
                            .foregroundColor(Color("Light Gray"))
                            .font(.subheadline)
                            .padding(.trailing, 30)
                    }
                    
                    HStack(spacing: 45) {
                        Button {
                            shuffle.toggle()
                        } label: {
                            Image(systemName: "shuffle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(shuffle ? .green : .white)
                        }
                        Button {
                            if getIndex(currentTrack: currentTrack, currentAlbum: currentAlbum) - 1 >= 0 {
                                currentTrack = prevTrack(currentAlbum: currentAlbum, currentTrack: currentTrack)
                            }
                            liked = currentTrack.liked
                            songTime = 0
                        } label: {
                            Image(systemName: "backward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        Button {
                            play.toggle()
                        } label: {
                            Image(systemName: play ? "play.circle.fill" : "pause.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        }
                        Button {
                            if getIndex(currentTrack: currentTrack, currentAlbum: currentAlbum) + 1 < currentAlbum.tracks.capacity {
                                currentTrack = nextTrack(currentAlbum: currentAlbum, currentTrack: currentTrack)
                            }
                            liked = currentTrack.liked
                            songTime = 0
                        } label: {
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        Button {
                            clickRepeat.toggle()
                        } label: {
                            Image(systemName: "repeat")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(clickRepeat ? .green : .white)
                        }
                    }
                    .padding(.bottom, 30)
                    SecondaryButtons()
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
            }
         }
        .toolbar(.hidden, for: .tabBar)
    }
}


struct ClickableButton: View {
    @State var isCliked = false
    let buttonIsClicked: String
    let buttonIsNotClicked: String
    var body: some View {
        Button {
            isCliked.toggle()
        } label: {
            Image(systemName: isCliked ? buttonIsClicked : buttonIsNotClicked)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
        }
    }
}


struct SecondaryButtons: View {
    var body: some View {
        HStack {
            Image(systemName: "appletvremote.gen1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 10, height: 10)
                .foregroundColor(.white)
                .padding(.leading, 30)
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .padding(.trailing, 40)
            Image(systemName: "rectangle.stack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .padding(.trailing, 30)
        }
    }
}

struct PlayListInfo: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Liked Songs")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "ellipsis")
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fill)
                .frame(width: 5, height: 5)
                .padding(.trailing, 30)
        }
    }
}

//to allow the SingleSongView to preview in the canvas with dummy variables
//basically recreates "ContentView"
struct SingleSongPreviewView: View {
    
    @State var songIndex: Int = 0
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    var body: some View {
        SingleSongView(currentTrack: $currentTrack, currentAlbum: $currentAlbum)
    }
    
}

struct SingleSongView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSongPreviewView()
    }
}

func nextTrack(currentAlbum: Album, currentTrack: Track) -> Track{
    for i in 0..<currentAlbum.tracks.capacity {
        if currentAlbum.tracks[i].name == currentTrack.name {
            return currentAlbum.tracks[i + 1]
        }
    }
    return currentTrack
}

func prevTrack(currentAlbum: Album, currentTrack: Track) -> Track{
    for i in 0..<currentAlbum.tracks.capacity {
        if currentAlbum.tracks[i].name == currentTrack.name {
            return currentAlbum.tracks[i - 1]
        }
    }
    return currentTrack
}

func getAlbum(albumList: [Album], currentAlbum: String) -> Album{
    for i in 0..<albumList.capacity {
        if albumList[i].album_name == currentAlbum {
            return albumList[i]
        }
    }
    return albumList[0]
}

func getIndex(currentTrack: Track, currentAlbum: Album) -> Int{
    for i in 0..<currentAlbum.tracks.capacity {
        if currentAlbum.tracks[i].name == currentTrack.name {
            return i
        }
    }
    return 0
}
