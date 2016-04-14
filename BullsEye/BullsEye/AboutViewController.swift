//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Cedulio Cezar on 14/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
