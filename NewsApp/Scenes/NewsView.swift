//
//  NewsViewView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var viewModel = NewsViewModel(repository: Repository(network: NetworkManager()))
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List {
                    if let articles = viewModel.articles {
                        ForEach(articles, id:\.title) { article in
                            NavigationLink(destination: DetailView(article: article)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(article.title ?? "title")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .lineLimit(1)
                                        Text(article.description ?? "description")
                                            .font(.subheadline)
                                            .lineLimit(3)
                                    }
                                    Spacer(minLength: 20)
                                    Rectangle()
                                        .frame(width: 80)
                                        .redacted(reason: .placeholder)
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Haber Ara")
                .onChange(of: searchText) { _, newValue in
                    Task {
                        viewModel.fetchNews(query: newValue, page: 1)
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
