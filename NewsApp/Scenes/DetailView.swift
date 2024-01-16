//
//  DetailView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @State private var viewModel = DetailViewModel(repository: SwiftDataRepository())
    @State private var isPresentWebView = false
    
    var article: Article
    
    var body: some View {
        NavigationSplitView {
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
                Text(article.title ?? "title")
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
                            .navigationTitle(article.title ?? "title")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        } detail: {
        }
        .toolbar {
            ShareLink(item: URL(string:article.url!)!)
            Button {
                if(viewModel.isFavorite(article)) {
                    viewModel.removeFavorite(article)
                }
                viewModel.addFavorite(article)
                
            } label: {
                Image(systemName: viewModel.isFavorite(article) ? "heart.fill" : "heart")
            }
        }
    }
}
