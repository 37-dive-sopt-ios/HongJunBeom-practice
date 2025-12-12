//
//  LazyHGridExample.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/29/25.
//

import SwiftUI

struct GridItemDemo: View {
    let rows = [
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(60), spacing: 10),
        GridItem(.fixed(90), spacing: 20),
        GridItem(.fixed(10), spacing: 50)
    ]


    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 5) {
                ForEach(0...300, id: \.self) { _ in
                    Color.red.frame(width: 30)
                    Color.green.frame(width: 30)
                    Color.blue.frame(width: 30)
                    Color.yellow.frame(width: 30)
                }
            }
        }
    }
}

#Preview {
    GridItemDemo()
}

// 아이덴티티 개념
// stateobject observableobject 부모 자식 뷰 데이터 초기화 되는 일이 있을 수 있음


