//
//  MapViewController.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 31.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (mapView.isUserLocationVisible == false)
        {
            mapView.showsUserLocation = true;
        }
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
        // Dispose of any resources that can be recreated.
    }
    
        @IBAction func onMapTouched(_ sender: UIGestureRecognizer) {
        
        let recognizer = sender
        let touchedPoint = recognizer.location(in: self.view)
        let locationCoordinate = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        
        
        locationManager.startUpdatingLocation()
        let annotation = MKPointAnnotation()
        // Set the annotation by the lat and long variables
        annotation.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        annotation.title = "User location"
        self.mapView.addAnnotation(annotation)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
