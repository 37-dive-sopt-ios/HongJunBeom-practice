//
//  NavigationDestination.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/29/25.
//

import SwiftUI

struct DestinationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("첫번째 버튼", value: "하이") //value는 넘겨주는거 -> 네비게이셔녀 데스티네이션에 사용됨 // 해셔블
            
            NavigationLink("두번째 버튼", value: "바이")
            
            NavigationLink {
                ColorDetail(color: .teal)
            } label: {
                Label("Work Folder", systemImage: "folder")
            }
            
            .navigationTitle("Colors")
            .navigationDestination(for: String.self) { value in
                TextView(text: value) //해셔블 타입이면 value 다 받는다?
            }
        }
    }
}

struct TextView: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}


struct ColorDetail: View {
    var color: Color

    var body: some View {
        color.navigationTitle(color.description)
    }
}

#Preview {
    DestinationView()
}
