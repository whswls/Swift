//
//  CombineFirebaseBookApp.swift
//  CombineFirebaseBook
//
//  Created by 존진 on 4/9/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AppDelegate:NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // 에뮬레이터 설정
        Auth.auth().useEmulator(withHost: "localhost", port: 9099)
        
        Firestore.firestore().useEmulator(withHost: "localhost", port: 8080)
        return true
    }
}

@main
struct CombineFirebaseBookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
