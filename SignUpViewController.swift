//
//  SignUpViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var selectRoleSegmentedControl: UISegmentedControl!
    
    let userinfo = UserInfo.shared
    var nickName: String
    
    private func userSignUpAPICall() {
        
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/user/save"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let id = String(userinfo.id)
        
        let userSignUpInfo = [
            "id": id,
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
