//
//  Network.swift
//  NewsApp
//
//  Created by Feyyaz ONUR on 10.01.2024.
//

import Foundation
import Alamofire

final class NetworkManager: NetworkManagerProtocol {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String
 
    func retrieveNews(query: String, page: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = NewsAPIEndpoint.makeURL(query: query, page: page, apiKey: self.apiKey) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        print("AF url: \(url)")
        AF.request(url).responseDecodable(of: NewsModel.self) { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        completion(.failure(NetworkError.invalidData))
                        return
                    }
                    
                    let articles = try JSONDecoder().decode(NewsModel.self, from: data).articles
                    print("articless \(articles)")
                    completion(.success(articles))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
