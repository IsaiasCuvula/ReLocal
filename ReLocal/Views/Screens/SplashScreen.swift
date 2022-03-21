//
//  SplashScreen.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 21.03.22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                MainView()
            } else {
                VStack {
                    withAnimation {
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
                    }
                    Text("ReLocal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("azul"))
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
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
