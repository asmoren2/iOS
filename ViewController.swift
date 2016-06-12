//
//  ViewController.swift
//  proj5App
//
//  Created by Adolfo Moreno on 4/21/16.
//  Copyright © 2016 Adolfo Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    // IBOutlet attribute tells Xcode that you can connect to the nameTextField.
    // weak keyword means that it’s possible for that property to have no value
    // exclamation point indicates that the type is an implicitly unwrapped optional,
    
    @IBOutlet weak var monthTextField1: UITextField!
    @IBOutlet weak var dayTextField1: UITextField!
    @IBOutlet weak var yearTextField1: UITextField!
    
    @IBOutlet weak var monthTextField2: UITextField!
    @IBOutlet weak var dayTextField2: UITextField!
    @IBOutlet weak var yearTextField2: UITextField!
    
    @IBOutlet weak var date1Label: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet weak var daysBetween: UILabel!
    @IBOutlet weak var numDays: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monthTextField1.delegate = self
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard after use
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: When button is pressed check for bad input and calculate days
    @IBAction func calculateButton(sender: UIButton) {
        // check to see that none of the textfields are empty
        if monthTextField1.text!.isEmpty || monthTextField2.text!.isEmpty || dayTextField1.text!.isEmpty || dayTextField2.text!.isEmpty || yearTextField1.text!.isEmpty || yearTextField1.text!.isEmpty{
           numDays.text = "Fill in all of the text fields" // if empty display error message
        }
        else{
            let a = Int(yearTextField1.text!)      // Starting Year cast to int
            let b = Int(yearTextField2.text!)      // Ending Year cast to int
            let c = Int(monthTextField1.text!)     // Starting Month cast to int
            let d = Int(dayTextField1.text!)       // Starting Day cast to int
            let e = Int(dayTextField2.text!)       // Ending Day cast to int
            let f = Int(monthTextField2.text!)     // Ending Month cast to int
            let Strings = GregorianCalendar.isCorrectInput(c!, cDay: d!, cYear: a!, fMonth: f!, fDay: e!, fYear: b!)
            
            numDays.text = GregorianCalendar.isCorrectInput(c!, cDay: d!, cYear: a!, fMonth: f!, fDay: e!, fYear: b!)
            if Strings == ""{
                numDays.text = String(GregorianCalendar.getTotalDays(c!, cDay: d!, cYear: a!, fMonth: f!, fDay: e!, fYear: b!))
            }
            else{
                numDays.text = Strings // Display error info
            }

        }

        
    }
    
}

