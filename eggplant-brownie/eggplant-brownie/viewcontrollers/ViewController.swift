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
        
        if(nameField == nil || hapinessField == nil){
            return
        }
        
        
        let name = nameField!.text
        let hapiness = Int(hapinessField!.text!)
        
        if hapiness == nil{
            return
        }
        
        let meal = Meal(name: name! ,  hapiness: hapiness!)
        
        
        print("eaten: \(meal.name) \(meal.hapiness)!")
        
        
    }

}

