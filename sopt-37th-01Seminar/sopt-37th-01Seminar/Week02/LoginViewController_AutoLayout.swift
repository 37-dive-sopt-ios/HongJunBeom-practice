//
//  LoginViewController_AutoLayout.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/18/25.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController_AutoLayout: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .h2
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = .h1
        textField.backgroundColor = .grey200
        textField.addLeftPadding()
        textField.addRightPadding()
        
        return textField
    }()
    
    // 입력 초기화 버튼(이메일)
    lazy var emailClearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(EmailClearButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
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
        
        components.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)}
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(163)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
//            $0.horizontalEdges.equalToSuperview().inset(20) 이렇게도 가능
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
//        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 163)])
//        
//        NSLayoutConstraint.activate([emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                                     emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                                     emailTextField.heightAnchor.constraint(equalToConstant: 52),
//                                     emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71)
//                                    ])
//        
//        NSLayoutConstraint.activate([passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                                     passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52),
//                                     passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 6)
//                                    ])
//        
//        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 217),
//                                     loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     loginButton.heightAnchor.constraint(equalToConstant: 58),
//                                    loginButton.widthAnchor.constraint(equalToConstant: 338)])
//    }
    
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

