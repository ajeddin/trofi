//
//  NetworkManager.swift
//  trofi
//
//  Created by Mohamed Midani on 5/24/24.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var recipes: [Recipe] = []

    let appID = "2caec870"
    let appKey = "ec0843f4a25b8549c699c9229603a8d6"
    let baseURL = "https://api.edamam.com/api/recipes/v2"

    func fetchRecipes(query: String) {
        
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "app_id", value: appID),
            URLQueryItem(name: "app_key", value: appKey)
            
        ]

        guard let url = urlComponents.url else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.recipes = decodedResponse.hits.map { $0.recipe }
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }
        task.resume()
    }
}













//#Preview {
//    NetworkManager()
//}
