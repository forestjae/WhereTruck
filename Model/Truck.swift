//
//  Truck.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct TruckList: Codable {
    let docs: [Truck]
}

struct Truck: Codable {
    let id: String
    let name: String
    let geoLocation: Geocode
    let description: String
    let opened: Bool
    let userId: String
    let numRating: Int
    let starAvg: Int
    let imageUrl: String?
//    let foods: [String]
//    let ratings: [String]
    
    
}

class TruckInfo {
    static let shared: TruckInfo = TruckInfo()
    
    var id: String = ""
    var name: String = ""
    var geoLocation: Geocode = Geocode(lat: 0.0, lng: 0.0)
    var description: String = ""
    var opened: Bool = false
    var userId: String = ""
    var numRating: Int = -1
    var starAvg: Int = -1
    var imageUrl: String = ""
    var foods: [String] = []
    var ratings: [String] = []
    
    private init() { }
}

    
