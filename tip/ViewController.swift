//
//  ViewController.swift
//  tip
//
//  Created by Pawan on 8/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customField: UITextField!
    
    let tipPrecentages = [0.10, 0.15, 0.2,0.0]
    
    let defaults = UserDefaults.standard
    let total : Double = 0.0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
       tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        
       let bill  = Double(billAmountTextField!.text!) ?? 0
        
        let customTip = Double(customField!.text!) ?? 0
        var tip : Double
        
        
        if (tipPrecentages[tipControl.selectedSegmentIndex] != 0.0)
        {
            customField.isEnabled = false
            customField.text = ""
            customField.backgroundColor = UIColor.init(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            customField.borderStyle = UITextField.BorderStyle(rawValue: 0)!
            
            tip = bill * tipPrecentages[tipControl.selectedSegmentIndex]
            
        }else
        {
            customField.isEnabled = true
            customField.borderStyle = UITextField.BorderStyle(rawValue: 3)!
            customField.backgroundColor = UIColor.init(red: 1, green: 0.7567524624, blue: 0.2575065863, alpha: 1)
            tip = bill * (customTip/100)
            
        }
        //Calculate tip and total
        
        let total = bill + tip
        
        
        // update the tip and total label
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        self.title = "Tip Calculator"
        
//         Do any additional setup after loading the view.
    }
    
  
    
   
    
    @IBAction func calculateTip(_ sender: Any) {
       
       
        //get initial amount and calculate tip
        let bill  = Double(billAmountTextField!.text!) ?? 0
        
        let customTip = Double(customField!.text!) ?? 0
        var tip : Double
        
        
        if (tipPrecentages[tipControl.selectedSegmentIndex] != 0.0)
        {
            customField.isEnabled = false
            customField.text = ""
            customField.backgroundColor = UIColor.init(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            customField.borderStyle = UITextField.BorderStyle(rawValue: 0)!
            
            tip = bill * tipPrecentages[tipControl.selectedSegmentIndex]
            
        }else
        {
            customField.isEnabled = true
            customField.borderStyle = UITextField.BorderStyle(rawValue: 3)!
            customField.backgroundColor = UIColor.init(red: 1, green: 0.7567524624, blue: 0.2575065863, alpha: 1)
            tip = bill * (customTip/100)
            
        }
        //Calculate tip and total
        
        let total = bill + tip
        
        
        // update the tip and total label
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

