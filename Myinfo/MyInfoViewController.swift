//
//  MyInfoViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
//

import UIKit

class MyInfoViewController: UIViewController {
    let userInfo = UserInfo.shared
    let userDefaults = UserDefaultsValue()

    
    let nickNameButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
        $0.setTitle("\(UserInfo.shared.nickName)님, 안녕하세요", for: .normal)
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
    
//    let reviewMoreButton = UIButton().then {
//        $0.setTitle("더보기", for: .normal)
//        $0.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
//
//    }
    
    let reviewTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
            }
    
    
//    @objc func goToTruckConfig(){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "truckconfig")
//        vc?.modalPresentationStyle = .fullScreen
//        vc?.modalTransitionStyle = .crossDissolve
//        self.present(vc!, animated: true, completion: nil)
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
        
        reviewTableView.snp.makeConstraints{ (make) in
        
            make.top.equalTo(nickNameContainer.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(10)
        }
        
        
//        reviewLabel.snp.makeConstraints{ (make) in
//            make.top.equalTo(truckContainer.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//
//        }
//
//        reviewCountLabel.snp.makeConstraints{ (make) in
//            make.top.equalTo(truckContainer.snp.bottom).offset(10)
//            make.left.equalTo(reviewLabel.snp.right).offset(5)
//
//        }
//
//        reviewMoreButton.snp.makeConstraints{ (make) in
//            make.top.equalToSuperview().offset(0)
//
//            make.right.equalToSuperview().offset(0)
//
//        }
        
//        menuLabel.snp.makeConstraints{ (make) in
//            make.top.equalTo(reviewTableView.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(24)
//            make.right.equalToSuperview().offset(-24)
//
//
//        }
    }
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)

    let item: [String] = ["abc", "def", "ghi", "dasf"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        view.addSubview(reviewTableView)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.translatesAutoresizingMaskIntoConstraints = false
        self.reviewTableView.register(MyInfoReviewCell.self, forCellReuseIdentifier: "MyInfoReviewCell")
        self.reviewTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        reviewTableView.rowHeight = UITableView.automaticDimension
        reviewTableView.estimatedRowHeight = UITableView.automaticDimension
        reviewTableView.sectionHeaderHeight = UITableView.automaticDimension
        reviewTableView.estimatedSectionHeaderHeight = 50

        view.addSubview(nickNameContainer)
        view.addSubview(nickNameButton)
        view.addSubview(configButton)

        view.addSubview(reviewLabel)
        view.addSubview(reviewCountLabel)
     

        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(red: 255/255, green: 182/255, blue: 166/255, alpha: 1.0)
        
        bindConstraints()
        
        
        self.configButton.addTarget(self, action: #selector(membershipConfigButtonTouched(_:)), for: .touchUpInside)
    }
    
    @objc func membershipConfigButtonTouched(_ sender: UIButton){
            guard let MyMembershipViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyMembershipViewController") as? MyMembershipViewController else { return }
            navigationController?.pushViewController(MyMembershipViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    let cellIdentifier: String = "cell"
    
    let myInfoMenuList = ["내 트럭", "내 메뉴"]
    
}


extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.lightGray
            let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width: tableView.bounds.width, height: tableView.bounds.size.height))
            sectionLabel.font = UIFont(name : "AppleSDGothicNeo", size: 20)
            sectionLabel.textColor = UIColor.black
            sectionLabel.text = "내 설정"
            sectionLabel.sizeToFit()
            headerView.addSubview(sectionLabel)
            headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.layoutIfNeeded()
            return headerView
        }
        else if section == 1 {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.lightGray
            let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width: tableView.bounds.width, height: tableView.bounds.size.height))
            sectionLabel.font = UIFont(name : "AppleSDGothicNeo", size: 20)
            sectionLabel.textColor = UIColor.black
            sectionLabel.text = "내 리뷰"
            sectionLabel.sizeToFit()
            
            let reviewMoreButton = UIButton(frame: CGRect(x: 4, y: 10, width: 10, height: tableView.bounds.size.height))
            reviewMoreButton.setTitle("더 보기", for: .normal)
            reviewMoreButton.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
            reviewMoreButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
            
            
            headerView.addSubview(sectionLabel)
            headerView.addSubview(reviewMoreButton)
            headerView.translatesAutoresizingMaskIntoConstraints = false
     
  
            headerView.layoutIfNeeded()
            return headerView
            
        }
        else {
            return UIView()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel!.text = self.myInfoMenuList[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoReviewCell", for: indexPath) as? MyInfoReviewCell else {
                return UITableViewCell() }

            return cell
        }
        

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            
            guard let MyTruckViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyTruckViewController") as? MyTruckViewController else { return }
            navigationController?.pushViewController(MyTruckViewController, animated: true)
        case 1:
            guard let MyMenuViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyMenuViewController") as? MyMenuViewController else { return }
            navigationController?.pushViewController(MyMenuViewController, animated: true)
        default:
            break
        }
    }
    

}
