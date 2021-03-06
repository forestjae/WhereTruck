//
//  ReverseGeocode.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/05.
//

import Foundation

struct ReverseGeoLocation: Codable {
  let name: String
  let region: Region
  let land: Land?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case region = "region"
    case land = "land"
  }
  
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    region = try values.decodeIfPresent(Region.self, forKey: .region) ?? Region()
    land = try values.decodeIfPresent(Land.self, forKey: .land)
  }
}
