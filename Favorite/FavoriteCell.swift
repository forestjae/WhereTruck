//
//  MyInfoFavoriteViewCell.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
//

import UIKit

class FavoriteCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MyInfoFavoriteCell")

    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

////
//  MyInfoTableViewCell.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/06.
////
//
//import UIKit
//import Then
//
//class MyInfoReviewCell: UITableViewCell {
//
//    let reviewWhatTruckLabel = UILabel().then {
//        $0.text = "창걸이네 삼겹살"
//        $0.textColor = .black
//        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
//    }
//
//
//    let reviewContentsLabel = UILabel().then {
//        $0.text = "엄청 맛있어요! 재방문의사 100%!"
//        $0.textColor = .systemGray2
//        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
//    }
//
//
//    let star1 = UIButton().then {
//
//        $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//        $0.setImage(UIImage(systemName: "star"), for: .normal)
//        $0.isUserInteractionEnabled = false
//        $0.tintColor = .systemYellow
//        $0.setTitleColor(.systemYellow, for: [.normal, .selected])
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
//        $0.setTitle("", for: [.normal, .selected])
//    }
//
//    let star2 = UIButton().then {
//        $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//        $0.setImage(UIImage(systemName: "star"), for: .normal)
//        $0.isUserInteractionEnabled = false
//        $0.tintColor = .systemYellow
//        $0.setTitleColor(.systemYellow, for: [.normal, .selected])
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
//
//    }
//
//    let star3 = UIButton().then {
//        $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//        $0.setImage(UIImage(systemName: "star"), for: .normal)
//        $0.isUserInteractionEnabled = false
//        $0.tintColor = .systemYellow
//        $0.setTitleColor(.systemYellow, for: [.normal, .selected])
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
//
//    }
//
//    let star4 = UIButton().then {
//        $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//        $0.setImage(UIImage(systemName: "star"), for: .normal)
//        $0.isUserInteractionEnabled = false
//        $0.tintColor = .systemYellow
//        $0.setTitleColor(.systemYellow, for: [.normal, .selected])
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
//
//    }
//
//    let star5 = UIButton().then {
//        $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//        $0.setImage(UIImage(systemName: "star"), for: .normal)
//        $0.isUserInteractionEnabled = false
//        $0.tintColor = .systemYellow
//        $0.setTitleColor(.systemYellow, for: [.normal, .selected])
//        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
//
//    }
//
//    let starStackView = UIStackView().then {
//        $0.axis = .horizontal
//        $0.alignment = .leading
//        $0.backgroundColor = .clear
//        $0.spacing = 2
//    }
//
//    private func setupView() {
//        self.selectionStyle = .none
//        self.starStackView.addArrangedSubview(star1)
//        self.starStackView.addArrangedSubview(star2)
//        self.starStackView.addArrangedSubview(star3)
//        self.starStackView.addArrangedSubview(star4)
//        self.starStackView.addArrangedSubview(star5)
//        self.addSubview(reviewWhatTruckLabel)
//        self.addSubview(reviewContentsLabel)
//        self.addSubview(starStackView)
//
//    }
//
//    private func bindConstraints() {
//        self.reviewWhatTruckLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
//            make.top.equalToSuperview().offset(4)
//
//        }
//
//        self.reviewContentsLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
//            make.top.equalTo(reviewWhatTruckLabel.snp.bottom).offset(4)
//            make.bottom.equalToSuperview().offset(-10)
//
//        }
//
//
//        self.star1.snp.makeConstraints { make in
//            make.width.height.equalTo(14)
//
//        }
//
//        self.star2.snp.makeConstraints { make in
//            make.width.height.equalTo(14)
//        }
//
//        self.star3.snp.makeConstraints { make in
//            make.width.height.equalTo(14)
//        }
//
//        self.star4.snp.makeConstraints { make in
//            make.width.height.equalTo(14)
//        }
//
//        self.star5.snp.makeConstraints { make in
//            make.width.height.equalTo(14)
//        }
//
//        self.starStackView.snp.makeConstraints { make in
//            make.centerY.equalTo(reviewWhatTruckLabel.snp.centerY)
////            make.left.equalTo(reviewWhatTruckLabel.snp.right).offset(10)
//            make.right.equalToSuperview().offset(-13)
//        }
//
//    }
//
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "MyInfoReviewCell")
//
//        setupView()
//        bindConstraints()
//
//
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
//
