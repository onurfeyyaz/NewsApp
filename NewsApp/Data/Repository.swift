//
//  Repository.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

final class Repository: NetworkManagerProtocol {
    private let network: NetworkManagerProtocol
    private let dataSource: DataSource

    // Dependency Injection
    init(network: NetworkManagerProtocol, dataSource: DataSource = DataSource.shared) {
        self.network = network
        self.dataSource = dataSource
    }
    
    // MARK: Remote Databse - API
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        network.retrieveNews(query: query, page: page, completion: completion)
    }
    
    // MARK: Local Database - SwiftData
    func addFavorite(_ article: Article) {
        let tesla = Article(source: Source(id: "", name: ""), author: "", title: "swiftdata title", description: "desc", url: "www.apple.com", urlToImage: "", publishedAt: "", content: "")
        dataSource.addFavorite(article)
    }

    func removeFavorite(article: Article) {
        dataSource.removeFavorite(article)
    }
    
    func fetchFavorites() -> [Article] {
        dataSource.fetchFavorites()
    }
}
