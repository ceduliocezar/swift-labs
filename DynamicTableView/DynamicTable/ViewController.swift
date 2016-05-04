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
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    // fixo, porque sem constraints nao foi possível descobrir o tamanho da linha de uma maneira consistente
    let tableLineHeight = CGFloat(44)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        createFakeItems()
    }
    
    func createFakeItems(){
        for index in 0..<100 {
            if index % 2 == 1{
                items.append(createFakeImageItem(index))
            }else{
                items.append(createFakeTableItem(index))
            }
        }
    }
    
    func createFakeTableItem(row: Int) -> Item{
        let item = Item()
        item.name = "Name \(row)"
        item.lines = Array<Array<String>>()
        
        for _ in 0..<row{
            var line = Array<String>()
            
            item.columns = Array<String>()
            
            for columnIndex in 0..<numberOfColumns{
                line.append("AES \(columnIndex)")
                item.columns!.append("Cell \(columnIndex)")
            }
            
            item.lines!.append(line)
            
        }
        return item
        
    }
    
    func createFakeImageItem(row: Int) -> Item{
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
        let view = cell!.viewWithTag(2)!
        
        drawLine(view, line: item.lines![indexPath.row])
        
        return cell!
    }
    
    func createTableHeader(tableView: UITableView, indexPath: NSIndexPath, item: Item) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("headerCell")
        
        let headerView = cell!.viewWithTag(1)!
        
        removeAllSubViews(headerView)
        
        drawLine(headerView, line: item.columns!)
    
        return cell!
    }
    
    func createImageCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("imageCell")
        return cell!
    }
    
    
    func drawLine(myView: UIView, line: Array<String>){
        
        let labelWidth = calculateLabelWidth(numberOfColumns)
        
        for index in 0..<line.count {
            let label = createLabel(labelWidth, index: index, height: tableLineHeight)
            label.text = line[index]
            myView.addSubview(label)
        }
        
        myView.layoutIfNeeded()
    }
    
    func createLabel(labelWidth: CGFloat, index: Int, height: CGFloat) -> UILabel{
        
        let distanceFromX = calculateDistanceFromX(labelWidth, index: index)
        
        print("x=\(distanceFromX), labelWidth=\(labelWidth), totalHeight=\(height)")
        
        let rect = CGRect(x: distanceFromX, y: 0, width: labelWidth, height: height)
        
        let label = UILabel(frame: rect)
        label.textAlignment = .Center
        //label.backgroundColor = getRandomColor()
        
        return label
    }
    
    func calculateDistanceFromX(width: CGFloat, index: Int) -> CGFloat{
        return CGFloat(width * CGFloat(index))
    }
    
    func calculateLabelWidth(numberOfColumns: Int) -> CGFloat{
        return tableView.bounds.size.width / CGFloat(numberOfColumns)
    }
    
    func removeAllSubViews(view: UIView){
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func getRandomColor() -> UIColor {
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
       
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }

}

