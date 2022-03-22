//
//  OnboardingViewTwo.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct OnboardingViewTwo: View {
    var body: some View {
        VStack{
            ZStack(alignment: .center){
                CustomImage(imageString: "map")
                    
            }
            .frame(width: 381, height: 381)
            
            CustomTitle(text: "Find our what's Nearby")
               
            CustomDescription(text: "Allowing the ReLocal app access to\n your location will make searching for \nthings nearby much easier.")
            
            Spacer()
        }
    }
}

struct OnboardingViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewTwo()
    }
}
