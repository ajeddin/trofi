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
                  
                  let gridItemSize = (geoProx.size.width - 2 * 3) / 3
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
                    .cornerRadius(15)
                    .shadow(radius: 10)
//                    .padding()
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 200)
                    .cornerRadius(15)
//                    .padding()
                
            }
            
            Text(meal.date, format: .dateTime.day().month().year())
                .font(.headline)
                .padding(5)
            Text(meal.title)
                .font(.largeTitle)
                .fontWeight(.bold)
//                .padding()
            
            
            
            VStack(alignment: .leading, spacing: 10) {
                

                    
                Text(meal.type)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
               
                Text("Notes:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text(meal.descriptionMeal)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Text("Recipe Link:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                HStack{   if let url = URL(string: meal.recipeLink) {
                    
                    Link(destination: url) {
                        Text(meal.recipeLink)
                            .foregroundColor(.blue)
                            .underline()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                    HStack{
                        Text ("\(meal.rating, specifier: "%.1f")")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.trailing, 5)
                        Image(systemName: "star.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    Spacer()

                }
                Spacer()

            }
            .padding()
            
            Spacer()
            
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarTitle(Text(meal.title), displayMode: .inline)
    }
    
}
#Preview {
    GeometryReader{ geoProx in
        galleryView(geoProx: geoProx)
    }
}
