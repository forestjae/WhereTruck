//
//  MyTruckInfoViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/13.
//

import UIKit
import Kingfisher

class MyTruckViewController: UIViewController {

    
    let truckInfo = TruckInfo.shared
    
    let truckClass = TruckService()
    
    let userDefaults = UserDefaultsValue()

    let myTruckContainer = UIView().then {
        $0.backgroundColor = UIColor(red: 243/255, green: 246/255, blue: 227/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
    }

    let myTruckNameTitleLabel = UILabel().then {
        $0.text = ";"
        $0.textColor = .systemBlue
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
    }
    
    let myTruckNameContentsLabel = UILabel().then {
        $0.text = "창걸네삼겹살"
        $0.textColor = .systemBlue
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
    }
    
    let myTruckImage = UIImageView().then {
        $0.image = UIImage.init(named: "truck_example")
        $0.backgroundColor = .systemBlue
    }

    
    let myTruckDescriptionLabel = UILabel().then {
        $0.text = "개맛있는 집입니다111;"
        $0.textColor = .systemBlue
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
    }
    
    let myTruckStatusLabel = UILabel().then {
        $0.text = "현재 운영 중"
        $0.textColor = .systemBlue
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
    }
    
    func bindConstraint(){
        
        myTruckContainer.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(120)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)

        }
        
        myTruckNameTitleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(myTruckContainer.snp.top).offset(10)
            make.left.equalTo(myTruckContainer.snp.left).offset(10)


        }
        


        myTruckImage.snp.makeConstraints{ (make) in
            make.top.equalTo(myTruckContainer.snp.top).offset(10)
            make.left.equalTo(myTruckContainer.snp.left).offset(10)

            make.width.height.equalTo(100)

        }
        
        myTruckDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(myTruckNameContentsLabel.snp.bottom).offset(10)
            make.left.equalTo(myTruckImage.snp.right).offset(10)
            
        }
        
        myTruckNameContentsLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(myTruckContainer.snp.top).offset(0)
            make.left.equalTo(myTruckImage.snp.right).offset(10)
            
            
        }
        myTruckNameContentsLabel.text = truckInfo.name
        myTruckDescriptionLabel.text = truckInfo.description
        
        
        

        myTruckStatusLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(myTruckDescriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(myTruckImage.snp.right).offset(10)
        }




    }
    
    lazy var editBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(didEditButtonTouched(_:)))
        return barButtonItem
    }()

    @objc func didEditButtonTouched(_ sender: UIBarButtonItem) {
        
        guard let TruckConfigViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TruckConfigViewController") as? TruckConfigViewController else { return }
        navigationController?.pushViewController(TruckConfigViewController, animated: true)
        
    }

    func navigationButtonSetup(){
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    func setUpView(){
        
 
        
        DispatchQueue.main.async {
            
            let url = URL(string: self.truckInfo.imageUrl)
            guard let url = url else { return }
            self.myTruckImage.kf.setImage(with: url)
            
            
            self.view.addSubview(self.myTruckContainer)
            self.view.addSubview(self.myTruckNameContentsLabel)
            self.view.addSubview(self.myTruckNameTitleLabel)
            self.view.addSubview(self.myTruckDescriptionLabel)
            self.view.addSubview(self.myTruckStatusLabel)
            self.view.addSubview(self.myTruckImage)
            
            self.bindConstraint()
      
        }
                

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("111111:\(self.truckInfo.name)")
        navigationButtonSetup()
        setUpView()
        
        

    
        
        
        
        
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
