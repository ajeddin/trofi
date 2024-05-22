//
//  ClassModels.swift
//  trofi
//
//  Created by Abdulaziz Jamaleddin on 5/22/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class LoggedMeals : Identifiable{
    var id : String?
    @Attribute(.externalStorage)
    var imageData: Data?;
    var type: String = ""
    var title:String = "";
    var descriptionMeal : String = ""
    
    var recipeLink : String = ""

    init(id: String? = nil, imageData: Data? = nil, type: String, title: String, descriptionMeal: String, recipeLink: String) {
        self.id = id
        self.imageData = imageData
        self.type = type
        self.title = title
        self.descriptionMeal = descriptionMeal
        self.recipeLink = recipeLink
    }
    

}


