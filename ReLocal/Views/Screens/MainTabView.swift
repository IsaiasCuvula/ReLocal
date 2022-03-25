//
//  MainView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 21.03.22.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    @Binding var city: String
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView(city: $city)
                .onTapGesture {
                    withAnimation {
                        self.selectedIndex = 0
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ItineraryScreen()
                .onTapGesture {
                    withAnimation {
                        self.selectedIndex = 1
                    }
                }
                .tabItem {
                    Image(systemName: "map")
                }.tag(1)
            
            
            MapScreen()
                .onTapGesture {
                    withAnimation {
                        self.selectedIndex = 2
                    }
                }
                .tabItem {
                    Image(systemName: "location")
                }.tag(2)
            
            FavoriteScreen()
                .onTapGesture {
                    withAnimation {
                        self.selectedIndex = 3
                    }
                }
                .tabItem {
                        Image(systemName: "bookmark")
                }.tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(city: .constant("Luanda"))
    }
}
