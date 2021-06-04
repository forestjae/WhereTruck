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
