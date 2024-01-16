//
//  FavoriteViewModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 11.01.2024.
//

import Foundation

@Observable
class FavoriteViewModel {
    @ObservationIgnored
    private let repository: SwiftDataRepository
    var favoriteArticles: [Article] = []

    init(repository: SwiftDataRepository) {
        self.repository = repository
        favoriteArticles = repository.fetchFavorites()
    }
    
    func fetchFavorites() {
        favoriteArticles = repository.fetchFavorites()
    }
}
