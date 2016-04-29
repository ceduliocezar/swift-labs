//
//  NestedUITableView.swift
//  NestedTableView
//
//  Created by Cedulio Cezar on 29/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

protocol UINestedTableViewDelegate{
    
}

class NestedTableCell: UITableViewCell, UITableViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell3")
        
        return cell!
        
    }
    

}