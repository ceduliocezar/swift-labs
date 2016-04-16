//
//  ViewController.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 15/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemDelegate {
    
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items =  [ChecklistItem]()
        
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
        "ChecklistItem", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withCheckListItem: item)
        
        return cell
    }
    
    override func tableView(tableView: UITableView,
                            didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmarkForCell(cell, withCheckListItem: item)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        items.removeAtIndex(indexPath.row)
        
        let indexPaths =  [indexPath]
        
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    func configureCheckmarkForCell(cell: UITableViewCell, withCheckListItem item: ChecklistItem) {
        
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }

    
    func addItemViewControllerDidCancel(controller: AddItemViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controler: AddItemViewController, didFinishAddingItem item: ChecklistItem) {
        
        
        let newRowIndex = items.count
        
        items.append(item)
        
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        
        let indexPaths = [indexPath]
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controler: AddItemViewController, didFinishEditingItem item: ChecklistItem){
        
    
        if let index = items.indexOf(item){
            
            let indexPath =  NSIndexPath(forRow: index, inSection: 0)
            
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                configureTextForCell(cell, withChecklistItem: item)
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AddItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            
            let controller = navigationController.topViewController as! AddItemViewController
            
            controller.delegate =  self
        }else if segue.identifier == "EditItem"{
            
            let navigationController = segue.destinationViewController as! UINavigationController
            
            let controller = navigationController.topViewController as! AddItemViewController
            
            controller.delegate =  self
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                controller.itemToEdit =  items[indexPath.row]
            }
        }
    }
    
    
}
