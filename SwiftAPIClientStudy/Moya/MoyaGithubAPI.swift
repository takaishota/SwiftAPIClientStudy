//
//  MoyaGithubAPI.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/09.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import Foundation
import Moya

enum MoyaGithubAPI {
    case showUser(String)
    case showRepositories(String)
}

extension MoyaGithubAPI: TargetType {
    var baseURL: URL { return URL(string: "https://api.github.com")! }

    var path: String {
        switch self {
        case .showUser(let name):
            return "/users/\(name.urlEscaped)"

        case .showRepositories(let userName):
            return "/users/\(userName.urlEscaped)/repos"
        }
    }

    var method: Moya.Method {
        switch self {
        case .showUser, .showRepositories:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .showUser(let name):
            return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!

        case .showRepositories(_):
            return "[{\"name\": \"RepoName\"}]".data(using: String.Encoding.utf8)!
        }
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }
}
