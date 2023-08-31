//
//  ContentView.swift
//  News
//
//  Created by Marat Mikaelyan on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsScreen()
                .tag(0)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            NewsScreen()
                .tag(1)
                .tabItem {
                    Label("Favourite", systemImage: "bookmark.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

