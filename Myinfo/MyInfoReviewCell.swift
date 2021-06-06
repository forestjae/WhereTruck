//
//  MyInfoTableViewCell.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
//

import UIKit
import Then

class MyInfoTableViewCell: UITableViewCell {
    
    let truckLabel = UILabel().then {
        $0.text = "나의 트럭"
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let truckNameLabel = UILabel().then {
        $0.text = "호식이 두마리 치킨"
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let truckImage = UIView().then {
        $0.backgroundColor = .clear
        
    }
    
    let truckStatusLabel = UILabel().then {
        $0.text = "현재 운영 중"
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }    
    
    let reviewLabel = UILabel().then {
        $0.text = "my_page_registered_review"
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
    }
    
    let reviewCountLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeoEB00", size: 24)
    }
    
    let reviewMoreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor(red: 200/255, green: 100/255, blue: 7/255, alpha: 1.0), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
