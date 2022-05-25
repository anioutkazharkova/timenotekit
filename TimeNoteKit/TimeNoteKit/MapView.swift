//
//  MapView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 25.05.2022.
//

import Foundation
import SwiftUI

import MapKit

struct LocationData : Identifiable {
    var id: UUID = UUID()
    
    let coordinate: CLLocationCoordinate2D
    let name: String
}

struct MapView: View {
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.75, longitude: 37.5), span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
    @State var annotation: LocationData = LocationData(coordinate: CLLocationCoordinate2D(latitude: 55.75, longitude: 37.5), name: "Home")
    
    init(location: Location) {
        self.mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
        self.annotation = LocationData(coordinate: mapRegion.center, name: "Home")
        
    }
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: [annotation]) { item in
            MapAnnotation(coordinate: item.coordinate, content: {
             Circle().foregroundColor(.red).frame(width: 30, height: 30)
        })
    }
}
}
