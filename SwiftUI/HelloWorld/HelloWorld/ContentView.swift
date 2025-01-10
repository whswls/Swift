//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
    var body: some View {
        Button(action: {
            // 작업의 우선순위를 결정할 수 있음
            Task(priority: .high) {
                // 작업의 우선순위를 확인하는 프로퍼티
                _ = Task.currentPriority
                // 작업의 취소 여부를 확인하는 프로퍼티
                _ = Task.isCancelled
                await Task.yield()
                await doSomething()
            }
            // 분리된 작업
            let detachedTask = Task.detached {
                await doSomething()
            }
            if(!detachedTask.isCancelled) {
                detachedTask.cancel()
            }
        }) {
            Text("Do Something")
        }
    }
    func doSomething() async {
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}


#Preview {
    ContentView()
}
