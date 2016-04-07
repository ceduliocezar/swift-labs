//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var hapinessField : UITextField!
    
    @IBAction func add(){
        
        
        let name : String = nameField.text!
        let hapiness : String = hapinessField.text!
        
        print("eaten: \(name) \(hapiness)!")
        
        
    }

}

