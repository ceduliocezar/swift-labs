//
//  DataSelectionViewController.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 26/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit

class PeriodoSelecaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = "Data 0\(indexPath.row+1)/04/2016"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Select line\(indexPath.row)")
        navigationController!.popViewControllerAnimated(true)
    }


}
