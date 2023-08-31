//
//  ArticleScreen.swift
//  News
//
//  Created by Marat Mikaelyan on 23.03.2023.
//

import SwiftUI
import UIDesignSystem

struct ArticleScreen: View {
    let title: String
    let description: String
    let content: String
    let url: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, 2)
                    Text(description)
                        .font(.title2)
                        .italic()
                    Text(content)
                        .padding(.top, 4)
                        .padding(.bottom, 15)
                    NavPushButton(
                        WebView(url: url)
                    ) {
                        Text("Read Article")
                            .padding(.vertical, 5)
                            .padding(.horizontal, 15)
                            .font(.headline)
                            .background(.mint)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
            }
        }
    }
}

struct ArticleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleScreen(
            title: "Article title",
            description: "Article longer description",
            content: "Article long long long long long long long long long long long long long long long content",
            url: "Article url"
        )
    }
}
