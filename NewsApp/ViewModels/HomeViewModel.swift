//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let repository: Repository
    @Published var articles: [Article]?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func fetchNews() async throws {
        do {
            self.articles = try await repository.retrieveNews()
        } catch {
            print("Error fetching news: \(error)")
        }
    }
}
