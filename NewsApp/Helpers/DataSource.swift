//
//  DataSource.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 16.01.2024.
//

import Foundation
import SwiftData

final class DataSource {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = DataSource()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Article.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func addFavorite(_ article: Article) {
        modelContext.insert(article)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeFavorite(_ article: Article) {
        modelContext.delete(article)
    }
    
    func fetchFavorites() -> [Article] {
        do {
            return try modelContext.fetch(FetchDescriptor<Article>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
