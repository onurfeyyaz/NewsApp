//
//  Repository.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

final class Repository {
    private let network: NetworkManager
    
    // Dependency Injection
    init(network: NetworkManager) {
        self.network = network
    }
    
    func retrieveNews() async throws -> [Article] {
        return try await network.retrieveNews()
    }
}
