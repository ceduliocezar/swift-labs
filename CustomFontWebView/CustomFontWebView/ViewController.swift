//
//  ViewController.swift
//  CustomFontWebView
//
//  Created by Cedulio Cezar on 15/09/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = NSBundle.mainBundle().pathForResource("page", ofType:"html") {
            let fm = NSFileManager()
            let exists = fm.fileExistsAtPath(path)
            if(exists){
                let c = fm.contentsAtPath(path)
                let cString = NSString(data: c!, encoding: NSUTF8StringEncoding)
                
                webView.loadHTMLString(cString as! String, baseURL: nil)
                
            }
        }else{
            NSLog("Nao encontrou termo")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

