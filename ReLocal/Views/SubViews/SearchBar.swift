//
//  SearchBar.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 25.03.22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField("City name ...", text: $text)
                .foregroundColor(.black)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.white))
                .cornerRadius(10)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }.padding(.horizontal, 6)
                )
                .overlay( RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray3), lineWidth: 1))
        }
        .padding(.horizontal, 4)
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
