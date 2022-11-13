//
//  songList.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation
import SwiftUI

struct Song: Identifiable{
    var songTitle: String
    var artist: String
    var timeLength: Double
    var liked: Bool = false
    var album: String
    var id = UUID()
}

var songList: [Song] = [
    Song(songTitle: "Daydream", artist: "Luna Luna", timeLength: 264, album: "For Lovers Only"),
    Song(songTitle: "Time Machine", artist: "Cuco", timeLength: 219, album: "Fantasy Gateway"),
    Song(songTitle: "Afterthought", artist: "Joji, BENEE", timeLength: 194, album: "Nectar"),
    Song(songTitle: "EXIST", artist: "Jessaudrey", timeLength: 222, album: "EXIST"),
//    Song(songTitle: "Symphonic Dances, Op. 45", artist: "Sergei Rachmaninoff", timeLength: 694, album: "Symphonic Dances, Op. 45"),
    Song(songTitle: "Die For You", artist: "Joji", timeLength: 211, album: "SMITHEREENS"),
    Song(songTitle: "Pyramids", artist: "Frank Ocean", timeLength: 592, album: "channel ORANGE")
]


