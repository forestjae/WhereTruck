//
//  DetailTruckViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/11.
//

import UIKit

class DetailTruckViewController: UIViewController {
    
    let navigationView = UIView().then {
      $0.layer.cornerRadius = 20
      $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
      
      $0.layer.shadowOffset = CGSize(width: 0, height: 4)
      $0.layer.shadowColor = UIColor.black.cgColor
      $0.layer.shadowOpacity = 0.04
      $0.backgroundColor = .white
    }
    
    let backButton = UIButton().then {
      $0.setImage(UIImage.init(named: "ic_back_black"), for: .normal)
    }
    
    let infoContainer = UIView().then {
      $0.backgroundColor = .white
      $0.layer.cornerRadius = 12
    }
    
    let storeTypeLabel = UILabel().then{
      $0.text = "store_detail_type".localized
      $0.textColor = .black
      $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    }
    
    let storeTypeValueLabel = UILabel().then {
      $0.textColor = UIColor(red: 255/255, green: 161/255, blue: 170/255, alpha: <#T##CGFloat#>)(r: 255, g: 161, b: 170)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "노점"
    }
    
    let storeTypeEmptyLabel = UILabel().then {
      $0.textColor = UIColor(r: 183, g: 183, b: 183)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "store_detail_info_empty".localized
      $0.isHidden = false
    }
    
    let storeDaysLabel = UILabel().then{
      $0.text = "store_detail_days".localized
      $0.textColor = .black
      $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    }
    
    let dayStackView = DayStackView()
    
    let storeDaysEmptyLabel = UILabel().then {
      $0.textColor = UIColor(r: 183, g: 183, b: 183)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "store_detail_info_empty".localized
      $0.isHidden = true
    }
    
    let paymentLabel = UILabel().then {
      $0.text = "store_detail_payment".localized
      $0.textColor = .black
      $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    }
    
    let cardLabel = UILabel().then {
      $0.textColor = UIColor(r: 161, g: 161, b: 161)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "store_detail_payment_card".localized
    }
    
    let cardCircleView = UIView().then {
      $0.backgroundColor = UIColor(r: 161, g: 161, b: 161)
      $0.layer.cornerRadius = 4
    }
    
    let transferLabel = UILabel().then {
      $0.text = "store_detail_transfer".localized
      $0.textColor = UIColor(r: 161, g: 161, b: 161)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    let transferCircleView = UIView().then {
      $0.backgroundColor = UIColor(r: 161, g: 161, b: 161)
      $0.layer.cornerRadius = 4
    }
    
    let cashLabel = UILabel().then {
      $0.textColor = UIColor(r: 161, g: 161, b: 161)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "store_detail_payment_cash".localized
    }
    
    let cashCircleView = UIView().then {
      $0.backgroundColor = UIColor(r: 161, g: 161, b: 161)
      $0.layer.cornerRadius = 4
    }
    
    let storePaymentEmptyLabel = UILabel().then {
      $0.textColor = UIColor(r: 183, g: 183, b: 183)
      $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
      $0.text = "store_detail_info_empty".localized
      $0.isHidden = true
    }
        
    
    func bindConstraint() {
        detailTruckTableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(20)
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
        self.view.addSubview(detailTruckTableView)
        
        
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    
}

    
}
