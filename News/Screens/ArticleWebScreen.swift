//
//  ArticleWebScreen.swift
//  News
//
//  Created by Marat Mikaelyan on 23.03.2023.
//

import SwiftUI

struct ArticleWebScreen: View {
    let url: String

    var body: some View {
        WebView(url: url)
    }
}

struct ArticleWebScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleWebScreen(url: "http://google.com")
    }
}
