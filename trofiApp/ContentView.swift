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
    @Namespace var namespace

    var body: some View {
        if (viewModel.moveItems == true){
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
                recipeView()
                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                    .toolbar(.hidden, for: .tabBar)
                
            }
        }else{
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
                recipeView()
                    .tabItem {
                        Label("Recipes", systemImage: "note.text")}
                
            }
        }}
        }


#Preview {
    ContentView()
}
