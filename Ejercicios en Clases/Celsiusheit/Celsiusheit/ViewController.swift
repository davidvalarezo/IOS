//
//  ViewController.swift
//  Celsiusheit
//
//  Created by cmulab on 4/11/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let FC = 1.8

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var degreesInputField: UITextField!
    
    
    @IBOutlet weak var scaleSwitch: UISwitch!
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        var degreeString : String
        let degrees = NSString(string: degreesInputField.text!).doubleValue
        
            if scaleSwitch.isOn {
            degreeString = String(format: "%.2f",fahrenheit(degrees: degrees))
                self.resultLabel.text = degreeString+" ºF"                
            }
            else{
                degreeString = String(format: "%.2f",celsius(degrees: degrees))
                self.resultLabel.text = degreeString+" ºC"
            }
        degreesInputField.resignFirstResponder()
        
    }
    
   
    @IBAction func conversorTextChange(_ sender: Any) {
        var degreeString : String
        let degrees = NSString(string: degreesInputField.text!).doubleValue
        
        if scaleSwitch.isOn {
            degreeString = String(format: "%.2f",fahrenheit(degrees: degrees))
            self.resultLabel.text = degreeString+" ºF"
        }
        else{
            degreeString = String(format: "%.2f",celsius(degrees: degrees))
            self.resultLabel.text = degreeString+" ºC"
        }
    }
    


    func fahrenheit (degrees: Double) -> Double
    {
        return (FC * degrees+32)
    }
    
    func celsius (degrees: Double) -> Double {
        return  ((degrees-32)/FC)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        degreesInputField.resignFirstResponder()
        
    }
    
}

