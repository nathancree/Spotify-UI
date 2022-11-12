//
//  MusicSuggestionLists.swift
//  Spotify-UI
//
//  Created by Nathan Cree on 11/12/22.
//

import Foundation
import SwiftUI

struct MusicPick: Identifiable {
    var id = UUID()
    var suggested: String //names of the album or playlist and such (corrosponds to the imported image name)
    var suggestedArtists: [String] //the artists that made the suggested album or playlist
}

struct MusicSuggestion: Identifiable {
    var id = UUID()
    var suggestedList: [MusicPick]
    var name: String
    var artistType: Bool = false
    var albumType: Bool = false
    
}

var AllSuggestionsList: [MusicSuggestion] {[
    MusicSuggestion(suggestedList: [
        MusicPick(suggested: "For Lovers Only", suggestedArtists: ["Luna Luna"]),
        MusicPick(suggested: "Fantasy Gateway", suggestedArtists: ["Cuco"]),
        MusicPick(suggested: "Nectar", suggestedArtists: ["Joji"]),
        MusicPick(suggested: "EXIST", suggestedArtists: ["Jessaudrey"]),
        MusicPick(suggested: "channel ORANGE", suggestedArtists: ["Frank Ocean"]),
        
    ], name: "Recently Played", albumType: true),
    
    MusicSuggestion(suggestedList: [
        MusicPick(suggested: "Joji Mix", suggestedArtists: ["Freddie Dredd", "Lil Peep", "$uicideboy$"]),
        MusicPick(suggested: "Chill Mix", suggestedArtists: ["Healy", "ilyTOMMY", "Entro"]),
        MusicPick(suggested: "Cuco Mix", suggestedArtists: ["Joji, Yot Club", "Memo Boy"]),
        MusicPick(suggested: "2010s Mix", suggestedArtists: ["BONES", "Frank Ocean", "Xavier Wulf"]),
        MusicPick(suggested: "R&B Mix", suggestedArtists: ["Omar Apollo", "ODIE", "Frank Ocean"]),
        MusicPick(suggested: "2000s Mix", suggestedArtists: ["the pillows", "Kanye West", "Emmanuel Jal"]),
        MusicPick(suggested: "J-Pop Mix", suggestedArtists: ["the cabs", "Soutaiseiriron", "9mm Parabellum Bullet"]),
        MusicPick(suggested: "Indie Mix", suggestedArtists: ["CASTLEBEAT", "EKKSTACY", "Good Morning"])
    ], name: "Your Top Mixes"),
    
    MusicSuggestion(suggestedList: [
        MusicPick(suggested: "Daily Mix 4", suggestedArtists: ["Matt Maltese", "Coco & Clair Clair", "Butthole Surfers"]),
        MusicPick(suggested: "Daily Mix 3", suggestedArtists: ["Cuco", "Steve Lacey", "Jelani Aryeh"]),
        MusicPick(suggested: "Daily Mix 5", suggestedArtists: ["Frank Ocean", "Lil Peep", "BONES"]),
        MusicPick(suggested: "Daily Mix 6", suggestedArtists: ["Xavier Wulf, Lil Tecca, Healy"]),
        MusicPick(suggested: "Daily Mix 2", suggestedArtists: ["Freddie Dredd", "$uicideboy$", "Pouya"]),
        MusicPick(suggested: "Daily Mix 1", suggestedArtists: ["Kanye West", "BROCKHAMPTON"])
    ], name: "Made For nathan cree"),
    
    MusicSuggestion(suggestedList: [
        MusicPick(suggested: "Rap Caviar", suggestedArtists: ["Baby Keem", "Drake", "21 Savage", "Lil Baby", "Juice World"]),
        MusicPick(suggested: "are & Be", suggestedArtists: ["Rihanna", "Chris Brown", "Beyonce", "Steve Lacey", "SZA"]),
        MusicPick(suggested: "TODAY'S TOP HITS", suggestedArtists: ["Joji", "Taylor Swift", "Bad Bunny", "Drake", "21 Savage"]),
        MusicPick(suggested: "HOT HITS", suggestedArtists: ["Joji", "Taylor Swift", "Bad Bunny", "Drake", "The Weekend"]),
        MusicPick(suggested: "mint", suggestedArtists: ["David Guetta", "Future", "Beyonce", "Bebe Rexha"]),
        MusicPick(suggested: "HOT COUNTRY", suggestedArtists: ["Morgan Wallen", "Luke Combs", "Zach Bryan"]),
        MusicPick(suggested: "VIVO LATINO", suggestedArtists: ["Bad Bunny", "Rauw Alejandro", "Feid", "Ozuna", "Daddy Yankee"]),
        MusicPick(suggested: "Rock This", suggestedArtists: ["Imagine Dragons", "Red Hot", "Chili Peppers"]),
        MusicPick(suggested: "Today's Indie Rock", suggestedArtists: ["Arctic Monkeys", "Gorillaz", "Tame Impala", "Rex Orange County"]),
        MusicPick(suggested: "Alt NOW", suggestedArtists: ["The Killers", "Imagine Dragons", "Artic Monkeys"]),
    ], name: "The state of music today"),
    
    MusicSuggestion(suggestedList: [
        MusicPick(suggested: "THIS IS Tyle, The Creator", suggestedArtists: ["Tyler, The Creator"]),
        MusicPick(suggested: "THIS IS Cuco", suggestedArtists: ["Cuco"]),
        MusicPick(suggested: "THIS IS Amine", suggestedArtists: ["Amine"]),
        MusicPick(suggested: "THIS IS Joji", suggestedArtists: ["Joji"]),
        MusicPick(suggested: "THIS IS BROCKHAMPTON", suggestedArtists: ["BROCKHAMPTON"]),
        MusicPick(suggested: "THIS IS Mac Miller", suggestedArtists: ["Mac Miller"]),
        MusicPick(suggested: "THIS IS $uicideboy$", suggestedArtists: ["$uicideboy$"]),
        MusicPick(suggested: "THIS IS Lil Peep", suggestedArtists: ["Lil Peep"]),
        MusicPick(suggested: "THIS IS Childish Gambino", suggestedArtists: ["Childish Gambino"]),
    
    ], name: "Best of artists", artistType: true)
]}

