//
//  TickText.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

struct TickText: View {
    //1
    var ticks: [String]
    var inset: CGFloat
    
    //2
    private struct IdentifiableTicks: Identifiable {
        var id: Int
        var tick: String
    }
    
    //3
    private var dataSource: [IdentifiableTicks] {
        self.ticks.enumerated().map { IdentifiableTicks(id: $0, tick: $1) }
    }
    
    var body: some View {
        //4
        GeometryReader { proxy in
            ZStack {
                ForEach(self.dataSource) {
                    Text("\($0.tick)").font(.system(size: 12)).foregroundColor(.blue)
                        .position(
                            //5
                            self.position(for: $0.id, in: proxy.frame(in: .local))
                        )
                }
            }
        }
    }
    
    //6
    private func position(for index: Int, in rect: CGRect) -> CGPoint { //(6)
        let rect = rect.insetBy(dx: inset, dy: inset)
        let angle = ((2 * .pi) / CGFloat(ticks.count) * CGFloat(index)) - .pi/2
        let radius = min(rect.width, rect.height)/2
        return CGPoint(x: rect.midX + radius * cos(angle),
                       y: rect.midY + radius * sin(angle))
    }
}
