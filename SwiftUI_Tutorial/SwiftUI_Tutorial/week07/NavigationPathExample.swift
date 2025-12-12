//
//  NavigationPathExample.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/29/25.
//

import SwiftUI

struct NavigationPathExample: View {
    
    @State private var path = NavigationPath() //배열이 만들어짐 (네비게이션 담는 배열)
    
    var body: some View {
        NavigationStack(path: $path) { // 또 다른 init path 활용 // path를 바인딩 => 바인딩을 할 때는 달러표시를 해줘야함 이생성자를 들어가보면 바인딩 이라는 프로퍼티래퍼로 감싸져잇음 스테이트로 하위뷰로 전달해줄때는 바인딩해줘야함
            
            VStack(spacing: 10) {
                Text("홈화면")
                    .font(.largeTitle)
                
                Button("뷰 이동") {
                    path.append(1) //이 1은 네비게이션 데스티네이션에 전달이 됨// ㅇ이 1은 그냥 화면에 표시해주려고 하는건가?
                }
            }
            .navigationDestination(for: Int.self) { step in
                StepView(step: step, path: $path)
            }
            
        }
    }
}

struct StepView: View {
    let step: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(step) 단계")
                .font(.largeTitle)
            
            Button("다음으로") {
                path.append(step + 1)
            }
            
            Button("처음으로") {
                path = NavigationPath()
            }
        }
    }
}

#Preview {
    NavigationPathExample()
}

//TCA 프레임워크 쓰면 더 어려워짐?

//뷰를 바꿔주는게 아니고 뷰에 전달하는 데이터만 바꿔주는 방식으로 하면 성능이 좋아짐?
