//
//  AddTodoView.swift
//  TodoApp
//
//  Created by 존진 on 1/20/25.
//

import SwiftUI

struct AddTodoView: View {
    // 데이터 저장소에 접근할 수 있는 환경변수
    @Environment(\.modelContext) private var modelContext
    // 나를 호출한 뷰에서 닫기 기능을 동작 시키는 환경변수
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Todo Title", text: $title)
                }
            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        title = ""
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let todo = TodoItem(title: title)
                        modelContext.insert(todo)
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    AddTodoView()
}
