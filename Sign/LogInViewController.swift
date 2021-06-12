//
//  LogInViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth
import Alamofire
import AuthenticationServices
import Lottie


class UserInfo {
    static let shared = UserInfo()
    
    var id: Int64 = 0
    var nickName: String = "정창걸"
    var role: String = "OWNER"
    var accessToken: String?
    
    private init() { }
}


class LogInViewController: UIViewController {
    
    
    let userDefaults: UserDefaultsValue = UserDefaultsValue()
    
    
    
    
    private var userModel: User?
    
//    @IBOutlet weak var appleLoginView: UIView!
    
    let appleLoginButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline).then {
        $0.cornerRadius = 5
    }
    
    let kakaoLoginButton = UIButton().then {
        $0.setImage(UIImage.init(named: "kakao_login_large_wide-1"), for: .normal )
        
    }
    
    let userinfo = UserInfo.shared
    
    let logoView = AnimationView(name:"43354-food-truck").then {
        $0.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .loop
    }
    
    let logoTitle = UILabel().then {
        $0.text = "WhereTruck"
        $0.font = .systemFont(ofSize: 43, weight: .heavy)
        
        $0.textColor = UIColor(red: 83/255, green: 84/255, blue: 84/255, alpha: 1.0)
        $0.shadowColor = .systemGray5
        $0.shadowOffset = CGSize(width: 1, height: 2)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func bindConstraints(){
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.width.height.equalTo(300)
        }
        
        logoTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoView.snp.bottom).offset(-50)
          
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoTitle.snp.bottom).offset(35)
            make.width.equalTo(260)
            make.height.equalTo(39)

        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(15)
            make.width.equalTo(260)
            make.height.equalTo(39)
        }
        
    }
    
    
    
    func kakaoLogin(){
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    if let token = oauthToken?.accessToken{
                        self.userinfo.accessToken = token
                        if let accessToken = self.userinfo.accessToken {
                            
                            print("accessToken : \(accessToken)")
                            self.userLoginAPICall(type: "kakao", authToken: accessToken)
                            self.userDefaults.setToken(token: accessToken)
                            
                        }
                    }
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
        
        UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
            if let error = error {
                print(error)
            }
            else {
                print("accessTokenInfo() success.")

                _ = accessTokenInfo
            }
        }
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                if let id = user?.id{
                    self.userinfo.id = id
                }

                _ = user
            }
        }
        



    }
    
    
    
    @objc func kakaoLoginButtonTouched(){
        kakaoLogin()

        
    }

    @objc func handleAppleSignInButton() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self as ASAuthorizationControllerDelegate
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.view.addSubview(logoView)
        self.view.addSubview(logoTitle)
        self.view.addSubview(appleLoginButton)
        self.view.addSubview(kakaoLoginButton)
        bindConstraints()
        logoView.play()
        logoView.loopMode = .loop
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTouched), for: .touchUpInside)
        appleLoginButton.addTarget(self, action: #selector(handleAppleSignInButton), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        logoView.play()
    }
    
    private func userLoginAPICall(type: String, authToken: String) {
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/login/\(type)"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"

//        let accessToken = String(userinfo.accessToken)

        
        let userSignUpInfo = [
            "authToken": authToken,
            "nickName": self.userinfo.nickName,
            "role": self.userinfo.role
        ] as Dictionary
        
        print("userSignUpInfo : \(userSignUpInfo)")
        
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
                print("1111111111")
                print(response.result)
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }

    }


}


extension LogInViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let user = credential.user
            print("User: \(user)")
            guard let identityToken = credential.identityToken else { return }
            guard let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }
            print("IdentityToken : \(identityTokenString)")
            self.userLoginAPICall(type: "apple", authToken: identityTokenString)
            self.userDefaults.setToken(token: identityTokenString)
            
        }
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Login Error Occur!")
    }

}
