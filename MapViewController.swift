//
//  MapViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/03.
//

import UIKit
import NMapsMap
import Alamofire

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView: NMFMapView {
        return naverMapView.mapView
    }
    var permissionRegions: PermissionRegionList
    
    func permissionRegionAPICall(lat: Double, lng: Double, distance: Int){
        AF.request("http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/region/search/geo?lat=\(lat)&lon=\(lng)&distance=\(distance)", encoding: URLEncoding.default).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            guard let model = try? decoder.decode(PermissionRegionList.self, from: data) else { return }
            self?.permissionRegions = model
        }
}
    
    func multiMarker (){
    DispatchQueue.global(qos: .default).async {
        // 백그라운드 스레드
        var markers = [NMFMarker]()
        for index in 1...1000 {
            let marker = NMFMarker(position: ...)
            marker.iconImage = ...
            marker.captionText = ...
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
