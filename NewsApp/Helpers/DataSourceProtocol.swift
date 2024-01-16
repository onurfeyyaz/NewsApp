//
//  DataSourceProtocol.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 16.01.2024.
//

import Foundation

protocol DataSourceProtocol {
    func addFavorite(_ article: Article)
    func removeFavorite(_ article: Article)
    func fetchFavorites() -> [Article]
}
