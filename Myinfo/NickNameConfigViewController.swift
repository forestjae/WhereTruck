//
//  NickNameConfigViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/19.
//

import UIKit

class NickNameConfigViewController: UIViewController {
    
    let userInfo = UserInfo.shared
    
    let NickNameTextField = UITextField().then {
        $0.placeholder = "닉네임이 없습니다"
        $0.text = UserInfo.shared.nickName
        $0.textColor = .black
    }
    
    func bindConstraint() {
        
        NickNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
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
