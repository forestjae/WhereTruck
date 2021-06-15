//
//  UserInfo.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/15.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    var id: String = ""
    var nickName: String = ""
    var role: String = ""
    var accessToken: String?
    
    private init() { }
}
