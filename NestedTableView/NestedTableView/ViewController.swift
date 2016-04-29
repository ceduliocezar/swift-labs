//
//  ViewController.swift
//  NestedTableView
//
//  Created by Cedulio Cezar on 29/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //tableView.estimatedRowHeight = 100
        //tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.tableView == tableView{
            return 100
        }else{
            return 5
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if self.tableView == tableView{
            if indexPath.row % 2 == 0{
                let cell =  tableView.dequeueReusableCellWithIdentifier("cell1") as UITableViewCell!
                
                return cell
            }else{
                let cell =  tableView.dequeueReusableCellWithIdentifier("cell2") as! NestedTableCell
                
//                cell.tableView.estimatedRowHeight = 44.0
//                cell.tableView.rowHeight = UITableViewAutomaticDimension
                
                return cell
            }
        }else{
            
            let cell =  tableView.dequeueReusableCellWithIdentifier("cell3") as UITableViewCell!
            
            return cell
            
        }
    }


}

