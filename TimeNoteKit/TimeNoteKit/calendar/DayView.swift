//
//  DayView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

struct DayView: View {
    var size: CGFloat = 30
    var fontSize: CGFloat = 14
    @State var day: Date
    @State var theme: Theme = .red
    
    var color: Color {
        if day.isWeekend {
            if day.isToday {
                return .white
            } else {
                return theme.accentColor()
            }
        } else {
            if day.isToday {
                return .white
            }
            else {
            return .black
            }
        }
    }
    
    var body: some View {
        Text("30")
            .hidden()
            .padding(6).frame(width: size, height: size)
            .background(day.isToday ? theme.accentColor() : Color.white)
            .clipShape(Circle())
            .padding(.vertical, 4)
            .overlay(
                Text("\(day.day)").frame(width: size, height: size)
                    .font(.system(size: fontSize)).foregroundColor(color)
            )
    }
}


