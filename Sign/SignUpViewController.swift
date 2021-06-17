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
    
    var userType: String = "USER"
    
    @IBAction private func touchUpSignUpButton(_ sender: UIButton) {
        
        if let nickName = nickNameTextField.text {
            userSignUpAPICall(nickName: nickName, role: self.userType)
        }
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if selectRoleSegmentedControl.selectedSegmentIndex == 0 {
            userType = "USER"
        }
        
        else {
            userType = "OWNER"
        }
        
    }
    let userDefaluts = UserDefaultsValue()
    let userInfo = UserInfo.shared
    
    private func userSignUpAPICall(nickName: String, role: String) {
        let urlNickName = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/user/nickname"
        let urlRole = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/user/role"

        print(nickName)
        print(role)
        
        let jwtHeader: HTTPHeaders = [
            "jwt": userDefaluts.getToken()
        ] 
        
        let userSignUpInfoNickName = [
            "nickName": nickName
        ] as Dictionary
        
        let userSignUpInfoRole = [
            "role": role
        ] as Dictionary
        
        
        AF.request(urlNickName, method: .put, parameters: userSignUpInfoNickName, encoding: JSONEncoding.default, headers: jwtHeader).responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
            }
        }
        AF.request(urlRole, method: .put,parameters: userSignUpInfoRole, encoding: JSONEncoding.default, headers: jwtHeader).responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
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
        selectRoleSegmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        
        
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
