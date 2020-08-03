//
//  SettingsViewController.swift
//  tip
//
//  Created by Pawan on 8/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTip.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClick(_ sender: Any) {
        
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
       
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
