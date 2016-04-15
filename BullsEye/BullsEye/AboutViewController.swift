//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Cedulio Cezar on 14/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlFile =  NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html"){
            if let htmlData = NSData(contentsOfFile: htmlFile){
                let baseURl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURl)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
