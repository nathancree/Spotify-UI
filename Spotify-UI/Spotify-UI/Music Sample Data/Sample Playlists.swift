//
//  Sample Playlists.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation
import SwiftUI

var MidnightMix: Playlist = Playlist(discription: "Cuco, Joji, Freddie Dredd", image: "Midnight Mix", name: "Midnight Mix", tracks: MidnightMixTracks)
var noPlaylist: Playlist = Playlist(discription: "Nothing here", image: "No Cover Chosen", name: "no name", tracks: MidnightMixTracks)

var PlaylistList: [Playlist] {[
    noPlaylist,
    MidnightMix
]}
