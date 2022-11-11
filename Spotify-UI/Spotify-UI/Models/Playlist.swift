//
//  Playlist.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation

struct playlist: Identifiable {
//    var collaborative: Bool //probs don't need it rn
    var discription: String = "" //if description is modified then change it here
    var followers: Int //tot # of followers of the playlist
    var image: String //should be an array of image objects that allows up to three images but for now I am making it one image for the cover
    var name: String
//    var user: user //in the future do a user type dont need now
//    var isPublic: Bool //probs don't need rn
    var tracks: [Track] //tracks on the playlist
    var type: String = "playlist" //for accessing in the future?
    var id = UUID()
}
