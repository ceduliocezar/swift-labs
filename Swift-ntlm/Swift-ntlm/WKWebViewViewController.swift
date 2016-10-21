//
//  WKWebViewViewController.swift
//  Swift-ntlm
//
//  Created by Cedulio Cezar on 14/10/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView =  WKWebView(frame: view.bounds)
        self.view = webView
        
        webView.navigationDelegate =  self
        webView.backgroundColor =  UIColor.red;
        
        
//                let baseUrl = "https://www.raywenderlich.com/110458/nsurlsession-tutorial-getting-started"
//                let baseUrl = "http://time.tecolote.com/"
        let baseUrl = "http://164.164.164.2/svnroot/teclogica/produtos/eletropaulo/inapp"
        let url = URL(string: baseUrl)!
        
        
        
        webView.load(URLRequest(url: url))
        
    }

}

extension WKWebViewViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        NSLog("didReceive challenge")
        if challenge.previousFailureCount < 2 {
            NSLog("use credential")
            let credential = URLCredential(user: "TECBMCCS", password: "password", persistence: URLCredential.Persistence.forSession)

            completionHandler(.useCredential,credential)
            
        }else{
            NSLog("performDefaultHandling = \(challenge.protectionSpace.authenticationMethod)")
            completionHandler(.rejectProtectionSpace, nil)
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        NSLog("didFail =\(error)")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        NSLog("didFailProvisionalNavigation=\(error)")
    }
}
