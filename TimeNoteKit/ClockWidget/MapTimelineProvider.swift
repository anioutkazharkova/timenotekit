//
//  MapTimelineProvider.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 24.05.2022.
//

import Foundation
import SwiftUI
import WidgetKit


struct MapEntry: TimelineEntry {
    var date: Date
    
    var location: Location
}

struct MapTimelineProvider: TimelineProvider {
    
    typealias Entry = MapEntry
    
    
    func placeholder(in context: Context) -> Entry {
        return Entry(date: Date(), location: Location(latitude: 0, longitude: 0))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (MapEntry) -> Void) {
        completion(Entry(date: Date(), location:  Location(latitude: 0, longitude: 0)))
    }
    
    func getTimeline( in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        PathManager.shared.start()
        
        completion(Timeline(entries: [MapEntry(date: Date(), location: PathManager.shared.currentLocation ?? Location(latitude: 0, longitude: 0))], policy: .atEnd))
        //completion(Timeline(entries: [Entry(date: current)], policy: .after(refreshDate)))
        //WidgetCenter.shared.reloadAllTimelines()//.reloadTimelines(ofKind: "Clock")
       
    }
}


