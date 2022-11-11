//
//  songList.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation
import SwiftUI

struct Song{
    var songTitle: String
    var artist: String
    var timeLength: Double
    var darkColor: Color
    var lightColor: Color
    var liked: Bool
}

var songList: [Song] = [
    Song(songTitle: "Daydream", artist: "Luna Luna", timeLength: 264, darkColor: Color("Dark Daydream"), lightColor: Color("Light Daydream"), liked: false),
    Song(songTitle: "Time Machine", artist: "Cuco", timeLength: 219, darkColor: Color("Dark Time Machine"), lightColor: Color("Light Time Machine"), liked: false),
    Song(songTitle: "Afterthought", artist: "Joji, BENEE", timeLength: 194, darkColor: Color("Dark Afterthought"), lightColor: Color("Light Afterthought"), liked: false),
    Song(songTitle: "EXIST", artist: "Jessaudrey", timeLength: 222, darkColor: Color("Dark EXIST"), lightColor: Color("Light EXIST"), liked: false),
    Song(songTitle: "Symphonic Dances, Op. 45", artist: "Sergei Rachmaninoff", timeLength: 694, darkColor: Color("Dark Symphonic Dances"), lightColor: Color("Light Symphonic Dances"), liked: false)
    
]
