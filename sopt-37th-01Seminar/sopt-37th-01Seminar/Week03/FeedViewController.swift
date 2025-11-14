//
//  FeedViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 11/1/25.
//

import Foundation
import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 21
    private let cellHeight: CGFloat = 198
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical // 디폴트가 vertical 입니다~
            layout.minimumLineSpacing = lineSpacing
            layout.minimumInteritemSpacing = itemSpacing
            layout.sectionInset = collectViewInset
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            return collectionView
        }() //여기서 컬렉션 뷰 초기화
    
    
    private var feeds: [FeedModel] = [] // 여기에 목 데이터를 넣을거야
   // private let collectionView: UICollectionView = UICollectionView() //컴파일이 아니고 런타임에 에러가 있다? //레이아웃을 필수로 설정해줘야해
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
        register()
        loadMockData()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
        title = "피드"
    }
    
    private func setDelegate() {
        collectionView.delegate = self //지금은 안써서 지워도됨
        collectionView.dataSource = self
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    // MARK: - Data
        
        private func loadMockData() {
            feeds = FeedModel.mockData
            collectionView.reloadData()
        }
}

// MARK: - UICollectionViewDataSource

extension FeedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(feed: feeds[indexPath.item])
        return cell
    }
}

extension FeedViewController: FeedCollectionViewCellDelegate {
    func didTapScrapButton(_ cell: FeedCollectionViewCell) {
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            
            feeds[indexPath.item].isScrap.toggle() // feed의 값을 변경 시키고
            cell.scrapButton.isSelected.toggle() // cell에 접근해서 해당 scrapbutton을 토글
        }
}

//extension FeedViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return feeds.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}

extension FeedViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInset: CGFloat = 20
        let width = (collectionView.frame.width - (itemSpacing + horizontalInset * 2)) / 2
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}
