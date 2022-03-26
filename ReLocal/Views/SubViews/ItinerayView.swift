//
//  ItinerayView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 26.03.22.
//

import SwiftUI

struct ItinerayView: View {
    var body: some View {
        HStack{
            VStack{
                Text("8:35")
                
                Text("9:00")
                    .padding(.vertical, 8)
                Spacer()
            }
            
            Divider()
            
            VStack(alignment: .leading){
                Group{
                    Text("My home Caffe")
                        .font(.headline)
                    Text("Breakfast")
                        .padding(.vertical, 8)
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "map")
                        Text("View in Map")
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("azul").opacity(0.6))
            .cornerRadius(20)
           
            
        }.frame(maxHeight: 113)
            .padding()
    }
}

struct ItinerayView_Previews: PreviewProvider {
    static var previews: some View {
        ItinerayView()
    }
}
