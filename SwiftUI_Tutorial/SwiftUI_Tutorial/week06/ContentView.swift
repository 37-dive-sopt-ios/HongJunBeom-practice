//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by 홍준범 on 11/22/25.
//

import SwiftUI

struct ContentView: View { //실제 뷰는 프로토콜(구조체가 아니다), body는 구조체 //뷰컨은 class인데 얘는 struct(즉 값 타입) pop의 장점은 alertable, loadingIndicator 같은 걸 클래스가 아님에도 채택가능(걔는 클래스 전용이라 안에 타입을 바꿔줘야함)
    var body: some View { //뷰 안에 뷰를 넣을수있게 하기 위해서 프로토콜이 어쩌구? vstack 안에도 return content 인데 content가 뷰 타입
        Text("구독과 조아요")
            .font(.headline)
            .foregroundStyle(.red)
            .opacity(0.5)
        
        HStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: "person.fill")
                }
            
            VStack(alignment: .leading){
                HStack {
                    Text("이명진")
                        .font(.headline)
                    Text("문정동")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .opacity(0.5)
                }
                Text("확인했습니다 감사합니다 :)")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 50, height: 50)
        }
        .padding()
        
//        VStack {
//            Spacer()
//            
//            Text("VStack1")
//            
//            HStack {
//                Spacer()
//                    .frame(width: 200)
//                
//                Text("Hi")
//                    .background(.red)
//                
//                VStack {
//                    Text("h 사이 v")
//                    Text("hi")
//                }
//                
//                Spacer()
//                
//                Text("zhang jike")
//                    .background(.yellow)
//                
//                Spacer()
//    //            Image(systemName: "globe") //얘도 뷰
//    //                .imageScale(.large)
//    //                .foregroundStyle(.tint)
//    //            Text("Hello, world!") // 얘도 뷰
//            }
//            .padding()
//            
//            Text("VStack2")
//            
//            Spacer()
//        }
//        
//        ZStack {
//            Text("zz")
//            
//            Text("tttttt")
//        }
    }
}

#Preview {
    ContentView()
}

//protocol View {
//    associatedtype Body : View
//    @ViewBuilder var body: Self.Body { get } 바디는 저장속성의 타입? 얘는 항상 뷰 프로토콜을 채택해야함?
//}

//계산 프로퍼티 get만 됨

//some => 역 제네릭
//뭐가 올지 몰라 하지만 view 타입을 반환해야한다
