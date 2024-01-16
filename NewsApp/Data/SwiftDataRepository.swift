//
//  SwiftDataRepository.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 16.01.2024.
//

import Foundation
import SwiftData

// MARK: Local Database - SwiftData
final class SwiftDataRepository: DataSourceProtocol {
    private let dataSource: DataSource
    
    init(dataSource: DataSource = DataSource.shared) {
        self.dataSource = dataSource
    }
    
    func addFavorite(_ article: Article) {
        dataSource.addFavorite(article)
    }

    func removeFavorite(_ article: Article) {
        dataSource.removeFavorite(article)
    }
    
    func fetchFavorites() -> [Article] {
        dataSource.fetchFavorites()
    }
}
