//
//  ChatTableViewCell.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 11/1/25.
//

import UIKit
import SnapKit

class ChatTableViewCell: UITableViewCell {
    // UINib => 스토리보드 관련
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    } //스토리 보드 관련 파일
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    } // 나중에 커스텀 할 때 필요? 선택할 때 어떻게 표시가 되냐 이런거
    
    static let identifier: String = "ChatTableViewCell" //cell 이 많아서 익스텐션으로 함 보통 앱잼때는?
    
    // MARK: - UI Components
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "장지커"
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.text = "Hi"
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Hello"
        return label
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) //super 이닛 안해도 된다등등 여러가지 방법이 있음
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UI & Layout
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(
            profileImageView,
            nameLabel,
            locationLabel,
            messageLabel,
            thumbnailImageView
        )
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(0.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(nameLabel)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-8)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    // MARK: -
    
        func configure(chatRoom: ChatRoomModel) {
               profileImageView.image = chatRoom.profileImage
               nameLabel.text = chatRoom.name
               locationLabel.text = chatRoom.location
               messageLabel.text = chatRoom.lastMessage
               thumbnailImageView.image = chatRoom.thumbnail
           }
    
}

#Preview {
    ChatTableViewCell()
}
