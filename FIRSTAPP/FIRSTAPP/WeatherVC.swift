//
//  WeatherVC.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 30.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.getWeather()
        // Do any additional setup after loading the view.
    }
    
    
    func updateUI()
    {
        // updating the UI
        
    }
    
    
    func getWeather() {
        // Set up the URL request
        let myPath: String = "https://simple-weather.p.mashape.com/weatherdata?lng=13,37&lat=52,51"
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
                let condition = item!["condition"] as? [String: AnyObject]
                
                
                self.windSpeed = wind!["speed"] as? String
                self.windDirection = wind!["direction"] as? String
                self.temperature = condition!["temp"] as? String

                var myTemperature = Int(self.temperature!)
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
                else
                {
                 self.backgroundView.image = #imageLiteral(resourceName: "sunny")
                }
                }
                
                DispatchQueue.main.async {
                self.txtLabelWindSpeed.text = self.windSpeed
                self.txtLabelWindDirection.text = self.windDirection
                self.txtLabelTemperature.text = self.temperature
                    
                
                }
                
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
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
