//
//  homePage.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI
import SwiftData
struct homePage: View {
    @State var selectedDate: Date = Date()
    @Environment(\.modelContext) private var context
    @Query private var meals: [LoggedMeals];
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var show: Bool = false
    @State private var appear: Bool = true
    @State private var selectedExpandIndex: Int? = nil
    var namespace: Namespace.ID
    let calendar = Calendar.current
    var geoProx : GeometryProxy

    
    let section: [ExpandSection] = []
    
    
    var body: some View {

        ZStack(alignment: .bottomTrailing) {
            lowFidelity
            
            if viewModel.selectedExpandIndex != nil {
                if let index = viewModel.selectedExpandIndex {
                    switch index {
                    case 0:
                        FirstExpandedView(namespace: namespace, geoProx: geoProx)
                        
                    default:
                        Text("Fail")
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




extension homePage {
    var plusButton: some View {
        Button {
            HapticManager.instance.impact(style: .light)
            withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 1)) {
                viewModel.showItems = true
                viewModel.selectedExpandIndex=0;
            }
            
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.gray0)
                .padding(16)
        }
        
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
                                        //                                        Text("Hello")
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
        
        NavigationStack{
            ZStack( content:
                    
                    {
                     VStack{
                         
                         VStack{
                             HStack{
                                 Text("trofi")
                                     .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                                     .kerning(4)
                                 
                                 Spacer()
                             }.padding([.leading,.top],10)
                             //
                             
                             Divider().frame(height: 1)
                             ZStack{
                                 Color.accentColor.opacity(0.1).cornerRadius(14)
                                 
                                 DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                     .datePickerStyle(.graphical)

//                                     .frame(width: geoProx.size.width/1.2, height: geoProx.size.height/2.5, alignment: .center)
//                                      .clipped()

                             }
                             .padding([.leading,.trailing])
                             
                         }.frame(maxHeight: geoProx.size.height/1.4)

                        List{
                            Section{
                                    ForEach(meals, id: \.id) { meal in
                                        if (calendar.isDate(meal.date, inSameDayAs: selectedDate)){
                                            NavigationLink(destination: DetailedMealView(meal: meal)) {
                                                Rectangle().frame(width: geoProx.size.width/1.1, height: geoProx.size.height/5.5).hidden()
                                            }                                            .scrollContentBackground(.hidden)

                                            .overlay{
                                                LoggedMealsScroll(meal: meal, geoProx: geoProx)
                                                    .overlay{
                                                        Color.gray.opacity(0.25)
                                                    }
                                            }
                                            
                                            .scrollContentBackground(.hidden)
                                            
                                            
                                                .buttonStyle(.plain)
                                            
                                            
                                        }
                                        
                                    } .onDelete(perform: delete)
                                    
                                
                                    
                                }header: {
                                
                                Text("Logged Meals")
                            }
                                
                    }.scrollContentBackground(.hidden)
//                    .frame(maxWidth: .infinity)
                    
                    .scrollIndicators(.hidden)
                }                                            .scrollContentBackground(.hidden)

                
            })
        }
    }
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            let meal = meals[i]
            context.delete(meal)
        }
    }
}




func dataToImage(_ data: Data?) -> UIImage{
    var uiImage: UIImage = UIImage(data: data!)!
    return uiImage
}


struct LoggedMealsScroll: View {
    var meal : LoggedMeals
    var geoProx : GeometryProxy

    var body: some View {
        
        
        HStack{
            ZStack{
                if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: geoProx.size.width/1.1, height: geoProx.size.height/5.5)
                        .scaledToFit()
                        .cornerRadius(25)
                        .blur(radius: 2)
                    
//                    VStack(alignment: .trailing, spacing: 15) {
//                        
                    HStack{
                        Text("\(meal.title)")
                            .font(.custom("DalaFloda-Medium", size: 60, relativeTo: .title2))
                            .foregroundStyle(Color.white)
                        Spacer()
                    }.padding([.top,.leading])
                        .padding(.leading,50)
//                            .fontWeight(.bold)
//                            .foregroundColor(.gray0)
//                            .padding(.trailing, 15)
//                            .padding(.top, 10)
//                            .font(.body)
//                        Spacer ()
//                        
//                        HStack{
//                            Text("Rating: \(meal.rating, specifier: "%.1f")" )
//                                .foregroundColor(.gray0)
//                                .font(.custom("DalaFloda-Medium", size: 20, relativeTo: .body))
//                                .padding(.trailing, 5) // Add some padding
//                            
//                            Image(systemName: "star.square")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: geoProx.size.width/10, height:  geoProx.size.height/12.5)
//                                .foregroundColor(.accentColor)
//                            
//                            
//                        }
////                        .padding(.bottom, 10)
////                        .padding(.trailing, 200)
//                    }
                }else {
                    
                } }}
    }
}
struct HomeView_Preview: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        GeometryReader{ geoProx in
            homePage(namespace: namespace, geoProx: geoProx )
                .environmentObject(HomeViewModel())
        }
    }
}
