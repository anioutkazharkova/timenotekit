//
//  WidgetBundle.swift
//  ClockWidgetExtension
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

@main
struct TimeNoteWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        ClockWidget()
        ClockCalendarWidget()
        CalendarWidget()
        MapWidget()
    }

}
