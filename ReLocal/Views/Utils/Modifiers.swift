//
//  Modifiers.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 22.03.22.
//

import SwiftUI

struct CustomTitle: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle).bold()
    }
}


struct CustomDescription: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct CustomImage: View {
    
    let imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .frame(width: 305, height: 305)
    }
}

struct CustomButtonLabel: View {
    let txt: String
    
    var body: some View{
        Text(txt)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,maxHeight: 50)
            .background(RoundedRectangle(cornerRadius: 10))
    }
}

