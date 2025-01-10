//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        // 경고창 팝업을 띄우는 수정자
        .alert("Important Message",
               isPresented: $showAlert,
               actions: {
               Button("OK", role: .cancel) { }
        }, message: {
            Text("This is an alert message.")
        })
    }
}



#Preview {
    ContentView()
}
