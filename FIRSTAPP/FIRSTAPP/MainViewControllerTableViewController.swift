//
//  MainViewControllerTableViewController.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 16.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit


class MainTableViewController: UITableViewController  {

    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    
    
    let flowingMenuTransitionManager = FlowingMenuTransitionManager()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc                   = segue.destination
        vc.transitioningDelegate = flowingMenuTransitionManager
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
//        // Add the pan screen edge gesture to the current view
//        flowingMenuTransitionManager.setInteractivePresentationView(view)
//
//        // Add the delegate to respond to interactive transition events
//        flowingMenuTransitionManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // some coment
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath) as UITableViewCell

        // Configure the cell...
        let rowNumber = indexPath.row + 1
        cell.textLabel?.text = "\(rowNumber). test"

        switch (indexPath.row)
        { case 0:
            cell.textLabel?.text = "User Details"
        case 1:
            cell.textLabel?.text = "Image Viewer"
        case 2:
            cell.textLabel?.text = "Animations"
        case 3:
            cell.textLabel?.text = "Colours"
        case 4:
            cell.textLabel?.text = "Weather"
        case 5:
            cell.textLabel?.text = "Game"
        default:
            cell.textLabel?.text = "\(rowNumber). test"

        }
        return cell

    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     {
        switch (indexPath.row)
        {
            case 0:
                    if let UserDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailVC") {
                        self.navigationController?.pushViewController(UserDetailVC, animated: true)  // use the story board id UserDetailVC
                    }
            case 1:
                    if let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "imageViewController") {
                        self.navigationController?.pushViewController(imageViewController, animated: true)  
                    }
            case 2:
                    if let AnimationsVC = self.storyboard?.instantiateViewController(withIdentifier: "AnimationsVC") {
                        self.navigationController?.pushViewController(AnimationsVC, animated: true)
                    }
            case 3:
                    if let TapBarController = self.storyboard?.instantiateViewController(withIdentifier: "TapBarController") {
                        self.navigationController?.pushViewController(TapBarController, animated: true)
                    }
            case 4:
                    if let WeatherVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherVC") {
                        self.navigationController?.pushViewController(WeatherVC, animated: true)
                    }
            case 5:
                if let MyGame = self.storyboard?.instantiateViewController(withIdentifier: "MyGame") {
                    self.navigationController?.pushViewController(MyGame, animated: true)
                }
            
            default:
                print("test")
       }
   }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

