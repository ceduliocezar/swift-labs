//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 13/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit


class Alert{
    let controller:UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(message: String = "Unexpected error."){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alert.addAction(cancel)
        
        controller.presentViewController(alert, animated: true, completion: nil)
    }
    
}