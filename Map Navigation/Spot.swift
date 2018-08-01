//
//  Spot.swift
//  Map
//
//  Created by Junghoon Lee on 8/1/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit
import MapKit

class Spot: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
