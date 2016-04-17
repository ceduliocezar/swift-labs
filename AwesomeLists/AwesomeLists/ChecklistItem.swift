//
//  ChecklistItem.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 16/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject, NSCoding{
    
    var text = ""
    var checked =  false
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    func toggleChecked(){
        self.checked =  !self.checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
}
