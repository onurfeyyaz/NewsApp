//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article]?
    
    private var currentPage = 1
    private let repository: Repository
    private var currentQuery = ""
    private var articleList: [Article] = []
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func searchNews(query: String) {
        currentQuery = query
        fetchNews()
    }
    
    func fetchNews() {
        repository.retrieveNews(query: currentQuery, page: currentPage) { result in
            switch result {
            case .success(let newArticles):
                DispatchQueue.main.async {
                    self.articleList.append(contentsOf: newArticles)
                    self.articles = self.articleList
                    //self.currentPage += 1
                    print("CURRENNT PAGEEEE: \(self.currentPage)")
                    print("ARTİLCES NUMBER ---------> \(self.articleList.count)")
                }
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
        }
         /*
        self.articles = [
            Article(
                source: Source(id: "id", name: "name"),
                author: "author",
                title: "title",
                description: "description",
                url: "https://www.apple.com/app-store",
                urlToImage: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/store-card-40-iphone-15-pro-202309?wid=800&hei=1000&fmt=p-jpg&qlt=95&.v=1692910040844",
                publishedAt: "17.01.2024",
                content: "content"
            )
        ]*/
    }
    
    func isLastItem<T: Identifiable>(item: T?) -> Bool {
        guard let item = item else { return false }
        return self.articles?.last?.title as! T.ID == item.id
    }
}
