//
//  MyMembershipViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/19.
//

import UIKit

class MyMembershipViewController: UIViewController {
    
    lazy var editBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(didEditButtonTouched(_:)))
        return barButtonItem
    }()

    @objc func didEditButtonTouched(_ sender: UIBarButtonItem) {
        
    }

    func navigationButtonSetup(){
        navigationItem.rightBarButtonItem = editBarButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationButtonSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "내 정보"
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
