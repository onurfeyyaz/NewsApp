//
//  Article.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation
import SwiftData

@Model
class Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let newsDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var formattedPublishedDate: String? {
        guard let dateString = publishedAt else {
            return nil
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case newsDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    init(source: Source, author: String?, title: String, description: String?, url: String, urlToImage: String?, publishedAt: String?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.newsDescription = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(Source.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decode(String.self, forKey: .title)
        newsDescription = try container.decodeIfPresent(String.self, forKey: .newsDescription)
        url = try container.decode(String.self, forKey: .url)
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try container.decodeIfPresent(String.self, forKey: .content)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(author, forKey: .author)
        try container.encode(title, forKey: .title)
        try container.encode(newsDescription, forKey: .newsDescription)
        try container.encode(url, forKey: .url)
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
        try container.encode(content, forKey: .content)
    }
}

@Model
class Source: Codable {
    let id: String?
    let name: String?
    
    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
