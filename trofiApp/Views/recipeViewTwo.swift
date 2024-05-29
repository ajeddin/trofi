////
////  recipeViewTwo.swift
////  trofi
////
////  Created by Abdulaziz Jamaleddin on 5/29/24.
////
//
//
//import SwiftUI
//import SwiftData
//struct recipeViewTwo: View {
//
//    @EnvironmentObject var viewModel: HomeViewModel
//    @State private var show: Bool = false
//    @State private var appear: Bool = true
//    @State private var selectedExpandIndex: Int? = nil
//    var namespace: Namespace.ID
//    
//    let section: [ExpandSection] = [
////        ExpandSection(title: "Log Meal", description: "Log and track your meal", imageName: "takeoutbag.and.cup.and.straw", backgroundColor: .orange),
////
////        ExpandSection(title: "Explore Recipes", description: "Explore recipes", imageName: "map.fill", backgroundColor: .pink),
////
////        ExpandSection(title: "Stay", description: "Find the perfect accommodation for a comfortable stay.", imageName: "house.fill", backgroundColor: .teal),
//    ]
//    
//    let expand: ExpandSection
//    
//    var body: some View {
//        
//         ZStack(alignment: .bottomTrailing) {
////             ContentView()
//             lowFidelityTwo
//             
//             // This controls navigation to other views. Currently there are 4 main views, you can add more if you want.
//
//             if viewModel.selectedExpandIndex != nil {
//                     if let index = viewModel.selectedExpandIndex {
//                         switch index {
//                         case 0:
//                             SecondExpandedView(namespace: namespace)
////                         case 1:
////                             SecondExpandedView(namespace: namespace)
////
//                         default:
//                             homePage(namespace: namespace, expand: ExpandSection(title: "jkjkj", description: "", imageName: "", backgroundColor: .clear))
//                         }
//                     }
//                 } else {
//                     ZStack(content: {
//                         combinedViewsTwo
//                             .padding(20)
//                             //.offset(y: viewModel.showItems ? 0 : -80)
//                     })
//                     .transition(.scale(scale: 1))
//                 }
//             
//         }
//    }
//}
//
//
//
//
//extension recipeViewTwo {
//    var plusButtonTwo: some View {
//        Button {
//            HapticManager.instance.impact(style: .light)
//            withAnimation(.spring(response: 0.25, dampingFraction: 0.85, blendDuration: 1)) {
//                viewModel.showItems = true
//                viewModel.selectedExpandIndex=0;
//            }
//            
//        } label: {
//            Image(systemName: "plus")
//                .font(.title)
//                .fontWeight(.semibold)
//                .foregroundStyle(.gray0)
//                .padding(16)
//        }
//
//    }
//    
//    var combinedViewsTwo: some View {
//        ZStack {
//            if !viewModel.showItems {
//                plusButtonTwo
//            }
//            else {
//                VStack(alignment: .leading, spacing: 8) {
//                    if !viewModel.showNextView {
//                        ZStack {
//                            VStack(alignment: .leading, spacing: 8, content: {
//                                ForEach(section.indices, id: \.self) { index in
//                                    Button {
//                                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
//                                            viewModel.selectedExpandIndex = index
//                                            viewModel.moveItems = true
//                                        }
//                                        
//                                    } label: {
////                                        ExpandView(expand: section[index])
//                                    }
//                                    .buttonStyle(BouncyButton())
//                                }
//                            })
//                        }
//                    }
//                }
//                .offset(y: viewModel.moveItems ? -200 : 0)
//                .opacity(viewModel.moveItems ? 0 : 1)
//            }
//        }
//        .padding(viewModel.showItems ? 8 : 0)
//        .background(
//            RoundedRectangle(cornerRadius: viewModel.showItems ? 24 : 32, style: .continuous)
//                .fill(Color("AccentColor"))
//                .matchedGeometryEffect(id: "background", in: namespace)
//        )
//        .mask({
//            RoundedRectangle(cornerRadius: viewModel.showItems ? 24 : 32, style: .continuous)
//                .matchedGeometryEffect(id: "mask", in: namespace)
//        })
//    }
//    
//    var lowFidelityTwo: some View {
//        
//        ZStack(alignment: .bottom, content: {
////        ZStack{
//            VStack{
//                
//                VStack(alignment: .center) {
//                    HStack{
//                        Text("trofi")
//                            .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
//                            .kerning(4)
//                        
//                        Spacer()
//                    }
//                    //
//                    
//                    Divider().frame(height: 1)
//                  
//                    Divider()
//                    
//                    
//                }
//                .padding(.top, 24)
////
//                
//                ScrollView {
////                    ForEach(meals, id: \.id) { meal in
////                        if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
////                            Image(uiImage: uiImage)
////                                .resizable()
////                                .scaledToFit()
////                        } else {
////                            // Provide a placeholder image or handle the case where imageData is nil or invalid
////                            Image(systemName: "logoTrofi")
////                                .resizable()
////                                .scaledToFit()
////                        }
////                    }
//                }
//
//            }
//            .frame(maxWidth: .infinity)
//
//            .scrollIndicators(.hidden)
////            .scaleEffect(viewModel.moveItems ? 0.8 : 1, anchor: .bottom)
//        }
//        )
//        .padding(.horizontal, 20)
//        .background(.gray0)
//
//    }
//}
//
//struct RecipeViewTwo_Preview: PreviewProvider {
//    @Namespace static var namespace
//    
//    static var previews: some View {
//        recipeViewTwo(namespace: namespace, expand: ExpandSection(title: "Send", description: "Send tokens or collectibles to any address or ENS username.", imageName: "paperplane.fill", backgroundColor: .blue))
//            .environmentObject(HomeViewModel())
//    }
//}
