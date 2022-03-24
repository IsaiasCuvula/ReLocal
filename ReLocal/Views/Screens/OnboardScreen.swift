//
//  OnboardScreen.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct OnboardScreen: View {
    
    @State private var showChooseCityView = false
    @State private var currentIndex = 0
    @Binding var showOnBoarding: Bool
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                OnboardingViewOne()
                    .tag(0)
                
                OnboardingViewTwo()
                    .tag(1)
                
                OnboardingViewThree()
                    .tag(2)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Spacer()
            
            Button{
                if currentIndex != 2 {
                    withAnimation {
                        self.currentIndex += 1
                    }
                } else if currentIndex == 2 {
                    withAnimation {
                        self.showOnBoarding = false
                        self.showChooseCityView.toggle()
                    }
                }
            }label: {
                CustomButtonLabel(txt: "Next")
            }
            .foregroundColor(Color("azul"))
            .padding()
            
            Button{
                withAnimation {
                    self.showOnBoarding = false
                    self.showChooseCityView.toggle()
                }
            }label: {
                Text("Skip")
                    .foregroundColor(Color("azul"))
            }
            .padding()
            Spacer()
        }
        .fullScreenCover(isPresented: $showChooseCityView) {
            ChooseCityScreen()
        }
    }
}


struct OnboardScreen_Previews: PreviewProvider {
   
    static var previews: some View {
        OnboardScreen(showOnBoarding: .constant(true))
    }
}
