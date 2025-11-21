//
//  ChatViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 11/1/25.
//

import Foundation
import UIKit
import SnapKit

class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain) //오토레이아웃으로 할거라 zero로함 스타일은 뭘까?
    
    private var chatRooms: [ChatRoomModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //꼭 이렇게 안나눠도됨 세미나때는 어떤 기능인지 알기위해 나눠놓음
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
        
    }
    
    private func setUI() {
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
    }
    
    private func setLayout() {           // 레이아웃 잡기~!
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}

extension ChatViewController: UITableViewDelegate {  //얘는 필수가 아니다
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row].name) 채팅방 선택됨")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //몇개 셀이 있는지?
        return chatRooms.count//혹은 10 //스위프트 문법에서는 return 이 한줄밖에 없을때는 return 생략가능 스위프트 간소 문법
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //어떤 셀에 어떤 데이터가 들어가는지? 그걸 리턴해줘 하는 메소드
        
        //재사용 큐에서 필요한 cell을 dequeue 하기 위함/ 식별자도 재사용큐안에서 구별? //indexpath는 두개가 필요 어떤 셀을 눌렀는지? 어떤 섹션에 있는 어떤 row에 있는지 두개 (섹션, 로우 두개가 필요한데 지금은 로우만 있음)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
    
    
}

//테이블 뷰가 없으면 전부 addTarget 해줘야함 그래서 tableview 내부에서 구현되어있어서 delegate로 가져다 쓰기만 하면 됨    
