//
//  ViewController.swift
//  TipCalculator
//
//  Created by Cedulio Cezar on 13/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tipCalc =  TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!

    
    
    @IBAction func calculateTapped(sender : AnyObject) {

        
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        // 2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        resultsTextView.text = results
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
        
        
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    func refreshUI(){
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        refreshUI()
    }


}

