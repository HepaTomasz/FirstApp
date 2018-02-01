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

protocol MapViewVCDelegate {
    func userChoosedNewLocation(longitude:Double, latitude: Double)
}

class MapViewController: UIViewController {
    
    
    var delegate : MapViewVCDelegate?
    let locationManager = CLLocationManager()
    var currentUsedLocationAnotation : MKPointAnnotation? = nil
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (mapView.isUserLocationVisible == false) {
            mapView.showsUserLocation = true;
        }
        
        if (self.currentUsedLocationAnotation != nil)
        {
            self.mapView.addAnnotation(self.currentUsedLocationAnotation!)
        }
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onMapTouched(_ sender: UIGestureRecognizer) {
        
        let recognizer = sender
        var touchedPoint = recognizer.location(in: self.view)
        
        touchedPoint.y = touchedPoint.y-64
        
        let locationCoordinate = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        
        
        var annotation : MKPointAnnotation? = nil
    
        if self.currentUsedLocationAnotation == nil
        {
            annotation = MKPointAnnotation()
            self.mapView.addAnnotation(annotation!)
            
            
        }
        else
        {
            annotation = self.currentUsedLocationAnotation
        }
        
        locationManager.startUpdatingLocation()
        
        // Set the annotation by the lat and long variables
        annotation?.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        annotation?.title = "Current Location"
      
        self.currentUsedLocationAnotation = annotation
        
        delegate?.userChoosedNewLocation(longitude: locationCoordinate.longitude, latitude: locationCoordinate.latitude)

    }
    

//        delegate?.weatherLocation(update: currentUsedLocationAnotation!)
//
//        navigationController?.popViewController(animated: true)

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}








