//
//  recipeView.swift
//  trofi
//
//  Created by Abdulaziz Jamaleddin on 5/29/24.
//


import SwiftUI
import SwiftData
struct recipeView: View {

    @EnvironmentObject var viewModelTwo: HomeViewModel
    @State private var show: Bool = false
    @State private var appear: Bool = true
    @State private var selectedExpandIndex: Int? = nil
    @Environment(\.modelContext) private var context
    @Query private var recipes: [RecipeData]
    var namespace: Namespace.ID
    var geoProx : GeometryProxy
    @ObservedObject var networkManager : NetworkManager


    var body: some View {
        
         ZStack(alignment: .bottomTrailing) {
//             ContentView()
             lowFidelityTwo
             

             if viewModelTwo.selectedExpandIndex != nil {
                     if let index = viewModelTwo.selectedExpandIndex {
                         switch index {
                         case 0:
                             SecondExpandedView(namespace: namespace, geoProx: geoProx, networkManager: networkManager)
//                         case 1:
//                             SecondExpandedView(namespace: namespace)
//
                         default:
                             Text("Failed")
                         }
                     }
                 } else {
                     ZStack(content: {
                         combinedViewsTwo
                             .padding(20)
                     })
                     .transition(.scale(scale: 1))
                 }
             
         }
    }
}




extension recipeView {
    var plusButtonTwo: some View {
        Button {
            HapticManager.instance.impact(style: .light)
            withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 1)) {
                viewModelTwo.selectedExpandIndex=0;
                viewModelTwo.showItems = true
                
            }
            
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.gray0)
                .padding(16)
        }

    }
    
    var combinedViewsTwo: some View {
        ZStack {
            if !viewModelTwo.showItems {
                plusButtonTwo
            }
           
        }
        .padding(viewModelTwo.showItems ? 8 : 0)
        .background(
            RoundedRectangle(cornerRadius: viewModelTwo.showItems ? 24 : 32, style: .continuous)
                .fill(Color("AccentColor"))
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask({
            RoundedRectangle(cornerRadius: viewModelTwo.showItems ? 24 : 32, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        })
    }
    
    var lowFidelityTwo: some View {
        NavigationStack {

        ZStack(alignment: .bottom, content: {
            //        ZStack{
            VStack{
                
                VStack(alignment: .center) {
                    HStack{
                        Text("trofi")
                            .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                            .kerning(4)
                        
                        Spacer()
                    }
                    //
                    
                    Divider().frame(height: 1).background(.backGround)
                    
                    
                    
                }
                .padding(.top, 24)
                //
                
                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe, geoProx: geoProx)) {
                        HStack {
                            
                            AsyncImage(url: URL(string: recipe.imageData)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 45))

                            
                            VStack(alignment: .leading) {
                                Text(recipe.title)
                                    .font(.headline)
                                Text(recipe.recipeSource)
                                    .font(.subheadline)
                                    .foregroundColor(.backGround)
                            }
                        }  .swipeActions {
                            Button(action:
                                    { 
                                context.delete(recipe)
                                try? context.save()
                            }) {
                                Label("", systemImage: "trash")
                            }
                            .tint(.red)}
                    } .scrollContentBackground(.hidden)

                }.scrollContentBackground(.hidden)
                
            }
            .frame(maxWidth: .infinity)
            
            .scrollIndicators(.hidden)
            //            .scaleEffect(viewModelTwo.moveItems ? 0.8 : 1, anchor: .bottom)
        }
        )
        .padding(.horizontal, 20)
//        .background(.gray0)
    }
    }
}



struct RecipeDetail: View {
    let recipe: RecipeData
    var geoProx : GeometryProxy

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.imageData)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 45))

          
            Text(recipe.title)
                .font(.largeTitle)
                .padding()
            Text(recipe.descriptionMeal)
                .font(.caption)
                .padding()
            Text("Source: \(recipe.recipeSource)")
                .font(.subheadline)
                .padding()

            Link("View Recipe", destination: URL(string: recipe.recipeLink)!)
                .font(.title2)
                .padding()
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct recipeView_Preview: PreviewProvider {
//    @Namespace static var namespace
//
//    static var previews: some View {
//        GeometryReader{geoProx in
//            recipeView(namespace: namespace, geoProx: geoProx)
//                .environmentObject(HomeViewModel())
//        }
//    }
//}
