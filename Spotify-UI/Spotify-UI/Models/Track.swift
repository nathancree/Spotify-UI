//
//  Track.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation

struct Track: Identifiable {
    var album: String //album that the track appears on
    var artists: [Artist] //artists that appear on the track
    var name: String // name of the track
    var timeLength: Double //length of track
    var liked: Bool  = false //add to liked songs (same as is_local?)
    var type: String = "track" //for access later?
//    var is_local: Bool // is track from a local file? (probs not needed rn)
    var id = UUID()
}

extension Track {
    static var example: [Track] {
        [Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "Don't Forget",
               timeLength: 262),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "For You",
               timeLength: 249),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "80's Tune",
               timeLength: 242),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "Revelation",
               timeLength: 243),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "Only You",
               timeLength: 293),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "You and I",
               timeLength: 209),

         Track(album: "ForLoversOnly",
               artists: [Artist.example],
               name: "Daydream",
               timeLength: 264)
        ]
    }
}
