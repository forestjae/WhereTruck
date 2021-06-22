//
//  TruckConfigViewController.swift
//  WhereTruck
//
//  Created by 이승재 on 2021/06/13.
//

import UIKit
import Alamofire

class TruckConfigViewController: UIViewController {
    
    let truckInfo = TruckInfo.shared
    
    let truckNameTitleLabel = UILabel().then {
        $0.text = "트럭 이름"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        $0.numberOfLines = 2
    
    }
    
    let informationContainer = UIView().then {
        $0.backgroundColor = UIColor.systemGray6
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0.3)
        $0.layer.shadowOpacity = 0.2

    }
    
    let informationLabel = UILabel().then {
        $0.text = "내 트럭 정보를 수정할 수 있습니다. \n정보를 입력하시고 완료버튼을 클릭해주세요"
        $0.textColor = .systemGray
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        $0.numberOfLines = 2
        
    }
    
    let truckNameField = UITextField().then {
        $0.placeholder = "트럭이름을 입력하세요"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 18)
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = CGColor(red: 255/255, green: 182/255, blue: 166/255, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.textColor = UIColor.black
    }
    
    let truckDescriptionTitleLabel = UILabel().then {
        $0.text = "트럭 설명"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        
    }
    
    let truckDescriptionField = UITextView().then {
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 18)
        $0.text = "설명을 입력하세요"
        $0.contentInset = UIEdgeInsets(top: 8, left: 5, bottom: 10, right: 0)
        $0.backgroundColor = .clear
        $0.returnKeyType = .done
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = CGColor(red: 255/255, green: 182/255, blue: 166/255, alpha: 1.0)

        
        
    }
    
    
    let truckImageTitleLabel = UILabel().then {
        $0.text = "트럭 대표사진"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
    }
    
    let myTruckImage = UIImageView().then {
        $0.image = UIImage.init(named: "truck_example")
        $0.layer.cornerRadius = 15.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 1.5, height: 1)
        $0.layer.shadowOpacity = 0.5
    }
    
    let truckImageModifyButton = UIButton().then {
        $0.setTitle("사진 변경", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14.5)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.tintColor = .systemBlue
        
    }

    
    let initTruckButton = UIButton().then {
        $0.setTitle("트럭생성", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    let getAllTruckButton = UIButton().then {
        $0.setTitle("트럭조회", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        $0.setImage(UIImage(systemName: "person.fill") , for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
    }
    
    
    
    func bindConstraint() {
        
        truckNameField.text = truckInfo.name
        truckDescriptionField.text = truckInfo.description
        
        self.informationContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(53)
        }
        
        self.informationLabel.snp.makeConstraints { make in
            make.top.equalTo(informationContainer.snp.top).offset(8)
            make.left.equalToSuperview().offset(22)
            make.height.equalTo(40)
        }
        
        
        self.truckNameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(informationContainer.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
        }
        
        
        
        self.truckNameField.snp.makeConstraints { make in
            make.top.equalTo(truckNameTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(26)
            make.width.equalTo(340)
            make.height.equalTo(40)
        }
        
        self.truckDescriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(truckNameField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        
        self.truckDescriptionField.snp.makeConstraints { make in
            make.top.equalTo(truckDescriptionTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(26)
            make.width.equalTo(340)
            make.height.equalTo(170)
        }
        
        self.truckImageTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(truckDescriptionField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        self.truckImageModifyButton.snp.makeConstraints { make in
            make.top.equalTo(truckDescriptionField.snp.bottom).offset(18)
            make.left.equalTo(truckImageTitleLabel.snp.right).offset(30)
        }
        
        self.myTruckImage.snp.makeConstraints { make in
            make.top.equalTo(truckImageTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(100)
        }
        
        
        
//        self.initTruckButton.snp.makeConstraints { make in
//            make.top.equalTo(myTruckImage.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(20)
//        }
        
        self.getAllTruckButton.snp.makeConstraints{ make in
            make.top.equalTo(myTruckImage.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        
        DispatchQueue.main.async {
            
            let url = URL(string: self.truckInfo.imageUrl)
            guard let url = url else { return }
            self.myTruckImage.kf.setImage(with: url)
      
        }
    }
    
    
    var truckName: String = ""
    var truckDescription: String = ""
    
    let userDefaults: UserDefaultsValue = UserDefaultsValue()
    let userInfo = UserInfo.shared
    
    lazy var editBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didCompleteButtonTouched(_:)))
        return barButtonItem
    }()
    
    let picker = UIImagePickerController()
    
    @objc func didImageModifyButtonTouched(_ sender: Any) {
        let alert =  UIAlertController(title: nil, message: "사진을 올릴 방법을 선택해 주세요", preferredStyle: .actionSheet)

        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }

        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        self.openCamera()
        }

        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }

    @objc func didCompleteButtonTouched(_ sender: UIBarButtonItem) {
        modifyTruck()
        print("11")
        
        
    }

    func navigationButtonSetup(){
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    @objc func initTruck(){
        self.truckName = truckNameField.text!
        self.truckDescription = truckDescriptionField.text!
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck"
        let jwt = userDefaults.getToken()
        let headers: HTTPHeaders = [
            "jwt": jwt
          ]
        let truckInfo = [
            "name": self.truckName,
            "description": self.truckDescription
        ] as Dictionary
        print("jwt:\(jwt)")
        AF.request(url, method: .post, parameters: truckInfo, encoding: JSONEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
            }
    }
    }
    
    
    
    @objc func modifyTruck(){
        self.truckName = truckNameField.text!
        self.truckDescription = truckDescriptionField.text!
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck"
    
        let jwt = userDefaults.getToken()
        let headers: HTTPHeaders = [
            "jwt": jwt,
            "Content-Type": "multipart/form-data"
          ]
//        let truckInfo = [
//            "id": self.truckInfo.id,
//            "name": self.truckName,
//            "description": self.truckDescription
//        ] as Dictionary
        
        AF.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(Data(self.truckInfo.id.utf8), withName: "id")
            multipartFormData.append(Data(self.truckName.utf8), withName: "name")
            multipartFormData.append(Data(self.truckDescription.utf8), withName: "description")
            guard let imageData = self.myTruckImage.image!.jpegData(compressionQuality: 0.5) else {return}
            multipartFormData.append(imageData, withName: "image", fileName: "imagename.jpg", mimeType: "image/jpeg")
            
            
            
            
        }, to: url, headers: headers).responseJSON { (response) in
            print(response.result)
            guard let statusCode = response.response?.statusCode else { return }
            
            switch statusCode {
            case 200:
                print("트럭 변경 성공")
                self.truckInfo.description = self.truckDescription
                self.truckInfo.name = self.truckName
                
            default:
                print("트럭 변경 실패")
                break
            }
        }
    }
    
    
    @objc func getAllTruck(){
        let url = "http://ec2-13-209-181-246.ap-northeast-2.compute.amazonaws.com:8080/api/truck/all"
        let jwt = userDefaults.getToken()
        let headers: HTTPHeaders = [
            "jwt": jwt
          ]
        print(jwt)
        
        AF.request(url, method: .get, headers: headers).responseJSON{ (response) in
            switch response.result {
            case .success:
                print(response.result)
            case .failure(let error):
                print(error)
            }
    }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(informationContainer)
        self.view.addSubview(informationLabel)
        
        self.view.addSubview(truckNameTitleLabel)
        self.view.addSubview(truckNameField)
        self.view.addSubview(truckDescriptionTitleLabel)
        self.view.addSubview(truckDescriptionField)
        self.view.addSubview(truckImageTitleLabel)
        self.view.addSubview(myTruckImage)
        self.view.addSubview(truckImageModifyButton)
        
        self.view.addSubview(initTruckButton)
        self.view.addSubview(getAllTruckButton)
        initTruckButton.addTarget(self, action: #selector(initTruck), for: .touchUpInside)
        getAllTruckButton.addTarget(self, action: #selector(getAllTruck), for: .touchUpInside)
        truckImageModifyButton.addTarget(self, action: #selector(didImageModifyButtonTouched(_:)), for: .touchUpInside)
        
        bindConstraint()
        navigationButtonSetup()
        
        picker.delegate = self
    }
}

extension TruckConfigViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func openLibrary(){
      picker.sourceType = .photoLibrary
      present(picker, animated: false, completion: nil)
    }
    func openCamera(){
      picker.sourceType = .camera
      present(picker, animated: false, completion: nil)
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                 myTruckImage.image = image
                
             }
             dismiss(animated: true, completion: nil)
    }
    
}




