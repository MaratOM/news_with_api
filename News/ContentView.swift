//
//  ContentView.swift
//  News
//
//  Created by Marat Mikaelyan on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var store = NewsStore()
    @State var tabSelection: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsScreen()
                .tag(1)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

