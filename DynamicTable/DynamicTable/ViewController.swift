//
//  ViewController.swift
//  DynamicTable
//
//  Created by Cedulio Cezar on 29/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let numberOfColumns = 6

    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        createFakeItems()
    }
    
    func createFakeItems(){
        for index in 0..<100 {
            if index % 2 == 1{
                items.append(createImageItem(index))
            }else{
                items.append(createTableItem(index))
            }
        }
    }
    
    func createTableItem(row: Int) -> Item{
        let item = Item()
        item.name = "Name \(row)"
        item.lines = Array<Array<String>>()
        
        for _ in 0..<row{
            var line = Array<String>()
            
            item.columns = Array<String>()
            
            for columnIndex in 0..<numberOfColumns{
                line.append("Cell \(columnIndex)")
                item.columns!.append("Cell \(columnIndex)")
            }
            
            item.lines!.append(line)
            
        }
        return item
        
    }
    
    func createImageItem(row: Int) -> Item{
        let item =  Item()
        item.name = "Name \(row)"
        item.imageURL = "\(row)"
        
        return item
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let rows = items[section].lines{
            return rows.count
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = items[indexPath.section]
        
        if hasImageURL(item) {
            return createImageCell(tableView, indexPath: indexPath)
        }else{
            return createTableCell(tableView, indexPath: indexPath, item: item)
        }
    }
    
    func createTableCell(tableView: UITableView, indexPath: NSIndexPath, item: Item) -> UITableViewCell{
        
        if isHeaderCell(indexPath) {
            return createTableHeader(tableView, indexPath: indexPath, item: item)
        }else{
            return createTableLine(tableView, indexPath: indexPath, item: item)
        }
    }
    
    func hasImageURL(item: Item) -> Bool{
        return (item.imageURL) != nil
    }
    
    func isHeaderCell(indexPath: NSIndexPath) -> Bool{
        return indexPath.row == 0
    }
    
    
    func createTableLine(tableView: UITableView, indexPath: NSIndexPath, item: Item) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let stackHorizontal = cell!.viewWithTag(2) as! UIStackView
        stackHorizontal.subviews.forEach({ $0.removeFromSuperview() })
        
        
        for column in 0..<item.lines![indexPath.row].count{
            let label = UILabel()
            
            if column == 0 {
                label.textAlignment = .Left
                label.text = "\(item.lines![indexPath.row][column])\(indexPath.section)"
                
            }else{
                label.textAlignment = .Center
                label.text = "\(indexPath.section)\(indexPath.row)"
            }
            
            stackHorizontal.addArrangedSubview(label)
        }
        
        return cell!
    }
    
    func createTableHeader(tableView: UITableView, indexPath: NSIndexPath, item: Item) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("headerCell")
        
        let stackHorizontal = cell?.viewWithTag(1) as! UIStackView
        stackHorizontal.subviews.forEach({ $0.removeFromSuperview() })
        for index in 0..<item.columns!.count{
            let label = UILabel()
            label.font = UIFont.boldSystemFontOfSize(18.0)
            if index == 0 {
                label.textAlignment = .Left
            }else{
                label.textAlignment = .Center
            }
            
            label.text = item.columns![index]
            
            stackHorizontal.addArrangedSubview(label)
        }
        return cell!
    }
    
    func createImageCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("imageCell")
        return cell!
    }

}

