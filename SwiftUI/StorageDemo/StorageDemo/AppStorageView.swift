//
//  AppStorageView.swift
//  StorageDemo
//
//  Created by 존진 on 1/13/25.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
