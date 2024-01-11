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
    }
}
