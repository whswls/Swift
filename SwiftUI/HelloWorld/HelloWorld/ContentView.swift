//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button(action: {
            Task{
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    func doSomething() async {
        print("Start \(Date())")
        // 비동기 반환값을 위한 async let
        async let result = takesTooLong()
        print("After async-let \(Date())")
        // async let 상수를 사용하려면, await
        print("End \(await result)")
        print("End \(Date())")
    }
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}



#Preview {
    ContentView()
}
