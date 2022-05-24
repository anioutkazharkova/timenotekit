//
//  ClockWidgetSwiftUI.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

import SwiftUI
import UIKit

struct MapWidgetSwift : View {
    var entry: MapTimelineProvider.Entry
    
    var body: some View {
        VStack {
            MapSnapshotView(location: entry.location)
        }
    }
}

struct ClockWidgetswift: View {
    var entry: ClockTimelineProvider.Entry
    
    var body: some View {
        GeometryReader { geometry in
            ClockView(theme: entry.configation.ThemeColor.accentColor() ).frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ClockCalendarswift: View {
    var entry: ClockTimelineProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemLarge, .systemExtraLarge:
            GeometryReader { geometry in
            HStack{
                ClockView(theme: entry.configation.ThemeColor.accentColor()).frame(width: 150, height: 150)
            MainCalendarView(theme: entry.configation.ThemeColor.accentColor())
            }
        }
        case .systemMedium:
            
            HStack{
            ClockView(theme: entry.configation.ThemeColor.accentColor()).frame(width: 150, height: 150)
                MainCalendarView(theme: entry.configation.ThemeColor.accentColor(), showHeaders: false, size: 18, fontSize: 8)
            }
        default:
            Text("Some other WidgetFamily in the future.")
        }
    }
}

struct CalendarSwift: View {
    var entry: ClockTimelineProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemLarge, .systemExtraLarge:
            MainCalendarView(theme: entry.configation.ThemeColor.accentColor(), size: 40, fontSize: 14)
        case .systemSmall:
            MainCalendarView(theme: entry.configation.ThemeColor.accentColor(), size: 15, fontSize: 7)
        default:
            Text("Some other WidgetFamily in the future.")
        }
    }
}


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
