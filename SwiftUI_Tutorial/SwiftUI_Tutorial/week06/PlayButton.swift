//
//  PlayButton.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
//

import SwiftUI

struct PlayButton: View {
    @State private var isPlaying: Bool = false // Create the state. //내부에서 겟셋 다 해줌

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") { // Read the state.
            isPlaying.toggle() // Write the state.
        }
    }
} //뷰가 딱딱 전환이 아니고 fadein fadeout 하는거 ㄹ아룻있는데 이게 아이덴티티로 같은거라는걸 알려주는거다
//

#Preview {
    PlayButton()
}
//바인딩은 private 안함 하위뷰랑 공유해야해서?

// 주입된 하위뷰에서 저장하고 싶으면 binding으로 해야함.

// 아이덴티티랑 연관이 있어서 sateobject obser 이런 프로퍼티 래퍼 썼다가 모달 내렸을 떄 화면 초기화 이런 경험이 있을수있음
