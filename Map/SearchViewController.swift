//
//  SearchViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/11.
//

import UIKit

class SearchViewController: UIViewController {
    
    let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_close"), for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .white
        
    }
    
    let searchView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .white
        
        
    }
    
    let searchContainer = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        
    }
    
    let searchIconImage = UIImageView().then {
        $0.image = UIImage(named: "ic_search")
        
    }
    
    let searchField = UITextField().then {
        $0.placeholder = "search_address_placeholder"
        $0.textColor = UIColor.systemRed
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        
    }
    
    let searchResultTable = UITableView().then {
        $0.backgroundColor = .white
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemRed.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(closeButton)
        self.view.addSubview(searchView)
        self.view.addSubview(searchContainer)
        self.view.addSubview(searchIconImage)
        self.view.addSubview(searchField)
        self.view.addSubview(searchResultTable)
        bindConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    
    func bindConstraints() {
      self.searchView.snp.makeConstraints { make in
        make.left.top.right.equalToSuperview()
        make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(59)
      }
      
      self.closeButton.snp.makeConstraints { make in
        make.left.equalToSuperview().offset(24)

      }
      

      self.searchContainer.snp.makeConstraints { make in
        make.left.equalToSuperview().offset(24)
      }
      
      self.searchIconImage.snp.makeConstraints { make in
        make.centerY.equalTo(self.searchContainer)
        make.left.equalTo(self.searchContainer).offset(12)
        make.width.height.equalTo(24)
      }
      
      self.searchField.snp.makeConstraints { make in
        make.centerY.equalTo(self.searchContainer)
        make.left.equalTo(self.searchIconImage.snp.right).offset(11)
        make.right.equalTo(self.searchView).offset(-11)
      }
      
      self.searchResultTable.snp.makeConstraints { make in
        make.left.right.equalToSuperview()
        make.top.equalTo(self.searchContainer.snp.bottom).offset(24)
        make.bottom.equalTo(self.view.safeAreaLayoutGuide)
      }
    }
    
    func showKeyboard() {
      self.searchField.becomeFirstResponder()
    }
    
    func hideKeyboard() {
      self.searchField.resignFirstResponder()
    }
    
}
