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
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 25)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")
    }
    
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(delay)
        print("Async task completed at \(Date())")
    }
}



#Preview {
    ContentView()
}
