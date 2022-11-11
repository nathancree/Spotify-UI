//
//  Artist.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation

struct Artist: Identifiable {
    
//    var followers: Int //tot # of followers (probs don't need this rn but maybe)
    var genres = [String]()
    var image: String //image associated with the artist
    var name: String
    var type: String = "artist" //type used for access later?
    var id = UUID()
    
}

extension Artist {
    static var example: Artist {
        Artist(image: "Daydream", name: "Luna Luna")
    }
}
