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
    var namespace: Namespace.ID
    

    var body: some View {
        
         ZStack(alignment: .bottomTrailing) {
//             ContentView()
             lowFidelityTwo
             

             if viewModelTwo.selectedExpandIndex != nil {
                     if let index = viewModelTwo.selectedExpandIndex {
                         switch index {
                         case 0:
                             SecondExpandedView(namespace: namespace)
//                         case 1:
//                             SecondExpandedView(namespace: namespace)
//
                         default:
                             recipeView(namespace: namespace)
                         }
                     }
                 } else {
                     ZStack(content: {
                         combinedViewsTwo
                             .padding(20)
                             //.offset(y: viewModelTwo.showItems ? 0 : -80)
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
                    
                    Divider().frame(height: 1)
                  
                    Divider()
                    
                    
                }
                .padding(.top, 24)
//
                
                ScrollView {
//
                }

            }
            .frame(maxWidth: .infinity)

            .scrollIndicators(.hidden)
//            .scaleEffect(viewModelTwo.moveItems ? 0.8 : 1, anchor: .bottom)
        }
        )
        .padding(.horizontal, 20)
        .background(.gray0)

    }
}

struct recipeView_Preview: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        recipeView(namespace: namespace)
            .environmentObject(HomeViewModel())
    }
}
