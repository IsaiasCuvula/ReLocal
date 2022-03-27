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
        VStack {
            ZStack(alignment: .top){
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .tint(Color(.systemPink))
                    
                    
                
                VStack(alignment: .trailing){
                    
                    VStack(spacing: 0) {
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search location...", text: $viewModel.searchText)
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(
                           RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                        )
                        
                        
                        if !viewModel.places.isEmpty && viewModel.searchText != "" {
                            ScrollView{
                                VStack(spacing: 15){
                                    ForEach(viewModel.places){place in
                                        
                                        Text(place.place.name ?? "")
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading)
                                        Divider()
                                    }
                                }
                                .padding(.top)
                            }
                            .background(Color.white)
                        }
                        
                    
                    }
                    .padding()
                    
                    Spacer()
                    
                    Group{
                        Button {
                            //focus
                        } label: {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(10)
                                .background(Color.primary)
                                .clipShape(Circle())
                        }
                        
                        
                        
                        Button {
                            //map type
                        } label: {
                            Image(systemName: viewModel.mpType == .standard ? "network" : "map")
                                .font(.title2)
                                .padding(10)
                                .background(Color.primary)
                                .clipShape(Circle())
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
        .onAppear{
            viewModel.checkIfLocationServiseIsEnabled()
        }
        .alert("Your Location have denied to this app location. Go to settings and change it.", isPresented: $viewModel.permissionDenied) {
            
            
            Button{
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            } label: {
                Text("Go to settings")
            }
            
        }
        .onChange(of: viewModel.searchText) { value in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if value == viewModel.searchText{
                    
                    self.viewModel.searchQuery()
                    
                }
            }
            
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}



