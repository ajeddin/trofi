////
////  MealView.swift
////  trofi
////
////  Created by Mohamed Midani on 6/4/24.
////
//
//
//import SwiftUI
//import SwiftData
//
//struct MealView: View {
//    @EnvironmentObject var viewModelTwo: HomeViewModel
//    @State private var show: Bool = false
//    @State private var appear: Bool = true
//    @State private var selectedExpandIndex: Int? = nil
//    var namespace: Namespace.ID
//    @Query private var meals: [LoggedMeals]
//
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            // Main Content
//            lowFidelityTwo
//            
//            if viewModelTwo.selectedExpandIndex != nil {
//                if let index = viewModelTwo.selectedExpandIndex, index < meals.count {
////                    MealDetailView(namespace: namespace, meal: meals[index])
//                } else {
//                    MealView(namespace: namespace)
//                }
//            } else {
//                ZStack(content: {
//                    combinedViewsTwo
//                        .padding(20)
//                })
//                .transition(.scale(scale: 1))
//            }
//        }
//    }
//}
//
//extension MealView {
//    var plusButtonTwo: some View {
//        Button {
//            HapticManager.instance.impact(style: .light)
//            withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 1)) {
//                if !meals.isEmpty {
//                    viewModelTwo.selectedExpandIndex = 0 // Just as an example, you can set it to any valid index
//                }
//                viewModelTwo.showItems = true
//            }
//        } label: {
//            Image(systemName: "plus")
//                .font(.title)
//                .fontWeight(.semibold)
//                .foregroundStyle(.gray0)
//                .padding(16)
//        }
//    }
//    
//    var combinedViewsTwo: some View {
//        ZStack {
//            if !viewModelTwo.showItems {
//                plusButtonTwo
//            }
//        }
//        .padding(viewModelTwo.showItems ? 8 : 0)
//        .background(
//            RoundedRectangle(cornerRadius: viewModelTwo.showItems ? 24 : 32, style: .continuous)
//                .fill(Color("AccentColor"))
//                .matchedGeometryEffect(id: "background", in: namespace)
//        )
//        .mask({
//            RoundedRectangle(cornerRadius: viewModelTwo.showItems ? 24 : 32, style: .continuous)
//                .matchedGeometryEffect(id: "mask", in: namespace)
//        })
//    }
//    
//    var lowFidelityTwo: some View {
//        ZStack(alignment: .bottom) {
//            VStack {
//                VStack(alignment: .center) {
//                    HStack {
//                        Text("Meals")
//                            .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
//                            .kerning(4)
//                        
//                        Spacer()
//                    }
//                    
//                    Divider().frame(height: 1)
//                    Divider()
//                }
//                .padding(.top, 24)
//                
//                ScrollView {
//                    ForEach(meals.indices, id: \.self) { index in
//                        Button {
//                            HapticManager.instance.impact(style: .light)
//                            withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 1)) {
//                                viewModelTwo.selectedExpandIndex = index
//                                viewModelTwo.showItems = true
//                            }
//                        } label: {
//                            Text(meals[index].title)
//                                .padding()
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(8)
//                        }
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity)
//            .scrollIndicators(.hidden)
//        }
//        .padding(.horizontal, 20)
//        .background(Color.gray0)
//    }
//}
//
//struct MealView_Previews: PreviewProvider {
//    @Namespace static var namespace
//    
//    static var previews: some View {
//        MealView(namespace: namespace)
//            .environmentObject(HomeViewModel())
//    }
//}
//
