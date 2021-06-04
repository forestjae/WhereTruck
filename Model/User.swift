//
//  User.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct User: Decodable {
    let id: String
    let email: String?
    let name: String?
    let nickName:String
}
