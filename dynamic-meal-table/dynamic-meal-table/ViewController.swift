//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by Cedulio Cezar on 08/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let meals = ["eggplant brownie", "zucchini muffin"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        
        var cell =  UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = meal
        
        return cell
        
    }

}

