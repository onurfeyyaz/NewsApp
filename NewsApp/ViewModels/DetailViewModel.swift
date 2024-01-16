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
    //private let dataSource: DataSource

    //var articles: [Article] = []

    init(repository: Repository) { //dataSource: DataSource = DataSource.shared,
        self.repository = repository
        //self.dataSource = dataSource
        //articles = dataSource.fetchFavorites()
    }
    
    func addFavorite(_ article: Article) {
        repository.addFavorite(article)
    }

    func removeFavorite(article: Article) {
        repository.removeFavorite(article: article)
    }
}
