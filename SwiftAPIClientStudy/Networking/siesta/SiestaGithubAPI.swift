//
//  SiestaGithubAPI.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/20.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import Foundation
import Siesta

let SiestaGithubAPI = _SiestaGithubAPI()

class _SiestaGithubAPI {
    private let service = Service(baseURL: "https://api.github.com",
                                  standardTransformers: [.text, .image])

    fileprivate init() {
        let decoder = JSONDecoder()

        service.configureTransformer("/users/*") {
            try decoder.decode(User.self, from: $0.content)
        }
        service.configureTransformer("/users/*/repos") {
            try decoder.decode([Repository].self, from: $0.content)
        }
    }
    

    func showUser(name: String) -> Resource {
        return service.resource("/users").child(name)
    }

    func showRepositories(userName: String) -> Resource {
        return service.resource("/users").child(userName).child("/repos")
    }
    
}
