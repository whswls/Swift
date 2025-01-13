//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

// Main App Entry Point
@main
struct CounterApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, initial: true) {
            switch scenePhase {
            case .active:
                print("Active")
            case .inactive:
                print("Scene is inactive")
            case .background:
                print("Background")
            default :
                print("Unknown")
            }
        }
    }
}

