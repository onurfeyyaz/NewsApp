//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    private let repository: Repository
    @Published var articles: [Article]?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func fetchNews(query: String, page: Int) {
        
         // ÇALIŞIYOR BURASI
         repository.retrieveNews(query: query, page: page) { result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                }
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
        }
         /*
        self.articles = [
            Article(
                source: Source(id: "id", name: "name"),
                author: "author",
                title: "title",
                description: "description",
                url: "https://www.apple.com/app-store",
                urlToImage: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-iphone-15-pro-202309?wid=800&hei=1000&fmt=p-jpg&qlt=95&.v=1692910040844",
                publishedAt: "17.01.2024",
                content: "content"
            )
        ]*/
    }
    
    func loadImage(url: URL) {
    }
    
    func pagination() {
        // TODO: pagination yap
    }
}
