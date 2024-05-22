//
//  FirstExpandedView.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI
import AppIntents

struct FirstExpandedView: View {
    
    var namespace: Namespace.ID
    @State private var textField: String = ""
    @State private var appear: Bool = false
    @EnvironmentObject var viewModel: HomeViewModel
    @State var selection = 0
    @State private var title: String = ""
    @State private var recipe: String = ""
    @State private var notes: String = ""
    @State var rating: CGFloat
    var maxRating: Int

    
    



    var body: some View {
        
        let stars = HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.square")
                        
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 50)
                          
                    }
                }

        
        ZStack {
            Color.gray0.ignoresSafeArea()
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Log Meal")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.gray900)
                        
                        
                        
                        Spacer()
                        Button(action: {
                            withAnimation(.spring(response: 0.25, dampingFraction: 1.25)) {
                                viewModel.showItems = true
                                HapticManager.instance.impact(style: .light)
                                viewModel.selectedExpandIndex = nil
                            }
                            withAnimation(.spring(response: 0.28, dampingFraction: 1.2)) {
                                //                                viewModel.showItems = false
                                //                                withAnimation(.spring(response: 0.88, dampingFraction: 0.9)) {
                                //                                    viewModel.showItems = false
                                viewModel.moveItems = false
                                //                                }
                            }
                            //                            viewModel.moveItems = false
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .renderingMode(.template)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray100)
                                .padding(12)
                                .background(.gray800)
                                .cornerRadius(32)
                        })
                    }
                    Spacer()
                    
                    VStack{
                        Spacer()
                        Picker("", selection: $selection) {
                            Text("Homecooked").tag(0)                        .foregroundColor(Color.accentColor)
                                .background(Color.accentColor)
                            Text("Restaurant").tag(1)                        .foregroundColor(Color.accentColor)
                            
                        }
                        .foregroundColor(Color.accentColor)
                        .pickerStyle(.segmented)
                        //                        .overlay(RoundedRectangle(cornerRadius: 15)
                        //                                    .stroke(Color.gray, lineWidth: 4)
                        //                            )
                        .colorMultiply(Color.accentColor)
                        .frame(width: 350)
                        
                        
                        TextField(
                            "Title:",
                            text: $title
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.accentColor, lineWidth: 2))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        
                        TextField(
                            "Notes:",
                            text: $notes
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.accentColor, lineWidth: 2))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        
                        TextField(
                            "Recipe:",
                            text: $recipe
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.accentColor, lineWidth: 2))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        
//                        
//                        TextField(
//                            "Rating:",
//                            text: $rating,
//                            format: .float
//                        )
//                        .keyboardType(.decimalPad)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 14)
//                                .stroke(Color.accentColor, lineWidth: 2))
//                        .textFieldStyle(.roundedBorder)
//                        .padding()
//                        
                        
                        Spacer()
                        
                        
                        stars.overlay(
                                  GeometryReader { g in
                                      let width = rating / CGFloat(maxRating) * g.size.width
                                      ZStack(alignment: .leading) {
                                          Rectangle()
                                              .frame(width: width)
                                              .foregroundColor(.accentColor)
                                      }
                                  }
                                  .mask(stars)
                              )
                              .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 150)
                .padding(.top, 80)
                
              

                Button(action: {
                    //                    withAnimation(.spring(response: 0.25, dampingFraction: 1.2)) {
                    ////                        viewModel.showItems = true
                    //                        HapticManager.instance.impact(style: .light)
                    //                        viewModel.selectedExpandIndex = nil
                    //                    }
                    
                    withAnimation(.spring(response: 0.28, dampingFraction: 1.2)) {
                        HapticManager.instance.impact(style: .light)
                        viewModel.selectedExpandIndex = nil
                        //
                        
                        //                                withAnimation(.spring(response: 0.88, dampingFraction: 0.9)) {
                        //                                    viewModel.showItems = false
                        //                                }
                        viewModel.showItems = false
                        viewModel.moveItems = false
                        
                    }
                    
                } ,label: {
                    
                    Rectangle()
                    
                        .foregroundStyle(.accent)
                    
                        .frame(width: 300, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .overlay(
                            Text("Confirm")
                                .foregroundColor(.black) // Set the text color
                        )
                        .padding(48)
                })
                .buttonStyle(BouncyButton())
            }
            
            .scaleEffect(appear ? 1 : 0.5, anchor: .bottom)
            .opacity(appear ? 1 : 0)
            .transition(.scale(scale: 1)) // this transition is kept to remove the default opacity fade when using a matchedGeometryEffect.
        }
        .fontDesign(.rounded)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.gray0)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
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
}

struct FirstExpandedView_Preview: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        FirstExpandedView(namespace: namespace, rating: 1.7, maxRating: 5)
            .environmentObject(HomeViewModel())
    }
}
