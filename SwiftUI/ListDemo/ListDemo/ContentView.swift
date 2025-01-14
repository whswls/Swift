//
//  ContentView.swift
//  ListDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct TodoItem: Identifiable {
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
        List {
            Section(header: Text("Settings")) {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notifications")
                }
            }
            Section(header: Text("To Do Tasks")) {
                ForEach(listData) {
                    item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
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

#Preview {
    ContentView()
}
