//
//  ViewController.swift
//  Map
//
//  Created by Junghoon Lee on 8/1/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let spot = Spot(title: "Staples Center",
                    locationName: "Los Angeles, CA",
                    discipline: "Convention Center",
                    coordinate: CLLocationCoordinate2D(latitude: 34.0430, longitude: -118.2673))
    
    let regionRadius: CLLocationDistance = 2000
    let initialLocation = CLLocation(latitude: 34.0430, longitude: -118.2673)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        centerMapOnLocation(location: initialLocation)
        mapView.addAnnotation(spot)
    }

    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}


extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Spot else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return view
    }
    
}










