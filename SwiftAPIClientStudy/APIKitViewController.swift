//
//  APIKitViewController.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/20.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import UIKit
import APIKit

class APIKitViewController: UIViewController {
    let userName = "takaishota"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        fetchRepositories()
    }

    private func fetchUser() {
        let request = APIKitGithubAPI.ShowUserRequest(name: userName)

        Session.send(request) { result in
            switch result {
            case .success(let user):
                print("[APIKit] data: \(user)")

            case .failure(let error):
                print("[APIKit] error: \(error)")
            }
        }
    }
    private func fetchRepositories() {
        let request = APIKitGithubAPI.ShowRepositoriesRequest(userName: userName)
        Session.send(request) { result in
            switch result {
            case .success(let user):
                print("[APIKit] data: \(user)")

            case .failure(let error):
                print("[APIKit] error: \(error)")
            }
        }
    }
}
