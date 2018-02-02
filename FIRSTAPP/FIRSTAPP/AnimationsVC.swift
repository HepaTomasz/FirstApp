//
//  AnimationsVC.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 18.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class AnimationsVC: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var animationView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let position = touch.location(in: view)
//            print(position)
//        }
//    }
    
    
    @IBAction func TouchPosition(_ sender: UITapGestureRecognizer) {
        
        let recognizer = sender
        let touchedPoint = recognizer.location(in: self.view)
        

//        UIView.animate(withDuration: 0.3)
//        {
//            //self.myLabel.frame.origin = touchedPoint
//            //self.animationView.frame.origin = touchedPoint
//            self.animationView.center = touchedPoint
//        }
//
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.animationView.center = touchedPoint
            self.animationView.transform = CGAffineTransform(scaleX: 1, y: -1)
        }, completion: nil)
        
//        UIView.animate(withDuration: 3, delay: 0, options: .transitionFlipFromLeft, animations: {
//            self.animationView.center = touchedPoint
//        }) { _ in
//            //nothing
//        }
        
        
        print("Touched")
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

