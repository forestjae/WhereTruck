//
//  ViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/03.
//

import UIKit
import Lottie
import Then
import Alamofire



class LogoViewController: UIViewController {
 
    let userDefaults: UserDefaultsValue = UserDefaultsValue()
    
    let logoView = AnimationView(name:"43354-food-truck").then {
        $0.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .loop
        $0.play()
    }
    
    let logoTitle = UILabel().then {
        $0.text = "WhereTruck"
        $0.font = .systemFont(ofSize: 43, weight: .heavy)
        
        $0.textColor = UIColor(red: 83/255, green: 84/255, blue: 84/255, alpha: 1.0)
        $0.shadowColor = .systemGray5
        $0.shadowOffset = CGSize(width: 1, height: 2)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    static func checkToken(){
        
    }
    
    static func checkMembership(type: String, authToken: String){
            let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/login/\(type)"
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "PUT"
            
            let userSignUpInfo = [
                "authToken": authToken,
                ] as Dictionary
            
            do {
                try request.httpBody = JSONSerialization.data(withJSONObject: userSignUpInfo, options:[])
            } catch {
                print("http Body Error")
            }

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            AF.request(request).responseString{ (response) in
                switch response.result {
                case .success:
                    print(response.result)
                case .failure(let error):
                    print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
                }
            }

        
        
        
        
    }
    
    
    private func bindConstraints(){
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(100)
            make.width.height.equalTo(300)
        }
        
        logoTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoView.snp.bottom).offset(-50)
          
        }
    }
    
 


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(logoView)
        self.view.addSubview(logoTitle)
        bindConstraints()

        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

}

