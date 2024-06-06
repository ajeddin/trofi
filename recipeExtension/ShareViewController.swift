////
////  ShareViewController.swift
////  EarnedItShare
////
////  Created by Abdulaziz Jamaleddin on 2/7/24.
////
//
//import UIKit
//import Social
//import SwiftData
//import SwiftUI
//import LinkPresentation
//class ShareViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        isModalInPresentation = true
//        if let items = (extensionContext!.inputItems.first as? NSExtensionItem)?.attachments{
//            let hostingView = UIHostingController(rootView: SheetView(extentionContext: extensionContext,itemProvider: items).background(Color.clear).modelContainer(for: [LoggedMeals.self,RecipeData.self]))
//            hostingView.view.frame = view.frame
//            view.addSubview(hostingView.view)
//            hostingView.view.backgroundColor = .clear
//        }
//  
//        
//        
//    }
//
//}
//
//
//fileprivate struct  SheetView: View {
//    
//    let haptic = UINotificationFeedbackGenerator()
//
//    @Environment(\.modelContext) private var context
//    var extentionContext: NSExtensionContext?
//    var itemProvider : [NSItemProvider]
//  
//    var body: some View{
//        
//        VStack{
//            Text("Hello")
//            }
//                .onAppear(perform: {
//                    extract()
//                    
//                    
//                }).padding(20)
//                .background(Color("BackgroundColor")).cornerRadius(25)
//        }
//        
//    
//        
//
//    
//    func extract(){
//        DispatchQueue.global(qos: .userInteractive).async{
//            for provider in itemProvider {
//                provider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (attachment, error) in
//                    if let url = attachment as? URL{
//                        var urlText = url.absoluteString
//                        if let range = urlText.range(of: "https") {
//                            var result = String(urlText[range.lowerBound...])
//                            result = result.trimmingCharacters(in: .whitespacesAndNewlines)
//                            urlText = result
//                           
//
//                        }
//                                                DispatchQueue.main.async {
//                        
//                        link = urlText
//                                                
//                        print(link)
//                    }
//                }
//                    
//                })
//            }
//            
//        }}
//    func saveItem(recipe : RecipeData){
//        do{
//            context.insert(recipe)
//            try context.save()
//        }catch{
//            print(error.localizedDescription)
//        }
//        
//        
//    }
//}
