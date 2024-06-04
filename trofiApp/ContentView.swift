//
//  ContentView.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    @StateObject var viewModelTwo = HomeViewModel()
    @StateObject var sharedInsightsModel = InsightsModel()


    @Namespace var namespace
    @Namespace var namespace3

    var body: some View {
        if (viewModel.showItems == true){
            TabView {
                
                homePage(namespace: namespace, expand: ExpandSection(title: "Send", description: "Send tokens or collectibles to any address or ENS username.", imageName: "paperplane.fill", backgroundColor: .blue))
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Log", systemImage: "fork.knife")}
                    .toolbar(.hidden, for: .tabBar)
                galleryView()
                    .tabItem {
                        Label("Gallery", systemImage: "photo")}
                    .toolbar(.hidden, for: .tabBar)
                insightsView()
                    .tabItem {
                        Label("Insights", systemImage: "chart.xyaxis.line")}
                    .toolbar(.hidden, for: .tabBar)
                    .environmentObject(sharedInsightsModel)
                   
               recipeView(namespace: namespace)
                    .environmentObject(viewModelTwo)

                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                    .toolbar(.hidden, for: .tabBar)
                
            }
            .overlay(
                Group {
                if viewModel.showItems {
                    FirstExpandedView(namespace: namespace, sharedInsightsModel: InsightsModel())
                        .environmentObject(sharedInsightsModel)
                        .environmentObject(viewModel)
                }
            }
            )
        }
            else{
            TabView {
                
                homePage(namespace: namespace, expand: ExpandSection(title: "Send", description: "Send tokens or collectibles to any address or ENS username.", imageName: "paperplane.fill", backgroundColor: .blue))
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Log", systemImage: "fork.knife")}
                galleryView()
                    .tabItem {
                        Label("Gallery", systemImage: "photo")}
                insightsView()
                    .tabItem {
                        Label("Insights", systemImage: "chart.xyaxis.line")}
                recipeView(namespace: namespace)
                    .environmentObject(viewModelTwo)

                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                
            }
        }}
        }


#Preview {
    ContentView()
}
