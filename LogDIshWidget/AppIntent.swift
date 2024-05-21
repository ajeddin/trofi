//
//  AppIntent.swift
//  LogDishWidget
//
//  Created by Mohamed Midani on 5/17/24.
//

import WidgetKit
import AppIntents
import SwiftUI
struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Log a Dish"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    
    
}

struct LogDishIntent: AppIntent {
    static var title: LocalizedStringResource = "Log a Dish"
    static var description = IntentDescription("This intent logs a dish in the app.")

    func perform() async throws -> some IntentResult {
        // Perform the action you want here
        

        
        print("Log Dish Intent Triggered")
        return .result()
    }
}
