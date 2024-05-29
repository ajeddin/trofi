//
//  insightsView.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI
import Charts



struct RatingData: Identifiable {
    let id = UUID()
    let date: Date
    let rating: Double
}


struct CookingFrequencyData: Identifiable {
    let id = UUID()
    let period: String
    let count: Int
}



struct insightsView: View {
    @State private var totalMealsLogged: Int = 0
    @State private var totalRecipesAdded: Int = 0
    @State private var mealsLoggedStreak: Int = 0
    @State private var highestRatedDish: String = ""
    @State private var lowestRatedDish: String = ""
    @State private var averageRatingData: [RatingData] = []
    @State private var cookingFrequencyData: [CookingFrequencyData] = []
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Insights")
                    .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                    .padding(.bottom)
                
                InsightCard(title: "Total Number of Meals Logged", value: "\(totalMealsLogged)")
                InsightCard(title: "Total Number of Recipes Added", value: "\(totalRecipesAdded)")
                InsightCard(title: "Meals Logged Streak", value: "\(mealsLoggedStreak) days")
                
                VStack(alignment: .leading) {
                    Text("Average Rating Over Time")
                        .font(.headline)
                    LineChartView(data: averageRatingData)
                        .frame(height: 200)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                
                
                VStack(alignment: .leading) {
                    Text("Cooking Frequency")
                        .font(.headline)
                    BarChartView(data: cookingFrequencyData)
                        .frame(height: 200)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                InsightCard(title: "Highest Rated Dish", value: highestRatedDish)
                InsightCard(title: "Lowest Rated Dish", value: lowestRatedDish)
            }
            .padding()
        }
        .onAppear {
            // Load your data here
            loadData()
        }
    }
    
    func loadData() {
        let exampleData = [
          
                    
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 8), rating: 2.0),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 7), rating: 1.5),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 6), rating: 3.6),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 5), rating: 4.2),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 4), rating: 5.0),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 3), rating: 3.7),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 2), rating: 4.2),
                   RatingData(date: Date(timeIntervalSinceNow: -86400 * 1), rating: 4.7)
               ]
               averageRatingData = exampleData
        
        let exampleCookingFrequencyData = [
                   CookingFrequencyData(period: "Monday", count: 2),
                   CookingFrequencyData(period: "Tuesday", count: 3),
                   CookingFrequencyData(period: "Wednesday", count: 1),
                   CookingFrequencyData(period: "Thursday", count: 4),
                   CookingFrequencyData(period: "Friday", count: 5),
                   CookingFrequencyData(period: "Saturday", count: 3),
                   CookingFrequencyData(period: "Sunday", count: 2)
               ]
               cookingFrequencyData = exampleCookingFrequencyData
           }
}

struct InsightCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
//        .foregroundColor(Color("accentColor"))

    }
}

struct LineChartView: View {
    var data: [RatingData]
        
        var body: some View {
            Chart(data) { point in
                LineMark(
                    x: .value("Date", point.date),
                    y: .value("Rating", point.rating)
                )
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisValueLabel(format: .dateTime.day().month().year(), centered: true)
                    AxisTick(centered: true)
                    AxisGridLine(centered: true)
                }
            }
        }
    }


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




#Preview {
    insightsView()
}
