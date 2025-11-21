//
//  WelcomeViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/18/25.
//

import Foundation
import UIKit

protocol WelcomeReloginDelegate: AnyObject { //anyobject? 클래스만 채택할수있음 (왜? 구조체나 열거형도된다며..?) struct나enum도 init으로 인스턴스를 만들수는 있지만 인스턴스를 만들수있는 객체라서 anyobject 로 하면 class만 가능
    /*func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String)*/ //뷰컨과 스트링을 파라미터 (어떤 뷰컨으로 가고 어떤 스트링을 주는지?) 다른 개발에서는 프로토콜을 interface라고 하는듯?
    func retryLogin(didTapReloginWith message: String)
}

final class WelcomeViewController_Delegate: UIViewController {
    
    var name: String?
    
    weak var delegate: WelcomeReloginDelegate? //이게 없어도 돌아갈수있구나~ 파트원 없이도 돌아갈수있다~ 뭐 이런의미
    
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
        
        /*delegate?.retryLogin(self, didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")*/ //클래스일수도있고 열거형일수도있고 구조체일수도 있는데 없을수도 있잖아? 파트원한테 시켰는데 파트원이 없으면 호출이 안되지
        
        delegate?.retryLogin(didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")
        
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
