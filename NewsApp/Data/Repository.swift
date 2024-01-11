//
//  Repository.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

protocol NewsRepository {
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void)
}

final class Repository: NewsRepository {
    private let network: NetworkManagerProtocol
    
    // Dependency Injection
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        network.retrieveNews(query: query, page: page, completion: completion)
    }
    
    /*
    func retrieveNews(_ search: String) async throws -> [Article] {
        return try await network.retrieveNews(search)
    }
     */
}
