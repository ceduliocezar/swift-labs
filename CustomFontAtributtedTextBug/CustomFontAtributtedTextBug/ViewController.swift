//
//  ViewController.swift
//  CustomFontAtributtedTextBug
//
//  Created by Cedulio Cezar on 26/07/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customFontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let plainText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        let myMutableString = NSMutableAttributedString(string: plainText, attributes: nil)
        
        myMutableString.addAttributes([NSFontAttributeName: UIFont(name: "SourceSansPro-Light", size: 20)!],
                                      range: NSRange(location: 15, length:42))
        
        myMutableString.addAttributes([NSFontAttributeName: UIFont(name: "SourceSansPro-Bold", size: 20)!],
                                      range: NSRange(location: 67, length:14))
        
        customFontLabel.attributedText = myMutableString
    }



}

