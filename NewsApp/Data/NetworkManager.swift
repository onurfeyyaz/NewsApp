//
//  Network.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

final class NetworkManager {
    func retrieveNews() async throws -> [Article] {
        // TODO: get news with alamofire
        /*return NewsModel(status: "ok",
                         totalResults: 213,
                         articles: [
                            Article(
                                source: Source(id: "id", name: "name"),
                                author: "author",
                                title: "title",
                                description: "description",
                                url: "url",
                                urlToImage: "urltoimage",
                                publishedAt: Date.now,
                                content: "content"
                            )
                         ]
         */
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 1)
        return [
            Article(
                source: Source(id: "id", name: "name"),
                author: "author",
                title: "title",
                description: "description",
                url: "url",
                urlToImage: "urltoimage",
                publishedAt: Date.now,
                content: "content"
            )
         ]
    }
}
