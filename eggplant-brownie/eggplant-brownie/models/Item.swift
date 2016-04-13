//
//  Item.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding{
    
    let name: String
    let calories: Double
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.calories = aDecoder.decodeDoubleForKey("calories")
    }
    
    init(name: String, calories: Double){
        self.name = name
        self.calories = calories
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeDouble(self.calories, forKey: "calories")
    }
    
    
    
}

func ==(first: Item, second: Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}

