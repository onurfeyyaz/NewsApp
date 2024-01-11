//
//  DetailView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {

    @State private var isPresentWebView = false
    var article: Article
    
    var body: some View {
        NavigationSplitView {
            VStack {
                if let imageURL = article.urlToImage {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .scaledToFit()
        
                } else {
                    Rectangle()
                        .fill(.gray)
                        .frame(maxWidth: .infinity)
                }
                Text(article.title ?? "title")
                HStack(spacing: 50) {
                    Label(article.author ?? "author", systemImage: "person.crop.circle")
                    Label(article.publishedAt ?? "12", systemImage: "calendar")
                }
                .padding()
                ScrollView {
                    Text(article.description ?? "description")
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
                            .navigationTitle(article.title!)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        } detail: {
        }
        .toolbar {
            ShareLink(item: URL(string:article.url!)!)
            
            Button {
                
            } label: {
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    DetailView(article:
                Article(
                    source: Source(id: "id", name: "name"),
                    author: "author",
                    title: "title",
                    description: "description",
                    url: "url",
                    urlToImage: "urltoimage",
                    publishedAt: "17.01.2024",
                    content: "content"
                )
    )
}
