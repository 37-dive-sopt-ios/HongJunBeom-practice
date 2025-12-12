//
//  ScrollView.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
//

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 120, height: 120)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    
                    nameWithPosition
                    ageAndMBTI
                    Spacer(minLength: 1000)
                    hobby
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 70)
            }
            VStack {
                Spacer()
                
                directMessageButton
                    .frame(width: 350, height: 50)
            }
        }
    }
    
    private var nameWithPosition: some View {
        HStack {
            Text("iOS")
                .font(.subheadline)
            Text("이명진")
                .font(.headline)
                .foregroundStyle(.blue)
            Spacer()
            Text("파트장")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
    }
    
    private var ageAndMBTI: some View {
        HStack {
            Text("97년생")
                .font(.subheadline)
            Spacer()
            Text("ESTP거나 ESTJ")
                .font(.subheadline)
                .foregroundStyle(.indigo)
        }
    }
    
    private var hobby: some View {
        Text("취미는 영상편집, 러닝, 카공 등")
    }
    
    private var directMessageButton: some View {
        Button { //이스케이핑
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ScrollViews()
}

//싱글톤이 앱이 켜질때부터 죽을때까지 살아있게 설정?했다고 가정?
