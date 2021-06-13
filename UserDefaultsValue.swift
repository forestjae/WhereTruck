import Foundation
import CoreLocation

struct UserDefaultsValue {
    
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_USER_ID = "KEY_USER_ID"
    static let KEY_USER_TYPE = "KEY_USER_TYPE"
    static let KEY_CURRENT_LAT = "KEY_CURRENT_LAT"
    static let KEY_CURRENT_LNG = "KEY_CURRENT_LNG"
    
    
    let userInformation: UserDefaults
    
    init(name: String? = nil) {
        if let name = name {
            UserDefaults().removePersistentDomain(forName: name)
            userInformation = UserDefaults(suiteName: name)!
        } else {
            userInformation = UserDefaults.standard
        }
    }
    
    func setToken(token: String) {
        self.userInformation.set(token, forKey:UserDefaultsValue.KEY_TOKEN)
    }
    
    func getToken() -> String {
        return self.userInformation.string(forKey: UserDefaultsValue.KEY_TOKEN) ?? ""
    }
    
    func setUserId(id: String) {
        self.userInformation.set(id, forKey: UserDefaultsValue.KEY_USER_ID)
    }
    
    func getUserId() -> String {
        self.userInformation.string(forKey: UserDefaultsValue.KEY_USER_ID) ?? ""
    }
    
    func setUserType(Type: String) {
        self.userInformation.set(Type, forKey: UserDefaultsValue.KEY_USER_TYPE)
    }
    
    func getUserType() -> String {
        return self.userInformation.string(forKey: UserDefaultsValue.KEY_USER_TYPE) ?? ""
    }
    
    func setUserCurrentLocation(location: CLLocation) {
      self.userInformation.set(
        location.coordinate.latitude,
        forKey: UserDefaultsValue.KEY_CURRENT_LAT
      )
      self.userInformation.set(
        location.coordinate.longitude,
        forKey: UserDefaultsValue.KEY_CURRENT_LNG
      )
    }
    
    func getUserCurrentLocation() -> CLLocation {
      let latitude = self.userInformation.double(forKey: UserDefaultsValue.KEY_CURRENT_LAT)
      let longitude = self.userInformation.double(forKey: UserDefaultsValue.KEY_CURRENT_LNG)
      
      return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func clear() {
      self.userInformation.removeObject(forKey: UserDefaultsValue.KEY_USER_ID)
      self.userInformation.removeObject(forKey: UserDefaultsValue.KEY_TOKEN)
    }
    
    static func setToken(token: String?) {
        UserDefaults.standard.set(token, forKey: UserDefaultsValue.KEY_TOKEN)
    }
    
    static func getToken() -> String? {
        UserDefaults.standard.string(forKey: UserDefaultsValue.KEY_TOKEN)
    }
    
    static func clear() {
        setToken(token: nil)
    }
    
    
}
