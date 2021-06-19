//
//  MyTruckInfoViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/13.
//

import UIKit

class MyTruckViewController: UIViewController {
    
    let myTruckContainer = UIView().then {
        $0.backgroundColor = UIColor(red: 243/255, green: 246/255, blue: 227/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
    }
    
    let myTruckLabel = UILabel().then {
        $0.text = "내 트럭"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let myTruckNameTitleLabel = UILabel().then {
        $0.text = "트럭이름 :"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let myTruckNameContentsLabel = UILabel().then {
        $0.text = "창걸이네 삼겹살"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    let myTruckImage = UIImageView().then {
        $0.image = UIImage.init(named: "truck_example")
        
    }
    
    let myMenuTitleLabel = UILabel().then {
        $0.text = "나의 트럭"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
    }
    
    
    func bindConstraint(){
        myTruckLabel.snp.makeConstraints{ make in
            
        }
    }
    
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
        navigationItem.title = "내 트럭"
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
