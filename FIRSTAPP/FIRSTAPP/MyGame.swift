//
//  myGame.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 02.02.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit


class MyGame: UIViewController {

    @IBOutlet weak var gameOverTxtLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!

    var score = 0
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    var drops : [UIImageView] = []
    let countDrops = 15
    let dropSize : CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // recognizer to get touch events on animated views
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.removeDrop(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBtnTouched(_ sender: Any) {
        
        // creating drops
        startButton.isHidden = true
        let width = self.view.frame.width
        let height = self.view.frame.height
        var randXBeginArr : Array<CGFloat> = []
        var randXEndArr : Array<Int> = []
        var durations : Array<CGFloat> = []
        var animDelayArr : Array<CGFloat> = []
        
        for index in 0..<self.countDrops {
            self.drops.append(UIImageView(image: #imageLiteral(resourceName: "rainDrop")))
            randXBeginArr.append(CGFloat(arc4random_uniform(UInt32(width))))
            randXEndArr.append(Int(arc4random_uniform(UInt32(width))))
            durations.append(randomCGFloat(min: 5, max: 17.0))
            animDelayArr.append(randomCGFloat(min: 0.0, max: 10))
            
            self.drops[index].frame = CGRect(x: randXBeginArr[index], y: -dropSize, width: dropSize, height: dropSize)
            if drops[index].frame == CGRect(x: randXBeginArr[index], y:0, width: dropSize, height: dropSize){
                gameOverTxtLabel.isHidden = false
                
            }
            //self.drops[index].isUserInteractionEnabled = true
            self.view.addSubview(self.drops[index])
            // animate the drop
            UIView.animate(withDuration: TimeInterval(durations[index]), delay: TimeInterval(animDelayArr[index]), options: .repeat, animations: {
                self.drops[index].center = CGPoint.init(x: randXBeginArr[index], y: height + self.dropSize)
            }, completion: nil)
        }
        runTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(MyGame.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func removeDrop(_ sender: UITapGestureRecognizer)
    {
        for index in 0..<self.drops.count {
            let point = sender.location(in: self.view)
            let presentationPosition = self.drops[index].layer.presentation()?.position
            
            if (point.x > presentationPosition!.x - self.dropSize/2 && point.x < presentationPosition!.x + self.dropSize/2
                && point.y > presentationPosition!.y - self.dropSize/2 && point.y < presentationPosition!.y + self.dropSize/2)
            {
                print("inside view")
                score += 1
                // remove the drop from view and from the drops array
                self.drops[index].removeFromSuperview()
                self.drops.remove(at: index)
                pointsLabel.text = "\(score)"
                
                break;
                // maybe later a nice explosion animation
            }
            else{
                print("outside view")
            }

        }
    }
    // some helper funtions
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)"  // This will update the label.
    }
    
    func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min
    }
    @IBAction func restartBtnTouched(_ sender: Any) {
        loadView()
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
