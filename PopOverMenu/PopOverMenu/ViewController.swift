//
//  ViewController.swift
//  PopOverMenu
//
//  Created by Cedulio Cezar on 01/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(sender: AnyObject) {
        let popoverContent = (self.storyboard?.instantiateViewControllerWithIdentifier("menu"))! as UIViewController
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSizeMake(100,200)
        popover!.delegate = self
        popover!.sourceView = self.view
//        popover!.sourceRect = CGRectMake(100,100,0,0)
        
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "popover"{
            var popOver = segue.destinationViewController as! PopOver
            popOver.popoverPresentationController!.delegate = self
        }
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
//    func adaptivePresentationStyleForPresentationController(
//        controller: UIPresentationController!) -> UIModalPresentationStyle {
//        return .None
//    }

}

