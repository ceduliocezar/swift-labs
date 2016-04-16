//
//  ChecklistItem.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 16/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation

class ChecklistItem{
    
    var text = ""
    var checked =  false
    
    func toggleChecked(){
        self.checked =  !self.checked
    }
}
