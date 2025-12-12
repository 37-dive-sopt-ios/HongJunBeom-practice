//
//  ChatRow.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
//

import Foundation
import SwiftUI

struct ChatRow: View {
    let chatRoom: ChatRoomModel //디펜던시? //여기에 리스트 포문으로 넣어주는거임
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 40, height: 40)
                
                .overlay {
                    if let image = chatRoom.profileImage {
                        image
                            .resizable()
                    }
                }
            
            VStack(alignment: .leading){
                HStack {
                    Text(chatRoom.name)
                        .font(.headline)
                    Text(chatRoom.location)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .opacity(0.5)
                }
                Text(chatRoom.lastMessage)
                    .font(.subheadline)
            }
            
            Spacer()

                    if let image = chatRoom.thumbnail {
                        image
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
        }
        .padding()
    }
}

#Preview {
    ChatRow(chatRoom: ChatRoomModel.mockData[0])
}
