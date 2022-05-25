//
//  ContentView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 22.05.2022.
//

import SwiftUI

struct ContentView: View {
    init() {
      let wm =   WidgetLocationManager.shared
    }
    var body: some View {
        GeometryReader { geometry in
            let size = (geometry.size.width - 50)/7
        ScrollView {
        VStack {
        ClockView().frame(width: 300, height: 300)
        
            MainCalendarView(size: size, fontSize: size/3)
            MapSnapshotView(location: Location(latitude: 30, longitude: 50)).frame(width: 300, height: 300)
        }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
