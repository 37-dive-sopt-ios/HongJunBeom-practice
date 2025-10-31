//
//  WelcomeViewController_Closure.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/18/25.
//

import Foundation
import UIKit

final class WelcomeViewController_Closure: UIViewController {
    
    var name: String?
    
    var completionHandler: ((String) -> Void)? // id값을 다른데로 전달해주기 위해 변수 선언 , 이것도 함수라 함수 호출을 해야해
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 130, y: 95, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 160, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 360, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .h2
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 360, height: 58))
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .h2
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // 이미지 변경 Segment 추가
    private lazy var imageSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["토끼", "당근"])
        segment.frame = CGRect(x: 145, y: 375, width: 120, height: 30)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        return segment
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        
        bindID()
    }
    
    private func setLayout() {
        [imageView, welcomeLabel, goHomeButton, backToLoginButton, imageSegment].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        let nickname = name ?? "알 수 없는 사용자"
        
        completionHandler?("\(nickname)님이 다시 로그인 버튼을 눌렀어요!") //언제 클로저가 작동할지를 선언해준 부분 뭘할지는 로그인 뷰컨에서
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Segment 작동 함수
    @objc
    private func segmentControlValueChanged() {
        let index = imageSegment.selectedSegmentIndex
        if index == 0 {
            self.imageView.image = UIImage(named: "logo2")
        } else {
            self.imageView.image = UIImage(named: "carrot")
        }
    }
    
    private func bindID() {
        if let name = name {
            self.welcomeLabel.text = "\(name)님 \n반가워요!"
        } else {
            self.welcomeLabel.text = "환영합니다."
        }
        
        //        guard let name = name else { return }
        //        self.welcomeLabel.text = "\(name)님 \n반가워요!"
    }
    
    func setLabelText(name: String?) {
        self.name = name
    }
}
