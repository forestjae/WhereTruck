//
//  User.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct UserInfomation: Decodable {
    let user: User
    let jwt: String
}

struct User: Decodable {
    let id: String
    let nickName: String
    let role: String
    let favorites: [Favorite]
}

struct Favorite: Decodable {
    let favorite: String
}






