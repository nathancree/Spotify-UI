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
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    SearchBarSubview()
                        .padding(.top, 20)
                    
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
                                    SearchTile(image: "image \(num)")
                                }
                            }
                            VStack(spacing: 15) {
                                ForEach(21..<40) {num in
                                    SearchTile(image: "image \(num)")
                                }
                            }
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

struct SearchPreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    
    var body: some View {
        SearchView(songIndex: $songIndex, showSheet: $showSheet)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPreview()
    }
}

struct SearchBarSubview: View {
    var body: some View {
        NavigationLink(destination: AlbumView()) {
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
}

struct SearchTile: View {
    var image: String
    var body: some View {
        NavigationLink(destination: AlbumView()) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 80)
                .cornerRadius(8)
        }
    }
}
