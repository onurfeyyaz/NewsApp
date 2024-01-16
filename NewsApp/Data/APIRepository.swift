//
//  Repository.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

// MARK: Remote Databse - API
final class APIRepository: NetworkManagerProtocol {
    private let network: NetworkManagerProtocol
    
    // Dependency Injection
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        network.retrieveNews(query: query, page: page, completion: completion)
    }
}
