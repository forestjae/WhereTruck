//
//  ViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/03.
//

import UIKit
import Lottie
import Then

class LogoViewController: UIViewController {
    
    let logoView = AnimationView(name:"43354-food-truck").then {
        $0.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .loop
    }
    
    let logoTitle = UILabel().then {
        $0.text = "WhereTruck"
        $0.font = .systemFont(ofSize: 43, weight: .heavy)
        
        $0.textColor = UIColor(red: 83/255, green: 84/255, blue: 84/255, alpha: 1.0)
        $0.shadowColor = .systemGray5
        $0.shadowOffset = CGSize(width: 1, height: 2)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func bindConstraints(){
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(100)
            make.width.height.equalTo(300)
        }
        
        logoTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoView.snp.bottom).offset(-50)
          
        }
    }
    
    @IBOutlet private weak var logoTitleTopConstraint: NSLayoutConstraint!
    
    


    override func viewDidLoad() {
        self.view.addSubview(logoView)
        self.view.addSubview(logoTitle)
        bindConstraints()
        print(logoView)
        logoView.play()
        logoView.loopMode = .loop
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(11)
        logoView.play()
        logoView.loopMode = .loop
    }

}

