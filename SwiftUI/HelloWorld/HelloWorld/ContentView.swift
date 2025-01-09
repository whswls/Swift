//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

// Main Content View
struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            ZStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            // 복잡한 중첩 레이아웃 예시
            Text("Financial Results")
                .font(.title)
            HStack {
                Text("Q1 Sales")
                    .font(.headline)
                VStack {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                VStack {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
            // 정렬, 여백
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$2000")
                    Text("$3000")
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
