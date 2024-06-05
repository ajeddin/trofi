//
//  loggedMealView.swift
//  trofi
//
//  Created by Abdulaziz Jamaleddin on 6/5/24.
//

import SwiftUI
import SwiftData

struct loggedMealView: View {
    let meal: LoggedMeals
    
    @Environment(\.modelContext) private var context
    @Query private var meals: [LoggedMeals];

    var body: some View {
        VStack {
            if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 344, height: 200)
                    .scaledToFit()
                    .cornerRadius(16)
                    .clipped()
                Text(meal.title)

                
            }
            else{
                Text("failed")
            }
            
            
            
            
        } .navigationTitle("Meal Details")
            
            .navigationBarTitleDisplayMode(.inline)
    }
}
//#Preview {
//    loggedMealView(meal: meals.first )
//}
