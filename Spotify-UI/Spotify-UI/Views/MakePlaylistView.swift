//
//  MakePlaylistView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 11/1/22.
//

import SwiftUI

struct MakePlaylistView: View {
    @State var playlistName: String = ""
    @Binding var playlistList: [PlaylistItem]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "multiply")
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .padding(.leading, 30)
        }
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color("Dark Playlist Maker"), Color("Light Playlist Maker")]),
                           startPoint: .bottom,
                           endPoint: .top)
            .ignoresSafeArea()
            
            VStack {
                HStack{
                    Spacer()
                    backButton
                        .padding(.top, 30)
                        .padding(.trailing, 30)
                }
                Spacer()

                Text("Give your playlist a name.")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                
                
                HStack {
                    Spacer()
                    TextField("My playlist", text: $playlistName)
                        .foregroundColor(.white)
                        .background(.white)
                        .textFieldStyle(RoundedBorderTextFieldStyle.init())
                        .onSubmit {
                            playlistList.append(PlaylistItem(name: playlistName))
                            playlistName = ""
                        }
                    Spacer()
                }
                
                Spacer()
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

struct MakePlaylistPreview: View {
//    @State var playlistName: String = ""
    @State var playlistList = [PlaylistItem]()
    var body: some View {
        MakePlaylistView(playlistList: $playlistList)
    }
}

struct MakePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        MakePlaylistPreview()
    }
}
