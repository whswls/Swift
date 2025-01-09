//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

// Main Content View
struct ContentView: View {
    // 상태를 관리하는 프로퍼티
    @State private var count = 0
    
    var body: some View {
        MyVStack {
            Text("Text 1")
            Text("Text 2")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        }
    }
}

#Preview {
    ContentView()
}
