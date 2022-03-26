//
//  CardPopularView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 26.03.22.
//

import SwiftUI

struct CardPopularView: View {
    
    let index: Int
    
    private let cardtitle = [
        "Top 10 restaurant", "Instagram Locations",
        "Best Places", "Top 10 Cities"
    ]
    
    private let cardBackground = [
        CardImage(image: "restaurant"),
        CardImage(image: "insta"),
        CardImage(image: "places"),
        CardImage(image: "cityy")
    ]
    
    private let images: [String] = [
        "fork.knife", "message", "location","map"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: images[index])
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
           
            Spacer()
            
            Text(cardtitle[index])
                .foregroundColor(.white)
                .font(.headline)
                .padding()
        }
        .frame(width: 170, height: 190)
        .background(.black.opacity(0.2))
        .background(cardBackground[index])
        .cornerRadius(30)
    }
}

struct CardPopularView_Previews: PreviewProvider {
    static var previews: some View {
        CardPopularView(index: 0)
    }
}
