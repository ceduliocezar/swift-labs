//
//  ViewController.swift
//  DisableConstraints
//
//  Created by Cedulio Cezar on 13/07/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    
    var heightConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topContainer.constraints.forEach({ contraint in
            
            
            if contraint.identifier == "altura"{
                
                heightConstraint  = contraint
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(sender: AnyObject) {
        
        if let heightConstraint =  heightConstraint{
            heightConstraint.active =  !heightConstraint.active
        }
        
        
//        if let heightConstraint =  heightConstraint{
//            
//            view.removeConstraint(heightConstraint)
//
//        }else{
//            heightConstraint = NSLayoutConstraint(item: topContainer, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 0)
//            view.addConstraint(heightConstraint!)
//        }
    }

}

