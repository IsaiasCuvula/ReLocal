//
//  StoryView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 26.03.22.
//

import SwiftUI

struct StoryView: View {
    
    let index: Int
    
    private let storyTitle: [String] = [
        "Food","Bar", "Landmark", "Bike", "Shop"
    ]
    private let storyImage: [String] = [
        "fork.knife","cup.and.saucer", "location","bicycle","bag"
    ]
    
    private let colors = [
        Color.orange.opacity(0.7), Color.purple , Color.green, Color.orange, Color.pink.opacity(0.8)
    ]
    
    
    var body: some View {
        VStack{
            Image(systemName: storyImage[index])
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(colors[index])
                        .frame(width: 56, height: 56))
                .frame(width: 28, height: 28)
                .padding()
            
            Text(storyTitle[index])
                .foregroundColor(.black)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(index: 1)
    }
}
