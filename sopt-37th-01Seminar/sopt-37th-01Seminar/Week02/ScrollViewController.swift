//
//  ScrollViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/18/25.
//

import Foundation
import UIKit
import SnapKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [blueView, grayView, redView, orangeView, yellowView, greenView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        let colorViewWidth = view.frame.width * 0.5
        let colorViewHeight = 300
        
        blueView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        grayView.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.equalTo(redView.snp.trailing)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
            $0.bottom.equalTo(contentView)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
            $0.bottom.equalTo(contentView)
        }
    }
    
}

#Preview {
    ScrollViewController()
}
