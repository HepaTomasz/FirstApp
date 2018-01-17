//
//  imageViewController.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 17.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

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

    @IBAction func onImageTouched(_ sender: Any) {
        
        imageView.image = #imageLiteral(resourceName: "video-obrazek")
      
        // change the image to the people image
    }
}
