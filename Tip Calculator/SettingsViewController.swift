//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Azhar Chara on 07/08/17.
//  Copyright © 2017 Azhar Chara. All rights reserved.
//


import UIKit

class SettingsViewController: UIViewController {
    
    // view outlets/connections
    @IBOutlet var defaultTipSlider: UISlider!
    @IBOutlet var defaultSplitSlider: UISlider!
    @IBOutlet var defTipLabel: UILabel!
    @IBOutlet var defSplitLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Settings"
        
        // initializing neccessary field with required values
        defaultTipSlider.value = Float(UserDefaults.standard.integer(forKey: "defTipPercent"))
        defaultSplitSlider.value = Float(UserDefaults.standard.integer(forKey: "defSplit"))
        defTipLabel.text = String(Int(defaultTipSlider.value)) + "%"
        defSplitLabel.text = String(Int(defaultSplitSlider.value))
    }
    
    // Action be performed when Default tip percentage slider is moved
    @IBAction func defTipSliderValueChanged(_ sender: Any) {
        
        UserDefaults.standard.set(Int(defaultTipSlider.value), forKey: "defTipPercent")
        defTipLabel.text = String(Int(defaultTipSlider.value)) + "%"
    }
    
    // Action be performed when Default split slider is moved
    @IBAction func defSplitSliderValueChanged(_ sender: Any) {
        
        UserDefaults.standard.set(Int(defaultSplitSlider.value), forKey: "defSplit")
        defSplitLabel.text = String(Int(defaultSplitSlider.value))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

