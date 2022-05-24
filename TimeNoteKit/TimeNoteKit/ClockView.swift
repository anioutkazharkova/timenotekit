//
//  ClockView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

struct ClockView: View {
    @State var theme: Theme = .red
    
    var body: some View {
           //1
           ZStack {
               //2
               Circle()
                   .fill(theme.accentColor())
                   
               //3
               Ticks(inset: 8, minTickHeight: 5, hourTickHeight: 10)
                   .stroke(lineWidth: 2)
                   .foregroundColor(.white)

               //4
               TickText(
                   ticks: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map{"\($0)"},
                   inset: 25
               )
                   .foregroundColor(.white)
                   .font(Font.system(size: 27))
               //5
               TickHands()
           }
           //6
           .padding()
       }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
