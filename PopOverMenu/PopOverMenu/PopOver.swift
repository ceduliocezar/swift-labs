//
//  PopOver.swift
//  PopOverMenu
//
//  Created by Cedulio Cezar on 01/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class PopOver: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CellTableViewCell
        
        if indexPath.row % 2 == 0{
            cell.label.text = "Histórico"
        }else{
            cell.label.text = "Tópicos"
        }
        
        
        return cell
        
    }

}
