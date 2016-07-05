//
//  Comunicacao.swift
//  AlamoFireObjectMapper
//
//  Created by Cedulio Cezar on 16/06/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation
import AlamofireObjectMapper

public class Comunicacao{
    
    public func getVencimentoAtual() ->Int {
        return 0
    }
    
    public func getVencimentosPossiveis() -> [Int]{
        return [Int]()
    }
    
    public func atualizarVencimento(){
        
    }
    
    
    func autenticar(credentials: Credentials) {
        
        let array = Mapper().toJSON(credentials)
        
//        Alamofire.request(.POST, "http://192.168.9.151:8080/lojaapp-api/rest/api/auth",
//            parameters: array, encoding: .JSON).responseJSON { response in
//                
//                print("REQUEST \(response.request)")
//                print("RESPONSE \(response.response)")
//                print("DATA = \(response.data)")
//                print("result=\(response.result)")
//                
//                if let JSON = response.result.value {
//                    print("JSON RETORNO: \(JSON)")
//                    
//                }
//        }
        
        Alamofire.request(.GET,"Asasdas")
            .responseArray { (response: Response<[RetornoAuth], NSError>) in
                switch response.result {
                case .Success:
                    let books = response.result.value
                    if let books = books {
                        let realm = try! Realm()
                        try! realm.write {
                            for book in books {
                                realm.add(book,update: true)
                            }
                        }
                    }
                case .Failure(let error):
                    //TODO: Handle error
                }
        }
    }
}