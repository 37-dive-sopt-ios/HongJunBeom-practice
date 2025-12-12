//
//  NavigationExample.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/29/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView2()
            } label: {
                Label("Work Folder", systemImage: "folder")
            }
            
            NavigationLink("Teal") {
                ColorDetail2(color: .teal)
            } //네비게이션 링크나 데스티네이션이나 다 똑같은ㅇ데 생성자가 다름?(정말 많음)
        }
    }
}

struct DetailView2: View {
    
    var body: some View {
        Text("Detail View")
    }
}

struct ColorDetail2: View {
    var color: Color
    
    var body: some View {
        color.navigationTitle(color.description) //그 뷰에 달면 네비게이션 타이틀이 달리는거
    }
}

#Preview {
    NavigationExample()
}
