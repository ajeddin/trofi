//
//  recipeView.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI

struct recipeViewTwo: View {
    @ObservedObject var networkManager = NetworkManager()
        @State private var searchQuery = ""

        var body: some View {
            NavigationView {
                VStack {
                    TextField("Search for recipes", text: $searchQuery, onCommit: {
                        networkManager.fetchRecipes(query: searchQuery)
                    })
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    List(networkManager.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            HStack {
                                AsyncImage(url: URL(string: recipe.image)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                                VStack(alignment: .leading) {
                                    Text(recipe.label)
                                        .font(.headline)
                                    Text(recipe.source)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Recipe Search")
            }
        }
    }

    struct RecipeDetailTwo: View {
        let recipe: Recipe

        var body: some View {
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Text(recipe.label)
                    .font(.largeTitle)
                    .padding()

                Text("Source: \(recipe.source)")
                    .font(.subheadline)
                    .padding()

                Link("View Recipe", destination: URL(string: recipe.url)!)
                    .font(.title2)
                    .padding()
            }
            .navigationTitle("Recipe Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    recipeViewTwo()
}
