//
//  CalendarWeekView.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 26.03.22.
//

import SwiftUI

class CalendarWeekView: ObservableObject {
   
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    
    init(){
        fetchCurrentWeek()
    }
    
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    
    func extractedDate(date: Date, format: String) -> String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    
    
    func isToday(date: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
}

