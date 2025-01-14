//
//  ContentView.swift
//  ListDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct TodoItem: Identifiable, Hashable {
    let id: UUID = UUID()
    let task: String
    var imageName: String
}

struct ContentView: View {
    @State var toggleStatus: Bool = false
    
    @State var listData: [TodoItem] = [
        TodoItem(task: "Take out trash",
                 imageName: "trash.circle.fill"),
        TodoItem(task: "Pick up the kids",
                 imageName: "person.2.fill"),
        TodoItem(task: "Wash the car",
                 imageName: "car.fill"),
    ]
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                
                Section(header: Text("To Do Tasks")) {
                    ForEach(listData) { item in
                        NavigationLink(value: item) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                }
            }
            // NavigationLink value 타입에 따른 뷰 빌더를 실행시켜주는 수정자
            .navigationDestination(for: TodoItem.self) { item in
                Text("Number of tasks: \(item.task) (\(item.id)")
            }
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks: \(count)")
            }
            .navigationDestination(for: String.self) { task in
                VStack {
                    Text("Selected Task: \(task)")
                }
            }
            .refreshable {
                listData = [
                    TodoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    TodoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    TodoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
        }
        
    }
}

#Preview {
    ContentView()
}
