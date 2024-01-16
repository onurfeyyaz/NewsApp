//
//  NewsViewView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI
import SwiftData
import Kingfisher

struct NewsView: View {
    @ObservedObject private var viewModel = NewsViewModel(
        repository: Repository(
            network: NetworkManager()))
    
    @State private var searchText: String = ""
    
    @Environment(\.modelContext) var modelContext
    @Query var art: [Article]
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List {
                    if let articles = viewModel.articles {
                        ForEach(articles, id:\.title) { article in
                            NavigationLink(destination: DetailView(article: article)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(article.title)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .lineLimit(1)
                                        Text(article.newsDescription ?? "description")
                                            .font(.subheadline)
                                            .lineLimit(3)
                                    }
                                    Spacer(minLength: 20)
                                    if let imageURL = article.urlToImage {
                                        KFImage(URL(string: imageURL))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100)
                                    } else {
                                        Rectangle()
                                            .fill(.gray)
                                            .frame(width: 100)
                                    }
                                }
                            }
                            .onAppear() {
                                if viewModel.isLastItem(item: articles.last) {
                                    viewModel.fetchNews()
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Haber Ara")
                .onChange(of: searchText) { _, newValue in
                    Task {
                        viewModel.searchNews(query: newValue)
                    }
                }
                
            }
            .navigationTitle("Appcent News")
        } detail: {
            //DetailView(article)
        }
    }
}

#Preview {
    NewsView()
}
