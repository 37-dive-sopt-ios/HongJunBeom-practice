//
//  SwiftUI_TutorialApp.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
// 이 파일이 앱델리게이트, 신델리게이트라고 생각하면 됨

import SwiftUI

@main
struct SwiftUI_TutorialApp: App {
    var body: some Scene { //some 좀 이따 배워, 씬 타입클로저안에 씬타입을 넣어야함? var label: UILabel { let label = UILabel() return label } 어떤 타입이 오는지 쓰고 그 밑에 쓰는거와 같은 거임
        WindowGroup { //그래서 얘는 씬 타입
            ContentView() //여기가 content (init을 보면 return content
        }
    }
}
