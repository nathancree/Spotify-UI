//
//  SingleSongViewModel.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/12/22.
//

import Foundation
import SwiftUI

//class SingleSongViewModel: ObservableObject {
//    @Published var songIndex: Int = 0
//    @Published var currentTrack: Track = EXISTTrack[0]
//    @Published var currentAlbum: Album = EXIST
//    
//    func updatedAlbum() -> Album{
//        ForEach(AlbumList) {album in
//            if album.album_name == currentTrack.album {
//                currentAlbum = album
//            }
//        }
//    }
//    
//    func updatedTrack() -> Track{
//        ForEach(0..<currentAlbum.tracks.capacity) {i in
//            if currentAlbum.tracks[i].name == currentTrack.name {
//                songIndex = i
//            }
//        }
//    }
//}
