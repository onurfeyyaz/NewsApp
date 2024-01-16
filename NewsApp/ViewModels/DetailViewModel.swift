//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 16.01.2024.
//

import Foundation

@Observable
class DetailViewModel {
    @ObservationIgnored
    private let repository: Repository
    private let dataSource: DataSource

    var articles: [Article] = []

    init(dataSource: DataSource = DataSource.shared, repository: Repository) {
        self.repository = repository
        self.dataSource = dataSource
        articles = dataSource.fetchFavorites()
    }
    
    func addFavorite() {
        repository.addFavorite()
    }

    func removeFavorite(article: Article) {
        repository.removeFavorite(article: article)
    }
    
    func fetchFavorites() {
        articles = repository.fetchFavorites()
    }
}
