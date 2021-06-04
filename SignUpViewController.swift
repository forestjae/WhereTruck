//
//  SignUpViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/04.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var selectRoleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        userinfo.nickName = nickNameTextField.text
        if let nickName = userinfo.nickName {
        userSignUpAPICall(nickName: nickName)
        }
    }
    
    let userinfo = UserInfo.shared
    
    private func userSignUpAPICall(nickName: String) {
        
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/user/save"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let id = String(userinfo.id)
        
        let userSignUpInfo = [
            "id": id,
            "nickName": nickName
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        enableButtonWhenAllFactorCompleted()
    }
    
    private func enableButtonWhenAllFactorCompleted() {
        //segmented control 조건 필요
        if nickNameTextField.hasText == true {
            signUpButton.isUserInteractionEnabled = true
            signUpButton.setTitleColor(.blue, for: .normal)
        } else {
            signUpButton.isUserInteractionEnabled = false
            signUpButton.setTitleColor(.gray, for: .normal)
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickNameTextField.delegate = self
        signUpButton.isUserInteractionEnabled = false
        signUpButton.setTitleColor(.gray, for: .normal)
        
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
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
