//
//  DetailViewController.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 25/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Detail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(Detail(name: "mapa"))
        items.append(Detail(name: "clientes"))
        items.append(Detail(name: "dec"))
        items.append(Detail(name: "fie"))
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        let imageView = tableView.viewWithTag(1001) as! UIImageView
        imageView.image = items[indexPath.row].image
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "zoom" {
            let imageDetailController = segue.destinationViewController as! ImageDetailViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                imageDetailController.detail =  items[indexPath.row]
            }
            
        }
    }

    
}
