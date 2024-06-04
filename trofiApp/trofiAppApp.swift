//
//  trofiAppApp.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI

@main
struct trofiAppApp: App {

    var body: some Scene {
        WindowGroup {
//            ContentView()
            viewController()

        }.modelContainer(for: [LoggedMeals.self,RecipeData.self])
     
    }
}
