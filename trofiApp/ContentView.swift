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
    @ObservedObject var networkManager = NetworkManager()

    
    @Namespace var namespace
    @Namespace var namespace3
    
    var body: some View {
        GeometryReader{ geoProx in

        if (viewModel.showItems == true){
            TabView {
                
                homePage(namespace: namespace, geoProx: geoProx)
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Log", systemImage: "fork.knife")}
                    .toolbar(.hidden, for: .tabBar)
                galleryView (geoProx: geoProx)
                    .tabItem {
                        Label("Gallery", systemImage: "photo")}
                    .toolbar(.hidden, for: .tabBar)
                insightsView (geoProx: geoProx)
                    .tabItem {
                        Label("Insights", systemImage: "chart.xyaxis.line")}
                    .toolbar(.hidden, for: .tabBar)
                
                recipeView(namespace: namespace, geoProx: geoProx, networkManager: networkManager)
                    .environmentObject(viewModelTwo)
                
                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                    .toolbar(.hidden, for: .tabBar)
                
            }
          
        }
        else{
            TabView {
                
                homePage(namespace: namespace, geoProx: geoProx)
                    .environmentObject(viewModel)
                    .tabItem {
                        Label("Log", systemImage: "fork.knife")}
                galleryView (geoProx: geoProx)
                    .tabItem {
                        Label("Gallery", systemImage: "photo")}
                insightsView (geoProx: geoProx)
                    .tabItem {
                        Label("Insights", systemImage: "chart.xyaxis.line")}
                recipeView(namespace: namespace, geoProx: geoProx, networkManager: networkManager)
                    .environmentObject(viewModelTwo)
                
                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                
            }
        }}
}
        }


#Preview {
    ContentView()
}
