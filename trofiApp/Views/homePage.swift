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
    
    let section: [ExpandSection] = []
    
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
                        FirstExpandedView(namespace: namespace)
                        
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
        NavigationView{
            ZStack(alignment: .bottom) {
                VStack{
                    
                    VStack(alignment: .center) {
                        HStack{
                            Text("trofi")
                                .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                                .kerning(4)
                            //                            .background(Color.backGround)
                            Spacer()
                        }
                        //
                        
                        Divider().frame(height: 0.5).background(.backGround)
                        ZStack{
                            Color.accentColor.opacity(0.1).cornerRadius(14)
                            
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                            //                        .padding(.horizontal)
                                .datePickerStyle(.graphical)
                        }
                        //                    .background(Color("AccentColor").opacity(0.1))
                        //                    Divider()
                        Spacer()
                        
                    }
                    .padding(.top, 24)
                    //
                    //                    Divider().frame(height: 0.5).background(.backGround)
                   
                        List{
                            Section{
                                ForEach(meals, id: \.id) { meal in
                                    if (calendar.isDate(meal.date, inSameDayAs: selectedDate)){
                                        NavigationLink(destination: loggedMealView(meal: meal)) {
                                            LoggedMealsScroll(meal: meal)
                                        }.scrollContentBackground(.hidden)
                                        
                                    }
                                    
                                } .onDelete(perform: delete)
                            }header: {
                                
                                Text("Products")
                            }
                    }.scrollContentBackground(.hidden)
//                    .frame(maxWidth: .infinity)
                    
                    .scrollIndicators(.hidden)
                }
                
                .padding(.horizontal, 20)
            }
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
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 20){
            ZStack{
                if let imageData = meal.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 344, height: 200)
                        .scaledToFit()
                        .cornerRadius(16)
                        .clipped()
                    VStack(alignment: .trailing, spacing: 15) {
                        
                        Text("\(meal.title)")
                            .font(.custom("DalaFloda-Medium", size: 30, relativeTo: .title2))
                            .fontWeight(.bold)
                            .foregroundColor(.gray0)
                            .padding(.trailing, 15)
                            .padding(.top, 10)
                            .font(.body)
                        Spacer ()
                        
                        HStack{
                            Text("Rating: \(meal.rating, specifier: "%.1f")" )
                                .foregroundColor(.gray0)
                                .font(.custom("DalaFloda-Medium", size: 20, relativeTo: .body))
                                .padding(.trailing, 5) // Add some padding
                            
                            Image(systemName: "star.square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 20)
                                .foregroundColor(.accentColor)
                            
                            
                        }
                        .padding(.bottom, 10)
                        .padding(.trailing, 200)
                    }
                }else {
                    
                    Image(systemName: "logoTrofi")
                        .resizable()
                        .scaledToFit()
                } }}
    }
}
