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
    @State private var viewModel = DetailViewModel(
        repository: Repository(
            network: NetworkManager())
    )
    @State private var isPresentWebView = false
    
    var article: Article
    
    var body: some View {
        NavigationSplitView {
            //Button("Add Sample", action: viewModel.addFavorite)
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
        } detail: {
        }
        .toolbar {
            ShareLink(item: URL(string:article.url!)!)
            Button {
                viewModel.addFavorite(article)
            } label: {
                Image(systemName: "heart")
            }
        }
    }
}
