//
//  NewsModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

struct NewsModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
