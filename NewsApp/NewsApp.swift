//
//  NewsApp.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import SwiftUI
import SwiftData

@main
struct NewsApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NewsView()
                    .tabItem {
                        Label("News", systemImage: "house.fill")
                    }
                FavoriteView()
                    .tabItem {
                        Label("Favorite", systemImage: "heart.fill")
                    }
            }
        }
        .modelContainer(container)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Article.self)
        } catch {
            fatalError("failed to create ModelContainer for Article")
        }
    }
}
