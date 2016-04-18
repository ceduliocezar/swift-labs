//
//  ListDetailViewControllerTableViewController.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 18/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

protocol ListDetailViewDelegate: class{
    func listDetailViewControllerDidCancel(controller: ListDetailViewController)
    
    func listDetailViewController(controler: ListDetailViewController, didFinishAddingChecklist checklist: Checklist)
    
    func listDetailViewController(controler: ListDetailViewController, didFinishEditingChecklist checklist: Checklist)
}


class ListDetailViewController: UITableViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewDelegate?
    
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let checklist = checklistToEdit{
            title = "Edit Checklist"
            textField.text =  checklist.name
            doneBarButton.enabled =  true
        }
    }
    
    
    @IBAction func cancel(){
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        print("Contents of the text field: \(textField.text!)")
        
        
        if let checklist = checklistToEdit{
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditingChecklist: checklist)
        }else{
            let checklist = Checklist(name: textField.text!)
            
            delegate?.listDetailViewController(self, didFinishAddingChecklist: checklist)
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
