//
//  LoginViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/18/25.
//

import Foundation
import UIKit

//시킴 받는애한테 프로토콜 채택 (파트원한테 너 가능하자나 라는 자격을 준거야, 너 다시 로그인 버튼 누르면 너가 구현가능하잖아
//class LoginViewController_Delegate: UIViewController, WelcomeReloginDelegate { 이걸 익스텐션으로 빼도 됨 보통 분리함
class LoginViewController_Delegate: UIViewController{
   
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 85, y: 163, width: 240, height: 50))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .h2
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var emailTextField: UITextField = { //이것도 다 클로저다.
        let textField = UITextField(frame: CGRect(x: 20, y: 270, width: 360, height: 52))
        textField.placeholder = "아이디"
        textField.font = .h1
        textField.backgroundColor = .grey200
        textField.addLeftPadding()
        textField.addRightPadding()
        
        return textField
    }()
    
    // 입력 초기화 버튼(이메일)
    lazy var emailClearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 350, y: 285, width: 24, height: 24))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(EmailClearButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 330, width: 360, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .h1
        textField.isSecureTextEntry = true
        textField.backgroundColor = .grey200
        textField.addLeftPadding()
        textField.addRightPadding(70)
        
        return textField
    }()
    
    // 비밀번호 표시여부 버튼(눈 모양)
    lazy var passwordVisibilityButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 320, y: 345, width: 24, height: 24))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(passwordVisibilityButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    // 입력 초기화 버튼(비밀번호)
    lazy var passwordClearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 350, y: 345, width: 24, height: 24))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(PasswordClearButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 420, width: 360, height: 55))
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .primaryOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            emailTextField,
            emailClearButton,
            passwordTextField,
            passwordVisibilityButton,
            passwordClearButton,
            loginButton
            
        ]
        
        components.forEach {view.addSubview($0)}
    }
    
    private func setLayout() {
        
    }
    
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController_Delegate()
        vc.name = emailTextField.text
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let vc = WelcomeViewController_Delegate()
        vc.name = emailTextField.text
        vc.delegate = self //웰컴아 그 일은 내가 할게!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    @objc
    private func passwordVisibilityButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let isSecure = passwordTextField.isSecureTextEntry
        passwordVisibilityButton.setImage(UIImage(systemName: isSecure ? "eye.slash" : "eye"), for: .normal)
    }
    
    @objc
    private func EmailClearButtonDidTap() {
        emailTextField.text = ""
    }
    
    @objc
    private func PasswordClearButtonDidTap() {
        passwordTextField.text = ""
    }
    
//    func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String) { //뷰컨을 파라미터, 그리고 자료를 넘겨줘야하기 때문에 string, 뷰컨 파라미터 안씀 현재 왜? 근데 원래 이 안에 dismiss 나 pop을 이 함수에 넣었음, 그래서 뷰컨 파라미터를 없애도됨. 데이터 전달만 하면 되는데 뷰 전환도 하게 되면 많은 일을하게 돼서 빼는게 낫다.
//        titleLabel.text = message
//        emailTextField.text = ""
//        passwordTextField.text = ""
//        loginButton.setTitle("다시 로그인하기", for: .normal)
//    func retryLogin(didTapReloginWith message: String) { //뷰컨을 파라미터, 그리고 자료를 넘겨줘야하기 때문에 string, 뷰컨 파라미터 안씀 현재 왜? 근데 원래 이 안에 dismiss 나 pop을 이 함수에 넣었음, 그래서 뷰컨 파라미터를 없애도됨. 데이터 전달만 하면 되는데 뷰 전환도 하게 되면 많은 일을하게 돼서 빼는게 낫다.
//        titleLabel.text = message
//        emailTextField.text = ""
//        passwordTextField.text = ""
//        loginButton.setTitle("다시 로그인하기", for: .normal)
        
//        if self.navigationController == nil { //self가 웰컴 뷰컨
//            self.dismiss(animated: true)
//        } else {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
}

extension LoginViewController_Delegate: WelcomeReloginDelegate {
    //생성자(생성자 종류가 뭐많았음), 메소드 , 계산 속성 등등을 정의 가능
    func retryLogin(didTapReloginWith message: String) { //뷰컨을 파라미터, 그리고 자료를 넘겨줘야하기 때문에 string, 뷰컨 파라미터 안씀 현재 왜? 근데 원래 이 안에 dismiss 나 pop을 이 함수에 넣었음, 그래서 뷰컨 파라미터를 없애도됨. 데이터 전달만 하면 되는데 뷰 전환도 하게 되면 많은 일을하게 돼서 빼는게 낫다.
        titleLabel.text = message
        emailTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}

//extension LoginViewController_Delegate: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//} 3주차 때 이런식으로,,
