//
//  LoginViewController.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/04/17.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import Foundation
import SafariServices

class LoginViewController: UIViewController {
    static private let clientId = Secrets.GitHub.clientId
    private let loginURL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&scope=user+repo+notifications")!
    private let callbackURLScheme = "test-app"
    private var authSession: SFAuthenticationSession?
    
    @IBOutlet weak var logInButton: UIButton!
    
    
    @IBAction func onLogInButton(_ sender: Any) {
        authSession = SFAuthenticationSession(url: loginURL, callbackURLScheme: callbackURLScheme, completionHandler: { callbackURL, error in
            guard error == nil, let callbackURL = callbackURL else {
                return
            }
            print(callbackURL)
            // didReceiveRedirect
        })
        authSession?.start()
    }
}

