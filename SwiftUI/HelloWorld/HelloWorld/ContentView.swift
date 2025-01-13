//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("First", systemImage: "01.circle") {
                FirstTabView()
            }
            Tab("Second", systemImage: "02.circle") {
                SecondTabView()
            }
        }
        .ignoresSafeArea(.all)
    }
}


#Preview {
    ContentView()
}
