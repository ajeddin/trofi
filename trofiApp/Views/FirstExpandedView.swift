//
//  FirstExpandedView.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import SwiftUI
import AppIntents
import UIKit

import SwiftData
struct FirstExpandedView: View {
    @Environment(\.modelContext) private var context
    @Query private var loggedMeals: [LoggedMeals];
    var namespace: Namespace.ID
    @State private var textField: String = ""
    @State private var appear: Bool = false
    @EnvironmentObject var viewModel: HomeViewModel
    @State var selection = 0
    @State private var title: String = ""
    @State private var recipe: String = ""
    @State private var notes: String = ""

    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    @State var rating: CGFloat = 1;
    var maxRating: Int = 0

    
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
                            withAnimation(.spring(response: 0.75, dampingFraction: 1.2)) {
                                viewModel.showItems = false
                                HapticManager.instance.impact(style: .light)
                                viewModel.selectedExpandIndex = nil
                            }
//                            withAnimation(.spring(response: 0.18, dampingFraction: 1.0)) {
//                                 viewModel.showItems = false
//                            }
                           
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
                    .padding(.top, 25)
                    .padding()
//                    Spacer()
                    VStack(spacing: 16) {
                        
                        
                        Button {
                            print("photo button was tapped")
                            showActionSheet = true
                            
                        } label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color.accentColor.opacity(0.1))
                                    .cornerRadius(14)
                                Image(systemName: "photo.badge.plus").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
                            ImagePicker(sourceType: sourceType)
                        }
                        
                        
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
                                "Recipe:",
                                text: $recipe
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.accentColor, lineWidth: 2))
                            .textFieldStyle(.roundedBorder)
                            .padding([.leading, .trailing, .bottom]) // Adjust the value as needed
                            
                            
                            
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
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    
                    
                    
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
              

                Button(action: {
           
                    withAnimation(.spring(response: 0.28, dampingFraction: 1.2)) {
                        HapticManager.instance.impact(style: .light)
                        viewModel.selectedExpandIndex = nil
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
    
    
}
    
    struct ImagePicker: UIViewControllerRepresentable {
        var sourceType: UIImagePickerController.SourceType

        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker

            init(_ parent: ImagePicker) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                // Handle the selected image
                picker.dismiss(animated: true)
            }

            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
        }
    }
    
    
    
    
    
    

struct FirstExpandedView_Preview: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        FirstExpandedView(namespace: namespace)
            .environmentObject(HomeViewModel())
    }
}
