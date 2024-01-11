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
    }
    
    func pagination() {
        // TODO: pagination yap
    }
}
