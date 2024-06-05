//
//  galleryView.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI
import SwiftData




struct galleryView: View {
    
      @Query private var meals: [LoggedMeals]
    
      @State private var selectedMeal: LoggedMeals? = nil

      var body: some View {
          NavigationView {
              ScrollView {
                  LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                      ForEach(meals) { meal in
                          if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                              Image(uiImage: uiImage)
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 100, height: 100)
                                  .clipped()
                                  .onTapGesture {
                                      selectedMeal = meal
                                  }
                          } else {
                              Rectangle()
                                  .fill(Color.gray)
                                  .frame(width: 100, height: 100)
                                  .onTapGesture {
                                      selectedMeal = meal
                                  }
                          }
                      }
                  }
                  .padding()
              }
              .navigationTitle("Meal Gallery")
              .sheet(item: $selectedMeal) { meal in
                  DetailedMealView(meal: meal)
              }
          }
      }
}

struct DetailedMealView: View {
    var meal: LoggedMeals

    var body: some View {
        VStack {
            if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
            }
            
            Text(meal.date, format: .dateTime.day().month().year())
            
            Text(meal.title)
                .font(.largeTitle)
                .padding()
            
            
            Text(meal.descriptionMeal)
                .padding()
            
            
            Text(meal.type)
            HStack{
                Text ("\(meal.rating, specifier: "%.1f")")
                Image(systemName: "star.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 20)
                    .foregroundColor(.accentColor)
            }
            
       
            
            Text(meal.recipeLink)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    galleryView()
}
