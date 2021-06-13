//
//  MyInfoViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    let userinfo = UserInfo.shared
    let userDefaults = UserDefaultsValue()
    
    
    let nickNameButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
        $0.setTitle("이승재님, 안녕하세요", for: .normal)
    }
    
    let configButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape") , for: .normal)
        $0.tintColor = .systemBlue
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("", for: .normal)
        
    }
    
    let nickNameContainer = UIView().then {
        $0.backgroundColor = UIColor(red: 243/255, green: 246/255, blue: 227/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
        //        $0.layer.shadowColor = UIColor.black.cgColor
        //        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        //        $0.layer.shadowOpacity = 0.1
    }
    
    let truckContainer = UIView().then {
        $0.backgroundColor = UIColor(red: 200/255, green: 215/255, blue: 217/255, alpha: 1.0)
        $0.layer.cornerRadius = 3
        //        $0.layer.shadowColor = UIColor.black.cgColor
        //        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        //        $0.layer.shadowOpacity = 0.1
    }
    
    let truckLabel = UILabel().then {
        $0.text = "나의 트럭"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let truckConfigButton = UIButton().then {
        $0.setTitle("관리하기", for: .normal)
        $0.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        
    }
    
    let truckNameLabel = UILabel().then {
        $0.text = "창걸이네 삼겹살"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let truckImage = UIImageView().then {
        $0.image = UIImage.init(named: "truck_example")
        
    }
    
    let truckStatusLabel = UILabel().then {
        $0.text = "현재 운영 중"
        $0.textColor = .systemBlue
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
    }
    
    let reviewLabel = UILabel().then {
        $0.text = "내가 쓴 리뷰"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let reviewCountLabel = UILabel().then {
        $0.text = "(4)"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeoEB00", size: 24)
    }
    
    let reviewMoreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        
    }
    
    let reviewTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
    }
    
    
    @objc func goToTruckConfig(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "truckconfig")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
    
//    var truck: Truck
//    
//    func getTruckInfo(){
//        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck/save"
//        let jwt = userDefaults.getToken()
//        let headers: HTTPHeaders = [
//            "jwt": jwt
//          ]
//        let truckInfo = [
//            "name": self.truckName,
//            "description": self.truckDescription
//        ] as Dictionary
//        print(truckInfo)
//        print(1111)
//        AF.request(url, method: .post, parameters: truckInfo, encoding: JSONEncoding.default, headers: headers).responseJSON{ (response) in
//            switch response.result {
//            case .success:
//                print(response.result)
//            case .failure(let error):
//                print(error)
//            }
//    }
//    }
    
    func bindConstraints() {
        
        nickNameContainer.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(40)
        }
        nickNameButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11.5)
            make.left.equalTo(nickNameContainer.snp.left).offset(15)
        }
        
        configButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(nickNameContainer.snp.right).offset(-13)
        }
        
        

        truckLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(nickNameContainer.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            
        }
        
        truckConfigButton.snp.makeConstraints{ (make) in
            make.top.equalTo(nickNameContainer.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            
        }
        
        truckContainer.snp.makeConstraints{ (make) in
            make.top.equalTo(truckLabel.snp.bottom).offset(10)
            make.height.equalTo(120)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            
            
        }
        
        
        truckNameLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(truckContainer.snp.top).offset(10)
            make.left.equalTo(truckImage.snp.right).offset(10)
  
            
            
        }
        
        
        truckImage.snp.makeConstraints{ (make) in
            make.top.equalTo(truckContainer.snp.top).offset(10)
            make.left.equalTo(truckContainer.snp.left).offset(10)
            
            make.width.height.equalTo(100)
            
        }
        
        truckStatusLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(truckNameLabel.snp.centerX)
            make.centerY.equalTo(truckImage.snp.centerY)
        }
        

        
        reviewLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(truckContainer.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            
        }
        
        reviewCountLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(truckContainer.snp.bottom).offset(10)
            make.left.equalTo(reviewLabel.snp.right).offset(5)
            
        }
        
        reviewMoreButton.snp.makeConstraints{ (make) in
            make.top.equalTo(truckContainer.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            
        }
        
        reviewTableView.snp.makeConstraints{ (make) in
        
            make.top.equalTo(reviewLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(200)
        }
    }
    

    let item: [String] = ["abc", "def", "ghi", "dasf"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(reviewTableView)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.translatesAutoresizingMaskIntoConstraints = false
        self.reviewTableView.register(MyInfoReviewCell.self, forCellReuseIdentifier: "MyInfoReviewCell")
        
        reviewTableView.rowHeight = UITableView.automaticDimension
        reviewTableView.estimatedRowHeight = UITableView.automaticDimension
        

        view.addSubview(nickNameContainer)
        view.addSubview(nickNameButton)
        view.addSubview(configButton)
        
        view.addSubview(truckContainer)
        view.addSubview(truckLabel)
        view.addSubview(truckConfigButton)
        view.addSubview(truckNameLabel)
        view.addSubview(truckImage)
        view.addSubview(truckStatusLabel)
        
        view.addSubview(reviewLabel)
        view.addSubview(reviewCountLabel)
        view.addSubview(reviewMoreButton)

        
        
        
        bindConstraints()
        
        self.truckConfigButton.addTarget(self, action: #selector(goToTruckConfig), for: .touchUpInside)
    }

    
}


extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoReviewCell", for: indexPath) as? MyInfoReviewCell else {
            return UITableViewCell() }
        

        
        
        return cell
    }
    

}
