//
//  LocationManager.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 24.05.2022.
//

import Foundation
import CoreLocation
import WidgetKit

struct Location: Codable, Equatable {
    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct LocationWithAddress: Codable {
    var latitude: Double
    var longitude: Double
    var address: String
}

class WidgetLocationManager: NSObject, CLLocationManagerDelegate {
    lazy var locationManager: CLLocationManager = {
       return CLLocationManager()
    }()
    
    static let shared = WidgetLocationManager()
    
    private var handler: ((CLLocation) -> Void)?
    override init() {
        super.init()
        self.locationManager.delegate = self
    
       // DispatchQueue.main.async {
            if self.locationManager.authorizationStatus == .notDetermined {
                self.locationManager.requestLocation()
                self.locationManager.requestAlwaysAuthorization()
                self.locationManager.requestWhenInUseAuthorization()
            }
       // }
    }
    func fetchLocation(handler: @escaping (CLLocation) -> Void) {
        self.handler = handler
        self.locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler!(locations.last!)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
