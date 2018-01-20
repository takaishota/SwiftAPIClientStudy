//
//  APIKitGithubAPI.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/20.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import Foundation
import APIKit

final class APIKitGithubAPI {
    struct ShowUserRequest: GitHubRequest {
        typealias Response = User
        let userName: String

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/users/\(userName.urlEscaped)"
        }

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> User {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }

            do {
                return try JSONDecoder().decode(User.self, from: data)
            } catch {
                print("[APIKit] decode is failed")
                throw error
            }
        }

        init(name: String) {
            userName = name
        }
    }

    struct ShowRepositoriesRequest: GitHubRequest {
        typealias Response = [Repository]
        let userName: String

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/users/\(userName.urlEscaped)/repos"
        }

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Repository] {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }

            do {
                return try JSONDecoder().decode([Repository].self, from: data)
            } catch {
                print("[APIKit] decode is failed")
                throw error
            }
        }

        init(userName: String) {
            self.userName = userName
        }
    }
}

protocol GitHubRequest: Request {}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var dataParser: DataParser {
        return JSONDataParser()
    }

    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        print("[APIKit] status code: \(urlResponse.statusCode)")
        return object
    }
}

// MARK: Support Codable
class JSONDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}
