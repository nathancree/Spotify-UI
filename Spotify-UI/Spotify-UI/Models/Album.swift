//
//  Album.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation
//import SwiftUI

struct Album: Identifiable {
    var album_type: String //can be "album" "single" "compilation"
    var total_tracks: Int
    //    var id = UUID() necessary
    var image: String
    var album_name: String
    var release_date: String
    var type: String = "album" //for accessing this type later on?
    var artists: [Artist]
    var tracks: [Track] //the tracks in the album
    var id = UUID()
}


//making an example album
extension Album {
    static var example: Album {
        Album(album_type: "album", total_tracks: 7, image: "Daydream", album_name: "For Lovers Only", release_date: "2018", artists: [Artist(image: "Daydream", name: "Luna Luna")], tracks: Track.example)
    }
}
