//
//  MyMembershipViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/19.
//

import UIKit

class MyMembershipViewController: UIViewController {
    
    let membershipTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
    }
    
    func bindConstraint() {
        membershipTableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
//    lazy var editBarButton: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(didEditButtonTouched(_:)))
//        return barButtonItem
//    }()

//    @objc func didEditButtonTouched(_ sender: UIBarButtonItem) {
//
//    }

//    func navigationButtonSetup(){
//        navigationItem.rightBarButtonItem = editBarButton
//    }
//
//    @objc func editBarButtonTouched(_ sender: UIBarItem){
//            guard let MyMembershipViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MyMembershipViewController") as? MyMembershipViewController else { return }
//            navigationController?.pushViewController(MyMembershipViewController, animated: true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(membershipTableView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "설정"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    let myMembershipMenuList = ["닉네임 변경하기", "문의사항","개인정보 처리 방침"]

}

extension MyMembershipViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel!.text = self.myMembershipMenuList[indexPath.row]
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
