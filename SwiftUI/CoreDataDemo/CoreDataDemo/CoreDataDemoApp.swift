//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by 존진 on 1/16/25.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
