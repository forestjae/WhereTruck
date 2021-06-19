//
//  TruckConfigViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/13.
//

import UIKit
import Alamofire

class TruckConfigViewController: UIViewController {
    
    let truckNameField = UITextField().then {
        $0.placeholder = "트럭이름을 입력하세요"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let truckDescriptionField = UITextView().then {
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let truckNameTitleLabel = UILabel().then {
        $0.text = "트럭이름"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let truckDescriptionTitleLabel = UILabel().then {
        $0.text = "트럭설명"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let truckImageTitleLabel = UILabel().then {
        $0.text = "트럭대표사진"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let myTruckImage = UIImageView().then {
        $0.image = UIImage.init(named: "truck_example")
        
    }

    
    let initTruckButton = UIButton().then {
        $0.setTitle("트럭생성", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    let getAllTruckButton = UIButton().then {
        $0.setTitle("트럭조회", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    
    
    func bindConstraint() {
        
        self.truckNameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(20)
        }
        
        
        
        self.truckNameField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        
        self.truckDescriptionField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(truckNameField.snp.bottom).offset(10)
        }
        
        self.initTruckButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(truckDescriptionField.snp.bottom).offset(10)
        }
        
        self.getAllTruckButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(initTruckButton.snp.bottom).offset(10)
        }
    }
    
    
    var truckName: String = ""
    var truckDescription: String = ""
    
    let userDefaults: UserDefaultsValue = UserDefaultsValue()
    let userInfo = UserInfo.shared
    
    @objc func initTruck(){
        self.truckName = truckNameField.text!
        self.truckDescription = truckDescriptionField.text!
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck"
        let jwt = userDefaults.getToken()
        let headers: HTTPHeaders = [
            "jwt": jwt
          ]
        let truckInfo = [
            "name": self.truckName,
            "description": self.truckDescription
        ] as Dictionary
        print("jwt:\(jwt)")
        AF.request(url, method: .post, parameters: truckInfo, encoding: JSONEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
            }
    }
    }
    
    @objc func getAllTruck(){
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck/all"
        let jwt = userDefaults.getToken()
        let headers: HTTPHeaders = [
            "jwt": jwt
          ]
        print(jwt)
        
        AF.request(url, method: .get, headers: headers).responseJSON{ (response) in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
            }
    }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(truckNameTitleLabel)
        self.view.addSubview(truckNameField)
        self.view.addSubview(truckDescriptionTitleLabel)
        self.view.addSubview(truckDescriptionField)
        self.view.addSubview(truckImageTitleLabel)
        self.view.addSubview(myTruckImage)
        
        self.view.addSubview(getAllTruckButton)
        initTruckButton.addTarget(self, action: #selector(initTruck), for: .touchUpInside)
        getAllTruckButton.addTarget(self, action: #selector(getAllTruck), for: .touchUpInside)
        bindConstraint()
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


