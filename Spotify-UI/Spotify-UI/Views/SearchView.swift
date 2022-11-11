//
//  SearchView.swift
//  Music Player UI
//
//  Created by Nathan Cree on 10/30/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var songIndex: Int
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    MiniPlayerView(songIndex: $songIndex, showSheet: $showSheet)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct SearchPreview: View {
    @State var songIndex: Int = 0
    @State var showSheet: Bool = false
    
    var body: some View {
        SearchView(songIndex: $songIndex, showSheet: $showSheet)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPreview()
    }
}
