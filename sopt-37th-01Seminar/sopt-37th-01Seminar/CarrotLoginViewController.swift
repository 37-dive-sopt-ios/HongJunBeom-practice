//
//  CarrotLoginViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/11/25.
//

import Foundation
import UIKit

class CarrotLoginViewController: UIViewController {
    
    lazy var message: UILabel = {
        let label = UILabel(frame: CGRect(x: 85, y: 163, width: 240, height: 50))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .h2
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
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
            message,
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
        let vc = WelcomeViewController()
        vc.name = emailTextField.text
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let vc = WelcomeViewController()
        vc.name = emailTextField.text
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
    
}

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 30) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}
