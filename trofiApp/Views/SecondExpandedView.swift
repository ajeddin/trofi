//
//  SecondExpandedView.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI
import SwiftData

struct SecondExpandedView: View {
    @State var searchQuery = ""

    var namespace: Namespace.ID
    var geoProx : GeometryProxy

    @State private var textField: String = ""
    @State private var appear: Bool = false
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.modelContext) private var context
    @ObservedObject var networkManager : NetworkManager

        var body: some View {
            NavigationStack {
                
                ZStack {
                    
                    ZStack(alignment: .bottom) {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            HStack {
                                Text("Recipe Search")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.backGround)
                                
                                
                                
                                Spacer()
                                Button(action: {
                                    withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 2)) {
                                        viewModel.showItems = false
                                        HapticManager.instance.impact(style: .light)
                                        viewModel.selectedExpandIndex = nil
                                    }
                                    
                                    //                            viewModel.moveItems = false
                                    
                                }, label: {
                                    Image(systemName: "xmark")
                                        .renderingMode(.template)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray100)
                                        .padding(12)
                                        .background(Color.accentColor)
                                        .cornerRadius(32)
                                })
                            }
                            .padding(.top,60)
                            .padding()
                            VStack(spacing: 16) {
                                
                                        TextField("Search for recipes", text: $searchQuery, onCommit: {
                                            networkManager.fetchRecipes(query: searchQuery)
                                            
                                        }).background(Color("backgroundColor")).submitLabel(.done)
                                            
                                        
                                        //                                                    .padding()
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
                                                    .clipShape(RoundedRectangle(cornerRadius: 45))
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text(recipe.label)
                                                            .font(.headline)
                                                        Text(recipe.source)
                                                            .font(.subheadline)
                                                            .foregroundColor(.secondary)
                                                    }
                                                }
                                            }
                                            .scrollContentBackground(.hidden)

                                        }.scrollContentBackground(.hidden)
                                    
//                                    Spacer()
                                    
                                    
                                
                            }
                            .padding(.horizontal, 15)
                            .padding(.top, 5)
                     
                            
                        }
                        
                        .scaleEffect(appear ? 1 : 0.5, anchor: .bottom)
                        .opacity(appear ? 1 : 0)
                        .transition(.scale(scale: 1))
                        .padding(.bottom, 50)
                    }
                    .fontDesign(.rounded)
//                    .background(
//                        RoundedRectangle(cornerRadius: 24, style: .continuous)
//                            .fill(.gray0)
//                            .matchedGeometryEffect(id: "background", in: namespace)
//                    )
                    .mask({
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                        
                    })
                    .ignoresSafeArea(.all)
                    
                    .onAppear(perform: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.85, blendDuration: 1)) {
                            appear = true
                        }
                    })
                }
            }        }
    }

    struct RecipeDetailView: View {
        let recipe: Recipe
        
        @Environment(\.modelContext) private var context
        @EnvironmentObject var viewModel: HomeViewModel

        var body: some View {
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
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
            .toolbar {
                                Button {
                                    let recipeData = RecipeData(imageData: recipe.image,title: recipe.label, descriptionMeal: "Fixing", recipeLink: recipe.url, recipeSource: recipe.source)
                                    
                                    context.insert(recipeData)
                                    try? context.save()
                                    withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 2)) {
                                        viewModel.showItems = false
                                        HapticManager.instance.impact(style: .light)
                                        viewModel.selectedExpandIndex = nil}
                                    
                                    
                                    
                                } label: {
                                    Image(systemName: "heart")
                                }

            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }

//struct SecondExpandedView_Preview: PreviewProvider {
//    @Namespace static var namespace
//    
//    static var previews: some View {
//        GeometryReader{geoProx in
//            SecondExpandedView(namespace: namespace, geoProx: geoProx)
//                .environmentObject(HomeViewModel())
//        }
//    }
//}

