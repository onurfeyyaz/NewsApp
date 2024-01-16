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
    private let repository: SwiftDataRepository
    //private let dataSource: DataSource

    //var articles: [Article] = []

    init(repository: SwiftDataRepository) { //dataSource: DataSource = DataSource.shared,
        self.repository = repository
        //self.dataSource = dataSource
        //articles = dataSource.fetchFavorites()
    }
    
    func addFavorite(_ article: Article) {
        repository.addFavorite(article)
    }

    func removeFavorite(_ article: Article) {
        repository.removeFavorite(article)
    }
    
    func isFavorite(_ article: Article) -> Bool {
        
        return false
    }
}
