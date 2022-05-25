//
//  MapView+Util.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 25.05.2022.
//

import Foundation
import MapKit
import SwiftUI


class MapHelper {
    static let shared = MapHelper()
    
    func makeSnapshotter(for country: MKCoordinateRegion, with size: CGSize)
      -> MKMapSnapshotter {
      let options = MKMapSnapshotter.Options()
      options.region = country
      options.size = size

      // Force light mode snapshot
      options.traitCollection = UITraitCollection(traitsFrom: [
        options.traitCollection,
        UITraitCollection(userInterfaceStyle: .light)
      ])

      return MKMapSnapshotter(options: options)
    }
    
    func taskSnapshot(for country: MKCoordinateRegion, with size: CGSize, completion: @escaping(UIImage)->Void) {
        makeSnapshotter(for: country, with: size).start { snapshot, error in
            if let snapshot = snapshot {
                completion(snapshot.image)
            }
        }
    }
}

