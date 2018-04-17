//
//  Secrets.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/02/06.
//  Copyright © 2018年 takaishota. All rights reserved.
//

import Foundation

enum Secrets {
    enum GitHub {
        static let clientId = Secrets.environmentVariable(named: "GITHUB_CLIENT_ID") ?? ""
        static let clientSecret = Secrets.environmentVariable(named: "GITHUB_CLIENT_SECRET") ?? ""
    }

    fileprivate static func environmentVariable(named: String) -> String? {

        let processInfo = ProcessInfo.processInfo

        guard let value = processInfo.environment[named] else {
            print("‼️ Missing Environment Variable: '\(named)'")
            return nil
        }

        return value

    }
}
