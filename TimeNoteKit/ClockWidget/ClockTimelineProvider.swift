//
//  ClockTimelineProvider.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import Foundation
import SwiftUI
import WidgetKit
import Intents

class TimeHolder {
    var timer: Timer? = nil
    var currentTime: Date = Date()
    
    var completion: (()->Void)? = nil
    
    static let shared = TimeHolder()
    
    init() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        self.currentTime = Date()
        WidgetCenter.shared.reloadAllTimelines()//.reloadTimelines(ofKind: "Clock")
    }
}

struct ClockEntry: TimelineEntry {
    var date: Date
    var configation: ChangeThemeIntent
}

struct ClockTimelineProvider: IntentTimelineProvider {
    
    typealias Intent = ChangeThemeIntent
    typealias Entry = ClockEntry
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), configation: ChangeThemeIntent())
    }
    
    func getSnapshot(for configuration: ChangeThemeIntent, in context: Context, completion: @escaping (Entry) -> ()) {
        completion(Entry(date: Date(),configation: configuration))
    }
    
    func getTimeline(for configuration: ChangeThemeIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let current = Date()
        let refreshDate = Calendar.current.date(byAdding: .second, value: 1, to: current)!
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            completion(Timeline(entries: [Entry(date: current, configation: configuration)], policy: .after(refreshDate)))
            WidgetCenter.shared.reloadTimelines(ofKind: "Clock")
            WidgetCenter.shared.reloadTimelines(ofKind: "ClockCalendar")
            WidgetCenter.shared.reloadTimelines(ofKind: "Calendar")
        }
        //completion(Timeline(entries: [Entry(date: current)], policy: .after(refreshDate)))
        //WidgetCenter.shared.reloadAllTimelines()//.reloadTimelines(ofKind: "Clock")
       
    }
}
