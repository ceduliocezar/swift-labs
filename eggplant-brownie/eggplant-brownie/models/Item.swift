//
//  Item.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

class Item: Equatable{
    let name: String
    let calories: Double
    init(name: String, calories: Double){
        self.name = name
        self.calories = calories
    }
    
}

func ==(first: Item, second: Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}