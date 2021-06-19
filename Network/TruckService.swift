//
//  TruckService.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/19.
//

import Foundation
import Alamofire

//protocol TruckServiceProtocol {
    
//    func getMyTruckFromAPI(authToken: String) -> Truck
//
//}

//class TruckInfo {
//    static let shared: TruckInfo = TruckInfo()
//
//    var id: String = ""
//    var name: String = ""
//    var geoLocation: Geocode
//    var description: String = ""
//    var opened: Bool = false
//    var userId: String = ""
//    var numRating: Int = 0
//    var starAvg: Int = 0
//    var imageUrl: String = ""
//    var foods: [String] = []
//    var ratings: [String] = []
//
//    private init() { }
//}


class TruckService {
    
    
    
    func getMyTruckFromAPI(authToken: String){
        var truck: Truck = Truck(id: "", name: "", geoLocation: Geocode(lat: 0.0, lng: 0.0), description: "", opened: false, userId: "", numRating: 0, starAvg: 0, imageUrl: "")
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck/my"
        let userSignUpInfo: HTTPHeaders = [
            "jwt": authToken
        ]
        
        let truckInfo = TruckInfo.shared
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: userSignUpInfo).responseJSON{ (response) in
            switch response.result {
            case .success:
                print(response.result)
                if let status = response.response?.statusCode{
                    switch status {
                    case 200:
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        guard let model = try? decoder.decode(TruckList.self, from: data) else { return }
                        truck = model.docs[0]
                        
                        
                        
                        DispatchQueue.main.async {
                            
                            truckInfo.id = truck.id
                            truckInfo.name = truck.name
                            truckInfo.description = truck.description
                            truckInfo.geoLocation = truck.geoLocation
                            truckInfo.opened = truck.opened
                            truckInfo.userId = truck.userId
                            truckInfo.numRating = truck.numRating
                            truckInfo.starAvg = truck.starAvg
                            guard let url = truck.imageUrl else { return }
                            truckInfo.imageUrl = url
                            
                        }
                   
                        
                        
                    case 400:
                        print("400 ERROR!")
                    case 500:
                        print("500 ERROR!")
                        
                    default:
                        break
                    }
                }
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }

    }
    
 
}
