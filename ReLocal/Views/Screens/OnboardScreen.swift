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
    @State private var showOnBoarding = false
    @AppStorage("onboardScreen") var hasOnBoarded = false
    
    var body: some View {
        VStack {
            if showOnBoarding {
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
                            self.showChooseCityView.toggle()
                        }
                    }
                }label: {
                    Text("Next")
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 10))
                    
                }
                .foregroundColor(Color("azul"))
                .padding()
                
                Button{
                    withAnimation {
                        self.showChooseCityView.toggle()
                    }
                }label: {
                    Text("Skip")
                        .foregroundColor(Color("azul"))
                }
                .padding()
                Spacer()
            } else {
                //self.showChooseCityView.toggle()
            }
        }
        .fullScreenCover(isPresented: $showChooseCityView) {
            ChooseCityScreen()
        }
        .onAppear{
            if !hasOnBoarded {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation {
                        showOnBoarding.toggle()
                        hasOnBoarded = true
                    }
                }
            }
        }
    }
}

struct OnboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardScreen()
    }
}
