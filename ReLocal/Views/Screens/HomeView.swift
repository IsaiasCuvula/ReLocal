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
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))]
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment:.leading){
                VStack{
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
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                                .padding(4)
                        }
                        .overlay(
                            Circle()
                                .stroke()
                        )
                        .padding(.horizontal, 10)
                    }
                    
                    SearchBar(text: $searchText, textHolder: "Search ...")
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< 5, id:\.self){ index in
                                StoryView(index: index)
                            }
                        }
                        .padding(.vertical)
                    }
                    .padding(.vertical)
                    
                    Button{
                        
                    }label: {
                        HStack{
                            Image(systemName: "map")
                            Text("START YOUR ITINERARY")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 15))
                    }
                    .foregroundColor(Color("azul"))
                }.padding()
                
                VStack(alignment: .leading) {
                    
                    Text("Popular")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                    
                    LazyVGrid(columns: adaptiveColumns, spacing:20) {
                        
                        ForEach(0 ..< 4, id: \.self){ i in
                            CardPopularView(index: i)
                        }
                    }
                }
                .padding()
            }
            Spacer()
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
