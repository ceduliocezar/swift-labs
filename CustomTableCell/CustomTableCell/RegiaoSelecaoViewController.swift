//
//  RegiaoSelecaoViewController.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 27/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class RegiaoSelecaoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var regioes = [Regiao]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regioes.append(Regiao(name: "AES"))
        regioes.append(Regiao(name: "Metropolitana"))
        regioes.append(Regiao(name: "F.Norte"))
        regioes.append(Regiao(name: "F.Sul"))
        regioes.append(Regiao(name: "Central"))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regioes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RegiaoCell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = regioes[indexPath.row].name
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Select line\(indexPath.row)")
        navigationController!.popViewControllerAnimated(true)
    }
    
    
}
