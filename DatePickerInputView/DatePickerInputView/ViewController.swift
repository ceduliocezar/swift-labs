//
//  ViewController.swift
//  DatePickerInputView
//
//  Created by Cedulio Cezar on 22/07/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var picker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.datePickerMode = .Date
        picker.addTarget(self, action: #selector(ViewController.changed(_:)), forControlEvents: .ValueChanged)
    }
    
    func changed(sender: UIDatePicker){
        let formatter =  NSDateFormatter()
        formatter.dateStyle = .LongStyle
        textField.text =  formatter.stringFromDate(sender.date)
        
    }


}

