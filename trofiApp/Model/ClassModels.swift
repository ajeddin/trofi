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
    var imageData: Data?;
    var title:String = "";
    var descriptionMeal : String = ""
    var recipeLink : String = ""

    init( imageData: Data? = nil,  title: String, descriptionMeal: String, recipeLink: String ) {
        self.id = UUID().uuidString
        self.imageData = imageData
        self.title = title
        self.descriptionMeal = descriptionMeal
        self.recipeLink = recipeLink
    }
}
