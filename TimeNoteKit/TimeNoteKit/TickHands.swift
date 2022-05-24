//
//  TickHands.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

extension Date {
    var day: Int {
        let calendar = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return calendar.day ?? 0
    }
    
    var month: Int {
        let calendar = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return calendar.month ?? 0
    }
    
    var year: Int {
        let calendar = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return calendar.year ?? 0
    }
    
    var weekday: Int {
        let calendar = Calendar.current.dateComponents([.weekday], from: self)
        return calendar.weekday ?? 0
    }
    
    var isToday: Bool {
        let current = Date()
        return self.day == current.day && self.month == current.month && self.year == current.year
    }
    
    var isWeekend: Bool {
        return self.weekday == 1 || self.weekday == 7
    }
    
    var hour: Int {
        let calendar = Calendar.current.dateComponents([.hour, .minute, .second], from: self)
        return calendar.hour ?? 0
    }
    
    var minute: Int {
        let calendar = Calendar.current.dateComponents([.hour, .minute, .second], from: self)
        return calendar.minute ?? 0
    }
    
    var second: Int {
        let calendar = Calendar.current.dateComponents([.hour, .minute, .second], from: self)
        return calendar.second ?? 0
    }
    
    var hourAngle: Int {
        return (30 * hour + minute / 2)
    }
    
    var minuteAngle: Int {
        return 6 * minute
    }
    
    var secondAngle: Int {
        return 6 * second
    }
}

struct TickHands: View {
    //1
    @State private var currentDate = Date()
    //2
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { reader in
        //3
        ZStack {
            Hand(inset: reader.size.height/5.0, angle: Angle(degrees: Double(currentDate.hourAngle)))
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
            Hand(inset: reader.size.height/11.0, angle: Angle(degrees: Double(currentDate.minuteAngle)))
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
            Hand(inset: reader.size.height/20.0, angle: Angle(degrees: Double(currentDate.secondAngle)))
                .stroke(lineWidth: 2)
                .foregroundColor(.gray)
        }
        }
        //4
        .onReceive(timer) { (input) in
            self.currentDate = input
        }
    }
}
