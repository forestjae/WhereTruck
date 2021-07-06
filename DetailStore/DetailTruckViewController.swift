////
////  DetailTruckViewController.swift
////  WhereTruck
////
////  Created by 이승재 on 2021/06/11.
////
//
//import UIKit
//
//class DetailTruckViewController: UIViewController {
//
//    let userInfo = UserInfo.shared
//    let userDefaults = UserDefaultsValue()
//
//
//    let navigationView = UIView().then {
//      $0.layer.cornerRadius = 20
//      $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//
//      $0.layer.shadowOffset = CGSize(width: 0, height: 4)
//      $0.layer.shadowColor = UIColor.black.cgColor
//      $0.layer.shadowOpacity = 0.04
//      $0.backgroundColor = .white
//    }
//
//    let backButton = UIButton().then {
//      $0.setImage(UIImage.init(named: "ic_back_black"), for: .normal)
//    }
//
//    let detailTruckTableView = UITableView().then {
//        $0.backgroundColor = .clear
//        $0.tableFooterView = UIView()
//        $0.separatorStyle = .none
//        $0.rowHeight = UITableView.automaticDimension
//        $0.showsVerticalScrollIndicator = false
//        $0.isScrollEnabled = false
//            }
//
//    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//
//    func bindConstraints() {
//
//
//        detailTruckTableView.snp.makeConstraints{ (make) in
//
//            make.top.equalToSuperview().offset(10)
//            make.left.equalToSuperview().offset(0)
//            make.right.equalToSuperview().offset(0)
//            make.bottom.equalToSuperview().offset(10)
//        }
//
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(detailTruckTableView)
//
//        detailTruckTableView.delegate = self
//        detailTruckTableView.dataSource = self
//        detailTruckTableView.translatesAutoresizingMaskIntoConstraints = false
//        self.detailTruckTableView.register(MyInfoReviewCell.self, forCellReuseIdentifier: "MyInfoReviewCell")
//        self.detailTruckTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        detailTruckTableView.rowHeight = UITableView.automaticDimension
//        detailTruckTableView.estimatedRowHeight = UITableView.automaticDimension
//        detailTruckTableView.sectionHeaderHeight = UITableView.automaticDimension
//        detailTruckTableView.estimatedSectionHeaderHeight = 50
//
//        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
//
//
//}
//
//extension DetailTruckViewController: UITableViewDelegate, UITableViewDataSource{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 2
//        case 1:
//            return 4
//        default:
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let headerView = UIView()
//            headerView.backgroundColor = UIColor.lightGray
//            let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width: tableView.bounds.width, height: tableView.bounds.size.height))
//            sectionLabel.font = UIFont(name : "AppleSDGothicNeo", size: 20)
//            sectionLabel.textColor = UIColor.black
//            sectionLabel.text = "내 설정"
//            sectionLabel.sizeToFit()
//            headerView.addSubview(sectionLabel)
//            headerView.translatesAutoresizingMaskIntoConstraints = false
//            headerView.layoutIfNeeded()
//            return headerView
//        }
//        else if section == 1 {
//            let headerView = UIView()
//            headerView.backgroundColor = UIColor.lightGray
//            let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width: tableView.bounds.width, height: tableView.bounds.size.height))
//            sectionLabel.font = UIFont(name : "AppleSDGothicNeo", size: 20)
//            sectionLabel.textColor = UIColor.black
//            sectionLabel.text = "내 리뷰"
//            sectionLabel.sizeToFit()
//
//            let reviewMoreButton = UIButton(frame: CGRect(x: 4, y: 10, width: 10, height: tableView.bounds.size.height))
//            reviewMoreButton.setTitle("더 보기", for: .normal)
//            reviewMoreButton.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
//            reviewMoreButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
//
//
//            headerView.addSubview(sectionLabel)
//            headerView.addSubview(reviewMoreButton)
//            headerView.translatesAutoresizingMaskIntoConstraints = false
//
//
//            headerView.layoutIfNeeded()
//            return headerView
//
//        }
//        else {
//            return UIView()
//        }
//    }
//
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.section == 0 {
//            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel!.text = self.myInfoMenuList[indexPath.row]
//            cell.textLabel?.textColor = .black
//            cell.accessoryType = .disclosureIndicator
//            return cell
//        }
//        
//        else {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoReviewCell", for: indexPath) as? MyInfoReviewCell else {
//                return UITableViewCell() }
//
//            return cell
//        }
//
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//
//        switch indexPath.row {
//        case 0:
//
//            guard let MyTruckViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyTruckViewController") as? MyTruckViewController else { return }
//            navigationController?.pushViewController(MyTruckViewController, animated: true)
//        case 1:
//            guard let MyMenuViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyMenuViewController") as? MyMenuViewController else { return }
//            navigationController?.pushViewController(MyMenuViewController, animated: true)
//        default:
//            break
//        }
//    }
//}
//
