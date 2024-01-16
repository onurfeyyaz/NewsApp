//
//  FavoriteView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 11.01.2024.
//

import SwiftUI
import Kingfisher
import SwiftData

struct FavoriteView: View {
    @State private var viewModel = FavoriteViewModel(repository: SwiftDataRepository())
    
    var body: some View {
        NavigationSplitView {
            VStack {
                if viewModel.favoriteArticles.isEmpty {
                    Text("There is no favorite article...\nPull to refresh")
                        .refreshable {
                            viewModel.fetchFavorites()
                        }
                } else {
                    List {
                        ForEach(viewModel.favoriteArticles, id:\.title) { article in
                            NavigationLink(destination: DetailView(article: article)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(article.title ?? "title")
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
                                viewModel.fetchFavorites()
                            }
                            .refreshable {
                                viewModel.fetchFavorites()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        } detail: {
            
        }
    }
}
