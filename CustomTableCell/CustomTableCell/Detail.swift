//
//  Detail.swift
//  CustomTableCell
//
//  Created by Cedulio Cezar on 26/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import UIKit

class Detail{
    
    var image: UIImage?
    
    init(name: String){
        self.image = UIImage(named: name)
    }
    
}