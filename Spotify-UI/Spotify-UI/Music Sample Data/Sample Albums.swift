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
                            artists: LunaLuna,
                            tracks: ForLoversOnlyTracks)

var FantasyGateway = Album(album_type: "album",
                           total_tracks: 12,
                           image: "FantasyGateway",
                           album_name: "Fantasy Gateway",
                           release_date: "2022",
                           artists: Cuco,
                           tracks: FantasyGatewayTracks)

var Nectar = Album(album_type: "album",
                   total_tracks: 18,
                   image: "Nectar",
                   album_name: "Nectar",
                   release_date: "2020",
                   artists: Joji,
                   tracks: NectarTracks)

var EXIST = Album(album_type: "single",
                  total_tracks: 1,
                  image: "EXIST",
                  album_name: "EXIST",
                  release_date: "2017",
                  artists: Jessaudrey,
                  tracks: EXISTTrack)

var SMITHEREENS = Album(album_type: "album", total_tracks: 9, image: "SMITHEREENS", album_name: "SMITHEREENS", release_date: "November 4, 2022", artists: Joji, tracks: SMITHEREENSTracks)

var Suffer = Album(album_type: "album", total_tracks: 10, image: "Suffer", album_name: "Suffer", release_date: "August 18, 2020", artists: FreddieDredd, tracks: SufferTracks)

var Beatopia = Album(album_type: "album", total_tracks: 14, image: "Beatopia", album_name: "Beatopia", release_date: "July 15, 2022", artists: beabadoobee, tracks: BeatopiaTracks)

var GTG = Album(album_type: "single", total_tracks: 1, image: "GTG", album_name: "GTG", release_date: "August 10, 2018", artists: FreddieDredd, tracks: GTGTrack)

var GetYou = Album(album_type: "single", total_tracks: 2, image: "Get You", album_name: "Get You", release_date: "October 21, 2016", artists: DanielCaesar, tracks: GetYouTracks)

var ChannelORANGE = Album(album_type: "album", total_tracks: 17, image: "channel ORANGE", album_name: "channel ORANGE", release_date: "July 10, 2012", artists: FrankOcean, tracks: ChannelORANGETracks)

var Daylight = Album(album_type: "single", total_tracks: 1, image: "Daylight", album_name: "Daylight", release_date: "August 6, 2020", artists: Joji, tracks: DaylightTrack)

var InTonguesDeluxe = Album(album_type: "album", total_tracks: 16, image: "In Tongues (Deluxe)", album_name: "In Tongues (Deluxe)", release_date: "February 14, 2018", artists: Joji, tracks: InTonguesDeluxeTracks)

var Drown = Album(album_type: "single", total_tracks: 1, image: "Drown", album_name: "Drown", release_date: "August 1, 2018", artists: Cuco, tracks: DrownTrack)


var AlbumList: [Album] {[
    ForLoversOnly,
    FantasyGateway,
    Nectar,
    EXIST,
    SMITHEREENS,
    Suffer,
    Beatopia,
    GTG,
    GetYou,
    ChannelORANGE,
    Daylight,
    InTonguesDeluxe,
    Drown
]}
