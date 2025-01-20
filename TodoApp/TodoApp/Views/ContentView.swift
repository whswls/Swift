//
//  ContentView.swift
//  TodoApp
//
//  Created by 존진 on 1/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // 리스트 페이지로 modelContext 기능이 이동하여 삭제됨
    
    @State private var showingAddTodo = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            TodoListView(searchText: searchText)
                .searchable(text: $searchText)
                .navigationTitle("Todo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: {
                            showingAddTodo = true
                        }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingAddTodo) {
            AddTodoView()
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
