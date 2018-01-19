//
//  MoyaViewController.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/02.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import UIKit
import Moya

class MoyaViewController: UIViewController {
    let provider = MoyaProvider<GithubAPI>()
    let userName = "takaishota"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        fetchRepositories()
    }

    func fetchUser() {
        provider.request(.showUser(userName)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(User.self, from: response.data)
                    print("[Moya] data: \(data)")
                    print("[Moya] status code: \(response.statusCode)")
                } catch {
                    print("[Moya] decode is failed")
                    print(error.localizedDescription)
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchRepositories() {
        provider.request(.showRepositories(userName)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode([Repository].self, from: response.data)
                    print("[Moya] data: \(data)")
                    print("[Moya] status code: \(response.statusCode)")
                } catch {
                    print("[Moya] decode is failed")
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}

