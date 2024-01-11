//
//  DetailView.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI

struct DetailView: View {
    var article: Article
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Image("placeholder-oryx")
                    .resizable()
                    .scaledToFit()
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
                    // TODO: go to webview
                } label: {
                    Text("News Source")
                }
                .padding(12)
                .buttonStyle(.borderedProminent)
            }
        } detail: {
        }
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
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
