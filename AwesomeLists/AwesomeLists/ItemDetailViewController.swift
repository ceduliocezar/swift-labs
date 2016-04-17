//
//  ItemDetailViewController.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 16/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewDelegate: class{
    func addItemViewControllerDidCancel(controller: ItemDetailViewController)
    
    func itemDetailViewController(controler: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    
    func itemDetailViewController(controler: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}


class ItemDetailViewController: UITableViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ItemDetailViewDelegate?
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text =  item.text
            doneBarButton.enabled =  true
        }
    }
    
    
    @IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        print("Contents of the text field: \(textField.text!)")
        
        
        if let item = itemToEdit{
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditingItem: item)
        }else{
            let item = ChecklistItem()
            item.text = textField.text!
            
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
        
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        
        doneBarButton.enabled =  (newText.length > 0)
        
        
        return true
    }

    
}
