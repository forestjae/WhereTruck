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


class UserInfo {
    static let shared = UserInfo()
    
    var id: Int64 = 0
    var nickName: String?
    var role: Int?
    
    private init() { }
}


class LogInViewController: UIViewController {
    
    private var userModel: User?
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    @IBAction func kakaoLoginButtonTouched(_sender: Any){
        kakaoLogin()
    }
    @IBAction func testSigunUpButtonTouched(_sender: Any){
        userSignUpAPICall()
    }
    
    let userinfo = UserInfo.shared
    
    func kakaoLogin(){
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
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
    
    private func userSignUpAPICall() {
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/user/save"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let userSignUpInfo = [
            "id": "I01hnnL9Nks",
            "nickName": "yain"
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
//
//    private func userListAPICall(_ url: String) {
//
//        let userIdString: String = String(userinfo.id)
//
//        var url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/user/get/id?id=\(userIdString)"
//        print(url)
//        AF.request(url).responseJSON { [weak self] response in
//            guard let data = response.data else { return }
//            let decoder = JSONDecoder()
//            guard let model = try? decoder.decode(User.self, from: data) else { return }
//            self?.userinfo.nickName = model.nickName
//
//        }
//    }
    
    func checkMebership(){
        
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
