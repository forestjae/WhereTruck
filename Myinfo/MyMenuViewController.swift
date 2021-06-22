//
//  MyMenuViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/17.
//

import UIKit

class MyMenuViewController: UIViewController {
    
    lazy var editBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(didEditButtonTouched(_:)))
        return barButtonItem
    }()

    let reviewTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
            }
    
    func bindConstraint() {
        
        reviewTableView.snp.makeConstraints{ (make) in
        
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(10)
        }
        
        
    }
    
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
        navigationItem.title = "내 메뉴"
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
