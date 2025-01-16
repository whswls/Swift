//
//  ImageDocDemoApp.swift
//  ImageDocDemo
//
//  Created by 존진 on 1/16/25.
//

import SwiftUI

@main
struct ImageDocDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ImageDocDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
