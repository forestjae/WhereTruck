//
//  Truck.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct truck: Codable {
    let id: String
    let name: String
    let geoLocation: Geocode
    let description: String
    let opened: Bool
    let userId: String
    
}

    
