//
//  LogItem.swift
//  coredatatest
//
//  Created by Cedulio Cezar on 17/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import CoreData


class LogItem: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, title: String, text: String) -> LogItem {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: moc) as! LogItem
        newItem.title = title
        newItem.itemText = text
        
        return newItem
    }

}
