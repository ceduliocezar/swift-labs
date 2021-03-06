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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var hapinessField : UITextField!
    @IBOutlet var tableView: UITableView?
    
    
    var delegate : AddMealDelegate?
    
    var items = Array<Item>()
    
    var selected = Array<Item>()
    
    @IBAction func add(){
        
        if let meal = getMealFromForm(){
            
            meal.items =  selected
            
            if let meals = delegate{
                meals.addMeal(meal)
                
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Unexpected error, but the meal was added.")
                }
                return
            }
        }
        
        Alert(controller: self).show()
        
    }
    
    func getMealFromForm() -> Meal?{
        if(nameField == nil || hapinessField == nil){
            return nil
        }
        
        
        let name = nameField!.text
        let hapiness = Int(hapinessField!.text!)
        
        if hapiness == nil{
            return nil
        }
        
        let meal = Meal(name: name! ,  happiness: hapiness!)
        
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        
        return meal
        
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
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
                                            style: UIBarButtonItemStyle.Plain,
                                            target: self,
                                            action: Selector("showNewItem"))
        
        navigationItem.rightBarButtonItem =  newItemButton
        
        self.items = Dao().loadItems()
        
    }
    
    func getUserDir() -> String{
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        return userDir[0] as String
    }
    
    @IBAction func showNewItem(){
        let newItemController = NewItemViewController(delegate: self)
        
        if let navigation =  navigationController{
            navigation.pushViewController(newItemController, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }
    
    func addNew(item: Item){
        self.items.append(item)
        
        Dao().saveItems(self.items)
        
        if let table =  tableView{
            table.reloadData()
        }else{
            Alert(controller: self).show("Unexpected error, but the item was added")
        }
    }
}