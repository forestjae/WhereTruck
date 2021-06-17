//
//  User.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct UserInfomation: Decodable {
    let jwt: String
    let user: User

}

struct User: Decodable {
    let id: String
    let nickName: String?
    let role: String?
}







