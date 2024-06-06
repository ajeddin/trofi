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
    var geoProx : GeometryProxy

      var body: some View {
          NavigationStack {
              ScrollView {
                  
                  let gridItemSize = (geoProx.size.width - 2 * 3) / 3 // 3 columns with 2 points of spacing between them
                  LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 2)], spacing: 2) {
                      ForEach(meals) { meal in
                          if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                              Image(uiImage: uiImage)
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: gridItemSize, height: gridItemSize)

//                                  .frame(width: 100, height: 100)
//                                  .frame(width: geoProx.size.width/1.1, height: geoProx.size.height/5.5)

                                  .clipped()
                                  .contentShape(Rectangle()) // Ensure the tappable area is the same as the image

                                  .onTapGesture {
                                      selectedMeal = meal
                                  }
                          } else {
                              Rectangle()
                                  .fill(Color.gray)
                                  .frame(width: gridItemSize, height: gridItemSize)
                                  .contentShape(Rectangle()) // Ensure the tappable area is the same as the rectangle

                                  .onTapGesture {
                                      selectedMeal = meal
                                  }
                          }
                      }
                  }
                  .padding(.horizontal, 1)
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
            HStack{
                Text(meal.title)
                    .font(.largeTitle)
                    .padding()
                Text ("\(meal.rating, specifier: "%.1f")")
                Image(systemName: "star.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 20)
                    .foregroundColor(.accentColor)
            }
            
            Text(meal.date, format: .dateTime.day().month().year())
            
            Text(meal.type)
           
            Spacer()
            
            VStack{
                Text("Notes: \(meal.descriptionMeal)")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Spacer()
                
                Text(meal.recipeLink)
                
                Spacer()
                Spacer()
            }
            .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    GeometryReader{ geoProx in
        galleryView(geoProx: geoProx)
    }
}
