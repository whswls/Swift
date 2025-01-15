//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by 존진 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor: Color = .white
    @State private var backgroundColor: Color = .gray
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            // 앱을 실행하고 텍스트를 길게 누르면 컨텍스트 메뉴가 나타남
            .contextMenu {
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }, label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                })
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                }, label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                })
                Button(action: {}, label: {})
            }
    }
}

#Preview {
    ContentView()
}
