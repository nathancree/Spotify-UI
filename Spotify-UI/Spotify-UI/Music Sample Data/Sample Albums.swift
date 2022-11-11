//
//  Sample Albums.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/11/22.
//

import Foundation
import SwiftUI

var ForLoversOnly = Album(album_type: "album",
                            total_tracks: 7,
                            image: "Daydream",
                            album_name: "For Lovers Only",
                            release_date: "2018",
                            artists: [Artist(image: "Daydream", name: "Luna Luna")],
                            tracks: ForLoversOnlyTracks)

var FantasyGateway = Album(album_type: "album",
                           total_tracks: 12,
                           image: "FantasyGateway",
                           album_name: "Fantasy Gateway",
                           release_date: "2022",
                           artists: [Cuco],
                           tracks: FantasyGatewayTracks)

var Nectar = Album(album_type: "album",
                   total_tracks: 18,
                   image: "Nectar",
                   album_name: "Nectar",
                   release_date: "2020",
                   artists: [Joji],
                   tracks: NectarTracks)

var EXIST = Album(album_type: "single",
                  total_tracks: 1,
                  image: "EXIST",
                  album_name: "EXIST",
                  release_date: "2017",
                  artists: [Jessaudrey],
                  tracks: EXISTTrack)
