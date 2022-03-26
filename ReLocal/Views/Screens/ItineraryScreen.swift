//
//  ItineraryView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 25.03.22.
//

import SwiftUI

struct ItineraryScreen: View {
    
    @StateObject var weekView = CalendarWeekView()
    @Namespace var animation
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                Section{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(weekView.currentWeek, id: \.self){ day in
                                
                                //EEE return day as MON, TUE, ... etc
                                VStack(spacing: 10){
                                    Text(weekView.extractedDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text(weekView.extractedDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(weekView.isToday(date: day) ? 1 : 0)
                                    
                                    
                                }
                                .foregroundStyle(weekView.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(weekView.isToday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                        if weekView.isToday(date: day) {
                                            
                                            Capsule()
                                                .fill(Color("azul"))
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation {
                                        weekView.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                } header: {
                    HeaderView()
                }
                
                HStack(spacing: 40){
                    Text("Time")
                    
                    Text("Locations")
                }
                .padding()
                
                VStack{
                    ForEach(0 ... 5, id: \.self){ i in
                        ItinerayView()
                    }
                }
                
                
                Spacer()
            }
        }
    }
    
    
    func  HeaderView() -> some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
            
            Button{
                
            } label: {
                Image("insta")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
            
        }
        .padding()
        .background(Color.white)
    }
}

struct ItineraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryScreen()
    }
}


extension View {
    
    func hLeading() -> some View{
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTraling() -> some View{
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View{
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
}
