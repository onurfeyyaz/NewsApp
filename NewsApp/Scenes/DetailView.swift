//
//  DetailView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI
import Kingfisher
import SwiftData

struct DetailView: View {
    @State private var isPresentWebView = false
    @State private var viewModel: ViewModel
    
    @Query(sort: \Article.title) var articles: [Article]
    
    var articleDetail: Article
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.articles) { article in
                VStack {
                    if let imageURL = article.urlToImage {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                    } else {
                        Rectangle()
                            .fill(.gray)
                            .frame(maxWidth: .infinity)
                    }
                    Text(article.title)
                    HStack(spacing: 50) {
                        Label(article.author ?? "author", systemImage: "person.crop.circle")
                        Label(article.formattedPublishedDate ?? "12.12.12", systemImage: "calendar")
                    }
                    .padding()
                    ScrollView {
                        Text(article.newsDescription ?? "description")
                    }
                    Spacer()
                    Button {
                        isPresentWebView = true
                    } label: {
                        Text("News Source")
                    }
                    .padding(12)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isPresentWebView) {
                        NavigationStack {
                            WebView(url: URL(string: article.url!)!)
                                .ignoresSafeArea()
                                .navigationTitle(article.title)
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
        } detail: {
        }
        .toolbar {
            ShareLink(item: URL(string:"article.url!")!)
            
            Button {
                
            } label: {
                Image(systemName: "heart")
            }
        }
    }
    
    init(article: Article, modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
        
        self.articleDetail = article
    }
}

extension DetailView {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        var articles = [Article]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }
        
        func fetchData() {
            do {
                let descriptor = FetchDescriptor<Article>(sortBy: [SortDescriptor(\.title)])
                articles = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
    }
}
