//
//  NewsScreen.swift
//  News
//
//  Created by Marat Mikaelyan on 22.03.2023.
//

import SwiftUI
import Networking
import UIDesignSystem

extension Article: Identifiable {
    public var id: String { url }
}

final class NewsViewModel: ObservableObject {
    @Published var currentNewsType: NewsType = .music {
        didSet {
            fetch()
        }
    }
    @Published var pagination: [NewsType: Int] = NewsType.allCases.reduce(into: [:]) { $0[$1] = 0 }
    @Published var allArticles: [NewsType: [Article]] = NewsType.allCases.reduce(into: [:]) { $0[$1] = [] }
    @Published var articles: [Article] = .init()
    @Published var favourites: [String] = .init()

    init() {
        fetch()
    }
    
    func fetch() {
        let date = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let from = dateFormatter.string(from: date)
        let sortBy = "publishedAt"
        let language = "en"
        let apiKey = "78bc2b46d98e4cce8e3fca1bebe73967"
        
        if pagination[currentNewsType]! < 6 {
            pagination[currentNewsType]! += 1
            
            ArticlesAPI.everythingGet(q: currentNewsType.rawValue,
                                      from: from,
                                      sortBy: sortBy,
                                      language: language,
                                      apiKey: apiKey,
                                      page: pagination[currentNewsType]
            ) { [weak self] data, error in
                guard let self = self else { return }
                debugPrint(error ?? "")
                self.allArticles[self.currentNewsType]?.append(
                    contentsOf: data?.articles?.filter { $0.title != nil } ?? []
                )
                self.articles = self.allArticles[self.currentNewsType] ?? []
            }
        }
    }
}

struct NewsScreen: View {
    @StateObject var viewModel: NewsViewModel = .init()
    var pickerOptions = NewsType.allCases.map { $0.rawValue }
    @State var listVariant: NewsType = .music
    
    var body: some View {
        NavigationStackView {
            VStack {
                Picker("News Type", selection: $viewModel.currentNewsType) {
                    ForEach(NewsType.allCases, id: \.self) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List {
                    ForEach(viewModel.articles) { article in
                        if let title = article.title {
                            NavPushButton(
                                ArticleScreen(
                                    title: article.title ?? "",
                                    description: article.description ?? "",
                                    content: article.content ?? "",
                                    url: article.url
                                )
                            ) {
                                HStack {
                                    Text(title)
                                        .onAppear {
                                            if viewModel.articles.isLastItem(article) {
                                                viewModel.fetch()
                                            }
                                    }
                                    Spacer()
                                    Image(systemName: viewModel.favourites.contains(article.id) ? "bookmark.fill" : "bookmark")
                                        .onTapGesture {
                                            if viewModel.favourites.contains(article.id) {
                                                viewModel.favourites = viewModel.favourites.filter { $0 != article.id }
                                            } else {
                                                viewModel.favourites.append(article.id)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
//        .onAppear {
//            viewModel.fetch()
//        }
    }
}

//struct NewsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsScreen()
//    }
//}

