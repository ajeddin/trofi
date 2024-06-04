//
//  InsightsModel.swift
//  trofi
//
//  Created by Mohamed Midani on 5/30/24.
//

import SwiftUI
import Combine

class InsightsModel: ObservableObject {
    @Published var totalMealsLogged: Int = 0
    @Published var totalRecipesAdded: Int = 0
    @Published var highestRatedDish: String = ""
    @Published var lowestRatedDish: String = ""
    @Published var averageRatingData: [RatingData] = []
    @Published var cookingFrequencyData: [CookingFrequencyData] = []
}
