//
//  ContentView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/12/22.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var songIndex: Int = 0
    @State var currentTrack: Track = FantasyGateway.tracks[0]
    @State var currentAlbum: Album = FantasyGateway
    @State var playlistList: [PlaylistItem] = [PlaylistItem(name: "Liked Songs")]
    @State var showSheet: Bool = false
    @State var showPlaylistSheet: Bool = false
    
    var body: some View {
        ZStack {
            TabView{
                NavigationStack {
                    HomeView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum, thisAlbum: currentAlbum)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Good evening")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "bell")
                                    .padding(.trailing, 10)
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "timer")
                                    .padding(.trailing, 10)
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                //Change to Nav Link
                                Image(systemName: "gear")
                            }
                        }
                        .foregroundColor(.white)
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                        .foregroundColor(.white)
                }
                
                
                NavigationStack {
                    SearchView(songIndex: $songIndex, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Search")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "camera")
                            }
                        }
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                
                
                NavigationStack {
                    LibraryView(songIndex: $songIndex, playlistList: $playlistList, showSheet: $showSheet, currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                HStack {
                                    Image(systemName: "heart.fill")
                                    Text("Your Library")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .padding(.trailing, 15)
                                    
                                    Button {
                                        showPlaylistSheet.toggle()
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .sheet(isPresented: $showPlaylistSheet) {
                                                MakePlaylistView(playlistList: $playlistList)
                                            }
                                    }
                                }
                            }
                        }
                }
                .tabItem {
                    Label("Your Library", systemImage: "book.closed")
                }
            }
            .accentColor(.white)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct MiniPlayerView: View {
    @Binding var songIndex: Int
    @Binding var showSheet: Bool
    @Binding var currentTrack: Track
    @Binding var currentAlbum: Album
    
    var body: some View {
        //        NavigationLink(destination: SingleSongView(songIndex: $songIndex)) {
        Button {
            showSheet.toggle()
        } label: {
            ZStack {

                //sets the background of the mini player to be the avg color of the current song playing
                Color(uiColor: UIImage(imageLiteralResourceName: currentAlbum.album_name).getAverageColour ?? .darkGray)
                    .brightness(-0.15)
                
                HStack {
                    Image(currentAlbum.album_name)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(currentTrack.name)
                            .foregroundColor(.white)
                        HStack {
                            ForEach(currentTrack.artists) {artist in
                                Text(artist.name == currentTrack.artists.last?.name ? "\(artist.name)" : "\(artist.name), ")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                    
                    Image(systemName: "appletvremote.gen1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("Light Gray"))
                        .padding(.trailing, 30)
                    
                    ClickableButton(buttonIsClicked: "pause.fill", buttonIsNotClicked: "play.fill")
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .fullScreenCover(isPresented: $showSheet) {
                    SingleSongView(currentTrack: $currentTrack, currentAlbum: $currentAlbum)
                }
            }
            .frame(width: 390, height: 65)
            .cornerRadius(10)
        }
    }
}
//    used to find avg color of image??
extension UIImage {
    var getAverageColour: UIColor? {
        //A CIImage object is the image data you want to process.
        guard let inputImage = CIImage(image: self) else { return nil }
        // A CIVector object representing the rectangular region of inputImage .
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

func getPlaylist(playlistList: [Playlist], playlistName: String) -> Playlist{
    for i in 0..<playlistList.capacity {
        if playlistList[i].name == playlistName {
            return playlistList[i]
        }
    }
    return playlistList[0]
}
