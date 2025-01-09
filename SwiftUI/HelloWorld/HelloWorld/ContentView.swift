//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

// Main Content View
struct ContentView: View {
    // 상태를 관리하는 프로퍼티
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) { // 수직 스택으로 컨텐츠 정렬
            Text("Count")
                .font(.largeTitle)
            
            Text("\(count)")
                .font(.system(size: 70))
                .fontWeight(.bold)
                .foregroundColor(count % 2 == 0 ? .blue : .red) // 짝수/홀수에 따른 색상 변경
            
            HStack { // 수평 스택으로 버튼 정렬
                Button(action: {
                    self.count -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                
                Spacer() // 중간 여백
                
                Button(action: {
                    self.count += 1
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
        }
        .padding() // 외부 여백 추가
    }
}

#Preview {
    ContentView()
}
