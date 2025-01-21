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
    @State private var priorityFilter: Priority? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        priorityFilter = nil
                    } label: {
                        Text("전체")
                            .font(.caption)
                            .padding(4)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(.rect(cornerRadius: 4))
                            .overlay {
                                if priorityFilter == nil {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.blue, lineWidth: 2)
                                }
                            }
                    }
                    ForEach([Priority.low, Priority.medium, Priority.high], id: \.self) { priority in
                        Button {
                            priorityFilter = priority
                        } label: {
                            PriorityBadge(priority: priority)
                        }
                    }
                }
                TodoListView(searchText: searchText, priorityFilter: priorityFilter)
                    .searchable(text: $searchText, prompt: "할 일 검색")
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
