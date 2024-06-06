//
//  insightsView.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI
import Charts
import Foundation
import SwiftData




struct RatingData: Identifiable {
    let id = UUID()
    let date: Date
    let rating: Float
}


struct CookingFrequencyData: Identifiable {
    let id = UUID()
    let period: String
    let count: Int
}



struct insightsView: View {
    @StateObject var sharedInsightsModel = InsightsModel()

    @Environment(\.modelContext) private var context
    @Query var meals: [LoggedMeals]
    @Query var recipes: [RecipeData]
    var geoProx : GeometryProxy

        
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Insights")
                    .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                    .padding(.bottom)
                HStack{
                    
                    InsightCard(title: "# of Meals Logged", value: "\(sharedInsightsModel.totalMealsLogged)")
                    InsightCard(title: "# of Recipes Added", value: "\(sharedInsightsModel.totalRecipesAdded)")
                }
                HStack{
                    
                    InsightCard(title: "Highest Rated Dish", value: sharedInsightsModel.highestRatedDish)
                    InsightCard(title: "Lowest Rated Dish ", value: sharedInsightsModel.lowestRatedDish)
                }
                
//                VStack(alignment: .leading) {
//                    Text("Average Rating Over Time")
//                        .font(.headline)
//                    LineChartView(data: sharedInsightsModel.averageRatingData)
//                        .frame(height: 200)
//                }
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                
                
                
                VStack(alignment: .leading) {
                    Text("Cooking Frequency")
                        .font(.headline)
                    BarChartView(data: sharedInsightsModel.cookingFrequencyData)
                        .frame(height: 200)
                }
                .padding()
                .background(Color.foreGround)
                .cornerRadius(10)
                .shadow(radius: 5)
                
             
            }
            .padding()
            
            Spacer()
            
            Text("More Features To Come. \n         Stay Tuned :)").bold().shadow(radius: 1)                .foregroundColor(Color.backGround)

        }
        .onAppear {

            sharedInsightsModel.calculateInsights(from: meals, recipes: recipes)

        }
    }
    
}

struct InsightCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.backGround)

//            Color.backGround
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }
        .padding()
        .background(Color.foreGround)
        .cornerRadius(10)
        .shadow(radius: 5)
//        .foregroundColor(Color("accentColor"))

    }
}

//struct LineChartView: View {
//    var data: [RatingData]
//        
//        var body: some View {
//            Chart(data) { point in
//                LineMark(
//                    x: .value("Date", point.date),
//                    y: .value("Rating", point.rating)
//                )
//            }
//            .chartXAxis {
//                AxisMarks(values: .stride(by: .day)) { value in
//                    AxisValueLabel(format: .dateTime.day().month().year(), centered: true)
//                    AxisTick(centered: true)
//                    AxisGridLine(centered: true)
//                }
//            }
//        }
//    }


struct BarChartView: View {
    var data: [CookingFrequencyData]
     
     var body: some View {
         Chart(data) { point in
             BarMark(
                 x: .value("Day", point.period),
                 y: .value("Count", point.count)
             )
         }
     }
 }

//
//
//
//#Preview {
//    insightsView()
//}
