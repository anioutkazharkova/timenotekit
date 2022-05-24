//
//  MonthCalendarView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

struct MonthCalendarView: View {
    var theme: Theme = .red
    let calendar = Calendar.current

    let interval: DateInterval
    
    var size: CGFloat = 30
    var fontSize: CGFloat = 14
    
    let showHeaders: Bool

    init(
        theme: Theme = .red,
        showHeaders: Bool = true,
        size: CGFloat = 30,
        fontSize: CGFloat = 14
    ) {
        self.interval = calendar.dateInterval(of: .month, for: Date())!
         self.theme = theme
        self.showHeaders = showHeaders
        self.size = size
        self.fontSize = size / 2
    }

    var body: some View {
        ZStack {
        GeometryReader { geometry in
            
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(size), spacing: 0), count: 7)) {
            ForEach(months, id: \.self) { month in
                Section(header: header(for: month)) {
                    ForEach(days(for: month), id: \.self) { date in
                        if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                            DayView(size: size - 2, fontSize: fontSize, day: date, theme: theme).id(date)
                        } else {
                            DayView(size: size - 2, fontSize: fontSize, day: date, theme: theme).hidden()
                        }
                    }
                }.lineSpacing(0)
            }
        }
        }
        }
    }


    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }

    private func header(for month: Date) -> some View {
        let component = calendar.component(.month, from: month)
        let formatter =  DateFormatter.monthAndYear
        formatter.locale = Locale(identifier: "en-US")
        return
        Text(showHeaders ? formatter.string(from: month) : "").frame(height: showHeaders ? size : 1)
            .font(.system(size: size*0.75))
                    
    }

    private func days(for month: Date) -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}


struct MainCalendarView: View {
    @State var theme: Theme = .red
    
    var calendar = Calendar.current
    var showHeaders: Bool = true
    
    var size: CGFloat = 30
    var fontSize: CGFloat = 14
    
    private var month: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }

    var body: some View {
        MonthCalendarView(theme: theme, showHeaders: showHeaders, size: size, fontSize: fontSize)
    }
}
