//
//  InsightsModel.swift
//  trofi
//
//  Created by Mohamed Midani on 5/30/24.
//

import SwiftUI
import Combine
import SwiftData




class InsightsModel: ObservableObject {
    @Published var totalMealsLogged: Int = 0
    @Published var totalRecipesAdded: Int = 0
    @Published var highestRatedDish: String = ""
    @Published var lowestRatedDish: String = ""
    @Published var averageRatingData: [RatingData] = []
    @Published var cookingFrequencyData: [CookingFrequencyData] = []

    func calculateInsights(from meals: [LoggedMeals], recipes: [RecipeData]) {
        totalMealsLogged = meals.count
        totalRecipesAdded = recipes.count

        // Calculate highest and lowest rated dishes
        if let highestRated = meals.max(by: { $0.rating < $1.rating }) {
            highestRatedDish = highestRated.title
        }
        if let lowestRated = meals.min(by: { $0.rating < $1.rating }) {
            lowestRatedDish = lowestRated.title
        }

        // Calculate average rating over time
        let groupedByDate = Dictionary(grouping: meals) { Calendar.current.startOfDay(for: $0.date) }
        averageRatingData = groupedByDate.map { (date, meals) in
            let averageRating = meals.map { $0.rating }.reduce(0, +) / Float(meals.count)
            return RatingData(date: date, rating: Float(averageRating))
        }.sorted(by: { $0.date < $1.date })

        // Calculate cooking frequency
        let groupedByDay = Dictionary(grouping: meals) { Calendar.current.component(.weekday, from: $0.date) }
        cookingFrequencyData = groupedByDay.map { (weekday, meals) in
            let dayName = DateFormatter().weekdaySymbols[weekday - 1]
            return CookingFrequencyData(period: dayName, count: meals.count)
        }.sorted(by: { $0.period < $1.period })
    }
}



