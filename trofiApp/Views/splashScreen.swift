//
//  SplashScreen.swift
//  trofiApp
//
//  Created by Abdulaziz Jamaleddin on 5/20/24.
//

import SwiftUI

struct splashScreen: View {
    @Binding var isActive: Bool
    
    var body: some View {
       
        ZStack{
            Color("mainColor").ignoresSafeArea()

            VStack{
                Image("logoTrofi").resizable().scaledToFit()
                    .frame(maxWidth: 250, maxHeight: 250)
//                    .padding(70)
                HStack(content: {
                    Text("track your journey")
                        .padding(.top,10)
                        .font(.custom("DalaFloda-Medium", size: 35, relativeTo: .largeTitle))
                        .foregroundColor(.white)
                })
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }

    }
}
//
//#Preview {
//    splashScreen()
//}



