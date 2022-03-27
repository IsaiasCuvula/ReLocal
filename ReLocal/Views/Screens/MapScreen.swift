//
//  MapScreen.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 25.03.22.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State private var query = ""
    
   
    
    
    var body: some View {
        ZStack(alignment: .top){
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .tint(Color(.systemPink))
            
            SearchBar(text: $query, textHolder: "Search location")
                .padding()
        }
        .onAppear{
            viewModel.checkIfLocationServiseIsEnabled()
        }
           
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}



