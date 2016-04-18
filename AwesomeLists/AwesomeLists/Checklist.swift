//
//  Checklist.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 17/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    
    var name = ""
    var items = [ChecklistItem]()
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items =  aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        super.init()
    }
    
    init(name : String){
        self.name =  name
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
    }
    
    

}
