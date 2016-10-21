//
//  ViewController.swift
//  Swift-ntlm
//
//  Created by Cedulio Cezar on 14/10/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    var conn: NSURLConnection!
    
    var request: URLRequest!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let baseUrl = "http://time.tecolote.com/"
        let baseUrl = "http://164.164.164.2/svnroot/teclogica/produtos/eletropaulo/inapp"
        let url = URL(string: baseUrl)!
        
        request =  URLRequest(url: url)
        
        conn = NSURLConnection(request: request as URLRequest, delegate: self, startImmediately: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        self.webView.loadRequest(request) 
    }
}


extension ViewController: NSURLConnectionDelegate{
    
//    func connection(_ connection: NSURLConnection, willSendRequestFor challenge: URLAuthenticationChallenge) {
//        
////        if challenge.protectionSpace.host == "miketokyo.com" {
//        
//        if(!jatentou){
//            let user = "user"
//            let password = "pass"
//            let credential = URLCredential(user: user, password: password, persistence: URLCredential.Persistence.forSession)
//            challenge.sender!.use(credential, for: challenge)
//            
//            jatentou = true
//            
//        }else{
//            challenge.sender!.cancel(challenge)
//        }
//        
//        
////        }
//    }
    
    func connection(_ connection: NSURLConnection, willSendRequestFor challenge: URLAuthenticationChallenge) {
        if challenge.previousFailureCount > 2 {
            NSLog("Muitas tentativas, desistindo de logar.")
            challenge.sender!.cancel(challenge)
        } else {
            let creds = URLCredential(user: "TECBMCCS", password: "misedote", persistence: URLCredential.Persistence.forSession)
            challenge.sender!.use(creds, for: challenge)
            
        }
    }
    
    
//    func connection(_ connection: NSURLConnection, didReceive challenge: URLAuthenticationChallenge) {
//        
//        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodNTLM {
//            /*    This is very, very important to check.  Depending on how your security policies are setup, you could lock your user out of his or her account by trying to use the wrong credentials too many times in a row.    */
//            if challenge.previousFailureCount > 2 {
//                challenge.sender!.cancel(challenge)
//               
//                NSLog("Muitas falhasm desistindo de logar")
//            
//            }else {
//                
//                let credential = URLCredential(user: "user", password: "password", persistence: URLCredential.Persistence.forSession)
//                
//                challenge.sender!.use(credential, for: challenge)
//            }
//        }else{
//            challenge.sender!.cancel(challenge)
//        }
//    }
    
}





