//
//  NetworkManagerProtocol.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 16.01.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void)
}
