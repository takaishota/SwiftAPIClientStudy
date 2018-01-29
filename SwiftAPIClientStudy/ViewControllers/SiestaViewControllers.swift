//
//  SiestaViewControllers.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/20.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import UIKit
import Siesta

class SiestaViewControllers: UIViewController {
    let userName = "takaishota"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        fetchRepositories()
    }

    func fetchUser() {
        SiestaGithubAPI.showUser(name: userName)
            .load()
            .onSuccess { data in
                print("[Siesta] data: \(data.content)")
                print("[Siesta] status: \(String(describing: data.headers["status"]))")

            }.onFailure { error in
                print("[Siesta] request is failed")
                print("[Siesta] data: \(error)")
        }
    }
    
    func fetchRepositories() {
        SiestaGithubAPI.showRepositories(userName: userName)
            .load()
            .onSuccess { data in
                print("[Siesta] data: \(data.content)")
                print("[Siesta] status: \(String(describing: data.headers["status"]))")

            }.onFailure { error in
                print("[Siesta] request is failed")
                print("[Siesta] data: \(error)")
        }
    }
}
