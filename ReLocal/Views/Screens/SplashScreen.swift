//
//  SplashScreen.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 21.03.22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @AppStorage("onboarding") var showOnBoarding: Bool = true
    
    var body: some View {
        VStack {
            if isActive {
                if showOnBoarding{
                    OnboardScreen(showOnBoarding: $showOnBoarding)
                } else {
                    ChooseCityScreen()
                }
            } else {
                VStack {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                        
                        Image(systemName: "drop.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("azul"))
                            .rotationEffect(.radians(.pi))
                        
                        Text("Re")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .offset(y: -7)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    
                    Text("ReLocal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .scaleEffect(size)
                        .opacity(opacity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("azul"))
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
