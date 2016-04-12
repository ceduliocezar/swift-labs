//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Cedulio Cezar on 12/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit
import Foundation

protocol AddAnItemDelegate{
    func addNew(item: Item)
}

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    
    let delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate){
        self.delegate =  delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.delegate =  nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewItem(){
        
        if(nameField == nil || caloriesField ==  nil){
            return
        }
        
        let name = nameField!.text
        let calories = NSString(string: caloriesField!.text!).doubleValue
        
        let item = Item(name: name!, calories: calories)
        
        if delegate ==  nil{
            return
        }
        
        delegate!.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}
