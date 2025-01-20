//
//  TodoItem.swift
//  TodoApp
//
//  Created by 존진 on 1/20/25.
//

import Foundation
import SwiftData

@Model
final class TodoItem: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = false
        self.createdAt = Date()
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
            lhs.id == rhs.id
        }
}
