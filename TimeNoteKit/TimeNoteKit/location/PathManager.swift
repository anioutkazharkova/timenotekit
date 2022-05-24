//
//  PathManager.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 24.05.2022.
//

import Foundation
import WidgetKit

class PathManager: LocationListener {
    var currentLocation: Location? = nil
    
   static let shared = PathManager()
    
    init() {
        self.start()
    }
    
    
    func start() {
        LocationManager.shared.request()
        LocationManager.shared.startUpdate()
    }
    
    
    func stop() {
        LocationManager.shared.stopUpdate()
    }
    
    
    
    func changedLocation(location: Location) {
        self.currentLocation = location
        WidgetCenter.shared.reloadTimelines(ofKind: "Map")
    }
    
}
    
