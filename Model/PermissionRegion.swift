//
//  Region.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import Foundation

struct PermissionRegionList: Codable {
    let docs: [PermissionRegion]
}

struct PermissionRegion: Codable {
    let regionName: String?
    let regionType: Int?
    let city: String?
    let town: String?
    let roadAddress: String?
    let postAddress: String?
    let geoLocation: Geocode?
    let capacity: Int?
    let cost: String?
    let permissionStartDate: String?
    let permissionEndDate: String?
    let closedDays: String?
    let weekdayStartTime: String?
    let weekdayEndTime: String?
    let weekendStartTime: String?
    let weekendEndTime: String?
    let restrictedItems: String?
    let agencyName: String?
    let agencyTel: String?
    
    
}
    

struct Geocode: Codable{
    let lat: Double?
    let lon: Double?
//    enum CodingKeys : String, CodingKey {
//        case lat
//        case lng = "lon"
//    }
}

struct FestivalRegion: Codable {
    let name: String
    let place: String
    let startDate: Date
    let endDate: Date
    let event: String
    let manageAgency: String
    let hostAgency: String
    let sponsors: [String]
    let tel: String
    let hompage: String
    let information: String
    let roadAddress: String
    let postAddress: String
    let lat: Float
    let lon: Float
}



