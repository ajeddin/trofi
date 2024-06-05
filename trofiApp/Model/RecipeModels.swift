//
//  RecipeModels.swift
//  trofi
//
//  Created by Mohamed Midani on 5/24/24.
//

import Foundation


struct RecipeResponse: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let recipe: Recipe
}

struct Recipe: Codable, Identifiable {
    let id = UUID()
    let label: String
    let image: String
    let source: String
    let url: String
    let calories: Double
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
    let ingredientLines : [String]
    let healthLabels : [String]
    enum CodingKeys: String, CodingKey {
        case label, image, source, url, calories, cuisineType, mealType, dishType, ingredientLines, healthLabels
    }
}
