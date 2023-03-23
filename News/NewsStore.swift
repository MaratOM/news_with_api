//
//  NewsStore.swift
//  News
//
//  Created by Marat Mikaelyan on 22.03.2023.
//

import Foundation

final class NewsStore: ObservableObject {
    //    @Published var tabSelection: ContentView.Tab = .navigation
    @Published var newsTypeToLoad: NewsType = .music
    @Published var pagination: [NewsType: Int] = NewsType.allCases.reduce(into: [:]) { $0[$1] = 0 }
    

}
