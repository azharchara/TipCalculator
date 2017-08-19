//
//  TipViewController.swift
//  Tip Calculator
//
//  Created by Azhar Chara on 07/08/17.
//  Copyright © 2017 Azhar Chara. All rights reserved.
//


import UIKit

// This extension is used to clear the last value of float (for ex:- 0.0 will be displayed as 0 only)
extension Float
{
    var cleanValue: String
    {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}


class TipViewController: UIViewController, UITextFieldDelegate{
    
    // view outlets/connections
    @IBOutlet var textfield: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipPercentSlider: UISlider!
    @IBOutlet var tipPerLabel: UILabel!
    @IBOutlet var splitSlider: UISlider!
    @IBOutlet var splitLabel: UILabel!
    @IBOutlet var splitTotalLab: UILabel!
    
    // variable for calulating total amount to be paid
    var total = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
        // This variable is used to create an instance of tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // initializing neccessary field with required values
        textfield.text = String(UserDefaults.standard.float(forKey: "textFieldValue").cleanValue)
        tipPercentSlider.value = Float(UserDefaults.standard.integer(forKey: "defTipPercent"))
        splitSlider.value = Float(UserDefaults.standard.integer(forKey: "defSplit"))
        tipPerLabel.text = String(Int(tipPercentSlider.value)) + "%"
        splitLabel.text = String(Int(splitSlider.value))
        
        // calulations be be taken after initialization
        self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textfield.text!)!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // initializing neccessary field with required values
        textfield.text = String(UserDefaults.standard.float(forKey: "textFieldValue").cleanValue)
        tipPercentSlider.value = Float(UserDefaults.standard.integer(forKey: "defTipPercent"))
        splitSlider.value = Float(UserDefaults.standard.integer(forKey: "defSplit"))
        tipPerLabel.text = String(Int(tipPercentSlider.value)) + "%"
        splitLabel.text = String(Int(splitSlider.value))
        
        // calulations be be taken after initialization
        self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textfield.text!)!)
        
    }
    
    // Action be performed when Tip percentage slider is moved
    @IBAction func tipPercentValueChanged(_ sender: Any) {
        tipPerLabel.text = String(Int(tipPercentSlider.value)) + "%"
        if textfield.text != "" {
            self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textfield.text!)!)
            
        }
        
    }
    
    // Action be performed when Split slider is moved
    @IBAction func splitSliderValueChanged(_ sender: Any) {
        
        splitLabel.text = String(Int(splitSlider.value))
        splitTotalLab.text = String((total / Float(Int(splitSlider.value))).cleanValue)
    }
    
    // Method which is called by instance of tap gesture
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Method which is called for performing neccessary calulations
    func calculations(tipSlider: Int,textField: Float){
        
        total = Float(textField + (((Float(tipSlider)) * textField) / 100))
        tipLabel.text = String((((Float(tipSlider)) * textField) / 100))
        totalLabel.text = String(total)
        splitTotalLab.text = String((total / Float(Int(splitSlider.value))).cleanValue)
        UserDefaults.standard.set(textField, forKey: "textFieldValue")
    }
    
    // Deleagate methods of textField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textField.text!)!)
        }
        else
        {
            textField.text = "0"
            self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textField.text!)!)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var  textFieldValue = textField.text!
        if string != "" {
            textFieldValue = textFieldValue.appending(string)
            
        }
        else
        {
            textFieldValue = String(textFieldValue.characters.dropLast())
        }
        
        if textFieldValue != "" {
            self.calculations(tipSlider: Int(tipPercentSlider.value), textField: Float(textFieldValue)!)
        }
        else
        {
            self.calculations(tipSlider: Int(tipPercentSlider.value), textField: 0.0)
        }
        
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}





