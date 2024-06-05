//
//  ClassModels.swift
//  trofi
//
//  Created by Abdulaziz Jamaleddin on 5/22/24.
//

import Foundation
import SwiftData

@Model
class LoggedMeals : Identifiable{
    var id : String =  ""
    var date: Date = Date.now
    var imageData: Data?;
    var type: String = ""
    var price: Float = 0.0
    var title:String = "";
    var descriptionMeal : String = ""
    var recipeLink : String = ""
    var rating : Float = 0

    init( imageData: Data? = nil, type: String, price: Float, title: String, descriptionMeal: String, recipeLink: String, rating: Float) {
        self.id = UUID().uuidString
        self.imageData = imageData
        self.type = type
        self.price = price
        self.title = title
        self.descriptionMeal = descriptionMeal
        self.recipeLink = recipeLink
        self.rating = rating
    }
}

@Model
class RecipeData : Identifiable{
    var id : String =  ""
    var imageData: String = "";
    var title:String = "";
    var descriptionMeal : String = ""
    var recipeLink : String = ""
    var recipeSource: String = ""

    init( imageData: String ,  title: String, descriptionMeal: String, recipeLink: String, recipeSource: String ) {
        self.id = UUID().uuidString
        self.imageData = imageData
        self.title = title
        self.descriptionMeal = descriptionMeal
        self.recipeLink = recipeLink
        self.recipeSource = recipeSource

    }
}
