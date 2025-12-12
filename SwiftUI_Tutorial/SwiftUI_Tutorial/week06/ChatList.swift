//
//  ChatList.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
//

import SwiftUI

struct ChatList: View {
    let chatRooms: [ChatRoomModel] //여러개의 챗룸이 들어가는 저장속성 여러개가 들어갈수있는 객체 초기화 안했으니 어떤 데이터 들어올지 모름
    
    var body: some View {
        List(chatRooms) { chatRoom in
            ChatRow(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets()) //타이트하게
                .alignmentGuide(.listRowSeparatorLeading) { viewDimension in
                    return -viewDimension.width
                }
//                .listRowSeparator(.visible) // 구분선
        }
        .listStyle(.plain)
    }
}

#Preview {
    ChatList(chatRooms: ChatRoomModel.mockData)
}
