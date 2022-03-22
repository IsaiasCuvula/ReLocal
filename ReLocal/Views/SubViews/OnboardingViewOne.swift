//
//  OnboardingView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct OnboardingViewOne: View {
    
    var body: some View {
        VStack{
            ZStack(alignment: .center){
                
                Image("wave")
                    .offset(y: -30)
                
                CustomImage(imageString: "person1")
                    .offset(x: -60)
            }
            .frame(width: 381, height: 381)
            
            CustomTitle(text: "Choose a City")
            CustomDescription(text: "Travel the world view attraction and \nexperince the city like a local")
            
            Spacer()
        }
    }
}

struct OnboardingViewOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewOne()
    }
}
