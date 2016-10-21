//
//  ViewController.swift
//  ProgramaticallyConstraints
//
//  Created by Cedulio Cezar on 16/09/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onClick(sender: AnyObject){
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor =  UIColor(red:0.02, green:0.20, blue:0.28, alpha:1.0)
        self.view.addSubview(containerView)
        
        var constraints = [NSLayoutConstraint]()
    
        let constraintTop = NSLayoutConstraint(item: containerView,
                                           attribute: NSLayoutAttribute.Top,
                                           relatedBy: NSLayoutRelation.Equal,
                                           toItem: self.view,
                                           attribute: NSLayoutAttribute.Top,
                                           multiplier: 1.0,
                                           constant: 20)
        
        constraints.append(constraintTop)
        
        let constraintBottom = NSLayoutConstraint(item: containerView,
                                              attribute: NSLayoutAttribute.Bottom,
                                              relatedBy: NSLayoutRelation.Equal,
                                              toItem: self.view,
                                              attribute: NSLayoutAttribute.Bottom,
                                              multiplier: 1.0,
                                              constant: 0)
        constraints.append(constraintBottom)
        
        let constraintLeft = NSLayoutConstraint(item: containerView,
                                            attribute: NSLayoutAttribute.Leading,
                                            relatedBy: NSLayoutRelation.Equal,
                                            toItem: self.view,
                                            attribute: NSLayoutAttribute.Leading,
                                            multiplier: 1.0,
                                            constant: 0)
        constraints.append(constraintLeft)

        
        let constraintRight = NSLayoutConstraint(item: containerView,
                                             attribute: NSLayoutAttribute.Trailing,
                                             relatedBy: NSLayoutRelation.Equal,
                                             toItem: self.view,
                                             attribute: NSLayoutAttribute.Trailing,
                                             multiplier: 1.0,
                                             constant: 0)
        constraints.append(constraintRight)
        
         NSLayoutConstraint.activateConstraints(constraints)
        
        
        
        
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints =  false
        
        containerView.addSubview(indicator)
        let centerX = NSLayoutConstraint(item: indicator,
                                         attribute: NSLayoutAttribute.CenterX,
                                         relatedBy: NSLayoutRelation.Equal,
                                         toItem: containerView,
                                         attribute: NSLayoutAttribute.CenterX,
                                         multiplier: 1,
                                         constant: 0)

        let centerY = NSLayoutConstraint(item: indicator,
                                         attribute: NSLayoutAttribute.CenterY,
                                         relatedBy: NSLayoutRelation.Equal,
                                         toItem: containerView,
                                         attribute: NSLayoutAttribute.CenterY,
                                         multiplier: 1,
                                         constant: 0)
        
        NSLayoutConstraint.activateConstraints([centerX, centerY])
    }

}

