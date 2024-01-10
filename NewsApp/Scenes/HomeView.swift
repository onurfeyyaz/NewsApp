//
//  ContentView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel(repository: Repository(network: NetworkManager()))
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationSplitView {
            VStack {
                if let articles = viewModel.articles {
                    List {
                        ForEach(articles, id:\.title) { article in
                            NavigationLink(destination: DetailView()) {
                                HStack {
                                    VStack {
                                        Text(article.title)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .fontWeight(.bold)
                                        Text(article.description)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    Rectangle()
                                        .frame(width: 80)
                                        .redacted(reason: .placeholder)
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Ara")
                }
                else {
                    ProgressView()
                }
            }
            .navigationTitle("Appcent News")
            .onAppear() {
                Task {
                    try await viewModel.fetchNews()
                }
            }
        } content: {
            VStack {
                Text("Content Screen")
            }
            .navigationTitle("content")
        } detail: {
            VStack {
                Text("Detail Screen")
            }
            .navigationTitle("detail")
        }
    }
}

#Preview {
    HomeView()
}
