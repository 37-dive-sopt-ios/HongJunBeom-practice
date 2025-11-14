//
//  LoginViewController_SnapKit.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 11/1/25.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    private let rootView = LoginView()
    
     override func loadView() {
        self.view = rootView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - setup
        func setAddTarget() {
           rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
       }

    @objc
    func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_SnapKit()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.name = rootView.idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_SnapKit()
        welcomeViewController.name = rootView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
   
}
