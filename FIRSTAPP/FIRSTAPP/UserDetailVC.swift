//
//  UserDetailVC.swift
//  FIRSTAPP
//
//  Created by Tomasz Hepa on 15.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit


class UserDetailVC: UIViewController {
    
    
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var NavigationBar: UINavigationItem!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var datePickerBirthday: UIDatePicker!
    @IBOutlet weak var passwordTxtField: UITextField!
    var birthday = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.title = "User Detail VC"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDateTouchedBy(_ sender: Any) {
         datePickerBirthday.isHidden = false
        
    }
    
    
    
    @IBAction func dataPickerValueChanged(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        
        // @TODO: remove time from date picker
        
        let dateString = formatter.string(from: datePickerBirthday.date)
        
        btnDate.setTitle(dateString, for: .normal)
        btnDate.setTitle(dateString, for: .selected)
        btnDate.setTitle(dateString, for: .highlighted)
        
        birthday = datePickerBirthday.date
        
    }
    
    @IBAction func someTextFieldStartsEditing(_ sender: Any)
    {
        datePickerBirthday.isHidden = true
    }
    var inputData: UIInputViewController?
    @IBAction func saveButton(_ sender: UIButton) {
        
        print(nameTxtField.text)
        print(lastNameTxtField.text)
        print(passwordTxtField.text)
        print(Slider.value)
        print(Switch.isOn)
        
        print(datePickerBirthday.date)
        
    }
    

}

