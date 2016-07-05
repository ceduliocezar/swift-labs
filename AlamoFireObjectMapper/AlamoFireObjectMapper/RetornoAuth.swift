//
//  RetornoAuth.swift
//  AlamoFireObjectMapper
//
//  Created by Cedulio Cezar on 16/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import ObjectMapper

public class RetornoAuth: Mappable{
    
    public var token:String = ""
    public var primeiroAcesso:Bool = false
    
    public init(){
        
    }
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        token <- map["token"]
        primeiroAcesso <- map["primeiroAcesso"]
        
    }
}