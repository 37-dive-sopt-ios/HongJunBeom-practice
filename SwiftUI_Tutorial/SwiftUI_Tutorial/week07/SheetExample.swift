//
//  SheetExample.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/29/25.
//

import SwiftUI

struct SheetExample: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Text("홈화면")
            
            Button("Sheet 열기") {
                print("asdadad")
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetView(isPresented: $showSheet)
        }
    }
}

struct SheetView: View {
    // 전역적으로 사용하는 환경변수 // 다크모드 같은거
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("시트화면")
                .font(.largeTitle)
            
            Button("닫기") {
                dismiss()
//                isPresented = true
            }
        }
    }
}

#Preview {
    SheetExample()
}

//상태는 줄이는게 좋다 최대한
