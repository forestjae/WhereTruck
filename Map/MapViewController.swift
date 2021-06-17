//
//  MapViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/03.
//

import UIKit
import NMapsMap
import Alamofire
import Then
import SnapKit
import DropDown

class MapViewController: UIViewController {
    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView: NMFMapView {
        return naverMapView.mapView
    }
    
    let userDefaults = UserDefaultsValue()
    let userInfo = UserInfo.shared
    
    
    let addressTextField = UITextField()
    let locationManager = CLLocationManager()
    var geoCodeToUse: (lat: Double, lng: Double) = (0.0,0.0)
    
    func getCurrentLocation(){
        geoCodeToUse.lat = naverMapView.mapView.cameraPosition.target.lat
        geoCodeToUse.lng = naverMapView.mapView.cameraPosition.target.lng
    }
    
 
    
    let addressPresentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowOpacity = 0.1
        

    }
    
    
    
    let willSetTruckButton = UIButton().then {
        $0.setTitle("푸드트럭 위치 선택하기🚚", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.setTitleColor(.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
        $0.backgroundColor = UIColor(red: 255, green: 92, blue: 67, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowOpacity = 0.08
 
    }
    
    let searchWithCurrentMap = UIButton().then {
        $0.setTitle("현재 지도에서 푸드트럭 재탐색", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.setTitleColor(.white, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowOpacity = 0.04
 
    }
    let dropDown = DropDown()

    
    
    let selectSearchRangeButton = UIButton().then {
        $0.setTitle("반경:5Km", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.setTitleColor(.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowOpacity = 0.20
    }
    

    
    let addressButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        $0.setImage(UIImage(systemName: "chevron.down") , for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    let truckPin = UIButton().then {
        $0.setImage(UIImage(systemName: "bus.doubledecker.fill") , for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    
    func setupView() {
        self.view.addSubview(addressPresentView)
        self.view.addSubview(addressButton)
        self.view.addSubview(willSetTruckButton)
        self.view.addSubview(searchWithCurrentMap)
        self.view.addSubview(selectSearchRangeButton)
        naverMapView.showZoomControls = false
        naverMapView.showLocationButton = true
        
        
        
    }
    
    func bindConstraints() {
        self.mapView.snp.makeConstraints{ (make) in
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.top.equalToSuperview().offset(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
        }
        
        self.addressPresentView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(56)
        }
        
        self.addressButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.addressPresentView)
        }
        
        self.willSetTruckButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-5)
            
        }
        
        self.searchWithCurrentMap.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(addressButton).offset(50)
        }
        
        self.selectSearchRangeButton.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.top.equalTo(addressButton).offset(50)
        }
        
        
        
    }
    
    
    enum MarkerPresentMode {
        case appear
        case disappear
    }
    
    enum SetTruckMarkerMode {
        case normal
        case set
    }
    
//    let userDefaults: UserDefaultsValue
    //MARK:- Present Region Marker
    
    var permissionRegions: [PermissionRegion] = []
    
    func permissionRegionAllAPICall(){
        let jwt = userDefaults.getToken()
        
        let headers: HTTPHeaders = [
            "jwt": jwt
          ]
        AF.request("http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/region/all", encoding: URLEncoding.default, headers: headers).responseJSON { [weak self] response in
  
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
 
            guard let model = try? decoder.decode(PermissionRegionList.self, from: data) else { return }
            print("aaaaaaaaaaaaa")
            self?.permissionRegions = model.docs
            
            
        }
}
    
    func permissionRegionAPICall(lat: Double, lng: Double, distance: Int){
        AF.request("http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/region/search/geo?lat=\(lat)&lon=\(lng)&distance=\(distance)", encoding: URLEncoding.default).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            guard let model = try? decoder.decode(PermissionRegionList.self, from: data) else { return }
            self?.permissionRegions = model.docs
        }
}
    
    var permissionRegionMarkerPresentMode: MarkerPresentMode = .disappear {
        didSet {
            switch permissionRegionMarkerPresentMode {
            case .appear:
                permissionRegionMarkerDraw()
            case .disappear:
                permissionRegionMarkerDelete()
            }
        }
    }
    
    func permissionRegionMarkerDraw(){
        
        print(11111)

        DispatchQueue.global(qos: .default).async {
            // 백그라운드 스레드
            var markers = [NMFMarker]()
            for permissionRegion in self.permissionRegions {
                let marker = NMFMarker(position: NMGLatLng(lat: permissionRegion.geoLocation.lat, lng: permissionRegion.geoLocation.lng))
                marker.iconImage = NMF_MARKER_IMAGE_BLUE
                marker.captionText = permissionRegion.regionName
                markers.append(marker)
            }
            
            DispatchQueue.main.async { [weak self] in
                // 메인 스레드
                for marker in markers {
                    marker.mapView = self?.mapView
                }
            }
        }
    }
    
    func permissionRegionMarkerDelete(){
        
        
    }
 
    //MARK:- Present Truck Marker
    
    func truckLocationAPICall(lat: Double, lng: Double, distance: Int){
        AF.request("http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/truck/search/geo?lat=\(lat)&lon=\(lng)&distance=\(distance)", encoding: URLEncoding.default).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            guard let model = try? decoder.decode(PermissionRegionList.self, from: data) else { return }
            self?.permissionRegions = model.docs
        }
}
    
    //MARK:- Get Address from Naver ReverseGeocode
    var address: String = "주소" {
        didSet{
            setAddressOnButton()
        }
    }
    
    func getAddressFromGeocode(lat: Double, lng: Double){
        let urlString = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
        let headers: HTTPHeaders = [
            "X-NCP-APIGW-API-KEY-ID": "s9c4ui3bbc",
            "X-NCP-APIGW-API-KEY": "H0oIq8gCLkOMD6XQ4sPg3Uh5XDosZK0YGUf7smE8"
          ]
        let parameters: [String: Any] = [
          "request": "coordsToaddr",
          "coords": "\(lng),\(lat)",
          "orders": "legalcode,admcode,addr,roadaddr",
          "output": "json"
        ]
        AF.request(urlString, method: .get, parameters: parameters, headers: headers).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            guard let model = try? decoder.decode(MapResponse.self, from: data) else { return }
            let address = model.getAddress()
            self?.address = address
            
            
        }
        
    
    }
    

    
    
    func setAddressOnButton(){
        addressButton.setTitle("\(address)", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.naverMapView.mapView.addCameraDelegate(delegate: self)

        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        setupView()
        bindConstraints()
        
        getCurrentLocation()
//        permissionRegionAPICall(lat: <#T##Double#>, lng: <#T##Double#>, distance: 300)
        permissionRegionAllAPICall()
        permissionRegionMarkerDraw()
        print("GEOCODE\(geoCodeToUse)")
        getAddressFromGeocode(lat: geoCodeToUse.lat, lng: geoCodeToUse.lng)
        
        setAddressOnButton()
        self.selectSearchRangeButton.addTarget(self, action: #selector(onTabButton), for: .touchUpInside)
        
        
        
        dropDown.dataSource = ["5Km", "10Km", "20Km"]
        
        print("id: \(userInfo.id) / nickName:\(userInfo.nickName) / role:\(userInfo.role)")
        
        // Do any additional setup after loading the view.
    }
    
    @objc func onTabButton() {
        dropDown.show()
        dropDown.anchorView = selectSearchRangeButton
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.textFont = UIFont.systemFont(ofSize: 14)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MapViewController: CLLocationManagerDelegate {
    
   // 위치권한 변경되었을때 처리 필요
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
            camera.animation = .easeIn
            
            self.mapView.moveCamera(camera)
     

        }
        locationManager.stopUpdatingLocation()
    }
    
    // 위치 에러 표시 필요
    
}

extension MapViewController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        
    }
}

extension MapViewController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        if reason == NMFMapChangedByGesture || reason == NMFMapChangedByControl {
            let mapLocation = CLLocation(
                latitude: naverMapView.mapView.cameraPosition.target.lat,
                longitude: naverMapView.mapView.cameraPosition.target.lng
            )
            getAddressFromGeocode(lat: mapLocation.coordinate.latitude, lng: mapLocation.coordinate.longitude)
            setAddressOnButton()
        }
    }
}
