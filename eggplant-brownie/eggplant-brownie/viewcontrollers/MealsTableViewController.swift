//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 08/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    
    var meals = [ Meal(name: "Eggplant brownie", happiness: 5), Meal(name: "Zucchini Muffin", happiness: 3)]

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func addMeal(meal : Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "addMeal"){
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.Began{
            
            let cell = recognizer.view as! UITableViewCell
            
            let indexPath = tableView.indexPathForCell(cell)
            
            if indexPath == nil{
                return
            }
            
            let row = indexPath?.row
            
            
            let meal =  meals[row!]
            
            let details = UIAlertController(title: meal.name, message: meal.showDetails(), preferredStyle: UIAlertControllerStyle.Alert)
            
            let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
            
            details.addAction(ok)
            
            presentViewController(details, animated: true, completion: nil)
        }
    }

}
