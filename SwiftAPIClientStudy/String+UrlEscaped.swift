//
//  String+UrlEscaped.swift
//  SwiftAPIClientStudy
//
//  Created by 高井　翔太 on 2018/01/20.
//  Copyright © 2018年 takaishota. All rights reserved.
//

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
