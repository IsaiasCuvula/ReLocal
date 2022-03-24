//
//  ChooseCityScreen.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct ChooseCityScreen: View {
    
    @State private var city = ""
    
    var body: some View {
        VStack {
            ZStack{
                Image("wave")
                Image("personCity")
                     .frame(width: 190, height: 321)
            }
            
            CustomTitle(text: "Select city to explore")
            
            SearchBar(text: $city)
                .padding()
            
            CustomDescription(text: "Welcome to our explore App, here you will find the best cities in the world for culture with a number of free museums to enjoy")
           
            
            Button{
                
            }label: {
                CustomButtonLabel(txt: "EXPLORE CITY")
            }
            .padding()
            .foregroundColor(Color("azul"))
            
            Spacer()
        }
        
    }
}

struct ChooseCityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCityScreen()
    }
}
