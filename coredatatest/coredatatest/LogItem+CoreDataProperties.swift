//
//  LogItem+CoreDataProperties.swift
//  coredatatest
//
//  Created by Cedulio Cezar on 17/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LogItem {

    @NSManaged var title: String?
    @NSManaged var itemText: String?

}
