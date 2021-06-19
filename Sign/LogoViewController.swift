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
    
    let userInfo = UserInfo.shared
 
    let userDefaults: UserDefaultsValue = UserDefaultsValue()
    
    let logoView = AnimationView(name:"43354-food-truck").then {
        $0.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        $0.contentMode = .scaleAspectFit
//        $0.loopMode = .loop
//        $0.play()
    }
    
    let logoTitle = UILabel().then {
        $0.text = "WhereTruck"
        $0.font = .systemFont(ofSize: 43, weight: .heavy)
        
        $0.textColor = UIColor(red: 83/255, green: 84/255, blue: 84/255, alpha: 1.0)
        $0.shadowColor = .systemGray5
        $0.shadowOffset = CGSize(width: 1, height: 2)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func checkMembership(type: String, authToken: String){
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/user/me"
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = "GET"

        let userSignUpInfo: HTTPHeaders = [
            "jwt": authToken
        ]
        
//        do {
//            try request.httpBody = JSONSerialization.data(withJSONObject: userSignUpInfo, options:[])
//        } catch {
//            print("http Body Error")
//        }
//
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: userSignUpInfo).responseJSON{ [weak self] (response) in
            
            switch response.result {
            case .success:
                if let status = response.response?.statusCode{
                    switch status {
                    case 200:
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        guard let model = try? decoder.decode(User.self, from: data) else { return }
                        self?.userInfo.id = model.id
                        self?.userInfo.nickName = model.nickName ?? ""
                        self?.userInfo.role = model.role ?? ""
                        if self?.userInfo.nickName != "" {
                            self?.goToMain()
                        }
                        else {
                            self?.goToSign()
                        }
                    case 400:
                        print("400 ERROR!")
                    case 500:
                        print("500 ERROR!")
                        self?.goToLogin()
                        
                    default:
                        break
                    }
                }
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
    
    func checkJWT(){
        let token = userDefaults.getToken()
        if token == "" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
            vc?.modalPresentationStyle = .fullScreen
            vc?.modalTransitionStyle = .crossDissolve
            self.present(vc!, animated: true, completion: nil)
        }
        
        else {
            let type = userDefaults.getUserType()
            print(type)
            print(token)
            checkMembership(type: type, authToken: token)
        }
    }

    func goToLogin(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    func goToMain(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "main")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
    func goToSign(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "sign")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        print(userDefaults.getToken())

        super.viewDidLoad()
        self.view.addSubview(logoView)
        self.view.addSubview(logoTitle)
        bindConstraints()
        self.logoView.play { [weak self] (isfinsih) in
            if isfinsih{
                UIView.animate(withDuration: 0.5, animations: { [weak self] in
                    self?.logoView.alpha = 0
                    self?.logoTitle.alpha = 0
                }) { _ in
                    self?.checkJWT()

                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

}

