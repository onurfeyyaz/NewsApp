//
//  NewsAPIEndpoint.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 11.01.2024.
//

import Foundation

struct NewsAPIEndpoint {
    static let baseURL = "https://newsapi.org/v2"

    static func makeURL(query: String, page: Int, apiKey: String) -> URL? {
        var components = URLComponents(string: baseURL + "/everything")
        components?.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        return components?.url
    }
}
