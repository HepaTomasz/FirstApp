//
//  myGame.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 02.02.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class MyGame: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    var drops : [UIImageView] = []
    let countDrops = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBtnTouched(_ sender: Any) {
        startButton.isHidden = true
        let width = self.view.frame.width
        let height = self.view.frame.height
        let dropSize : CGFloat = 40
        var randXBeginArr : Array<CGFloat> = []
        var randXEndArr : Array<Int> = []
        var durations : Array<CGFloat> = []
        var animDelayArr : Array<CGFloat> = []
        
        for index in 0..<self.countDrops {
            self.drops.append(UIImageView(image: #imageLiteral(resourceName: "rainDrop")))
            randXBeginArr.append(CGFloat(arc4random_uniform(UInt32(width))))
            randXEndArr.append(Int(arc4random_uniform(UInt32(width))))
            durations.append(randomCGFloat(min: 0.5, max: 5.0))
            animDelayArr.append(randomCGFloat(min: 0.0, max: 10))
            
            self.drops[index].frame = CGRect(x: randXBeginArr[index], y: -dropSize, width: dropSize, height: dropSize)
            
            self.view.addSubview(self.drops[index])
            
            UIView.animate(withDuration: TimeInterval(durations[index]), delay: TimeInterval(animDelayArr[index]), options: .repeat, animations: {
                self.drops[index].center = CGPoint.init(x: randXBeginArr[index], y: height + dropSize)
            }, completion: nil)
            
        }
    }
    
    
    
    
    func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min
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
