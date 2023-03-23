//
//  NewsApp.swift
//  News
//
//  Created by Marat Mikaelyan on 22.03.2023.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject private var store = NewsStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
