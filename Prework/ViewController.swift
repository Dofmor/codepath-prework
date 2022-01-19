//
//  ViewController.swift
//  Prework
//
//  Created by Daniel Morales on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitSlide: UISlider!
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let split = Int(splitSlide.value)
        
        //Get Total tip by multiplying tip *tipPercentage
        let tipPercentage = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / Double(split)
        
        //Update tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total amount
        totalLabel.text =  String(format: "$%.2f", total)
        
        
    }

    //Optional Work
    
    //function that calculates tip and total
    func calculate() {
        let bill = Double(billAmountTextField.text!) ?? 0
        let split = Int(splitSlide.value)
        
        //Get Total tip by multiplying tip *tipPercentage
        let tipPercentage = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / Double(split)
        
        //Update tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //Update total amount
        totalLabel.text =  String(format: "$%.2f", total)
        //Update split label
    }
    
    //calculates tip and changes Slide Label whenever value changes
    @IBAction func displaySplit(_ sender: Any) {
        let split = Int(splitSlide.value)
        calculate()
        splitTotal.text = String(format: "%d", split)
        
    }
    
    //calculates tip whenever Bill Amount Text Field changes
    @IBAction func changedBillAmount(_ sender: Any) {
        calculate()
    }
    @IBAction func darkMode(_ sender: Any) {
        if (darkModeSwitch.isOn) {
            overrideUserInterfaceStyle = .dark
        }
        else {
            overrideUserInterfaceStyle = .light
        }
    }
    @IBAction func tapAmount(_ sender: Any) {
        billAmountTextField.becomeFirstResponder()
    }
}

