//
//  CardPopularView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 26.03.22.
//

import SwiftUI

struct CardPopularView: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "fork.knife")
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
            
        }
        .frame(width: 170, height: 190)
        .background(.red.opacity(0.3))
        .cornerRadius(30)
        
       
    }
}

struct CardPopularView_Previews: PreviewProvider {
    static var previews: some View {
        CardPopularView()
    }
}
