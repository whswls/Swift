//
//  EditTodoView.swift
//  TodoApp
//
//  Created by 존진 on 1/20/25.
//

import SwiftUI

struct EditTodoView: View {
    @Environment(\.dismiss) var dismiss
    
    let todo: TodoItem
    
    @State private var title: String = ""
    
    init(todo: TodoItem) {
        self.todo = todo
        
        self._title = State(initialValue: todo.title)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
            }
            .navigationTitle("Edit Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        todo.title = title
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditTodoView(todo: TodoItem(title: "Hello, world!!"))
}
