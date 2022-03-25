//
//  HomeView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 21.03.22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var showSelectCity = false
    @Binding var city: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment:.leading){
                HStack {
                    Image("locationIcon")
                    Text(city)
                        .font(.title).bold()
                    
                    Spacer()
                    
                    Button{
                        withAnimation {
                            self.showSelectCity.toggle()
                        }
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "bell.badge")
                            .foregroundColor(.gray)
                            .overlay(
                                Circle()
                                    .stroke())
                    }
                    
                    Spacer()
                }
                
                SearchBar(text: $searchText, textHolder: "Search ...")
                    .padding(.top)
                
            }
            .padding()
        }
        .sheet(isPresented: $showSelectCity) {
            ChooseCityScreen()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(city: .constant("Luanda"))
    }
}
