//
//  imageViewController.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 17.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet var landscapeTapped: UITapGestureRecognizer!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landscapeView: UIImageView!
    @IBOutlet weak var peopleView: UIImageView!
    @IBOutlet weak var flowersView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func onImageTouched(_ sender: AnyObject) {
        
        
        let recognizer : UITapGestureRecognizer = sender as! UITapGestureRecognizer
        let senderImageView = recognizer.view as! UIImageView

        
        let imagePeople = #imageLiteral(resourceName: "people")
        let imageLandscape = #imageLiteral(resourceName: "landscape")
        
        if  senderImageView.image == imagePeople  // ==, != , <, >, <= , >=
        {
            imageView.image = imageLandscape
        }
        else
        {
            imageView.image = imagePeople
        }
    }
    
    @IBAction func onStackViewImageTouched(_ sender: UITapGestureRecognizer)
    {
        let recognizer = sender
        let senderImageView = recognizer.view as! UIImageView
        
        let imagePeople = peopleView
        let imageLandscape = landscapeView
        
        if senderImageView == imageLandscape
        {
           imageView.image = #imageLiteral(resourceName: "landscape")
        }
        else if senderImageView == imagePeople
        {
           imageView.image = #imageLiteral(resourceName: "people")
        }
        else
        {
           imageView.image = #imageLiteral(resourceName: "flowers")
        }
       
   
    
        }


}
