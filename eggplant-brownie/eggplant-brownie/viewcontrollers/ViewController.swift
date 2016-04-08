//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 07/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

protocol AddMealDelegate{
    func addMeal(meal : Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var hapinessField : UITextField!
    
    
    var delegate : AddMealDelegate?
    
    var items = [ Item(name: "Eggplant Brownie", calories: 10),
                  Item(name: "Zucchini Muffin", calories: 10),
                  Item(name: "Cookie", calories: 10),
                  Item(name: "Coconut oil", calories: 500),
                  Item(name: "Chocolate frosting", calories: 1000),
                  Item(name: "Chocolate chip", calories: 1000)]
    
    var selected = Array<Item>()
    
    @IBAction func add(){
        
        if(nameField == nil || hapinessField == nil){
            return
        }
        
        
        let name = nameField!.text
        let hapiness = Int(hapinessField!.text!)
        
        if hapiness == nil{
            return
        }
        
        let meal = Meal(name: name! ,  happiness: hapiness!)
        meal.items =  selected
        
        
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        
        delegate!.addMeal(meal)
        
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
        
        
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items [ row ]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text =  item.name
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell ==  nil {
            return
        }
        
        if(cell!.accessoryType == UITableViewCellAccessoryType.None){
            cell?.accessoryType =  UITableViewCellAccessoryType.Checkmark
            
            selected.append(items [ indexPath.row] )
        } else {
            cell?.accessoryType =  UITableViewCellAccessoryType.None
            
            if let position =  find(selected ,  toFind: items [indexPath.row]){
                items.removeAtIndex(position)
            }
            
        }
    }
    
    
    func find(elements: Array<Item>, toFind: Item) -> Int? {
        let max = elements.count - 1
        for i in 0...max{
            if (toFind == elements[i]){
                return i
            }
        }
        
        return nil
    }
    
    

}

