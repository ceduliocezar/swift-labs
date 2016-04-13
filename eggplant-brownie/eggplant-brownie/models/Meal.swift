//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//
import Foundation

class Meal : NSObject, NSCoding{
    
    let name : String
    let happiness : Int
    var items = Array<Item>()
    
    init(name:String , happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.items = aDecoder.decodeObjectForKey("items") as! Array<Item>
        
    }
    
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        
        return total
    }
    
    func showDetails()-> String{
        var message = "Happiness: \(self.happiness)"
        
        for item in self.items {
            message += "\n *\(item.name) - calories: \(item.calories)"
        }
        
        return message
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInt(Int32(self.happiness), forKey: "happiness")
        aCoder.encodeObject(self.items, forKey: "items")
    }
    
}