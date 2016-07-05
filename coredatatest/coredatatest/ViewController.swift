//
//  ViewController.swift
//  coredatatest
//
//  Created by Cedulio Cezar on 17/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource  {
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var logTableView = UITableView(frame: CGRectZero, style: .Plain)
    
    var logItems = [LogItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        var viewFrame = self.view.frame
        

        viewFrame.origin.y += 20
        

        viewFrame.size.height -= 20
        

        logTableView.frame = viewFrame
        

        self.view.addSubview(logTableView)
        
        logTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "LogCell")
        
        logTableView.dataSource = self
        
        
        fetchLog()
        
        
        let addButton = UIButton(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 44, UIScreen.mainScreen().bounds.size.width, 44))
        addButton.setTitle("+", forState: .Normal)
        addButton.backgroundColor = UIColor(red: 0.5, green: 0.9, blue: 0.5, alpha: 1.0)
        addButton.addTarget(self, action: #selector(ViewController.addNewItem), forControlEvents: .TouchUpInside)
        self.view.addSubview(addButton)
        
        viewFrame.size.height -= (20 + addButton.frame.size.height)
    }
    
    let addItemAlertViewTag = 0
    let addItemTextAlertViewTag = 1
    func addNewItem() {
        
        let titlePrompt = UIAlertController(title: "Enter Title",
                                            message: "Enter Text",
                                            preferredStyle: .Alert)
        
        var titleTextField: UITextField?
        titlePrompt.addTextFieldWithConfigurationHandler {
            (textField) -> Void in
            titleTextField = textField
            textField.placeholder = "Title"
        }
        
        titlePrompt.addAction(UIAlertAction(title: "Ok",
            style: .Default,
            handler: { (action) -> Void in
                if let textField = titleTextField {
                    print(textField.text)
                    self.saveNewItem(textField.text!)
                }
        }))
        
        self.presentViewController(titlePrompt,
                                   animated: true,
                                   completion: nil)
    }
    
    func save() {
        do{
            try managedObjectContext.save()
        }catch let error{
            print(error)
        }
    }
    
    func saveNewItem(title : String) {
        
        let newLogItem = LogItem.createInManagedObjectContext(self.managedObjectContext, title: title, text: "")
        
        
        self.fetchLog()
        

        
        
        if let newItemIndex = logItems.indexOf(newLogItem) {
            
            let newLogItemIndexPath = NSIndexPath(forRow: newItemIndex, inSection: 0)
            
            logTableView.insertRowsAtIndexPaths([ newLogItemIndexPath ], withRowAnimation: .Automatic)
            save()
        }
    }
    
    func fetchLog() {
        do{
            
            let fetchRequest = NSFetchRequest(entityName: "LogItem")
            
            let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
            
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [LogItem] {
                logItems = fetchResults
            }
        }catch let error{
            print(error)
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete ) {
            
            let logItemToDelete = logItems[indexPath.row]
            
            
            managedObjectContext.deleteObject(logItemToDelete)
            
            
            self.fetchLog()
            
            
            logTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            save()
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LogCell")!
        
        let logItem = logItems[indexPath.row]
        
        
        cell.textLabel?.text = logItem.title
        return cell
    }
    
    
}

