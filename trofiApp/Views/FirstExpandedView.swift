//
//  FirstExpandedView.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI
import AppIntents
import UIKit
import PhotosUI
import SwiftData





struct FirstExpandedView: View {
    @Environment(\.modelContext) private var context
    @Query private var meals: [LoggedMeals];
    
    
    
    @FocusState private var isUsernameFocused: Bool

    var namespace: Namespace.ID
    var geoProx : GeometryProxy

    @State private var textField: String = ""
    @State private var appear: Bool = false
    @EnvironmentObject var viewModel: HomeViewModel
    @State var selection = 0
    @State private var title: String = ""
    @State private var recipe: String = ""
    @State private var notes: String = ""
    @State var rating: CGFloat = 0
    var maxRating: Int = 5
    @State private var selectedImage: UIImage?
    //    @State private var selectedImageData: Data?
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    var body: some View {

        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.square")
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 40)
                
            }
        }
        
        
        ZStack {
            Color.foreGround.ignoresSafeArea()
            ZStack(/*alignment: .bottom*/) {
                
                VStack() {
                    VStack{
                        
                        HStack {
                            Text("Log Meal")
                                .font(.custom("DalaFloda-Medium", size: 36, relativeTo: .title))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.backGround)
                            
                            
                            
                            
                            Spacer()
                            Button(action: {
                                withAnimation(.spring(response: 0.45, dampingFraction: 1.2, blendDuration: 1)) {
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
                        .ignoresSafeArea(.all)
//                        .padding(.top)
                        .padding([.leading,.trailing])
                        
                        VStack() {
                            
                            VStack{
                                if let image = selectedImage{
                                    Image(uiImage: image).resizable().scaledToFit().frame(maxWidth: geoProx.size.width/1.9,maxHeight: geoProx.size.height/2.5)
                                }
                                else{
                                    Button {
                                        showActionSheet = true
                                        
                                    } label: {
                                        ZStack{
                                            Rectangle()
                                                .fill(Color.accentColor.opacity(0.1))
                                                .cornerRadius(14)
                                            Image(systemName: "photo.badge.plus").font(.title)
                                        }}
                                    .actionSheet(isPresented: $showActionSheet) {
                                        ActionSheet(title: Text("Select an option"), buttons: [
                                            .default(Text("Select from Gallery")) {
                                                sourceType = .photoLibrary
                                                showImagePicker = true
                                            },
                                            .default(Text("Camera")) {
                                                sourceType = .camera
                                                showImagePicker = true
                                            },
                                            .cancel()
                                        ])
                                    }
                                    .sheet(isPresented: $showImagePicker) {
                                        ImagePicker(sourceType: sourceType, selectedImage: $selectedImage)
                                            .ignoresSafeArea()
                                    }
                                }
                                
                            }
                            VStack{
//                                Spacer()
                                Picker("", selection: $selection) {
                                    Text("Homecooked").tag(0)                        .foregroundColor(Color.backGround)
                                        .background(Color.accentColor)
                                    Text("Restaurant").tag(1)                        .foregroundColor(Color.backGround)
                                    
                                }
                                .foregroundColor(Color.accentColor)
                                .pickerStyle(.segmented)
                          
                                .colorMultiply(Color.accentColor)
                                //                            .frame(width: 350)
                                .padding(.bottom)
                                
                                TextField(
                                    "Title:",
                                    text: $title
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.accentColor, lineWidth: 2))
                                .textFieldStyle(.roundedBorder)
                                //                        .padding(.leading)
                                //                        .padding(.trailing)
                                //                        .padding(.bottom)
                                .padding([.leading, .trailing, .bottom]) // Adjust the value as needed
                                
                                
                                TextField(
                                    "Notes:",
                                    text: $notes
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.accentColor, lineWidth: 2))
                                .textFieldStyle(.roundedBorder)
                                .padding([.leading, .trailing, .bottom]) // Adjust the value as needed
                                
                                
                                TextField(
                                    "Recipe/Link:",
                                    text: $recipe
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.accentColor, lineWidth: 2))
                                .textFieldStyle(.roundedBorder)
                                .padding([.leading, .trailing, .bottom])
                                
                                
                                TextField(
                                    "Rating:",
                                    value: $rating, formatter: formatter
                                )
                                .keyboardType(.decimalPad)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.accentColor, lineWidth: 2))
                                .textFieldStyle(.roundedBorder)
                                .padding([.leading, .trailing, .bottom]) // Adjust the value as needed
                                
                                
                                
                                //                            Spacer()
                                
                                
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
                        //                    .padding(.horizontal, 15)
                        //                    .padding(.top, 5)
                    }.frame(maxWidth: geoProx.size.width/1, maxHeight: geoProx.size.height/1.2)
                    
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.28, dampingFraction: 1.2)) {
                            HapticManager.instance.impact(style: .light)
                            viewModel.selectedExpandIndex = nil
                            var loggedMeal = LoggedMeals(type: "Homecooked", price: 223, title: "\(title)", descriptionMeal: "\(notes)", recipeLink: "\(recipe)",rating: Float(rating))
                            if (selection == 1){
                                loggedMeal.type = "Restaurant"
                            }
                                if let imageUnwrapped = selectedImage{
                                    loggedMeal.imageData = imageUnwrapped.pngData()
                                    
                                }
                                else{
                                    print("No Image")
                                }
                                context.insert(loggedMeal)
                                
                            for num in 1...20{
                                var loggedMeal = LoggedMeals(type: "Homecooked", price: 223, title: "\(title)", descriptionMeal: "\(notes)", recipeLink: "\(recipe)",rating: Float(rating))
                                let dateFormatter = DateFormatter()

                                var specificDate: Date {
                                       // Define the components of the date
                                       var dateComponents = DateComponents()
                                       dateComponents.year = 2024
                                       dateComponents.month = 5
                                       dateComponents.day = num+10
                                       
                                       // Create the date using the current calendar
                                       let calendar = Calendar.current
                                       return calendar.date(from: dateComponents) ?? Date()
                                   }
                                loggedMeal.date = specificDate
                                if let imageUnwrapped = selectedImage{
                                    loggedMeal.imageData = imageUnwrapped.pngData()
                                    
                                }
                                else{
                                    print("No Image")
                                }
                                context.insert(loggedMeal)


                            }
                            
                            
                            
                            
                                try? context.save()
                            

                                
                                viewModel.showItems = false
                                viewModel.moveItems = false
                            }
                            
                        } ,label: {
                        
                        Rectangle()
                        
                            .foregroundStyle(.accent)
                        
                            .frame(width: geoProx.size.width/1.2, height: geoProx.size.height/13)
                            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                            .overlay(
                                Text("Confirm")
                                    .foregroundColor(.black) // Set the text color
                                    .bold()
                            )
                            .padding(.top,30)
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
                    .fill(Color("backgroundColor"))
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
        
    }}
    
    
}
struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}



struct FirstExpandedView_Preview: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        GeometryReader{geoProx in
            FirstExpandedView(namespace: namespace, geoProx: geoProx)
                .environmentObject(HomeViewModel())
        }
    }
}

