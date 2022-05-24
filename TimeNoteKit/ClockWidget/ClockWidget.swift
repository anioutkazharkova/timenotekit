//
//  ClockWidget.swift
//  ClockWidget
//
//  Created by Anna Zharkova on 22.05.2022.
//

import WidgetKit
import Intents


import Foundation
import SwiftUI
import WidgetKit

struct MapWidget : Widget {
    let kind: String = "Map"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MapTimelineProvider()) { entry in
            MapWidgetSwift(entry: entry)
        }
        .configurationDisplayName("Map widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge, .systemExtraLarge])
    }
}

struct ClockWidget: Widget {

    let kind: String = "Clock"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ChangeThemeIntent.self, provider: ClockTimelineProvider()) { entry in
            ClockWidgetswift(entry: entry)
        }
        .configurationDisplayName("Clock widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge, .systemSmall, .systemMedium])
    }

}

struct ClockCalendarWidget: Widget {

    let kind: String = "ClockCalendar"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ChangeThemeIntent.self, provider: ClockTimelineProvider()) { entry in
            ClockCalendarswift(entry: entry)
        }
        .configurationDisplayName("Clock calendar widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }

}

struct CalendarWidget: Widget {

    let kind: String = "Calendar"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ChangeThemeIntent.self, provider: ClockTimelineProvider()) { entry in
            CalendarSwift(entry: entry)
        }
        .configurationDisplayName("Clock calendar widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemLarge])
    }

}
