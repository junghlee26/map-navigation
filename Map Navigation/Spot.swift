//
//  Spot.swift
//  Map
//
//  Created by Junghoon Lee on 8/1/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class Spot: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init?(json: [Any]) {
        self.title = json[16] as? String ?? "No Title"
        self.locationName = json[12] as! String
        self.discipline = json[15] as! String
        
        if let lat = Double(json[18] as! String), let lon = Double(json[19] as! String) {
            self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
    }
    
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
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
