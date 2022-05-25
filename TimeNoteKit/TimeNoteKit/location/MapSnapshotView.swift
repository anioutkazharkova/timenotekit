//
//  MapSnapshotView.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 24.05.2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapSnapshotView: View {
  let location: CLLocationCoordinate2D
  var span: CLLocationDegrees = 0.01
    
    init(location: Location) {
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }

  @State private var snapshotImage: UIImage? = nil

  var body: some View {
      GeometryReader {geometry in
          VStack(alignment: .center) {
          if let image = snapshotImage {
              Image(uiImage: image).resizable().scaledToFit()
          } else {
              Color.red
          }
          }
        .onAppear {
            MapHelper.shared.taskSnapshot(for: MapView(location: Location(latitude: location.latitude, longitude: location.longitude)).mapRegion, with: geometry.size) { image in
                self.snapshotImage = image
            }
            //generateSnapshot(width: geometry.size.width, height: geometry.size.height)
        }
      }
      }
    
    
    func generateSnapshot(width: CGFloat, height: CGFloat) {

      // The region the map should display.
      let region = MKCoordinateRegion(
        center: self.location,
        span: MKCoordinateSpan(
          latitudeDelta: self.span,
          longitudeDelta: self.span
        )
      )

      // Map options.
      let mapOptions = MKMapSnapshotter.Options()
      mapOptions.region = region
      mapOptions.size = CGSize(width: width, height: height)
      //mapOptions.showsBuildings = true

      // Create the snapshotter and run it.
      let snapshotter = MKMapSnapshotter(options: mapOptions)
      snapshotter.start { (snapshotOrNil, errorOrNil) in
        if let error = errorOrNil {
          print(error)
          return
        }
        if let snapshot = snapshotOrNil {
          self.snapshotImage = snapshot.image
        }
      }
    }
}
