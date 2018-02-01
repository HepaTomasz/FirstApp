//
//  WeatherVC.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 30.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class WeatherVC: UIViewController, CLLocationManagerDelegate, MapViewVCDelegate {
    func weatherLocation(update: MKPointAnnotation) {
    
    }

    
    @IBOutlet weak var titleLabelCity: UILabel!
    @IBOutlet weak var titleLabelTemp: UILabel!
    @IBOutlet weak var titleLabelSpeed: UILabel!
    @IBOutlet weak var titleLabelWindDirection: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var txtLabelWindDirection: UILabel!
    @IBOutlet weak var txtLabelWindSpeed: UILabel!
    @IBOutlet weak var txtLabelTemperature: UILabel!
    
    var windSpeed : String?
    var windDirection : String?
    var temperature : String?
    var city : String?
    let locationManager = CLLocationManager()
    var currentLat : Double?
    var currentLng : Double?
    
    
    
    var drop1 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))
    var drop2 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))
    var drop3 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))
    var drop4 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))
    var drop5 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))
    var drop6 = UIImageView(image: #imageLiteral(resourceName: "rainDrop"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = self.view.frame.width
        let diceRoll = Int(arc4random_uniform(UInt32(width)))
        let diceRoll2 = Int(arc4random_uniform(UInt32(width)))
        let diceRoll3 = Int(arc4random_uniform(UInt32(width)))
        let diceRoll4 = Int(arc4random_uniform(UInt32(width)))
        let diceRoll5 = Int(arc4random_uniform(UInt32(width)))
        let diceRoll6 = Int(arc4random_uniform(UInt32(width)))
        let durationDiceRoll1 = Int(arc4random_uniform(6))
        let durationDiceRoll2 = Int(arc4random_uniform(6))
        let durationDiceRoll3 = Int(arc4random_uniform(6))
        let durationDiceRoll4 = Int(arc4random_uniform(6))
        let durationDiceRoll5 = Int(arc4random_uniform(6))
        let durationDiceRoll6 = Int(arc4random_uniform(6))
        
        drop1.frame = CGRect(x: diceRoll, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop1)
    
        UIView.animate(withDuration: TimeInterval(durationDiceRoll1), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop1.center = CGPoint.init(x: diceRoll, y: 899)
        }, completion: nil)
        
        drop2.frame = CGRect(x: diceRoll2, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop2)
        
        UIView.animate(withDuration: TimeInterval(durationDiceRoll2), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop2.center = CGPoint.init(x: diceRoll2, y: 899)
        }, completion: nil)
        
        drop3.frame = CGRect(x: diceRoll3, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop3)
        
        UIView.animate(withDuration: TimeInterval(durationDiceRoll3), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop3.center = CGPoint.init(x: diceRoll3, y: 899)
        }, completion: nil)
        
        drop4.frame = CGRect(x: diceRoll4, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop4)
        
        UIView.animate(withDuration: TimeInterval(durationDiceRoll4), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop4.center = CGPoint.init(x: diceRoll4, y: 899)
        }, completion: nil)
        
        drop5.frame = CGRect(x: diceRoll5, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop5)
        
        UIView.animate(withDuration: TimeInterval(durationDiceRoll5), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop5.center = CGPoint.init(x: diceRoll5, y: 899)
        }, completion: nil)
        
        drop6.frame = CGRect(x: diceRoll6, y: 50, width: 40, height: 40)
        
        self.view.addSubview(drop6)
        
        UIView.animate(withDuration: TimeInterval(durationDiceRoll6), delay: 0.0, options: .curveEaseInOut, animations: {
            self.drop6.center = CGPoint.init(x: diceRoll6, y: 899)
        }, completion: nil)
        
        // Rain drops end
        
        if CLLocationManager.locationServicesEnabled() {
            // configuration
            locationManager.delegate = self // tell the location manager who one is the opject the wants to have the events
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.distanceFilter = 10000
            
            if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
                locationManager.requestWhenInUseAuthorization()
            }

            //the activation
            locationManager.startUpdatingLocation()
            //locationManager.requestLocation();
            
        }
        else{
            self.getWeatherFor(latitude: 37.37 , longitude: 52.51)
        }
        
        
        
    }
    
    
    

    //this method will be called each time when a user change his location access preference.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("User allowed us to access location")
            //do whatever init activities here.
        }
    }


    //this method is called by the framework on         locationManager.requestLocation();
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        print("Did location updates is called: \(lat) \(lng) ")
        //store the user location here to firebase or somewhere
        
        self.currentLat = lat
        self.currentLng = lng
        self.getWeatherFor(latitude: self.currentLat! , longitude : self.currentLng!)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Did location updates is called but failed getting location \(error)")
    }



    
     func updateUI()
    {
        // updating the UI
        
        let myTemperature = Int(self.temperature!)
        DispatchQueue.main.async {
            if myTemperature! < 20 {
                self.backgroundView.image = #imageLiteral(resourceName: "middleTemp")
                self.txtLabelTemperature.textColor = UIColor.white
                self.txtLabelWindDirection.textColor = UIColor.white
                self.txtLabelWindSpeed.textColor = UIColor.white
                self.titleLabelTemp.textColor = UIColor.white
                self.titleLabelSpeed.textColor = UIColor.white
                self.titleLabelWindDirection.textColor = UIColor.white
                
                
            }
            if myTemperature! < 0 {
                self.backgroundView.image = #imageLiteral(resourceName: "winter")
                self.txtLabelTemperature.textColor = UIColor.black
                self.txtLabelWindDirection.textColor = UIColor.black
                self.txtLabelWindSpeed.textColor = UIColor.black
                self.titleLabelTemp.textColor = UIColor.black
                self.titleLabelSpeed.textColor = UIColor.black
                self.titleLabelWindDirection.textColor = UIColor.black
            }
            else if myTemperature! > 20 {
                self.backgroundView.image = #imageLiteral(resourceName: "sunny")
            }
        }
        
        DispatchQueue.main.async {
            self.txtLabelWindSpeed.text = self.windSpeed
            self.txtLabelWindDirection.text = self.windDirection
            self.txtLabelTemperature.text = self.temperature
            self.titleLabelCity.text = self.city
        }
        
    }
    
    
    func getWeatherFor(latitude: Double , longitude : Double) {
        
        var latStr = "\(latitude)"
        var lngStr = "\(longitude)"
        
        latStr = latStr.replacingOccurrences(of: ".", with: ",")
        lngStr = lngStr.replacingOccurrences(of: ".", with: ",")
        
        // Set up the URL request
        let myPath: String = "https://simple-weather.p.mashape.com/weatherdata?lng=\(lngStr)&lat=\(latStr)"
        guard let url = URL(string: myPath) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("9h0MJAqeR7mshHznC9BqqChNu7ESp1RzzxKjsnZFNV8Fzmlfha", forHTTPHeaderField: "X-Mashape-Key")
        urlRequest.addValue("simple-weather.p.mashape.com", forHTTPHeaderField: "X-Mashape-Host")
        
        // set up the session
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            // check for any errors
            
            //print(response)
            guard error == nil else {
                print(error!)
                return
            }
            
            
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            
            do {
                    guard let weatherJSONObj = try JSONSerialization.jsonObject(with: responseData, options:[]) as? [String: AnyObject] else {
                        print("error trying to convert data to JSON")
                        return
                    }
                    print("The weather is: " + weatherJSONObj.description)
                
                    let query  = weatherJSONObj["query"] as? [String: AnyObject]
                    let results = query!["results"] as? [String: AnyObject]
                    let channel = results!["channel"] as? [String: AnyObject]
                    let wind = channel!["wind"] as? [String: AnyObject]
                    let item = channel!["item"] as? [String: AnyObject]
                    let location = channel!["location"] as? [String: AnyObject]
                    let condition = item!["condition"] as? [String: AnyObject]
                    // let city = location!["city"] as? [String: AnyObject]
                
                    self.city = location!["city"] as? String
                    self.windSpeed = wind!["speed"] as? String
                    self.windDirection = wind!["direction"] as? String
                    self.temperature = condition!["temp"] as? String

                    // we have now the values, let us update the ui
                    self.updateUI();
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        task.resume()
        
        txtLabelWindSpeed.text = windSpeed
        txtLabelWindDirection.text = windDirection
        txtLabelTemperature.text = temperature
        titleLabelCity.text = city
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onBtnChangeLocationTouched(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as? MapViewController{
            vc.delegate = self
            if vc.currentUsedLocationAnotation == nil {
                vc.currentUsedLocationAnotation = MKPointAnnotation()
                vc.currentUsedLocationAnotation?.coordinate = CLLocationCoordinate2D(latitude: self.currentLat!, longitude: self.currentLng!)
            }

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "second" {
//            let destination = segue.destination as! MapViewController
//            destination.delegate = self
//        }
//    }
    
    
    func userChoosedNewLocation(longitude: Double, latitude: Double) {
        // do something
        
         self.getWeatherFor(latitude: latitude , longitude: longitude)
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
