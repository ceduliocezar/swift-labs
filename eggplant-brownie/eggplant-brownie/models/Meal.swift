//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

class Meal{
    
    let name : String
    let happiness : Int
    var items = Array<Item>()
    
    init(name:String , happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        
        return total
    }
    
}