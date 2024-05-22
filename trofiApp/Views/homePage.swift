//
//  homePage.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI

struct homePage: View {
    @State var selectedDate: Date = Date()

    @EnvironmentObject var viewModel: HomeViewModel
    @State private var show: Bool = false
    @State private var appear: Bool = true
    @State private var selectedExpandIndex: Int? = nil
    var namespace: Namespace.ID
    
    let section: [ExpandSection] = [
//        ExpandSection(title: "Log Meal", description: "Log and track your meal", imageName: "takeoutbag.and.cup.and.straw", backgroundColor: .orange),
//        
//        ExpandSection(title: "Explore Recipes", description: "Explore recipes", imageName: "map.fill", backgroundColor: .pink),
//        
//        ExpandSection(title: "Stay", description: "Find the perfect accommodation for a comfortable stay.", imageName: "house.fill", backgroundColor: .teal),
    ]
    
    let expand: ExpandSection
    
    var body: some View {
        
         ZStack(alignment: .bottomTrailing) {
//             ContentView()
             lowFidelity
             
             // This controls navigation to other views. Currently there are 4 main views, you can add more if you want.

             if viewModel.selectedExpandIndex != nil {
                     if let index = viewModel.selectedExpandIndex {
                         switch index {
                         case 0:
                             FirstExpandedView(namespace: namespace, rating: 1, maxRating: 5)
//                         case 1:
//                             SecondExpandedView(namespace: namespace)
//    
                         default:
                             homePage(namespace: namespace, expand: ExpandSection(title: "jkjkj", description: "", imageName: "", backgroundColor: .clear))
                         }
                     }
                 } else {
                     ZStack(content: {
                         combinedViews
                             .padding(20)
                             //.offset(y: viewModel.showItems ? 0 : -80)
                     })
                     .transition(.scale(scale: 1))
                 }
             
         }
    }
}


struct HomeView_Preview: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        homePage(namespace: namespace, expand: ExpandSection(title: "Send", description: "Send tokens or collectibles to any address or ENS username.", imageName: "paperplane.fill", backgroundColor: .blue))
            .environmentObject(HomeViewModel())
    }
}

struct ExpandView: View {
    let expand: ExpandSection

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: expand.imageName)
                .font(.body)
                .fontWeight(.semibold)
                .padding(8)
                .foregroundStyle(Color("AccentColor"))
                .background(expand.backgroundColor.gradient)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(expand.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("AccentColor"))

                Text(expand.description)
                    .font(.callout)
                    .foregroundStyle(Color("AccentColor"))
            }
        }
        .fontDesign(.rounded)
        .padding(16)
        .frame(width: 336, alignment: .leading)
        .background(Color("AccentColor").opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color("AccentColor"), lineWidth: 0.7)
        }
    }
}


extension homePage {
    var plusButton: some View {
        Button {
            HapticManager.instance.impact(style: .light)
            print(viewModel.selectedExpandIndex)
            withAnimation(.spring(response: 0.25, dampingFraction: 0.85, blendDuration: 1)) {
                viewModel.showItems = true
                viewModel.selectedExpandIndex=0;
            }
            
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.gray0)
                .padding(16)
        }.background(Color("AccentColor"))

    }
    
    var combinedViews: some View {
        ZStack {
            if !viewModel.showItems {
                plusButton
            }
            else {
                VStack(alignment: .leading, spacing: 8) {
                    if !viewModel.showNextView {
                        ZStack {
                            VStack(alignment: .leading, spacing: 8, content: {
                                ForEach(section.indices, id: \.self) { index in
                                    Button {
                                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                                            viewModel.selectedExpandIndex = index
                                            viewModel.moveItems = true
                                        }
                                        
                                    } label: {
                                        ExpandView(expand: section[index])
                                    }
                                    .buttonStyle(BouncyButton())
                                }
                            })
                        }
                    }
                }
                .offset(y: viewModel.moveItems ? -200 : 0)
                .opacity(viewModel.moveItems ? 0 : 1)
            }
        }
        .padding(viewModel.showItems ? 8 : 0)
        .background(
            RoundedRectangle(cornerRadius: viewModel.showItems ? 24 : 32, style: .continuous)
                .fill(Color("AccentColor"))
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask({
            RoundedRectangle(cornerRadius: viewModel.showItems ? 24 : 32, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        })
    }
    
    var lowFidelity: some View {
        
        ZStack(alignment: .bottom, content: {
//        ZStack{
            VStack{
                
                VStack(alignment: .center) {
                    HStack{
                        Text("trofi")
                            .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))

                        
                        Spacer()
                    }
                    //
                    Divider().frame(height: 1)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .padding(.horizontal)
                        .datePickerStyle(.graphical)
                    Divider()
                    
                    
                }
                .padding(.top, 24)
                ScrollView {
                    Text("hello")
                  
                }
            }
//            .frame(maxWidth: .infinity)

            .scrollIndicators(.hidden)
            .scaleEffect(viewModel.moveItems ? 0.8 : 1, anchor: .bottom)
        }
        )
        .padding(.horizontal, 20)
        .background(.gray0)
        .onTapGesture {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.85, blendDuration: 1)) {
                viewModel.showItems = false
            }
        }

    }
}


