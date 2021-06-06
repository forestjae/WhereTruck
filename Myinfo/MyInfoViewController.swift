//
//  MyInfoViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    
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
        $0.tintColor = .black
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
    
    let myinfoTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        
    }
    
    
    
    
    
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
        
        myinfoTableView.snp.makeConstraints{ (make) in
            make.top.equalTo(nickNameContainer.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.bottom.equalToSuperview().offset(130)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myinfoTableView.delegate = self
        myinfoTableView.dataSource = self
        self.myinfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyInfoTruckCell")
        view.addSubview(nickNameContainer)
        
        view.addSubview(nickNameButton)
        
        view.addSubview(configButton)
        bindConstraints()
    }
    
}

extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0...1:
            return 1
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: MyInfoTruckCell = self.tableviewdeque
        
        default:
            fatalError(" ")
            
        }
        
    }
    
    
    
    
}

