//
//  NewsModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation
import SwiftData

@Model
class NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
    
    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(String.self, forKey: .status)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        articles = try container.decode([Article].self, forKey: .articles)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(totalResults, forKey: .totalResults)
        try container.encode(articles, forKey: .articles)
    }
}
