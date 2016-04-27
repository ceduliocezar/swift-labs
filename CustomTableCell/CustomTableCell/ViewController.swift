//
//  ViewController.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 25/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let empresas = ["Eletropaulo","Sul", "Tietê"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath)

        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = empresas[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return empresas.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    


}

