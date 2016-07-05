//
//  Credentials.swift
//  AlamoFireObjectMapper
//
//  Created by Cedulio Cezar on 16/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import ObjectMapper

public class Credentials: Mappable{
    
    public var nuc:Int = 0
    public var digitoVerificador:Int = 0
    public var documento:Int = 0
    public var idDispositivo:String = ""
    
    public init(){
        
    }
    
    required public init?(_ map: Map) {
        
    }
    
    
    public func mapping(map: Map) {
        nuc <- map["nuc"]
        digitoVerificador <- map["digitoVerificador"]
        documento <- map["documento"]
        idDispositivo <- map["idDispositivo"]
    }
    
}