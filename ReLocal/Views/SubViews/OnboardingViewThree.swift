//
//  OnboardingViewThree.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct OnboardingViewThree: View {
    var body: some View {
        VStack{
            ZStack(alignment: .center){
                
                Image("wave")
                    .offset(y: -30)
                
               Image("person2")
                    .frame(width: 190, height: 321)
            }
            .frame(width: 381, height: 381)
            
            CustomTitle(text: "Customize your travel")
            CustomDescription(text: "Explore destinations, save attraction and things to do, set up when and time.")
            
            Spacer()
        }
    }
}

struct OnboardingViewThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewThree()
    }
}
