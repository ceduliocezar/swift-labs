//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 08/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    var meals = [ Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        
        var cell =  UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = meal.name
        
        return cell
    }
    

}
